import Flutter
import ShipBookSDK
import UIKit

public class ShipbookFlutterOmnysPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "shipbook_flutter_omnys", binaryMessenger: registrar.messenger())
        let instance = ShipbookFlutterOmnysPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let arguments = call.arguments as! NSArray
        switch call.method {
        case "Shipbook.start":
            let appId = arguments[0] as! String
            let appKey = arguments[1] as! String
            ShipBook.start(appId: appId, appKey: appKey)
            result(true)
        case "Shipbook.log":
            let tag = arguments[0] as! String
            let message = arguments[1] as! String
            //TODO receive severity from Dart code
            ShipBook.getLogger(tag).message(msg: message, severity: Severity.Debug)
            result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
