package com.eminemini.modavkotlin
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Query

interface UserService {
    @GET("users")
    suspend fun getUsers(@Query("count") count: Int): Response<List<User>>
}

class UserAPIManager {
    private val service: UserService = // Retrofit instance

        suspend fun getUsers(count: Int): List<User> {
        val response = service.getUsers(count)
        if (response.isSuccessful) {
            return response.body() ?: emptyList()
        } else {
            throw Exception(response.errorBody()?.string())
        }
    }
}
