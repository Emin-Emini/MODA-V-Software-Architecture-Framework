package com.eminemini.modavkotlin

interface UserDelegate {
    fun didFetchedSuccessfully(users: List<User>)
    fun didFailWithError(error: Throwable)
}