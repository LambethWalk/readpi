#!/usr/bin/env bash

export GOOGLE_APPLICATION_CREDENTIALS="/home/eyal/readpi/readpi-3d4e9ace8bbe.json"

echo "Activating virtualenv"
#source env/bin/activate

cd resources

echo "Recording... [ctrl-c to stop]"
arecord -V mono -r 16000 audio.wav

echo "Converting file"
ffmpeg -i audio.wav -acodec flac -y audio.flac

cd ../

echo "Sending to Google"
./test.py 
