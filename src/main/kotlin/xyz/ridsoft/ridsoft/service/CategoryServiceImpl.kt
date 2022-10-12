package xyz.ridsoft.ridsoft.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import xyz.ridsoft.ridsoft.dao.CategoryMapper
import xyz.ridsoft.ridsoft.vo.Category

@Service
class CategoryServiceImpl : CategoryService {

    @Autowired
    private lateinit var mapper: CategoryMapper

    override fun getCategories(): List<Category> {
        return mapper.getCategories()
    }

    override fun getCategory(catId: Int): Category? {
        return mapper.getCategory(catId)
    }

    override fun insertCategory(category: Category) {
        mapper.insertCategory(category)
    }

}