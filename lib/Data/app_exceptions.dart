abstract class AppExceptions implements Exception {
  final String? message;
  final String? prefix;
  AppExceptions({this.message, this.prefix});
  @override
  String toString() {
    return "$prefix :: $message";
  }
}

class BadRequestException extends AppExceptions {
  BadRequestException(msg) : super(message: msg, prefix: "Invalid request");
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException(String msg)
    : super(message: msg, prefix: "Unauthorized");
}

class FetchDataException extends AppExceptions {
  FetchDataException(String msg) : super(message: msg, prefix: "Server Error");
}

class ConflictException extends AppExceptions {
  ConflictException(String msg) : super(message: msg, prefix: "Conflict Error");
}
