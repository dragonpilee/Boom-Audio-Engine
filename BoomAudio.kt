import android.media.audiofx.AudioEffect
import android.media.audiofx.Virtualizer
import android.content.Context
import android.media.AudioManager
import android.util.Log

class SpatialAudioEffect(context: Context) {
    private var virtualizer: Virtualizer? = null

    init {
        try {
            val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
            val sessionId = audioManager.generateAudioSessionId()

            virtualizer = Virtualizer(0, sessionId).apply {
                enabled = true
                strength = 1000 // Set the strength to the max for spatial effect
            }

            Log.d("SpatialAudioEffect", "Virtualizer enabled: ${virtualizer?.enabled}, Strength: ${virtualizer?.strength}")
        } catch (e: Exception) {
            Log.e("SpatialAudioEffect", "Error initializing Virtualizer: ${e.message}")
        }
    }

    fun release() {
        virtualizer?.release()
        virtualizer = null
    }
}
