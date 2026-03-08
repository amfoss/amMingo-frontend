import 'package:amingo/main.dart';
import 'package:amingo/screens/RoleSelection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class CreateUsername extends StatelessWidget {
  const CreateUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                ],
              ),

              Center(
                child: Image.asset(
                  'assets/images/amMingo.png',
                  height: height * 0.15,
                ),
              ),
              SizedBox(height: height * 0.01),
              Center(
                child: Column(
                  children: [
                    Text(
                      "AMINGO",
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: width * 0.2,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "Create your identity",
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.05),

              Text(
                "Display Name",
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.04,
                ),
              ),

              SizedBox(height: height * 0.02),

              TextField(
                keyboardType: TextInputType.name,
                cursorColor: colorScheme.primary,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  filled: true,
                  fillColor: colorScheme.surface,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outline,
                      width: 1.2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.2),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Roleselection()),
                    );
                  },
                  child: Text(
                    "Save Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.05,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
