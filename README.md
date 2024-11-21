# ⚽ Football League App

The Football League App is a modern iOS application that provides users with the latest football league information, team details, match schedules, and player statistics. Built using the **MVVM design pattern**, this app ensures scalability, maintainability, and a seamless user experience.

---

## 📱 Features

- **League Overview**: View the latest standings, match results, and upcoming fixtures.
- **Offline Mode**: Access saved data when offline.

---

## 🛠️ Tech Stack

- **Language**: Swift
- **Design Pattern**: MVVM
- **Networking**: URLSession
- **Dependency Management**: CocoaPods
- **Libraries**:
  - [Kingfisher](https://github.com/onevcat/Kingfisher): For efficient image caching and SVG image rendering.
  - [SVGKit](https://github.com/SVGKit/SVGKit): For rendering SVG images.
  - [RXSwift](): for bind data
- **Error Handling**: Custom error handling with `FootballError` enum.

---

## 📂 Project Structure
FootballLeagueApp/ ├── Application/ │ ├── AppDelegate.swift │ ├── SceneDelegate.swift ├── Modules/ │ ├── Matches/ │ │ ├── Models/ │ │ ├── ViewModels/ │ │ ├── Views/ │ ├── Teams/ │ │ ├── Models/ │ │ ├── ViewModels/ │ │ ├── Views/ │ ├── Players/ │ │ ├── Models/ │ │ ├── ViewModels/ │ │ ├── Views/ ├── Networking/ │ ├── APIService.swift │ ├── Endpoints.swift ├── Shared/ │ ├── Utilities/ │ ├── FootballError.swift │ ├── Extensions/ └── Resources/ ├── Main.storyboard ├── LaunchScreen.storyboard
![Simulator Screenshot - iPhone 15 - 2024-11-21 at 18 17 47](https://github.com/user-attachments/assets/6298376f-5548-426b-a703-b7cbe8a33059)   ![Simulator Screenshot - iPhone 15 - 2024-11-21 at 18 18 30](https://github.com/user-attachments/assets/2c18631a-1a8c-426c-a95c-bae46bd4aea4)  ![Simulator Screenshot - iPhone 15 - 2024-11-21 at 18 18 36](https://github.com/user-attachments/assets/92cc7f4c-69f2-45e7-8ed7-37404040c204)



