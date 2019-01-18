import 'package:flutter/material.dart';

import 'module/contacts/ContactView.dart';
import 'injections/InjectorContact.dart';
import 'injections/Flavor.dart';

void main() {
  InjectorContact.configure(Flavor.PRO);

  runApp(
      new MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(
              primarySwatch: Colors.blue
          ),
          home: new ContactsPage()
      )
  );
}