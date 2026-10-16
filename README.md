# Windows 11 Debloater & Restore Tool

> **Made by [lavenderpoet608](https://t.me/lavenderpoet608)** • **Telegram:** [https://t.me/lavenderpoet608](https://t.me/lavenderpoet608)

Tool otomasi berbasis PowerShell dengan antarmuka grafis (**GUI**) modern untuk membersihkan aplikasi bawaan (*bloatware*), mematikan telemetri dan iklan, mencopot instalasi Microsoft Edge secara menyeluruh, serta menyediakan fitur **Restore 1-Klik** untuk mengembalikan seluruh pengaturan sistem kapan saja.

---

## 🌟 Fitur Utama

### 1. 🛡 Keamanan Sistem Terjamin
- **Auto Admin Elevation**: Meminta hak akses Administrator secara otomatis melalui prompt UAC.
- **System Restore Point Otomatis**: Membuat titik pemulihan sistem (`BeforeDebloat`) sebelum modifikasi dilakukan.
- **Akses Cepat System Restore**: Tombol langsung untuk membuka wizard pemulihan bawaan Windows (`rstrui.exe`).

### 2. 🚫 Uninstall Paksa Microsoft Edge & Blokir Update
- **Bypass Proteksi Sistem**: Membuka kunci registri sistem Windows 11 yang mengunci uninstalasi Edge.
- **Eksekusi Uninstaller Resmi**: Menjalankan Chromium `setup.exe` dengan parameter `--msedge` dan `--delete-profile`.
- **Hapus Paket AppX Modern**: Menghapus `Microsoft.MicrosoftEdge.Stable`, `Microsoft.Edge.GameAssist`, `Microsoft.EdgeDevtoolsPlugin`, dan `Microsoft.MicrosoftEdgeDevToolsClient`.
- **Pembersihan Residu**: Menghapus sisa folder instalasi di `Program Files (x86)` serta membersihkan shortcut di Desktop, Start Menu, Quick Launch, dan Taskbar.
- **Blokir Pembaruan**: Menerapkan kebijakan registri dan menonaktifkan scheduled tasks agar Edge tidak terpasang kembali via Windows Update.

### 3. 📱 Auto-Detect Phone Link (`Microsoft.YourPhone`)
- Mendeteksi secara cerdas apakah aplikasi Phone Link terhubung atau aktif digunakan dengan smartphone pengguna (memeriksa proses, file cache pairing, dan registri).
- **Jika terhubung**: Aplikasi **dipertahankan** agar sinkronisasi smartphone tidak terganggu.
- **Jika tidak terhubung**: Aplikasi dihapus secara aman sebagai bloatware yang tidak terpakai.

### 4. 🗑 Pembersihan Bloatware Windows 11
- Menghapus aplikasi bawaan yang tidak diperlukan untuk seluruh pengguna (`-AllUsers`) serta paket provisioning sistem (`-Online`).
- Daftar aplikasi yang dibersihkan meliputi: *Bing News, Bing Weather, Bing Search, Bing Finance, Bing Sports, Clipchamp, Cortana, Copilot, Get Help, Tips/Get Started, Solitaire Collection, Mixed Reality Portal, OneNote, Outlook Baru, People, Power Automate, Skype, To Do, Alarms & Clock, Feedback Hub, Maps, Sound Recorder, Media Player / Zune, Microsoft Teams, dan Dev Home*.

### 5. ☁️ Uninstall OneDrive Menyeluruh
- Menghentikan proses OneDrive yang berjalan.
- Menjalankan uninstaller resmi `OneDriveSetup.exe /uninstall`.
- Menghapus sisa folder instalasi di UserProfile, LocalAppData, dan ProgramData.
- Menghapus pin folder OneDrive dari panel navigasi File Explorer.

### 6. 🔒 Privasi, Anti-Telemetri & Iklan
- **Matikan Widgets & Berita**: Menonaktifkan feed berita MSN dan widget di Taskbar.
- **Start Menu Bersih**: Mematikan pencarian web Bing dan saran pencarian online di Start Menu.
- **Matikan Copilot**: Menonaktifkan Windows Copilot pada tingkat user maupun machine.
- **Anti Iklan & Saran Aplikasi**: Mematikan *Windows Consumer Features*, instalasi aplikasi otomatis di latar belakang, dan rekomendasi aplikasi bawaan.
- **Nonaktifkan Telemetri**: Mematikan pengumpulan data telemetri diagnostik Windows (`AllowTelemetry = 0`), menghentikan layanan `DiagTrack` dan `dmwappushservice`, serta menonaktifkan scheduled tasks telemetri terkait.

### 7. 🧹 Pembersihan File Temporary
- Membersihkan cache dan file sampah di folder `%TEMP%` pengguna dan direktori `C:\Windows\Temp`.

### 8. 🔄 Fitur Pemulihan (Restore / Kembalikan Semua)
- Mengembalikan seluruh kebijakan registri ke kondisi semula.
- Mengaktifkan kembali layanan telemetri dan scheduled tasks.
- Mengaktifkan kembali izin instalasi Edge dan memasangnya kembali via `winget` (dengan fallback pengunduh installer resmi Microsoft).
- Mengembalikan ikon OneDrive di File Explorer dan menjalankan setup instalasi jika file lokal tersedia.
- Mendaftarkan ulang seluruh aplikasi bawaan Windows (`AppXManifest.xml`).

---

## 📋 Persyaratan Sistem

- **Sistem Operasi**: Windows 11 (Semua edisi dan versi, termasuk 23H2, 24H2, dan 25H2).
- **PowerShell**: Windows PowerShell 5.1 atau PowerShell 7+.
- **Hak Akses**: Administrator (skrip akan meminta izin secara otomatis).

---

## 🚀 Cara Menjalankan

1. Buka folder proyek di File Explorer.
2. Klik kanan file `Windows11_Debloater_Restore.ps1` lalu pilih **Run with PowerShell**.
3. Atau jalankan melalui PowerShell / Terminal:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\Windows11_Debloater_Restore.ps1
   ```
4. Jendela aplikasi akan terbuka:
   - Centang fitur pembersihan yang diinginkan.
   - Klik **Jalankan Pembersihan (Debloat)** untuk mulai mengoptimasi sistem.
   - Atau klik **Restore / Kembalikan Semua** untuk memulihkan pengaturan.
5. Pantau status dan kemajuan proses melalui panel **Status & Riwayat Log**.

---

## ⚠️ Catatan & Keamanan

- Skrip selalu menyertakan opsi pembuatan **System Restore Point** sebelum eksekusi untuk memastikan Anda dapat kembali ke kondisi sistem sebelumnya jika diperlukan.
- Setelah proses selesai, Windows Explorer akan dimulai ulang secara otomatis untuk menerapkan perubahan antarmuka tanpa mewajibkan restart perangkat.

---

## 👤 Author & Kontak

- **Creator**: **lavenderpoet608**
- **Telegram**: [https://t.me/lavenderpoet608](https://t.me/lavenderpoet608)

