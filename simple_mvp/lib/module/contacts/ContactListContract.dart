import '../../data/Contact.dart';

abstract class ContactListContract {
  void onLoadContactsComplete(List<Contact> contacts);
  void onLoadContactsError();
}