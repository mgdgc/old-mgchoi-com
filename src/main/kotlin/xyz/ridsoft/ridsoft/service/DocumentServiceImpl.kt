package xyz.ridsoft.ridsoft.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import xyz.ridsoft.ridsoft.dao.DocumentMapper
import xyz.ridsoft.ridsoft.vo.Document

@Service
class DocumentServiceImpl : DocumentService {

    @Autowired
    private lateinit var mapper: DocumentMapper

    override fun getDocuments(): List<Document> {
        return mapper.getDocuments()
    }

    override fun getDocumentById(docId: Int): Document? {
        return mapper.getDocumentById(docId)
    }

    override fun getDeletedDocuments(): List<Document> {
        return mapper.getDeletedDocuments()
    }

    override fun getDocumentsByCategory(catId: Int): List<Document> {
        return mapper.getDocumentsByCategory(catId)
    }

    override fun insertDocument(document: Document) {
        mapper.insertDocument(document)
    }

    override fun deleteDocumentPermanently(docId: Int) {
        mapper.deleteDocumentPermanently(docId)
    }

    override fun deleteDocument(docId: Int) {
        mapper.deleteDocument(docId)
    }

    override fun restoreDocument(docId: Int) {
        mapper.restoreDocument(docId)
    }

    override fun updateDocument(document: Document) {
        mapper.updateDocument(document)
    }

    override fun touchDocument(docId: Int) {
        mapper.touchDocument(docId)
    }
}