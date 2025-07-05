# H.266 / VVC Video Encoder (Batch Script for Windows)

This is a simple Windows batch script that allows you to encode video files to the H.266/VVC format using FFmpeg and the `libvvenc` encoder.

---

## ⚙️ Requirements

Before using this script, you must install **FFmpeg with full libvvenc support**.

### 🔽 Download FFmpeg Full Build with VVC support

1. Go to: [https://www.gyan.dev/ffmpeg/builds/](https://www.gyan.dev/ffmpeg/builds/)
2. Scroll to the **"git master builds"** section.
3. Under **"latest git master branch build"**, download this archive:
   - 📦 `ffmpeg-git-full.7z`
4. Extract the archive using [7-Zip](https://www.7-zip.org/) or similar.
   - You will get a folder named like:
     ```
     ffmpeg-YYYY-MM-DD-git-xxxxxxxxxx-full_build
     ```

### 📂 Place the script

1. Copy `encode-vvc.bat` into the root of the extracted folder above.
2. You should now have a structure like:
   ```
   ffmpeg-YYYY-MM-DD-git-xxxxxxxxxx-full_build/
   ├── bin/
   ├── doc/
   ├── presets/
   ├── encode-vvc.bat
   └── ...
   ```

---

## ▶️ How to Use

1. **Double-click** on `encode-vvc.bat` to run it.
2. Follow the prompts:
   - Input one or more file paths (use **quotes** if they contain spaces).
     - Example: `"C:\Videos\My Movie.mp4" "MyOtherClip.mov"`
   - Choose encoding speed: faster → slower
   - Choose quality control mode:
     - QP (recommended: 22–37)
     - Bitrate (e.g., `3000k`)
   - Set GOP period (e.g., 10)
   - Choose output extension (`mp4`, `mkv`, etc.)

3. Encoded videos will be saved in:
   ```
   outputs/YYYY-MM-DD/
   ```

   This folder is automatically created based on the current date.

---

## 📌 Notes

- The script **preserves the original audio track** (`-c:a copy`).
- Supports **batch encoding** of multiple files at once.
- Compatible only with **Windows** systems (via `.bat` script).
- Requires a FFmpeg version that includes `libvvenc`.

---

## 🧠 About VVC (H.266)

Versatile Video Coding (VVC), also known as H.266, is a cutting-edge video compression standard offering **significant bitrate savings** compared to H.265/HEVC and older formats — ideal for 4K/8K content and streaming efficiency.

---

## 🙏 Credits

- **FFmpeg**: [https://ffmpeg.org/](https://ffmpeg.org/)  
  > FFmpeg is a powerful open-source multimedia framework to decode, encode, transcode, stream, and play almost anything.

- **VVenc (VVC Encoder by Fraunhofer HHI)**: [https://github.com/fraunhoferhhi/vvenc](https://github.com/fraunhoferhhi/vvenc)  
  > VVenc is an open and optimized implementation of the H.266/VVC standard.

---

## 📜 License

This script is provided under the MIT License. FFmpeg and VVenc are licensed separately — check their respective repositories for details.
