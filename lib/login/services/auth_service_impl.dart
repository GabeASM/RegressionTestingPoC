
import 'package:regression_poc/login/repositories/auth_repository.dart';
import 'package:regression_poc/login/services/auth_service.dart';

class AuthServiceImpl implements AuthService{

  final AuthRepository _authRepository;

  AuthServiceImpl(this._authRepository);

  @override
  Future<bool> logInUser(String email, String password) async {
    final result = await _authRepository.login(email, password);
    return result;
  }
}