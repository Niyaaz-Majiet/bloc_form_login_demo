import 'package:bloc_login_demo/blocs/form_bloc.dart';
import 'package:bloc_login_demo/blocs/form_provider.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = FromProvider.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 239.0, left: 50.0, right: 50.0),
          height: 550.0,
          child: Form(
              child: Column(
            children: [
              _emailField(formBloc),
              _passwordField(formBloc),
              _checkbox(),
              _submitButton(formBloc),
              _forgotPasswordButton(context)
            ],
          )),
        ),
      ),
    );
  }

  Widget _emailField(FormBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snap) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email',
                errorText: snap.error),
            onChanged: (String value) {
              bloc.changeEmail(value);
            },
          );
        });
  }

  Widget _passwordField(FormBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.password,
        builder: (context, snap) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            maxLength: 20,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snap.error),
            onChanged: (String value) {
              bloc.changePassword(value);
            },
          );
        });
  }

  Widget _checkbox() {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (checked) => {}),
        Text('Keep Me Logged In'),
      ],
    );
  }

  Widget _submitButton(FormBloc bloc) {
    return StreamBuilder<bool>(
        stream: bloc.submitValidFrom,
        builder: (context, snap) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: snap.hasError ? null : bloc.submit,
              child: const Icon(Icons.arrow_forward),
              color: Colors.red,
              clipBehavior: Clip.hardEdge,
              elevation: 10,
              disabledColor: Colors.blueGrey,
              disabledElevation: 10,
              disabledTextColor: Colors.white,
            ),
          );
        });
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/forgot-password'),
        child: Container(
          child: Text('Forgot Password ?'),
          alignment: Alignment.bottomLeft,
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/sign-up'),
        child: Container(
          child: Text('Sign Up ?'),
          alignment: Alignment.bottomLeft,
        ),
      ),
    ]);
  }
}
