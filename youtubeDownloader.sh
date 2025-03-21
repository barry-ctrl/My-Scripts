#!/usr/bin/env bash

#This program uses the python package yt-dlp to download youtube videos
# Check if yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp is not installed. Please install it first."
    echo "You can install it using: pip install yt-dlp"
    exit 1
fi

read -p "Enter the YouTube video URL: " youtube_url

# Checking if the URL is provided
if [ -z "$youtube_url" ]; then
    echo "No URL provided. Exiting."
    exit 1
fi

# Download the video using yt-dlp
echo "Downloading video..."
yt-dlp -f "bestvideo+bestaudio" --merge-output-format mp4 -o "%(title)s.%(ext)s" "$youtube_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully!"
else
    echo "Download failed. Please check the URL and try again."
    exit 1
fi
