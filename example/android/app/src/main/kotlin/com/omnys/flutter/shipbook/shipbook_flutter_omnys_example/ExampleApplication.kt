package com.omnys.flutter.shipbook.shipbook_flutter_omnys_example

import com.omnys.flutter.shipbook.shipbook_flutter_omnys.ShipbookFlutterOmnysPlugin
import io.flutter.app.FlutterApplication

class ExampleApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        ShipbookFlutterOmnysPlugin.init(this)
    }
}