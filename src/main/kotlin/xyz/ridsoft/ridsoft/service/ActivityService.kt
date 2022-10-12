package xyz.ridsoft.ridsoft.service

import xyz.ridsoft.ridsoft.vo.Activity

interface ActivityService {

    fun selectActivities(): List<Activity>
    fun selectPrizes(): List<Activity>
    fun selectActivity(activityId: Int): Activity
    fun insertActivity(activity: Activity)
    fun updateActivity(activity: Activity)
    fun touchActivity(activityId: Int)
    fun deleteActivity(activityId: Int)

}