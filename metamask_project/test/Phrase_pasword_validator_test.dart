import 'package:flutter_test/flutter_test.dart';
import 'package:metamask_project/Screens/Auth/CreateWallet.dart';

void main() {

  test("empty password ", () {

    final result = PasswordFieldValidator.validate('');
    expect(result, "Please a Enter Password");
  });

  test("non-empty but wrong format password ", () {

    final result = PasswordFieldValidator.validate('password');
    expect(result, "Password must have at least 8 characters,one uppercase, one lowercase, one digit");
  });

  test("non-empty and right format password ", () {

    final result = PasswordFieldValidator.validate('TruongGiaBinh!@#12');
    expect(result, null);
  });

  test('empty password in confirm password ', () {

    final result = PasswordConfirmationFieldValidator.validate('', 'TruongGiaBinh!@#12');
    expect(result, 'Please re-enter password');
  });

  test('wrong password in confirm password ', () {

    final result = PasswordConfirmationFieldValidator.validate('password', 'TruongGiaBinh!@#12');
    expect(result, 'Password does not match');
  });

  test('wrong password in confirm password ', () {

    final result = PasswordConfirmationFieldValidator.validate('TruongGiaBinh!@#12', 'TruongGiaBinh!@#12');
    expect(result, null);
  });

  test('wrong phrase ', () {
    final result = PhrasesValidator.validate('people', 'peopeo');
    expect(result, '');
  });

  test('right phrase ', () {
    final result = PhrasesValidator.validate('people', 'people');
    expect(result, null);
  });
}