#!/bin/bash

# Boom Audio Fix Script
# This script helps resolve common issues after the installation of Boom Audio

echo "Starting Boom Audio fix..."

# Clear audio effects cache (if applicable)
echo "Clearing audio effects cache..."
rm -rf /data/data/com.android.audiofx/cache/*
rm -rf /data/data/com.android.audiofx/files/*

# Reset permissions on system audio files (example paths)
echo "Resetting permissions on audio files..."
chmod 644 /system/etc/audio_effects.conf
chmod 644 /system/etc/sound_effects.conf
chmod 644 /system/lib/soundfx/*

# Clear Dalvik and cache
echo "Clearing Dalvik cache..."
rm -rf /data/dalvik-cache/*
rm -rf /cache/dalvik-cache/*

# Optional: Fix SELinux contexts (for permissive mode or enforcing issues)
echo "Restoring SELinux contexts..."
restorecon -Rv /system

# Reboot the device to apply changes
echo "Rebooting device..."
reboot

echo "Boom Audio fix applied successfully!"