package xyz.ridsoft.ridsoft.vo

import lombok.Getter
import lombok.Setter

@Getter
@Setter
class FileVO(
    var fileId: Int,
    var userId: String,
    var fileName: String,
    var created: String
) {
    constructor(userId: String, fileName: String)
            : this(-1, userId, fileName, "")

}