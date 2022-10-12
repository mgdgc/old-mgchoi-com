package xyz.ridsoft.ridsoft.vo


class Document(
    var docId: Int,
    var userId: String,
    var catId: Int,
    var title: String,
    var desc: String,
    var content: String,
    var coverImg: Int,
    var tag: String?,
    var github: String,
    var hidden: Boolean,
)