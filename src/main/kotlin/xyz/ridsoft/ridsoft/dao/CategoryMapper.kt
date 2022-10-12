package xyz.ridsoft.ridsoft.dao

import org.springframework.stereotype.Repository
import xyz.ridsoft.ridsoft.vo.Category

@Repository
interface CategoryMapper {

    public fun getCategories(): List<Category>
    public fun getCategory(catId: Int): Category?
    public fun insertCategory(category: Category)

}