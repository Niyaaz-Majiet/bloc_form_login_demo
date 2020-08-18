// Makes data accessible from the child widget

import 'package:bloc_login_demo/blocs/form_bloc.dart';
import 'package:flutter/material.dart';

class FromProvider extends InheritedWidget {
  final bloc = FormBloc();

  FromProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static FormBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FromProvider) as FromProvider)
        .bloc;
  }
}
