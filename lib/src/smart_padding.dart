import 'package:flutter/widgets.dart';

/// A padding widget that resolves values using a cascading hierarchy.
///
/// Values are resolved independently for each side, using the following
/// precedence:
///
/// 1. Individual side values: [left], [top], [right], [bottom]
/// 2. Axis values: [horizontal], [vertical]
/// 3. The [all] value
/// 4. `0.0` if no value is provided
///
/// For example:
///
/// ```dart
/// SmartPadding(
///   all: 16.0,
///   horizontal: 24.0,
///   bottom: 8.0,
///   child: child,
/// )
/// ```
///
/// resolves to:
///
/// - left: 24.0
/// - right: 24.0
/// - top: 16.0
/// - bottom: 8.0
///
/// A value of `0.0` is considered an explicitly provided value and therefore
/// does not fall back to a less-specific value.
///
/// This widget uses physical sides (`left` and `right`) rather than
/// directional sides (`start` and `end`).
class SmartPadding extends StatelessWidget {
  /// Creates a [SmartPadding] widget.
  const SmartPadding({
    required this.child,
    this.all,
    this.horizontal,
    this.vertical,
    this.left,
    this.top,
    this.right,
    this.bottom,
    super.key,
  });

  /// The widget to display inside the padding.
  final Widget child;

  /// The default padding for all four sides.
  ///
  /// Overridden by [horizontal], [vertical], or an individual side value
  /// where applicable.
  final double? all;

  /// The default padding for the left and right sides.
  ///
  /// Individual [left] and [right] values take precedence.
  final double? horizontal;

  /// The default padding for the top and bottom sides.
  ///
  /// Individual [top] and [bottom] values take precedence.
  final double? vertical;

  /// The padding for the left side.
  ///
  /// Takes precedence over [horizontal] and [all].
  final double? left;

  /// The padding for the top side.
  ///
  /// Takes precedence over [vertical] and [all].
  final double? top;

  /// The padding for the right side.
  ///
  /// Takes precedence over [horizontal] and [all].
  final double? right;

  /// The padding for the bottom side.
  ///
  /// Takes precedence over [vertical] and [all].
  final double? bottom;

  EdgeInsets get _resolvedPadding {
    return EdgeInsets.only(
      left: left ?? horizontal ?? all ?? 0.0,
      top: top ?? vertical ?? all ?? 0.0,
      right: right ?? horizontal ?? all ?? 0.0,
      bottom: bottom ?? vertical ?? all ?? 0.0,
    );
  }

  @override
  Widget build(_) {
    return Padding(padding: _resolvedPadding, child: child);
  }
}
