package xyz.ridsoft.ridsoft.service

import xyz.ridsoft.ridsoft.vo.FileVO

interface FileService {

    public fun getFiles(): List<FileVO>
    public fun getFileById(fileId: Int): FileVO?
    public fun getFiles(userId: String): List<FileVO>
    public fun getFilesByName(fileName: String): List<FileVO>
    public fun insertFile(fileVO: FileVO)
    public fun deleteFile(fileId: Int)

}