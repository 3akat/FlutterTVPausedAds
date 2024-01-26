package com.example.pausable_ads_plugin.player_view

import com.example.androidtvlibrary.main.adapter.PlayerView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*

class PlayerViewMethodChannel(private val adsPlayerView: PlayerView) : MethodChannel.MethodCallHandler {


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        print("onMethodCall")
        when (call.method) {
            "addPausedAds" -> {
                adsPlayerView.setPlayerData()
                adsPlayerView.adAdsLoader(
                    {
                        //todo
//                        fragment.view?.visibility = INVISIBLE
//                            savedPosition = playerAdapter.mediaPlayer.currentPosition
//                            playerAdapter.mediaPlayer.pause()
                    },
                    {
//                        fragment.view?.visibility = VISIBLE
                        //

//                            playerAdapter.play()
//                            mTransportControlGlue.playWhenPrepared()
                    },
                    true
                )

            }
            else -> result.notImplemented()
        }
    }
}
