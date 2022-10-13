package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.ModelAndView
import xyz.ridsoft.ridsoft.constants.SessionKey
import xyz.ridsoft.ridsoft.error.Errors
import xyz.ridsoft.ridsoft.service.CategoryService
import xyz.ridsoft.ridsoft.service.DocumentService
import xyz.ridsoft.ridsoft.service.UserService
import xyz.ridsoft.ridsoft.vo.Admin
import xyz.ridsoft.ridsoft.vo.Category
import xyz.ridsoft.ridsoft.vo.Document
import xyz.ridsoft.ridsoft.vo.User
import java.util.Locale
import java.util.StringJoiner
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class ProjectController {

    @Autowired
    private lateinit var docService: DocumentService

    @Autowired
    private lateinit var catService: CategoryService

    @Autowired
    private lateinit var userService: UserService

    @Value("\${adminId}")
    private lateinit var adminId: String

    @Value("\${adminPw}")
    private lateinit var adminPw: String

    @GetMapping("/project")
    public fun showProjects(
        locale: Locale
    ): ModelAndView {
        val mav = ModelAndView("projects")

        val categories = catService.getCategories()
        mav.addObject("categories", categories)

        val projects = docService.getDocuments()
        mav.addObject("projects", projects)

        return mav
    }

    @GetMapping("/project/{catId}")
    public fun showProjectsByCategory(
        locale: Locale,
        @PathVariable("catId") catId: Int
    ): ModelAndView {
        val mav = ModelAndView("projects")

        val categories = catService.getCategories()
        mav.addObject("categories", categories)

        val projects = docService.getDocumentsByCategory(catId)

        mav.addObject("projects", projects)

        return mav
    }

    @GetMapping("/project/{catId}/{docId}")
    public fun showProject(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("catId") catId: Int,
        @PathVariable("docId") docId: Int,
        response: HttpServletResponse
    ): ModelAndView? {
        val mav = ModelAndView("project_detail")

        val doc = docService.getDocumentById(docId)

        if (doc == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.DatabaseError.notExists)
            response.sendRedirect("/error-page")
            return null
        }

        mav.addObject("title", doc.title)
        mav.addObject("document", doc)

        return mav
    }

    @ResponseBody
    @GetMapping("/api/document/{docId}")
    public fun getDocument(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("docId") docId: Int,
        response: HttpServletResponse
    ): Document? {
        val mav = ModelAndView("project_detail")

        val doc = docService.getDocumentById(docId)

        if (doc == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.DatabaseError.notExists)
            response.sendRedirect("/error-page")
            return null
        }

        return doc
    }

    @GetMapping("/project/category")
    public fun manageCategory(
        locale: Locale,
        request: HttpServletRequest,
        response: HttpServletResponse
    ): ModelAndView? {
        val admin = request.getAttribute(SessionKey.KEY_ADMIN) as? Admin

        if (admin == null || (admin.adminId != this.adminId || adminPw != this.adminPw)) {
            val user = request.session.getAttribute(SessionKey.KEY_USER) as? User
            if (user == null) {
                request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
                response.sendRedirect("/error-page")
                return null
            }
        }

        val mav = ModelAndView("manage_category")

        val categories = catService.getCategories()
        mav.addObject("categories", categories)

        return mav
    }

    @PostMapping("/project/category")
    public fun insertCategory(
        locale: Locale,
        request: HttpServletRequest,
        @RequestParam title: String,
        response: HttpServletResponse
    ) {
        val user = request.session.getAttribute(SessionKey.KEY_USER) as? User
        if (user == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
            response.sendRedirect("/error-page")
            return
        }

        catService.insertCategory(Category(-1, title))

        response.sendRedirect("/project/category")
    }

    @GetMapping("/project/{catId}/write")
    public fun writeDocument(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("catId") catId: Int,
        response: HttpServletResponse
    ): ModelAndView? {

        val user = request.session.getAttribute(SessionKey.KEY_USER) as? User
        if (user == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
            response.sendRedirect("/error-page")
            return null
        }

        val mav = ModelAndView("document_write")

        mav.addObject("catId", catId)

        return mav
    }

    @PostMapping("/project/{catId}/write")
    public fun writeDocument(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("catId") catId: Int,
        @RequestParam title: String,
        @RequestParam desc: String,
        @RequestParam content: String,
        @RequestParam coverImg: Int,
        @RequestParam tag: String,
        @RequestParam github: String,
        response: HttpServletResponse
    ) {
        val user = request.session.getAttribute(SessionKey.KEY_USER) as? User
        if (user == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
            response.sendRedirect("/error-page")
            return
        }

        val document = Document(
            docId = -1,
            catId = catId,
            title = title,
            desc = desc,
            content = content,
            userId = user.userId,
            coverImg = coverImg,
            tag = tag,
            github = github,
            hidden = false
        )

        println(content)

        docService.insertDocument(document)

        response.sendRedirect("/project")

    }

    @GetMapping("/project/{catId}/documents")
    public fun manageDocuments(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("catId") catId: Int,
        response: HttpServletResponse
    ): ModelAndView? {
        val sessionUser = request.session.getAttribute(SessionKey.KEY_USER) as? User

        if (sessionUser == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notSignedIn)
            response.sendRedirect("/error-page")
            return null
        } else {
            val user = userService.getUser(sessionUser.userId)
            if (user?.userId != sessionUser.userId || user.userPw != sessionUser.userPw) {
                request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
                response.sendRedirect("/error-page")
                return null
            }
        }

        val mav = ModelAndView("manage_document")

        val documents = docService.getDocumentsByCategory(catId)

        mav.addObject("documents", documents)

        return mav

    }

    @GetMapping("/project/{catId}/{docId}/touch")
    public fun touchDocument(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("catId") catId: Int,
        @PathVariable("docId") docId: Int,
        response: HttpServletResponse
    ) {
        val sessionUser = request.session.getAttribute(SessionKey.KEY_USER) as? User

        if (sessionUser == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notSignedIn)
            response.sendRedirect("/error-page")
            return
        } else {
            val user = userService.getUser(sessionUser.userId)
            if (user?.userId != sessionUser.userId || user.userPw != sessionUser.userPw) {
                request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
                response.sendRedirect("/error-page")
                return
            }
        }

        docService.touchDocument(docId)

        response.sendRedirect("/project/${catId}/documents")
    }

}