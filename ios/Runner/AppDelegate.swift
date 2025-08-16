import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "playground/native", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
        if call.method == "platformVersion" {
            result("iOS \(UIDevice.current.systemVersion)")
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
