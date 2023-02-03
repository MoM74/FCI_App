import 'package:fci_project/shared/components/constants.dart';
import 'package:flutter/material.dart';


String? email1;
// final emailValidator = MultiValidator([
//   RequiredValidator(errorText: 'email is required'),
//   EmailValidator(errorText: 'Invalid Email Form')
// ]);

class RoundedInputField extends StatelessWidget {
  final TextEditingController emailController;
  final String hintText;
  final IconData icon;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: Colors.blueGrey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(60),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Email is required";
          } else if (value.length < 6) {
            return "Should be at least 6 Characters";
          }
          if (value != email1) {
            return "Email must be same as above";
          } else
            null;
        },
        controller: emailController,
        onChanged: (val) => email1 = val,
        keyboardType: TextInputType.emailAddress,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(60),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey.shade400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
