package xyz.ridsoft.ridsoft.vo

import lombok.Getter
import lombok.Setter

@Getter
@Setter
class Activity(
    var activityId: Int,
    var activityName: String,
    var outside: Boolean,
    var year: Int,
    var month: Int,
    var endYear: Int?,
    var endMonth: Int?,
    var prize: String?,
    var touch: String
)