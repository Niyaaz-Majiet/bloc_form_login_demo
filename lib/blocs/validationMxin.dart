import 'dart:async';

class ValidationMixin {
  final validatorEmail = new StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
    if (!email.contains("@")) {
      sink.addError("Please Enter a valid Email");
    } else if (email.indexOf('.') == -1) {
      sink.addError('Seriously');
    } else {
      sink.add(email);
    }
  });

  final validatorPassword = new StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add(password);
    } else {
      sink.addError('Password should contain more than 8 characters');
    }
  });
}
