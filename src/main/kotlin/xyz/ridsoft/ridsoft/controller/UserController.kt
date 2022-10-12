package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestParam
import xyz.ridsoft.ridsoft.constants.SessionKey
import xyz.ridsoft.ridsoft.error.Errors
import xyz.ridsoft.ridsoft.service.UserService
import xyz.ridsoft.ridsoft.security.PasswordTool
import xyz.ridsoft.ridsoft.security.SaltGenerator
import xyz.ridsoft.ridsoft.vo.User
import java.util.Locale
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class UserController {

    @Autowired
    private lateinit var userService: UserService

    @Value("\${adminId}")
    private lateinit var adminId: String
    @Value("\${adminPw}")
    private lateinit var adminPw: String

    @GetMapping("/login")
    public fun loginForm(locale: Locale): String {
        return "login"
    }

    @PostMapping("/login")
    public fun login(
        locale: Locale,
        request: HttpServletRequest,
        @RequestParam userId: String,
        @RequestParam userPw: String,
        response: HttpServletResponse
    ) {
        val user = userService.getUser(userId)

        if (user == null) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.DatabaseError.notExists)
            response.sendRedirect("/error")
            return
        }

        if (user.userPw == PasswordTool.encryptPassword(userPw, user.salt)) {
            request.session.setAttribute(SessionKey.KEY_USER, user)
            response.sendRedirect("/")
        } else {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.wrongPassword)
            response.sendRedirect("/error")
        }

    }

    @GetMapping("/logout")
    public fun logout(
        locale: Locale,
        request: HttpServletRequest,
        response: HttpServletResponse
    ) {
        request.session.invalidate()
        response.sendRedirect("/")
    }

    @PostMapping("/register")
    public fun register(
        locale: Locale,
        request: HttpServletRequest,
        @RequestParam adminId: String,
        @RequestParam adminPw: String,
        @RequestParam userId: String,
        @RequestParam userPw: String,
        response: HttpServletResponse
    ) {
        if (this.adminId != adminId || this.adminPw != adminPw) {
            request.session.setAttribute(SessionKey.KEY_ERROR, Errors.Companion.UserError.notAuthorized)
            response.sendRedirect("/error-page")
            return
        }

        val salt = SaltGenerator.generate(8)
        val user = User(userId, PasswordTool.encryptPassword(userPw, salt), salt)
        userService.insertUser(user)

        response.sendRedirect("/login")
    }

}