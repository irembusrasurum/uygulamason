mixin StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null || value.length < 2) {
      return "İsim en az iki karakter olmalıdır.";
    } else {
      return null;
    }
  }

   String? validateLastName(String? value) {
    if (value == null || value.length < 2) {
      return "Soyad en az iki karakter olmalıdır.";
    } else {
      return null;
    }
  }

  String? validateGrade(String? value) {
    var grade = int.parse(value!);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır.";
    } else {
      return null;
    }
  }
}
