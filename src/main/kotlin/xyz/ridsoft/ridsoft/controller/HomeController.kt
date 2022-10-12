package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.ModelAndView
import xyz.ridsoft.ridsoft.constants.SessionKey
import xyz.ridsoft.ridsoft.service.ActivityService
import xyz.ridsoft.ridsoft.service.DocumentService
import xyz.ridsoft.ridsoft.service.FileService
import xyz.ridsoft.ridsoft.service.SkillService
import xyz.ridsoft.ridsoft.vo.Document
import xyz.ridsoft.ridsoft.vo.Skill
import java.util.Locale
import javax.servlet.http.HttpServletRequest

@Controller
class HomeController {

    @Autowired
    private lateinit var docService: DocumentService

    @Autowired
    private lateinit var skillService: SkillService

    @Autowired
    private lateinit var fileService: FileService

    @Autowired
    private lateinit var activityService: ActivityService

    @Value("\${file_base_location}")
    private lateinit var fileBaseLocation: String

    @GetMapping("/")
    public fun home(
        locale: Locale
    ): ModelAndView {

        val mav = ModelAndView("index")

        val projects = docService.getDocuments()
        val p = arrayListOf<Document>()

        for (i in 0 until if (projects.size > 4) 4 else projects.size) {
            p.add(projects[i])
        }

        mav.addObject("projects", p)

        val skillGroups = skillService.getSkillGroups()
        val skills: HashMap<Int, List<Skill>> = hashMapOf()
        for (skillGroup in skillGroups) {
            skills[skillGroup.skillGroupId] = skillService.getSkillsByGroup(skillGroup.skillGroupId)
        }
        val skillIcons: HashMap<Int, Int> = hashMapOf()
        for (skillList in skills.values) {
            for (skill in skillList) {
                fileService.getFileById(skill.icon)?.let {
                    skillIcons[skill.skillId] = it.fileId
                }
            }
        }

        mav.addObject("skillGroups", skillGroups)
        mav.addObject("skills", skills)
        mav.addObject("skillIcons", skillIcons)

        val activities = activityService.selectActivities()
        mav.addObject("activities", activities)

        return mav
    }

    @GetMapping("/error-page")
    public fun error(locale: Locale, request: HttpServletRequest): ModelAndView {
        val mav = ModelAndView("error_page")

        val error = request.session.getAttribute(SessionKey.KEY_ERROR) as? Error

        if (error == null) {
            mav.addObject("error", "세션이 유효하지 않습니다.")
        } else {
            mav.addObject("error", error.message)
        }

        return mav
    }

    @ResponseBody
    @GetMapping("/robots.txt")
    public fun robotsTxt(): String {
        return """
            User-agent: *
            Disallow: /
            Allow : /${'$'}
        """.trimIndent()
    }

}