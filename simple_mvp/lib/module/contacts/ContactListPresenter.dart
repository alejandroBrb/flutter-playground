import 'ContactListContract.dart';

import '../../injections/InjectorContact.dart';
import '../../data/ContactRepository.dart';

class ContactListPresenter {
  ContactListContract _view;
  ContactRepository _repository;

  ContactListPresenter(this._view) {
    _repository = new InjectorContact().contactRepository;
  }

  void loadContact() {
    assert(_view != null);

    _repository.fetch()
        .then((contacts) {
          _view.onLoadContactsComplete(contacts);
        })
        .catchError((onError) {
          print(onError);
          _view.onLoadContactsError();
    });
  }
}