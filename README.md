# user_listing_app

## Installation
- Add [Flutter](https://flutter.dev/docs/get-started/install 'Flutter') to your machine
- Open this project folder with Terminal/CMD
- Ensure there's no cache/build left over by running `flutter clean` in the Terminal
- Run in the Terminal `flutter pub get`
- Run in the Terminal `dart run build_runner build --delete-conflicting-outputs`

## Before Run
- Make sure the .env(dev,prod) file is in the root project

## Running the App
- Open Android Emulator
- Run `flutter run`


## Build an APK
- Run `flutter build apk --release` 
- The apk will be saved under this location: `[project]/build/app/outputs/flutter-apk/`
- We can also build appbundle (.aab) by running this command: `flutter build appbundle --flavor {RELEASE_TYPE}`

## More Info
- APK build in folder /doc name file reqres
- API use https://reqres.in/
