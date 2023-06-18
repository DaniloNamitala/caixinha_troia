import 'dart:convert';
import 'package:crypto/crypto.dart';

extension StringClear on String {
  // remove '.', '#', '$', '[', or ']'
  String removeInvalidChars() {
    return replaceAll(RegExp("\\."), "(dot)")
        .replaceAll(RegExp("#"), "(hash)")
        .replaceAll(RegExp("\\\$"), "(dol)")
        .replaceAll(RegExp("\\["), "(lb)")
        .replaceAll(RegExp("\\]"), "(rb)");
  }

  String restoreInvalidChars() {
    return replaceAll(RegExp("(dot)"), ".")
        .replaceAll(RegExp("(hash)"), "#")
        .replaceAll(RegExp("(dol)"), "\\\$")
        .replaceAll(RegExp("(lb)"), "[")
        .replaceAll(RegExp("(rb)"), "]");
  }

  bool invalidEmail() {
    final exp = RegExp("[a-zA-Z0-9\\.]+@estudante.ufla.br");
    return !exp.hasMatch(this);
  }
}

extension Encrypt on String {
  String encrypted() {
    final bytes = utf8.encode(this);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
