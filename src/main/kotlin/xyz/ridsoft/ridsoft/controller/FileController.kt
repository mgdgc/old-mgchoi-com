package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.core.io.Resource
import org.springframework.core.io.UrlResource
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.servlet.ModelAndView
import xyz.ridsoft.ridsoft.constants.SessionKey
import xyz.ridsoft.ridsoft.error.Errors
import xyz.ridsoft.ridsoft.service.FileService
import xyz.ridsoft.ridsoft.service.UserService
import xyz.ridsoft.ridsoft.vo.Admin
import xyz.ridsoft.ridsoft.vo.FileVO
import xyz.ridsoft.ridsoft.vo.User
import java.io.File
import java.net.MalformedURLException
import java.util.*
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.servlet.http.Part

@Controller
class FileController {

    @Autowired
    private lateinit var userService: UserService

    @Autowired
    private lateinit var fileService: FileService

    @Value("\${adminId}")
    private lateinit var adminId: String

    @Value("\${adminPw}")
    private lateinit var adminPw: String

    @Value("\${file_base_location}")
    private lateinit var fileBaseLocation: String

    @GetMapping("/file")
    public fun getFilesManagement(
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
            response.sendRedirect("/file/${user.userId}")
        }

        val mav = ModelAndView("manage_files")

        val files = fileService.getFiles()
        mav.addObject("files", files)
        mav.addObject("upload_form", false)

        return mav
    }

    @GetMapping("/file/{userId}")
    public fun getFilesManagementByUser(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("userId") userId: String,
        @RequestParam adminId: String?,
        @RequestParam adminPw: String?,
        response: HttpServletResponse
    ): ModelAndView? {
        val mav = ModelAndView("manage_files")

        val sessionUser = request.session.getAttribute(SessionKey.KEY_USER) as? User

        if (adminId != null && adminPw != null) {
            if (this.adminId != adminId || this.adminPw != adminPw) {
                request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
                response.sendRedirect("/error-page")
                return null
            }
        } else {
            val user = userService.getUser(userId)
            if (sessionUser?.userId != user?.userId || sessionUser?.userPw != user?.userPw) {
                request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
                response.sendRedirect("/error-page")
                return null
            }
        }

        val files = getFiles(userId)
        mav.addObject("files", files)
        mav.addObject("upload_form", true)

        return mav
    }

    private fun getFiles(userId: String? = null): List<FileVO> {
        if (userId != null) {
            return fileService.getFiles(userId)
        } else {
            return fileService.getFiles()
        }
    }

    @PostMapping("/file/upload")
    public fun uploadFile(
        locale: Locale,
        request: HttpServletRequest,
        response: HttpServletResponse
    ) {

        val user = request.session.getAttribute(SessionKey.KEY_USER) as? User

        if (user == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
            response.sendRedirect("/error-page")
            return
        }

        val parts: Collection<Part> = request.parts

        val path = File("${fileBaseLocation}/${user.userId}/")
        if (!path.exists()) {
            path.mkdirs()
        }

        for (p in parts) {
            val insertVO = FileVO(user.userId, p.submittedFileName)
            fileService.insertFile(insertVO)
            p.write(File("${fileBaseLocation}/${user.userId}/${p.submittedFileName}").absolutePath)
        }

//        val split = file.originalFilename!!.split(".")
//        val type = split.get(split.lastIndex)
//        var dbFileVO = FileVO(user.userId, file.originalFilename!!, type)
//
//        fileService.insertFile(dbFileVO)
//        dbFileVO = fileService.getFiles(user.userId)[0]
//        val fullPath = "${dbFileVO.fileId}.${type}"
//        val f = File(fullPath)
//
//        file.transferTo(f)

        response.sendRedirect("/file")

    }

    @ResponseBody
    @GetMapping("/image/{fileId}")
    @Throws(MalformedURLException::class)
    fun showImage(
        request: HttpServletRequest,
        @PathVariable("fileId") fileId: Int,
        response: HttpServletResponse
    ): Resource? {
        val fileVO = fileService.getFileById(fileId)

        if (fileVO == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.DatabaseError.notExists)
            response.sendRedirect("/error-page")
            return null
        }

        return UrlResource("file:${fileBaseLocation}/${fileVO.userId}/${fileVO.fileName}")
    }

}