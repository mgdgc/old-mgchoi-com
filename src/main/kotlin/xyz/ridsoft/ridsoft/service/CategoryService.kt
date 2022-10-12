package xyz.ridsoft.ridsoft.service

import xyz.ridsoft.ridsoft.vo.Category

interface CategoryService {

    public fun getCategories(): List<Category>
    public fun getCategory(catId: Int): Category?
    public fun insertCategory(category: Category)

}