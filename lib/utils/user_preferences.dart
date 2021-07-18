import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferencees;

  static const _keyFirstTime = 'keyFirstTime';
  static const _keyIsLogged = 'keyIsLogged';
  static const _keyPatientId = 'keyPatientId';
  static const _keyPatientName = 'keyPatientName';
  static const _keyPatientGender = 'keyPatientGender';
  static const _keyPatientNik = 'keyPatientNik';
  static const _keyPatientBpjs = 'keyPatientBpjs';
  static const _keyPatientBirthDate = 'keyPatientBirthDate';
  static const _keyPatientPhoneNumber = 'keyPatientPhoneNumber';
  static const _keyPatientAddress = 'keyPatientAddress';
  static const _keyPatientMemberSince = 'keyPatientMemberSince';

  static Future init() async {
    _preferencees = await SharedPreferences.getInstance();
  }

  static Future setFirstTimeStatus(bool status) async {
    await _preferencees!.setBool(_keyFirstTime, status);
  }

  static bool getFirstTimeStatus() {
    return _preferencees!.getBool(_keyFirstTime) ?? true;
  }

  static Future setIsLoggedStatus(bool status) async {
    await _preferencees!.setBool(_keyIsLogged, status);
  }

  static bool getIsLoggedStatus() {
    return _preferencees!.getBool(_keyIsLogged) ?? false;
  }

  static Future setPatientId(String info) async {
    await _preferencees!.setString(_keyPatientId, info);
  }

  static String getPatientId() {
    return _preferencees!.getString(_keyPatientId) ?? "";
  }

  static Future setPatientName(String info) async {
    await _preferencees!.setString(_keyPatientName, info);
    print(_preferencees!.getString(_keyPatientName));
  }

  static String getPatientName() {
    return _preferencees!.getString(_keyPatientName) ?? "";
  }

  static Future setPatientGender(String info) async {
    await _preferencees!.setString(_keyPatientGender, info);
  }

  static String getPatientGender() {
    return _preferencees!.getString(_keyPatientGender) ?? "";
  }

  static Future setPatientNik(String info) async {
    await _preferencees!.setString(_keyPatientNik, info);
  }

  static String getPatientNik() {
    return _preferencees!.getString(_keyPatientNik) ?? "";
  }

  static Future setPatientBpjs(String info) async {
    await _preferencees!.setString(_keyPatientBpjs, info);
  }

  static String getPatientBpjs() {
    return _preferencees!.getString(_keyPatientBpjs) ?? "";
  }

  static Future setPatientBirthDate(String info) async {
    await _preferencees!.setString(_keyPatientBirthDate, info);
  }

  static String getPatientBirthDate() {
    return _preferencees!.getString(_keyPatientBirthDate) ?? "";
  }

  static Future setPatientPhoneNumber(String info) async {
    await _preferencees!.setString(_keyPatientPhoneNumber, info);
  }

  static String getPatientPhoneNumber() {
    return _preferencees!.getString(_keyPatientPhoneNumber) ?? "";
  }

  static Future setPatientAddress(String info) async {
    await _preferencees!.setString(_keyPatientAddress, info);
  }

  static String getPatientAddress() {
    return _preferencees!.getString(_keyPatientAddress) ?? "";
  }

  static Future setPatientMemberSince(String info) async {
    await _preferencees!.setString(_keyPatientMemberSince, info);
  }

  static String getPatientMemberSince() {
    return _preferencees!.getString(_keyPatientMemberSince) ?? "";
  }

  // REMOVE PATIENT CREDENTIALS
  static removePatientCredentials() async {
    await _preferencees!.remove(_keyPatientId);
    await _preferencees!.remove(_keyPatientName);
    await _preferencees!.remove(_keyPatientGender);
    await _preferencees!.remove(_keyPatientNik);
    await _preferencees!.remove(_keyPatientBpjs);
    await _preferencees!.remove(_keyPatientBirthDate);
    await _preferencees!.remove(_keyPatientPhoneNumber);
    await _preferencees!.remove(_keyPatientAddress);
    await _preferencees!.remove(_keyPatientMemberSince);
  }
}
