package xyz.ridsoft.ridsoft.dao

import org.springframework.stereotype.Repository
import xyz.ridsoft.ridsoft.vo.Activity

@Repository
interface ActivityMapper {

    fun selectActivities(): List<Activity>
    fun selectPrizes(): List<Activity>
    fun selectActivity(activityId: Int): Activity
    fun insertActivity(activity: Activity)
    fun updateActivity(activity: Activity)
    fun touchActivity(activityId: Int)
    fun deleteActivity(activityId: Int)

}