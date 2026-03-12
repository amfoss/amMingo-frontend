import 'package:amingo/screens/createevent.dart';
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
  MobileScannerController cameraController = MobileScannerController();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Scan the event QR code or enter the unique 6-digit code provided by the host.",
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                ),

                SizedBox(height: height * 0.02),

                SizedBox(
                  height: height * 0.35,
                  width: width * 0.9,
                  child: Stack(
                    children: [
                      MobileScanner(
                        controller: cameraController,
                        onDetect: (BarcodeCapture capture) async {
                          if (isScanned) return;
                          List<Barcode> barcodes = capture.barcodes;
                          if (barcodes.isNotEmpty &&
                              barcodes.first.rawValue != null) {
                            isScanned = true;
                            setState(() {
                              qrResult = barcodes.first.rawValue!;
                            });
                            final uri = Uri.tryParse(qrResult);
                            if (uri != null && await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid QR Code"),
                                ),
                              );
                              isScanned = false;
                            }
                          }
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
                              decoration: BoxDecoration(
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
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                              left: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                              right: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                              right: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                              left: BorderSide(
                                color: Colors.yellow,
                                width: width * 0.01,
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.01),

                Center(
                  child: IconButton(
                    onPressed: () => cameraController.toggleTorch(),
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController,
                      builder: (context, value, child) {
                        switch (value.torchState) {
                          case TorchState.off:
                            return const Icon(
                              Icons.flash_off,
                              color: Colors.grey,
                            );
                          case TorchState.on:
                            return const Icon(
                              Icons.flash_on,
                              color: Colors.yellow,
                            );
                          case TorchState.auto:
                            return const Icon(
                              Icons.flash_auto,
                              color: Colors.blue,
                            );
                          case TorchState.unavailable:
                            return const Icon(
                              Icons.flash_off,
                              color: Colors.grey,
                            );
                        }
                      },
                    ),
                  ),
                ),

                SizedBox(height: height * 0.01),

                Row(
                  children: [
                    Expanded(child: Divider(color: colorScheme.outline)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: width * 0.035,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: colorScheme.outline)),
                  ],
                ),

                SizedBox(height: height * 0.01),

                Text(
                  "6-digit Code",
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: width * 0.04,
                  ),
                ),

                SizedBox(height: height * 0.01),

                TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    letterSpacing: 4,
                  ),
                  cursorColor: colorScheme.primary,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: "111111",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      letterSpacing: 4,
                    ),
                    filled: true,
                    fillColor: colorScheme.surface,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.outline),
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
                SizedBox(height: height * 0.04),
                SizedBox(
                  width: double.infinity,
                  height: height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateEventScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Text(
                      "Join Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
