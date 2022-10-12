package xyz.ridsoft.ridsoft.service

import xyz.ridsoft.ridsoft.vo.Skill
import xyz.ridsoft.ridsoft.vo.SkillGroup

interface SkillService {

    public fun getSkillGroups(): List<SkillGroup>
    public fun getSkillGroupById(skillGroupId: Int): SkillGroup?
    public fun getSkillGroupByName(name: String): SkillGroup?
    public fun insertSkillGroup(skillGroup: SkillGroup)
    public fun updateSkillGroup(skillGroup: SkillGroup)
    public fun deleteSkillGroup(skillGroupId: Int): Boolean
    public fun getSkills(): List<Skill>
    public fun getSkillsByGroup(skillGroupId: Int): List<Skill>
    public fun getSkill(skillName: String): Skill?
    public fun getSkill(skillId: Int): Skill?
    public fun insertSkill(skill: Skill)
    public fun deleteSkill(skillId: Int)
    public fun updateSkill(skill: Skill)

}