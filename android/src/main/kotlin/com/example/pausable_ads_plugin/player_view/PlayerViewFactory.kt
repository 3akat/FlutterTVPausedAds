package com.example.pausable_ads_plugin.player_view

import android.content.Context
import com.example.androidtvlibrary.main.adapter.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class PlayerViewFactory(private val adsPlayerView: PlayerView) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, id: Int, o: Any?): PlatformView {
        return PlayerViewFlutter(adsPlayerView)
    }
}
