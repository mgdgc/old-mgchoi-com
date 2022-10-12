package xyz.ridsoft.ridsoft.vo

import lombok.Getter
import lombok.Setter

@Getter
@Setter
class Activity(
    var activityId: Int,
    var activityName: String,
    var outside: Boolean,
    var date: String,
    var prize: String,
    var touch: String
)