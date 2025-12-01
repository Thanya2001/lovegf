import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LetterPage extends StatefulWidget {
  const LetterPage({super.key});

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  //const OpenWhatsAppPage({super.key});

Future<void> openWhatsApp() async {
    String phoneNumber = ""; // replace with real number
    String message = "I will be yours💗"; // message to send
    Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    try {
      if (!await launchUrl(
        whatsappUri,
        mode: LaunchMode.externalApplication,
      )) {
        // fallback if WhatsApp app is not installed
        print("Could not launch WhatsApp. Try installing it!");
      }
    } catch (e) {
      print("Error launching WhatsApp: $e");
    }}
  String fullText = """ My love,

I don’t know how to explain what you mean to me, but I’ll try… because you deserve to know every beat of my heart. Even though we are both girls, none of that matters to my heart — it chose you the moment your soul touched mine.

You are the light that made my life bright again. You became my favourite human, the one I want in every way — your time, your laughter, your silence, your anger, your softness… your whole heart.

I promise I will never hurt you on purpose. And even if I ever make mistakes, I will always come back to you, because my heart feels incomplete without your presence. I’ve fallen for you completely — for your words, your energy, the way your soul shines even without me seeing your eyes properly.

So today, with all the love inside me, I want to say this clearly:

I LOVE YOU, MY LITTLE ONE… MY GURL… MY HEART.

And now I’m asking you, softly but bravely…

Will you be mine? Will you choose me the way I’ve already chosen you? 💗
""";

  String displayedText = "";
  int index = 0;

  @override
  void initState() {
    super.initState();
    startTyping();
  }

  void startTyping() {
    Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (index < fullText.length) {
        setState(() {
          displayedText += fullText[index];
          index++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  // void openWhatsApp() async {
  //   final number = "917010463269"; // Include country code
  //   final message = Uri.encodeComponent("Hi! 😘"); // Optional pre-filled message

  //   final appUrl = Uri.parse("whatsapp://send?phone=$number&text=$message");
  //   final webUrl = Uri.parse("https://wa.me/$number?text=$message");

  //   if (await canLaunchUrl(appUrl)) {
  //     await launchUrl(appUrl, mode: LaunchMode.externalApplication);
  //   } else if (await canLaunchUrl(webUrl)) {
  //     await launchUrl(webUrl, mode: LaunchMode.externalApplication);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text("WhatsApp is not installed or cannot be opened")),
  //     );
  //   }
  // }

  void showRejectDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text("Feature Unavailable"),
        content: const Text(
            "Sorry, currently this feature of connection is unavailable.\n\nPlease choose Accept 😁"),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  // void showAcceptDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  //       title: const Text("Accepted ❤️"),
  //       content: const Text("😳 (shy emoji)"),
  //       actions: [
  //         TextButton(
  //           child: const Text("OK"),
  //           onPressed: () => Navigator.pop(context),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          "A Letter For You ❤️",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:Stack(
  children: [
    // Background Image
    Opacity(
      opacity: 0.15, // fade level (0.0 = invisible, 1.0 = full image)
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/IMG-20230424-WA0004(1).jpg"), // <-- your image
            fit: BoxFit.cover, // full screen
          ),
        ),
      ),
    ), Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Card with letter
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      displayedText,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Show buttons only after the typing finishes
            if (displayedText.length == fullText.length)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: showRejectDialog,
                    child: const Text(
                      "Reject ❌",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: openWhatsApp,
                    child: const Text(
                      "Accept ❤️",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
   ]) );
  }
}
