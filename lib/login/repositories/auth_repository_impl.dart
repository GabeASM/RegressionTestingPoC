
import 'package:regression_poc/login/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> login(String email, String password) async  {
        await Future.delayed(const Duration(seconds: 1 ));
    if(email == 'psoftware@ufrontera.cl' && password == 'hola123'){
      return true;
    }
    return false;
  }

}