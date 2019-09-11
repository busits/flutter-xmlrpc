import 'dart:convert' show base64;

/// An object corresponding to a `<fault>` in the response.
class Fault {
  /// The code contained in <faultCode>.
  final int code;

  /// The text contained in <faultString>.
  final String text;

  Fault(this.code, this.text);

  @override
  String toString() => 'Fault[code:$code,text:$text]';
}

/// A container for a base64 encoded value.
class Base64Value {
  String _base64String;
  List<int> _bytes;

  Base64Value(this._bytes);
  Base64Value.fromBase64String(this._base64String);

  String get base64String => _base64String ??= base64.encode(_bytes);

  List<int> get bytes => _bytes ??= base64.decode(_base64String);
}
