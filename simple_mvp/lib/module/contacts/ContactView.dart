import 'package:flutter/material.dart';
import 'package:simple_mvp/data/Contact.dart';

import 'ContactListContract.dart';
import 'ContactListPresenter.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contacts"),
      ),
      body: new ContactList(),
    );
  }
}

//
//  ContactList
//
class ContactList extends StatefulWidget {
  ContactList({ Key key }) : super(key: key);

  @override
  _ContactListState createState() => new _ContactListState();
}

class _ContactListState extends State<ContactList> implements ContactListContract {

  ContactListPresenter _presenter;
  List<Contact> _contacts;
  bool _isSearching;

  _ContactListState() {
    // Init presenter
    _presenter = new ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadContact();
  }

  @override
  void onLoadContactsComplete(List<Contact> contacts) {
    setState(() {
      _contacts = contacts;
      _isSearching = false;
    });
  }

  @override
  void onLoadContactsError() {
    onLoadContactsError();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if(_isSearching) {
      widget = new Center(
        child: new Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: new CircularProgressIndicator(),
        ),
      );
    } else {
      widget = new ListView.builder(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (BuildContext context, int index) {
          return new _ContactListItem(_contacts[index]);
        }
      );
    }
    return widget;
  }
}

//
// ContactListItem
//

class _ContactListItem extends StatelessWidget {
  _ContactListItem(Contact contact) : _contact = contact;

  final Contact _contact;

  @override
  Widget build(BuildContext context) {
    return new Text(_contact.fullName);
  }
}