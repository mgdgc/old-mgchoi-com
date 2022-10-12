package xyz.ridsoft.ridsoft.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import xyz.ridsoft.ridsoft.dao.SkillMapper
import xyz.ridsoft.ridsoft.vo.Skill
import xyz.ridsoft.ridsoft.vo.SkillGroup

@Service
class SkillServiceImpl : SkillService {

    @Autowired
    private lateinit var mapper: SkillMapper

    override fun getSkillGroups(): List<SkillGroup> {
        return mapper.getSkillGroups()
    }

    override fun getSkillGroupById(skillGroupId: Int): SkillGroup? {
        return mapper.getSkillGroupById(skillGroupId)
    }

    override fun getSkillGroupByName(name: String): SkillGroup? {
        return mapper.getSkillGroupByName(name)
    }

    override fun insertSkillGroup(skillGroup: SkillGroup) {
        mapper.insertSkillGroup(skillGroup)
    }

    override fun updateSkillGroup(skillGroup: SkillGroup) {
        mapper.updateSkillGroup(skillGroup)
    }

    override fun deleteSkillGroup(skillGroupId: Int): Boolean {
        return if (getSkillsByGroup(skillGroupId).isNotEmpty()) {
            false
        } else {
            mapper.deleteSkillGroup(skillGroupId)
            true
        }
    }

    override fun getSkills(): List<Skill> {
        return mapper.getSkills()
    }

    override fun getSkillsByGroup(skillGroupId: Int): List<Skill> {
        return mapper.getSkillsByGroup(skillGroupId)
    }

    override fun getSkill(skillName: String): Skill? {
        return mapper.getSkillByName(skillName)
    }

    override fun getSkill(skillId: Int): Skill? {
        return mapper.getSkillById(skillId)
    }

    override fun insertSkill(skill: Skill) {
        mapper.insertSkill(skill)
    }

    override fun deleteSkill(skillId: Int) {
        mapper.deleteSkill(skillId)
    }

    override fun updateSkill(skill: Skill) {
        mapper.updateSkill(skill)
    }
}