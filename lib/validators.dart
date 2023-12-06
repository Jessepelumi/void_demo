String? dropdownValidation(String? string) =>
    string == "Select" ? "Select an item" : null;

String? emailValidation(String? email) {
  bool validateEmail = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email!.trim().toLowerCase());
  if (!validateEmail) {
    return 'Email is not valid';
  }
  return null;
}

// String? passwordValidation(String? string) {
//   bool validatePassword = RegExp(
//           r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
//       .hasMatch(string!);
//   if (!validatePassword) {
//     return 'Min. 8 chars, 1 uppercase, 1 num, 1 Spec. chars';
//   }

String? passwordValidation(String? string) =>
    string!.length < 6 ? 'At least 6 characters is expected' : null;

String? stringValidation(String? string) =>
    string!.length < 2 ? 'Atleast 2 characters is expected' : null;

String? numericValidation(String? value) {
  if (!RegExp(r"^[0-9]+$").hasMatch(value!)) {
    return "Please enter a valid number";
  }

  return null;
}
