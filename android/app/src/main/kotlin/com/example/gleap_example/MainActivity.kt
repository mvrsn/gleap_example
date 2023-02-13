package com.example.gleap_example

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
        var flutterEngineInstance: FlutterEngine? = null
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngineInstance = flutterEngine

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "gleap_example").setMethodCallHandler { call, result ->
            if (call.method == "open") {
                activity.startActivity(
                    Intent(activity, DemoActivity::class.java)
                )

                result.success(true)
            }
        }

    }
}
