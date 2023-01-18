### MacOS Configuration
## Install appdmg
```xml
npm install -g appdmg
```

## Build macos
```xml
flutter clean
flutter build macos
```

## Deploy file dmg
```xml
cd installers/dmg
appdmg ./config.json ./filename.dmg
```

![Screenshot](screenshot-macos.1.2.0.png)

