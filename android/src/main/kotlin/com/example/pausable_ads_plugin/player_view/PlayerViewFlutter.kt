package com.example.pausable_ads_plugin.player_view

import android.view.View
import com.example.androidtvlibrary.main.adapter.PlayerView
import io.flutter.plugin.platform.PlatformView

class PlayerViewFlutter(private val playerView: PlayerView) : PlatformView {

    override fun getView(): View {
        return playerView
    }

    override fun dispose() {
    }
}
