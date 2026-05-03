import 'package:amingo/screens/friend_verification.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinEventScreen extends StatefulWidget {
  const JoinEventScreen({super.key});

  @override
  State<JoinEventScreen> createState() => _JoinEventScreenState();
}

class _JoinEventScreenState extends State<JoinEventScreen>
    with SingleTickerProviderStateMixin {
  final MobileScannerController cameraController = MobileScannerController();

  bool isScanned = false;
  String qrResult = "";

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  Future<void> handleScan(String value) async {
    final messenger = ScaffoldMessenger.of(context);
    final uri = Uri.tryParse(value);

    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      messenger.showSnackBar(const SnackBar(content: Text("Invalid QR Code")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Join Event"),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Scan the event QR code or enter the unique 6-digit code provided by the host.",
                style: TextStyle(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: height * 0.02),

              SizedBox(
                height: height * 0.35,
                width: width,
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: cameraController,
                      onDetect: (capture) async {
                        if (isScanned) return;

                        final barcodes = capture.barcodes;
                        if (barcodes.isEmpty ||
                            barcodes.first.rawValue == null) {
                          return;
                        }

                        isScanned = true;
                        final code = barcodes.first.rawValue!;

                        await cameraController.stop();
                        await handleScan(code);

                        await Future.delayed(const Duration(seconds: 2));
                        isScanned = false;

                        await cameraController.start();
                      },
                    ),

                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Positioned(
                          top: animation.value * ((height * 0.35) - 6),
                          left: 2,
                          right: 3,
                          child: Container(
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow,
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),

              IconButton(
                icon: Icon(
                  cameraController.torchEnabled
                      ? Icons.flash_on
                      : Icons.flash_off,
                  color: cameraController.torchEnabled
                      ? Colors.yellow
                      : Colors.grey,
                ),
                onPressed: () {
                  cameraController.toggleTorch();
                  setState(() {}); // refresh icon
                },
              ),

              SizedBox(height: height * 0.02),

              Row(
                children: [
                  Expanded(child: Divider(color: colorScheme.outline)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider(color: colorScheme.outline)),
                ],
              ),

              SizedBox(height: height * 0.02),

              TextField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "111111",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const FriendVerification(letter: 'B'),
                      ),
                    );
                  },
                  child: const Text("Join Now"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
