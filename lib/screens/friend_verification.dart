import 'dart:io';
import 'package:amingo/screens/preview_screen.dart';
import 'package:amingo/screens/role_selection.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FriendVerification extends StatefulWidget {
  final String letter;

  const FriendVerification({super.key, required this.letter});

  @override
  State<FriendVerification> createState() => _FriendVerificationState();
}

class _FriendVerificationState extends State<FriendVerification> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> _openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) return;

    if (!mounted) return;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(image: File(pickedFile.path)),
      ),
    );

    if (result == true && mounted) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height * 0.01),
            Text(
              "Verify Friend",
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Tile ${widget.letter} verification",
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
          children: [
            // IMAGE
            Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: InkWell(
                onTap: _openCamera,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.22,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        border: Border.all(color: colorScheme.outline),
                        image: DecorationImage(
                          image: image != null
                              ? FileImage(image!)
                              : const AssetImage('assets/images/default2.png')
                                    as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // DARK OVERLAY
                    Container(
                      width: double.infinity,
                      height: height * 0.22,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                    ),

                    // CAMERA ICON
                    Positioned.fill(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // PROOF OF MEETING
            Container(
              width: double.infinity,
              height: height * 0.14,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Proof of Meeting",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Snap a quick selfie with your friend",
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.tertiary,
                          ),
                        ),
                      ),

                      //OPEN CAMERA CONTAINER
                      Material(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: _openCamera,
                          borderRadius: BorderRadius.circular(12),
                          splashColor: colorScheme.surface.withValues(
                            alpha: 0.2,
                          ),
                          child: Container(
                            width: width * 0.3,
                            height: height * 0.058,
                            alignment: Alignment.center,
                            child: Text(
                              "Open Camera",
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.surface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.02),

            // FRIEND NAME
            Text(
              "Friend's Name",
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.004),

            Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outline, width: 1.2),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      "${widget.letter} |",
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      cursorColor: colorScheme.primary,
                      style: TextStyle(color: colorScheme.onSurface),
                      decoration: InputDecoration(
                        hintText: "Complete the name",
                        hintStyle: TextStyle(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.003),

            Text(
              "Helping you complete the '${widget.letter}' tile on your Bingoboard",
              style: textTheme.bodySmall?.copyWith(color: colorScheme.tertiary),
            ),

            SizedBox(height: height * 0.02),

            // FRIEND CODE
            Text(
              "Friend's Code",
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.004),

            Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outline),
              ),
              child: TextField(
                controller: codeController,
                cursorColor: colorScheme.primary,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: "e.g 123",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 13,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.003),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Ask your friend's for their 3 digit code",
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.tertiary,
                    ),
                  ),
                ),

                SizedBox(width: width * 0.03),

                // YOUR CODE BOX
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF352804),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorScheme.outline),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "YOUR CODE: ",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "867",
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.02),

            // ABOUT FRIEND
            Text(
              "About your friend",
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.004),

            Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outline),
              ),
              child: TextField(
                controller: aboutController,
                maxLength: 20,
                cursorColor: colorScheme.primary,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: "Quick vibe check",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //BOTTOM VERIFY BUTTON
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: height * 0.09,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Roleselection()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "VERIFY AND MARK TILE",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
