import 'package:bloc/bloc.dart';
import 'package:mamc/screens/MyBill.dart';
import 'package:mamc/screens/loginPage.dart';
import '../screens/VisitPage.dart';
import '../screens/MyPayment.dart';
import '../screens/SettingPage.dart';
import '../screens/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  VisitClickedEvent,
  MyBillClickedEvent,
  MyPaymentClickedEvent,
  SettingsClickedEvent,
  LoginPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.VisitClickedEvent:
        yield VisitPage();
        break;
      case NavigationEvents.MyBillClickedEvent:
        yield Bill();
        break;
        case NavigationEvents.MyPaymentClickedEvent:
        yield MyPaymentPage();
        break;
        case NavigationEvents.SettingsClickedEvent:
        yield SettingPage();
        break;
        case NavigationEvents.LoginPageClickedEvent:
        yield LoginPage();
    }
  }
}
