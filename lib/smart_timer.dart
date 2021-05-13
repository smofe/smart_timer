library smart_timer;

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

/// A [SmartTimer] is a [Timer] which only runs while the app is _resumed_.
///
/// When the app is in the background, the [SmartTimer] will stop ticking. Uses a
/// [WidgetsBindingObserver] to react to AppLifeCycle changes.
class SmartTimer with WidgetsBindingObserver {
  final Duration duration;
  final Function onTick;

  late Timer _timer;

  SmartTimer({required this.duration, required this.onTick}) {
    WidgetsBinding.instance?.addObserver(this);
    _initializeTimer();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(duration, (timer) {
      onTick();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      _timer.cancel();
    } else {
      _initializeTimer();
    }
    super.didChangeAppLifecycleState(state);
  }

  /// Cancels the timer.
  void cancel() {
    _timer.cancel();
    WidgetsBinding.instance?.removeObserver(this);
  }
}
