# 🪔 Sakhi Smart Money — Flutter Build Guide

## Prerequisites
Install these on your machine:
1. **Flutter SDK** → https://docs.flutter.dev/get-started/install
   - Run `flutter doctor` to verify setup
2. **Android Studio** → https://developer.android.com/studio
   - Install Android SDK (API 33+)
   - Install Android Emulator OR connect a physical Android device
3. **Java JDK 17** (included with Android Studio)

---

## Project Structure
```
sakhi_smart_money/
├── lib/
│   ├── main.dart                  ← App entry point
│   ├── models/
│   │   └── game_state.dart        ← Game state (Provider)
│   ├── data/
│   │   └── game_data.dart         ← All events, scams, choices
│   ├── screens/
│   │   ├── splash_screen.dart     ← Welcome / intro screen
│   │   ├── main_game_screen.dart  ← Main layout + nav
│   │   ├── home_tab.dart          ← Home dashboard
│   │   ├── income_tab.dart        ← Step 1: Income
│   │   ├── jars_tab.dart          ← Step 2: Money Jar Puzzle
│   │   ├── events_tab.dart        ← Step 3: Life Events + Scam Defense
│   │   └── progress_tab.dart      ← Step 4: Progress & Badges
│   ├── widgets/
│   │   └── game_card.dart         ← Reusable UI components
│   └── utils/
│       └── app_theme.dart         ← Colors, fonts, theme
├── assets/images/                 ← (add your images here)
├── pubspec.yaml                   ← Dependencies
└── android/                       ← Android config
```

---

## Step-by-Step Build Instructions

### Step 1 — Get dependencies
```bash
cd sakhi_smart_money
flutter pub get
```

### Step 2 — Run on emulator or device
```bash
# List available devices
flutter devices

# Run debug build
flutter run

# Run on specific device
flutter run -d emulator-5554
```

### Step 3 — Build release APK (Android)
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`
→ Share this APK file to install on any Android phone.

### Step 4 — Build App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### Step 5 — Build for iOS (Mac only)
```bash
flutter build ios --release
# Then open Xcode and archive
```

---

## Font Setup (Required)
The app uses **Baloo 2** font. Add it to pubspec.yaml if not using google_fonts:
```yaml
flutter:
  fonts:
    - family: Baloo2
      fonts:
        - asset: assets/fonts/Baloo2-Regular.ttf
        - asset: assets/fonts/Baloo2-Bold.ttf
          weight: 700
        - asset: assets/fonts/Baloo2-ExtraBold.ttf
          weight: 800
```
Or keep using `google_fonts` package (requires internet on first load).

---

## Adding App Icon
1. Create a 1024x1024 PNG icon
2. Add to `assets/images/icon.png`
3. Install flutter_launcher_icons:
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/icon.png"
```
4. Run: `flutter pub run flutter_launcher_icons`

---

## Adding Splash Screen
Install `flutter_native_splash`:
```yaml
dev_dependencies:
  flutter_native_splash: ^2.3.2

flutter_native_splash:
  color: "#0F0A1E"
  image: assets/images/splash_logo.png
  android: true
  ios: true
```
Run: `flutter pub run flutter_native_splash:create`

---

## Features Implemented
| Feature | Status |
|--------|--------|
| Monthly Game Loop (12 months) | ✅ |
| Step 1: Income Display | ✅ |
| Step 2: Money Jar Puzzle (4 jars) | ✅ |
| Step 3: Life Events (5 scenarios) | ✅ |
| Step 3b: Scam Defense (4 scam types) | ✅ |
| Progress Meters (Health/Stress/Confidence) | ✅ |
| XP + Level System (5 levels) | ✅ |
| Achievement Badges (4 badges) | ✅ |
| Voice Guidance Bubbles (Hindi) | ✅ |
| Score Tracking | ✅ |
| Offline Mode (no internet needed) | ✅ |
| Dark Purple Theme | ✅ |
| Monthly Report | ✅ |
| Result Dialogs with Effects | ✅ |

---

## Troubleshooting
- `flutter doctor` shows issues → Follow the fix instructions it shows
- `Gradle build failed` → Run `cd android && ./gradlew clean` then retry
- `pub get fails` → Check internet connection, run `flutter pub cache repair`
- Font not loading → Use `google_fonts` package or add font files to assets

---

## Play Store Release Checklist
- [ ] Change `applicationId` in `android/app/build.gradle`
- [ ] Update version in `pubspec.yaml`
- [ ] Generate signing keystore: `keytool -genkey -v -keystore release.keystore`
- [ ] Configure signing in `android/app/build.gradle`
- [ ] Build: `flutter build appbundle --release`
- [ ] Upload AAB to Google Play Console

