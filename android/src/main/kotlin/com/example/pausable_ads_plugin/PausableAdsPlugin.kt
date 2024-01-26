package com.example.pausable_ads_plugin

import androidx.annotation.NonNull
import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.example.androidtvlibrary.main.TVTestLibrary
import com.example.androidtvlibrary.main.adapter.PlayerView
import com.example.androidtvlibrary.main.PauseCallback
import com.example.androidtvlibrary.main.ResumeCallback
import com.example.pausable_ads_plugin.player_view.PlayerViewFactory
import com.example.pausable_ads_plugin.player_view.PlayerViewMethodChannel

/** PausableAdsPlugin */
class PausableAdsPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var tVTestLibrary: TVTestLibrary = TVTestLibrary()
    private lateinit var context: Context
    private lateinit var adsPlayerCallbackChannel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "pausable_ads_plugin")
        context = flutterPluginBinding.applicationContext

        val adsPlayerView = PlayerView(context)
        adsPlayerCallbackChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "ads_player")

        flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory("ads_player_view", PlayerViewFactory(adsPlayerView))

        adsPlayerCallbackChannel.setMethodCallHandler(PlayerViewMethodChannel(adsPlayerView))
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "adAdsLoader") {
            var skipped = false
            (call.arguments as? HashMap<*, *>)?.let {
            }

        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        adsPlayerCallbackChannel.setMethodCallHandler(null)
        channel.setMethodCallHandler(null)
    }
}
