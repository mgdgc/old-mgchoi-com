package xyz.ridsoft.ridsoft.dao

import org.springframework.stereotype.Repository
import xyz.ridsoft.ridsoft.vo.User

@Repository
interface UserMapper {

    public fun insertUser(user: User)
    public fun getUser(userId: String): User?
    public fun deleteUser(userId: String)
    public fun updateUser(user: User)

}