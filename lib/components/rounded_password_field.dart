import 'package:fci_project/shared/components/constants.dart';
import 'package:flutter/material.dart';


String? password1;

class RoundedPasswordField extends StatefulWidget {
  TextEditingController passController = new TextEditingController();
  String hint;
  final IconData icon;

  RoundedPasswordField(
      {required this.hint,
      required this.passController,
      this.icon = Icons.lock});

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool password = true;

  IconData? get icon => Icons.lock;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: Colors.blueGrey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(60),
      child: TextFormField(
        obscureText: password,
        keyboardType: TextInputType.text,
        onChanged: (val) => password1 = val,
        validator: //passwordValidator//MinLengthValidator(6, errorText: "Should be atleast 6 Characters")
            (value) //modified
            {
          if (value!.isEmpty) {
            return "password is required";
          } else if (value.length < 6) {
            return "Should be at least 6 Characters";
          }
          if (value != password1) {
            return "Password must be same as above";
          } else {
            null;
          }
        },
        controller: widget.passController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(60)),
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: widget.hint,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey.shade400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              password ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF4a1c40),
            ),
            onPressed: () {
              setState(() {
                password = !password;
              });
            },
          ),
        ),
      ),
    );
  }
}
