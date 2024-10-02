# M3U8 單檔下載器

此儲存庫包含一個簡單的批次腳本，用於下載指定的 M3U8 影片檔案。通過設定 URL 與檔案名稱，您可以輕鬆使用 `ffmpeg` 將影片從 M3U8 播放清單下載到本地。

## 功能
- 下載單個 M3U8 影片檔案至指定目錄。
- 可自定義影片 URL 與檔案名稱。
- 可選擇在下載完成後自動執行其他操作，例如關機。

## 需求條件
- [ffmpeg](https://ffmpeg.org/) 必須安裝並添加到系統的 PATH 中，確保可以從命令提示字元中直接使用 `ffmpeg` 指令。

## 使用方法

1. 下載程式碼：
   `M3U8-BATCH-Downloader.bat`
2. 編輯批次檔案：
- 修改 `base_url` 為要下載的 M3U8 播放清單的 URL。
- 更新 `output_dir` 為您希望存放影片的目錄。
- 修改 `file_name` 為影片的輸出檔案名稱。
3. 如果播放清單需要使用多種協議或解密，您可以取消註解以下範例：

  ```bash
  ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i "sample.m3u8" -c copy -bsf:a aac_adtstoasc sample.mp4
  ```
  `-protocol_whitelist`: 指定允許使用的協議，如 `file`, `http`, `https`, `tcp`, `tls`, `crypto`。
  `aac_adtstoasc`: 處理音訊流中的 AAC 格式，使其能夠正確儲存在 MP4 中。
  
4. 執行腳本：
  `M3U8-BATCH-Downloader.bat`
5. 影片將會被下載至指定資料夾中。
  
## 自定義功能
### 下載其他影片
如果您需要下載其他 M3U8 影片，請修改批次檔案中的 `base_url` 和 `file_name` 變數。

### 完成後自動關機
若您希望在影片下載完成後關機，只需取消註解批次檔案中的關機指令。

## 授權
此專案依據 MIT 授權條款進行發佈。
