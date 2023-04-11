String? baseFieldCheck(
  String fieldName,
  String? value, {
  bool isRequired = false,
  String? emptyLengthMessage,
  int minLength = 10,
  String? minLengthMessage,
  int maxLength = 100,
  String? maxLengthMessage,
}) {
  minLengthMessage ??= "This field must be more then $minLength.";
  maxLengthMessage ??= "This field must be less then $maxLength.";
  emptyLengthMessage ??= "This field is required.";

  if (isRequired) {
    if (value == null || value.isEmpty) {
      return emptyLengthMessage;
    } else if (value.length < minLength) {
      return minLengthMessage;
    } else if (value.length > maxLength) {
      return maxLengthMessage;
    }
  } else {
    if (value != null) {
      if (value.length > maxLength) {
        return maxLengthMessage;
      } else if (value.isNotEmpty && value.length < minLength) {
        return minLengthMessage;
      }
    }
  }

  return null;
}

String? checkFileUrl(
  String? value, {
  List<String> fileExtensions = const ["pdf"],
  String? emptyLengthMessage,
  int minLength = 10,
  String? minLengthMessage,
  int maxLength = 400,
  String? maxLengthMessage,
  bool validateByRegExp = true,
  String? linkMessage,
  String? extensionMessage,
}) {
  var baseCheck = baseFieldCheck(
    "Link",
    value,
    minLength: minLength,
    emptyLengthMessage: emptyLengthMessage,
    maxLength: maxLength,
    maxLengthMessage: maxLengthMessage,
  );

  if (baseCheck == null) {
    if (value == null) return null;

    linkMessage ??= "Link is wrong.";
    extensionMessage ??= "Such a file isn't allowed.";

    if ((Uri.tryParse(value)?.hasAbsolutePath ?? false) == false) {
      return "Link is wrong";
    }

    if (fileExtensions.contains(value.split('.').last) == false) {
      return extensionMessage;
    }
  }
  return baseCheck;
}
