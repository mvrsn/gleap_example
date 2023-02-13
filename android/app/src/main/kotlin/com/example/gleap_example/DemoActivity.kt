package com.example.gleap_example

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import io.gleap.Gleap

class DemoActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_demo)

        findViewById<Button>(R.id.openGleapButton).setOnClickListener {
            Gleap.getInstance().open()
        }
    }
}
