import 'dart:async';

import 'Contact.dart';
import 'ContactRepository.dart';

class MockContactRepository implements ContactRepository {
  Future<List<Contact>> fetch() {
    return new Future.value(kContacts);
  }
}

const kContacts = const <Contact>[
  const Contact(
    fullName: "Alejandro Barba",
    email: "alejandro@zubut.com"
  ),
  const Contact(
    fullName: "Juan Lopez",
    email: "juan@zubut.com"
  )
];