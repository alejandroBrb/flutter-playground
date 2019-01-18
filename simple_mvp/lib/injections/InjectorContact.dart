import 'Flavor.dart';
import '../data/ContactRepository.dart';
import '../data/MockContactRepository.dart';
import '../data/RandomContactRepository.dart';

class InjectorContact {

  static final InjectorContact _singleton = new InjectorContact._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor){
    _flavor = flavor;
  }

  factory InjectorContact() {
    return _singleton;
  }

  InjectorContact._internal();

  ContactRepository get contactRepository {
    switch(_flavor) {
      case Flavor.MOCK: 
        return new MockContactRepository();
      default: 
        return new RandomContactRepository();
    }
  }
}