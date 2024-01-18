package com.eminemini.modavkotlin
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class UserOrchestrator {
    var delegate: UserDelegate? = null
    private val adapter = UserAPIManager()

    fun getUsers(count: Int) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val users = adapter.getUsers(count)
                CoroutineScope(Dispatchers.Main).launch {
                    delegate?.didFetchedSuccessfully(users)
                }
            } catch (e: Exception) {
                CoroutineScope(Dispatchers.Main).launch {
                    delegate?.didFailWithError(e)
                }
            }
        }
    }
}