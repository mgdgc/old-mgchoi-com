package xyz.ridsoft.ridsoft.service

import xyz.ridsoft.ridsoft.vo.User

interface UserService {

    public fun insertUser(user: User)
    public fun getUser(userId: String): User?
    public fun deleteUser(userId: String)
    public fun updateUser(user: User)

}