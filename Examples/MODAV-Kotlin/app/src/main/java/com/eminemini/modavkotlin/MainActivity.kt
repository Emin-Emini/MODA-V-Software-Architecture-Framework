package com.eminemini.modavkotlin

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.eminemini.modavkotlin.ui.theme.MODAVKotlinTheme

class MainActivity : ComponentActivity() {
    private lateinit var orchestrator: UserOrchestrator

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MODAVKotlinTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Greeting("Android")
                }
            }
        }

        orchestrator = UserOrchestrator()
        orchestrator.delegate = this
        orchestrator.getUsers(10)
    }

    override fun didFetchedSuccessfully(users: List<User>) {
        // Handle successful fetch
    }

    override fun didFailWithError(error: Throwable) {
        // Handle error
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    MODAVKotlinTheme {
        Greeting("Android")
    }
}