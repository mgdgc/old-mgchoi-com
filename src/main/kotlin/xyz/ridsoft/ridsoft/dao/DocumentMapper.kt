package xyz.ridsoft.ridsoft.dao

import org.springframework.stereotype.Repository
import xyz.ridsoft.ridsoft.vo.Document

@Repository
interface DocumentMapper {

    public fun getDocuments(): List<Document>
    public fun getDocumentById(docId: Int): Document?
    public fun getDeletedDocuments(): List<Document>
    public fun getDocumentsByCategory(catId: Int): List<Document>
    public fun insertDocument(document: Document)
    public fun deleteDocumentPermanently(docId: Int)
    public fun deleteDocument(docId: Int)
    public fun restoreDocument(docId: Int)
    public fun updateDocument(document: Document)
    public fun touchDocument(docId: Int)

}