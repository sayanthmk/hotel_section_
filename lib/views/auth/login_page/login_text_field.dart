import 'package:flutter/material.dart';
import 'package:hotel_side/constants/colors/colors.dart';
import 'package:hotel_side/widgets/auth_widgets/textfrom_field.dart';

class LoginTextfield extends StatelessWidget {
  const LoginTextfield({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          labelText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-z]{2,7}$')
                .hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          borderColor: Colors.grey.withOpacity(0.3),
          focusedBorderColor: AdminColors.primerybuttoncolor,
          enabledBorderColor: Colors.grey.withOpacity(0.3),
          errorBorderColor: Colors.red.withOpacity(0.8),
          prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: passwordController,
          labelText: 'Password',
          hintText: 'Enter your Password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          borderColor: Colors.grey.withOpacity(0.3),
          focusedBorderColor: AdminColors.primerybuttoncolor,
          enabledBorderColor: Colors.grey.withOpacity(0.3),
          errorBorderColor: Colors.red.withOpacity(0.8),
          obscureText: true,
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
          suffixIcon: const Icon(Icons.remove_red_eye, color: Colors.grey),
        ),
      ],
    );
  }
}
