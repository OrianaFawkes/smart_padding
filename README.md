# SmartPadding

A Flutter padding widget with cascading values for `all`, `horizontal`,
`vertical`, and individual sides.

## Why SmartPadding?

Flutter's `Padding` widget normally requires choosing between constructors
such as `EdgeInsets.all`, `EdgeInsets.symmetric`, and `EdgeInsets.only`.

For example, if you want 16 logical pixels of padding on the left and right and
8 logical pixels on the bottom, you could write:

``` dart
Padding(
  padding: EdgeInsets.symmetric(
    horizontal: 16.0,
  ),
  child: Padding(
    padding: EdgeInsets.only(
      bottom: 8.0,
    ), 
    child: child,
  ),
)
```

or:

``` dart
Padding(
  padding: EdgeInsets.only(
    left: 16.0,
    right: 16.0,
    bottom: 8.0,
  ),
  child: child,
)
```

With `SmartPadding`, the same layout can be expressed as:

``` dart
SmartPadding(
  horizontal: 16.0,
  bottom: 8.0,
  child: child,
)
```

## Usage

### All sides

``` dart
SmartPadding(
  all: 16.0,
  child: child,
)
```

### Horizontal and vertical

``` dart
SmartPadding(
  horizontal: 16.0,
  vertical: 8.0,
  child: child,
)
```

### Individual sides

``` dart
const SmartPadding(
  left: 16.0,
  top: 8.0,
  right: 24.0,
  bottom: 4.0,
  child: child,
)
```

### Cascading values

Values can be combined. More-specific values override less-specific values.

``` dart
SmartPadding(
  all: 16.0,
  horizontal: 24.0,
  bottom: 8.0,
  child: child,
)
```

This resolves to:

| Side   | Value   | Source       |
| ------ | ------: | ------------ |
| Left   |    24.0 | `horizontal` |
| Right  |    24.0 | `horizontal` |
| Top    |    16.0 | `all`        |
| Bottom |     8.0 | `bottom`     |

The resolution order for each side is:

`individual side → horizontal/vertical → all → 0.0`

A value of `0.0` is explicit and does not fall back to another value.

## Installation

Add `smart_padding` to your dependencies:

``` yaml
dependencies:
  smart_padding: ^1.0.0
```

Then import it:

``` dart
import 'package:smart_padding/smart_padding.dart';
```

## Limitations

SmartPadding currently works with physical sides (`left`, `right`, `top`,
and `bottom`). Directional `start` and `end` values are not currently
supported.

## Example

See the [example](example) directory for a complete Flutter application
demonstrating SmartPadding.

## Issues and contributions

Bug reports and feature requests are welcome through the project's
[issue tracker](https://github.com/OrianaFawkes/smart_padding/issues).

## License

SmartPadding is released under the MIT License.
