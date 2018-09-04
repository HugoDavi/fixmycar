class Validation {
  String validateEmail(String value) {
    if (!value.contains('@')) { 
      return 'Invalid Email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Invalid Password';
    }
    return null;
  }
}
