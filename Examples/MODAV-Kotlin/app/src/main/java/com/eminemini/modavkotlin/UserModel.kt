package com.eminemini.modavkotlin

data class User(
    val name: Name,
    val email: String = "",
    val phone: String = ""
)

data class Name(
    val first: String = "",
    val last: String = ""
)
