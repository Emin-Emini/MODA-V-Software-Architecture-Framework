package com.eminemini.modavkotlin

object Config {
    object App {
        val bundleId = BuildConfig.APPLICATION_ID
    }

    object OAuth {
        const val absoluteURL = "https://randomuser.me"
        const val baseURL = "$absoluteURL/api/"
    }
}
