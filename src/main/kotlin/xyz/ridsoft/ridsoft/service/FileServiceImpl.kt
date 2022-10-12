package xyz.ridsoft.ridsoft.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import xyz.ridsoft.ridsoft.dao.FileMapper
import xyz.ridsoft.ridsoft.vo.FileVO

@Service
class FileServiceImpl : FileService {

    @Autowired
    private lateinit var mapper: FileMapper

    override fun getFileById(fileId: Int): FileVO? {
        return mapper.getFileById(fileId)
    }

    override fun getFilesByName(fileName: String): List<FileVO> {
        return mapper.getFilesByName(fileName)
    }

    override fun getFiles(): List<FileVO> {
        return mapper.getFiles()
    }

    override fun getFiles(userId: String): List<FileVO> {
        return mapper.getFilesByUserId(userId)
    }

    override fun insertFile(fileVO: FileVO) {
        mapper.insertFile(fileVO)
    }

    override fun deleteFile(fileId: Int) {
        mapper.deleteFile(fileId)
    }
}