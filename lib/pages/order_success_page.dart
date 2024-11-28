import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

class OrderSuccessPage extends StatefulWidget {
  const OrderSuccessPage({super.key});

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage>
    with TickerProviderStateMixin {
  late AnimationController _confettiController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Confetti animation controller
    _confettiController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Slide animations controller
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    // Pulse animation controller
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    // Scale animation
    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Animated background gradient
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.lerp(
                        const Color(0xFFFEE5E5),
                        const Color(0xFFE0F7F7),
                        _pulseController.value,
                      )!,
                      Color.lerp(
                        const Color(0xFFE0F7F7),
                        const Color(0xFFFEE5E5),
                        _pulseController.value,
                      )!,
                    ],
                  ),
                ),
              );
            },
          ),

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success Animation
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.5),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _slideController,
                      curve:
                          const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
                    )),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Confetti animation
                        Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_xwmj0hsk.json',
                          controller: _confettiController,
                          height: 300,
                          width: 300,
                        ),
                        // Success check animation
                        Lottie.network(
                          'https://assets5.lottiefiles.com/packages/lf20_jbrw3hcz.json',
                          height: 200,
                          width: 200,
                          repeat: false,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Success Message
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.5),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _slideController,
                    curve: const Interval(0.2, 0.7, curve: Curves.easeOutCubic),
                  )),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _slideController,
                        curve: const Interval(0.2, 0.7),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Order Placed Successfully!',
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Thank you for your purchase. Your order will be delivered soon!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Continue Shopping Button
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _slideController,
                    curve: const Interval(0.4, 0.9, curve: Curves.easeOutCubic),
                  )),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _slideController,
                        curve: const Interval(0.4, 0.9),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: 1.0 +
                                (_pulseController.value *
                                    0.03), // Subtle pulse effect
                            child: Container(
                              width: double.infinity,
                              height: 60, // Increased height
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFFFEE5E5),
                                    const Color(0xFFE0F7F7),
                                    Color.lerp(
                                      const Color(0xFFFEE5E5),
                                      const Color(0xFFE0F7F7),
                                      _pulseController.value,
                                    )!,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFEE5E5)
                                        .withOpacity(0.5),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                    spreadRadius: 2,
                                  ),
                                  BoxShadow(
                                    color: const Color(0xFFE0F7F7)
                                        .withOpacity(0.3),
                                    blurRadius: 15,
                                    offset: const Offset(0, 4),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add haptic feedback
                                  HapticFeedback.mediumImpact();
                                  // Pop until we reach homepage
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: const Color(0xFF333333),
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Continue Shopping',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18, // Increased font size
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 24, // Increased icon size
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating particles effect
          Positioned.fill(
            child: IgnorePointer(
              child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_xwmj0hsk.json',
                controller: _confettiController,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
