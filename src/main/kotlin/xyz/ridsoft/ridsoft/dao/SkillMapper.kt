package xyz.ridsoft.ridsoft.dao

import org.springframework.stereotype.Repository
import xyz.ridsoft.ridsoft.vo.Skill
import xyz.ridsoft.ridsoft.vo.SkillGroup

@Repository
interface SkillMapper {

    public fun getSkillGroups(): List<SkillGroup>
    public fun getSkillGroupById(skillGroupId: Int): SkillGroup?
    public fun getSkillGroupByName(name: String): SkillGroup?
    public fun insertSkillGroup(skillGroup: SkillGroup)
    public fun updateSkillGroup(skillGroup: SkillGroup)
    public fun deleteSkillGroup(skillGroupId: Int)
    public fun getSkills(): List<Skill>
    public fun getSkillsByGroup(skillGroupId: Int): List<Skill>
    public fun getSkillByName(skillName: String): Skill?
    public fun getSkillById(skillId: Int): Skill?
    public fun insertSkill(skill: Skill)
    public fun deleteSkill(skillId: Int)
    public fun updateSkill(skill: Skill)

}