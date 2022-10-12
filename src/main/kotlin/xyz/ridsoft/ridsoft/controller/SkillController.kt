package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.ModelAndView
import xyz.ridsoft.ridsoft.service.SkillService
import xyz.ridsoft.ridsoft.vo.Skill
import xyz.ridsoft.ridsoft.vo.SkillGroup
import java.util.Locale
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class SkillController {

    @Autowired
    private lateinit var skillService: SkillService

    @GetMapping("/skill/group")
    public fun skillGroups(
        locale: Locale,
        request: HttpServletRequest
    ): ModelAndView {
        val mav = ModelAndView("manage_skill_group")

        val skillGroups = skillService.getSkillGroups()
        mav.addObject("skillGroups", skillGroups)

        val skills: HashMap<Int, Int> = hashMapOf()
        for (skillGroup in skillGroups) {
            skills[skillGroup.skillGroupId] = skillService.getSkillsByGroup(skillGroup.skillGroupId).size
        }
        mav.addObject("skills", skills)

        return mav
    }

    @PostMapping("/skill/group")
    public fun insertSkillGroup(
        locale: Locale,
        request: HttpServletRequest,
        @RequestParam name: String,
        response: HttpServletResponse
    ) {
        skillService.insertSkillGroup(SkillGroup(-1, name))
        response.sendRedirect("/skill/group")
    }

    @ResponseBody
    @PostMapping("/skill/{skillGroupId}/delete")
    public fun deleteSkillGroup(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("skillGroupId") skillGroupId: Int,
        response: HttpServletResponse
    ): Boolean {
        skillService.deleteSkillGroup(skillGroupId)
        return true
    }

    @GetMapping("/skill/{skillGroupId}")
    public fun skills(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("skillGroupId") skillGroupId: Int
    ): ModelAndView {
        val mav = ModelAndView("manage_skill")
        val skills = skillService.getSkillsByGroup(skillGroupId)
        mav.addObject("skills", skills)

        return mav
    }

    @PostMapping("/skill/{skillGroupId}")
    public fun insertSkill(
        locale: Locale,
        request: HttpServletRequest,
        @PathVariable("skillGroupId") groupId: Int,
        @RequestParam skillName: String,
        @RequestParam icon: Int,
        @RequestParam year: Int,
        @RequestParam level: Int,
        @RequestParam desc: String,
        response: HttpServletResponse
    ) {
        val skill = Skill(-1, groupId, skillName, icon, year, level, desc)
        skillService.insertSkill(skill)

        response.sendRedirect("/skill/${groupId}")
    }

}