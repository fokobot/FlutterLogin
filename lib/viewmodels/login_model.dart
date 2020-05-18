import 'package:demo_app/base/base_model.dart';
import 'package:demo_app/models/user.dart';
import 'package:demo_app/services/authentication_service.dart';

import '../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  User get user => _authenticationService.user;
 
  Future<bool> login() async {
    setState(ViewState.Busy);
    var success = await _authenticationService.login('a@a.com', '123456');
    notifyListeners();
    setState(ViewState.Idle);
    return success;
  }
}