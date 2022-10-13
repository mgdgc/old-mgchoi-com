package xyz.ridsoft.ridsoft.controller

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import xyz.ridsoft.ridsoft.service.ActivityService

@Controller
class ActivityController {

    @Autowired
    private lateinit var activityService: ActivityService



}