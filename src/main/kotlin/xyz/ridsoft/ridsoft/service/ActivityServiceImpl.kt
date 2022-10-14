package xyz.ridsoft.ridsoft.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import xyz.ridsoft.ridsoft.dao.ActivityMapper
import xyz.ridsoft.ridsoft.vo.Activity

@Service
class ActivityServiceImpl : ActivityService {

    @Autowired
    private lateinit var mapper: ActivityMapper
    override fun selectAllActivities(): List<Activity> {
        return mapper.selectAllActivities()
    }

    override fun selectActivities(): List<Activity> {
        return mapper.selectActivities()
    }

    override fun selectPrizes(): List<Activity> {
        return mapper.selectPrizes()
    }

    override fun selectActivity(activityId: Int): Activity {
        return mapper.selectActivity(activityId)
    }

    override fun insertActivity(activity: Activity) {
        return mapper.insertActivity(activity)
    }

    override fun updateActivity(activity: Activity) {
        return mapper.updateActivity(activity)
    }

    override fun touchActivity(activityId: Int) {
        return mapper.touchActivity(activityId)
    }

    override fun deleteActivity(activityId: Int) {
        return mapper.deleteActivity(activityId)
    }
}