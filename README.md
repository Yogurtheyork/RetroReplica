# RetroReplica

SwiftUI coursework recreating the Retro home screen. 第一階段只顯示黑底白字「第 42 週」，先驗證 macOS 建置、模擬器啟動與截圖。參考圖：`reference/retro-home.jpg`，不會打包進 App。

## Windows / WSL

在這個 repository 編輯 Swift 與 `project.yml`。WSL 無法執行 Xcode 或 iOS Simulator，透過 GitHub Actions 建置：

```bash
cd /home/york/projects/iOS/RetroReplica
git status
git add .gitignore README.md project.yml RetroReplica scripts .github
git commit -m "Set up SwiftUI app and iOS preview workflow"
git push origin main
```

到 GitHub → Actions → iOS Preview 查看執行。也可在 Actions 頁按 Run workflow 手動執行。完成後下載 `ios-preview` artifact，解壓縮並確認 `retro-home.png` 顯示「第 42 週」。綠色勾勾只代表流程成功，仍需查看截圖。

流程使用 macOS runner 的預設 Xcode、列出已安裝的 Xcode / SDK / 模擬器，動態選擇可用且 iOS 17 以上的 iPhone，產生專案並編譯 Simulator 版本（停用簽署），等待模擬器開機、安裝並啟動 App，最後截圖。沒有符合條件的裝置時會明確失敗。

`ios-preview` 內包含 `preview.log`、`build.log`、裝置清單與截圖；檔案依流程進度產生，失敗時也會上傳已產生的紀錄，保留 14 天。若失敗，請先查看 Actions 的紅色步驟及 artifact 紀錄。

## 在 Mac 開啟

需要 Xcode、Command Line Tools 與已安裝的 iOS 17 以上模擬器 runtime。先開啟 Xcode 完成首次安裝，再執行：

```bash
brew install xcodegen
xcodegen generate
open RetroReplica.xcodeproj
```

選擇 `RetroReplica` scheme 與 iPhone 模擬器，按 Run。也可在 repository 根目錄執行 `bash scripts/ios-preview.sh`，產生與 CI 相同的本機截圖。產生的 Xcode 專案、DerivedData 與 artifacts 不提交；專案設定以 `project.yml` 為準。模擬器版本不需要付費 Apple 開發者帳號或簽署憑證。

## 後續階段

確認第一次 Actions 截圖後，再依參考圖拆分 SwiftUI 元件、加入本地照片、水平與垂直捲動及固定底部導覽列。這一版沒有登入、API 或完整 Retro 排版。

設定參考：[XcodeGen project spec](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md)、[GitHub macOS runner](https://github.com/actions/runner-images/blob/main/images/macos/macos-15-Readme.md)。
