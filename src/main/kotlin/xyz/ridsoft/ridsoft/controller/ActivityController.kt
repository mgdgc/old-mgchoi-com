package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.servlet.ModelAndView
import xyz.ridsoft.ridsoft.constants.SessionKey
import xyz.ridsoft.ridsoft.error.Errors
import xyz.ridsoft.ridsoft.service.ActivityService
import xyz.ridsoft.ridsoft.service.UserService
import xyz.ridsoft.ridsoft.vo.Activity
import xyz.ridsoft.ridsoft.vo.User
import java.util.Locale
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class ActivityController {

    @Autowired
    private lateinit var activityService: ActivityService

    @Autowired
    private lateinit var userService: UserService

    @GetMapping("/activity")
    public fun manageActivity(
        locale: Locale,
        request: HttpServletRequest,
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

        val mav = ModelAndView("manage_activity")

        val activities = activityService.selectAllActivities()
        mav.addObject("activities", activities)

        return mav
    }

    @PostMapping("/activity")
    public fun insertActivity(
        locale: Locale,
        request: HttpServletRequest,
        activity: Activity,
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

        activityService.insertActivity(activity)
        response.sendRedirect("/activity")
    }

}