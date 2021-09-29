import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
    let deviceInfoChannel = FlutterMethodChannel(name: "platformchannel.mauricio.com/deviceinfo", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
    deviceInfoChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: FlutterResult) -> Void in
        if (call.method == "getDeviceInfo") {
            self.getDeviceInfo(result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getDeviceInfo(result: FlutterResult) {
        let device = UIDevice.current
        var deviceInfo: String = ""
        deviceInfo = "\nName: \(device.name)"
        deviceInfo += "\nModel: \(device.model)"
        deviceInfo += "\nSystem: \(device.systemName) \(device.systemVersion)"
        deviceInfo += "\nProximity Monitoring Enabled: \(device.isProximityMonitoringEnabled)"
        deviceInfo += "\nMultitasking supported: \(device.isMultitaskingSupported)"
        result(deviceInfo)
    }
}
