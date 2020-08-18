import 'package:rxdart/rxdart.dart';

import 'validationMxin.dart';

class FormBloc with ValidationMixin {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get email => _email.stream.transform(validatorEmail);
  Stream<String> get password => _password.stream.transform(validatorPassword);

  Stream<bool> get submitValidFrom =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    print(_email.value);
    print(_password.value);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
