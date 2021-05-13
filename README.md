[![Pub](https://img.shields.io/pub/v/smart_timer.svg)](https://pub.dev/packages/smart_timer)
# smart_timer

A periodic Timer which runs only while the app's lifecycle is _resumed_.

The default Dart timer also runs while the app is paused, e.g. if it is in the background. This can be useful sometimes, but often you might want to stop the timer to save resources. smart_timer listens to app lifecycle changes and pauses/resumes the timer accordingly. 

## Usage
``` dart
SmartTimer(
  duration: Duration(seconds: 1),
  onTick: () => print("Hello World"),
)
```

