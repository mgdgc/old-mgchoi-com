package xyz.ridsoft.ridsoft.dao

import org.springframework.stereotype.Repository
import xyz.ridsoft.ridsoft.vo.FileVO

@Repository
interface FileMapper {

    public fun getFiles(): List<FileVO>
    public fun getFileById(fileId: Int): FileVO?
    public fun getFilesByUserId(userId: String): List<FileVO>
    public fun getFilesByName(fileName: String): List<FileVO>
    public fun insertFile(fileVO: FileVO)
    public fun deleteFile(fileId: Int)

}