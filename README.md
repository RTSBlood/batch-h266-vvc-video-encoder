# Batch H.266 / VVC Video Encoder

A simple Windows batch script to encode videos into the H.266/VVC format using FFmpeg and the `libvvenc` encoder.

## 🔧 Requirements

Download a full build of **FFmpeg** with **libvvenc** from the official builds:

➡️ [https://www.gyan.dev/ffmpeg/builds/](https://www.gyan.dev/ffmpeg/builds/)

1. Scroll to **"git master builds"**
2. Under **"latest git master branch build"**, download the archive named:  
   **`ffmpeg-git-full.7z`**
3. Extract the archive
4. Place the `encode-vvc.bat` script into the `bin` folder inside the extracted FFmpeg directory, e.g.:

```
ffmpeg-YYYY-MM-DD-git-xxxxxxxxxx-full_build/
└── bin/
    ├── ffmpeg.exe
    ├── ffprobe.exe
    ├── ...
    └── encode-vvc.bat  ← Place the script here
```

## ▶️ How to Use

1. Double-click `encode-vvc.bat`
2. Follow the prompts in the terminal:
   - Enter the video file(s) (you can enter full paths, quoted if they include spaces)
   - Choose encoding speed (preset)
   - Choose quality control mode (QP or bitrate)
   - Enter GOP period
   - Choose output file format

3. Encoded files will be saved inside the `outputs/YYYY-MM-DD/` folder based on the current date.

Example input:

```
"C:\Videos\My Movie.mp4" "C:\Other\Test.mov"
```

## 📁 Output Structure

```
outputs/
└── 2025-07-05/
    ├── My Movie-h266.mp4
    └── Test-h266.mp4
```

## ✅ Features

- Interactive encoding via terminal prompts
- Supports QP or bitrate encoding
- Organizes output by date
- Compatible with file paths that contain spaces

## 🧠 Credits

- [FFmpeg](https://ffmpeg.org/) - Multimedia framework by the FFmpeg team
- [VVenc](https://github.com/fraunhoferhhi/vvenc) - VVC encoder by Fraunhofer HHI

## 📄 License

This script is open-source and available under the MIT License.
