import 'dart:async';
import 'Contact.dart';

abstract class ContactRepository {
  Future<List<Contact>> fetch();
}