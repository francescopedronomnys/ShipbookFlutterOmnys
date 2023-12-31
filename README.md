# shipbook_flutter_omnys

A very simple Flutter plugin for Shipbook.io remote logging service.

This is NOT an official Shipbook plugin and is NOT intended for production usage, just a test package. This is not actively maintained.

## Getting Started

If you want to use it add this to your pubspec.yaml:
```
shipbook_flutter_omnys:
  git:
    url: https://github.com/francescopedronomnys/ShipbookFlutterOmnys
    ref: master
```

Init the plugin somewhere (e.g. in your Flutter app main):
```
    ShipbookFlutterOmnys().start(
      appId: "YOUR_APP_ID", //TODO change me
      appKey: "YOUR_APP_KEY", //TODO change me
    );
```
Then you can log some messages:
```
ShipbookFlutterOmnys().log(message);
```
All messages will be logged at Debug level (some further development is needed to support different levels) and this cannot be changed, a TAG could be set on `log()` method. 

### Android configuration

This plugin needs a specific initialization on Android to get an instance of your Application class (this is needed by Shipbook's Android SDK), so add this line in your Application's onCreate() method:
```
ShipbookFlutterOmnysPlugin.init(this)
```
