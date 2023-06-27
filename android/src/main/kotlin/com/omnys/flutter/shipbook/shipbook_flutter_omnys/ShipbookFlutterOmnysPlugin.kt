package com.omnys.flutter.shipbook.shipbook_flutter_omnys

import android.app.Application
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.shipbook.shipbooksdk.Models.Severity
import io.shipbook.shipbooksdk.ShipBook

/** ShipbookFlutterOmnysPlugin */
class ShipbookFlutterOmnysPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "shipbook_flutter_omnys")
        channel.setMethodCallHandler(this)
        flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val args = call.arguments<ArrayList<*>>()

        when (call.method) {
            "Shipbook.start" -> {
                val appId = args!![0] as String
                val appKey = args[1] as String
                ShipBook.start(application, appId, appKey)
                result.success(true)
            }

            "Shipbook.log" -> {
                val tag = args!![0] as String
                val message = args[1] as String
                //TODO receive severity from Dart code
                ShipBook.getLogger(tag).message(message, Severity.Debug)
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    companion object {
        private lateinit var application: Application

        fun init(application: Application) {
            this.application = application
        }
    }
}
