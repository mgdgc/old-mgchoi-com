package xyz.ridsoft.ridsoft.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import xyz.ridsoft.ridsoft.dao.UserMapper
import xyz.ridsoft.ridsoft.vo.User

@Service
class UserServiceImpl : UserService {

    @Autowired
    private lateinit var mapper: UserMapper

    override fun insertUser(user: User) {
        mapper.insertUser(user)
    }

    override fun getUser(userId: String): User? {
        return mapper.getUser(userId)
    }

    override fun deleteUser(userId: String) {
        mapper.deleteUser(userId)
    }

    override fun updateUser(user: User) {
        mapper.updateUser(user)
    }

}