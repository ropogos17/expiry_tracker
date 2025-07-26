int checkPasswordStrength(String password) {
  if (password.isEmpty) return 0;

  int strength = 0;

  // Criteria
  final hasLowercase = RegExp(r'[a-z]');
  final hasUppercase = RegExp(r'[A-Z]');
  final hasDigit = RegExp(r'\d');
  final hasSpecial = RegExp(r'[!@#\$&*~%^()\-_=+\[\]{};:"\\|,.<>\/?]');
  final isLongEnough = password.length >= 8;
  final isVeryLong = password.length >= 12;

  // Scoring
  if (hasLowercase.hasMatch(password)) strength++;
  if (hasUppercase.hasMatch(password)) strength++;
  if (hasDigit.hasMatch(password)) strength++;
  if (hasSpecial.hasMatch(password)) strength++;
  if (isLongEnough) strength++;
  if (isVeryLong) strength++;

  return strength.clamp(0, 6);
}
