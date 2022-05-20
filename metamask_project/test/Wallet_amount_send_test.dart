import 'package:flutter_test/flutter_test.dart';
import 'package:metamask_project/Screens/Send/SendPage.dart';

void main() {

  test('empty receiver ', () {

    final String? result = ReceiverFieldValidator.validate('', 'VmtPZOHTkMghCZS76qzUeblmd7z2');
    expect(result, 'Please enter receiver id');
  });

  test('non-empty but wrong format receiver id ', () {

    final String? result = ReceiverFieldValidator.validate('asdwkmf', 'VmtPZOHTkMghCZS76qzUeblmd7z2');
    expect(result, 'Id must be 28 characters long');
  });

  test('non-empty and right format but sender and receiver have the same uid ', () {

    final String? result = ReceiverFieldValidator.validate('VmtPZOHTkMghCZS76qzUeblmd7z2', 'VmtPZOHTkMghCZS76qzUeblmd7z2');
    expect(result, 'You cannot send to yourself');
  });

  test('non-empty and right format but sender and receiver have the different uid ', () {

    final String? result = ReceiverFieldValidator.validate('Ee6UdUZzZWWO5kFms9K6Rq0g4EH2', 'VmtPZOHTkMghCZS76qzUeblmd7z2');
    expect(result, null);
  });

  test('empty amount', () {

    final String? result = AmountFieldValidator.validate('', 5);
    expect(result, 'Please enter amount of token');
  });

  test('larger amount', () {

    final String? result = AmountFieldValidator.validate('7', 5);
    expect(result, 'Amount you enter is larger than amount of your wallet');
  });

  test('good amount', () {

    final String? result = AmountFieldValidator.validate('3', 5);
    expect(result, null);
  });
}