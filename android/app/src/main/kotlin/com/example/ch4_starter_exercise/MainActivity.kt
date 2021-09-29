package com.example.ch4_starter_exercise

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "platformchannel.mauricio.com/deviceinfo"
        ).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceInfo") {
                result.success(getDeviceInfo())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfo(): String {
        return "\nDevice: ${Build.DEVICE}" +
            "\nManufacturer: ${Build.MANUFACTURER}" +
            "\nModel: ${Build.MODEL}" +
            "\nProduct: ${Build.PRODUCT}" +
            "\nVersion Release: ${Build.VERSION.RELEASE}" +
            "\nVersion SDK: ${Build.VERSION.SDK_INT}" +
            "\nFingerprint: ${Build.FINGERPRINT}"
    }
}