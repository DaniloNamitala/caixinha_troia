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
