import Flutter
import UIKit
//import AppleTVAds

public class PausableAdsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pausable_ads_plugin", binaryMessenger: registrar.messenger())
    let instance = PausableAdsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
    if (call.method == "adAdsLoader") {
//               if let args = call.arguments as? Dictionary<String, Any>,
//                 let appToken = args["appToken"] as? String{
//                 m_ziggeo = Ziggeo(token: appToken);
//                 registerAllTheChannels();
              }
     }
  }

