import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_application_1/Letter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // bottom
      end: Offset(0, 0),   // original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue.shade100,
        // title: Center(
        //   child: Text(
        //     "Wait is Over, Babe",
        //     style: TextStyle(
        //       fontSize: 36,
        //       fontWeight: FontWeight.bold,
        //       color: Color.fromARGB(255, 54, 53, 53),
        //     ),
        //   ),
        // ),
      ),
      backgroundColor: Colors.blue.shade100,
      
      // 🔥 Slide animation added HERE
      body: SlideTransition(
        position: _slideAnimation,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Text(
            "Wait is Over, Babe",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 54, 53, 53),
            ),
          ),
              Text(
                "💌💌💌",
                style: TextStyle(color: Colors.redAccent, fontSize: 30),
              ),
              SizedBox(height: 60),
              
              SizedBox(
                height: 200,
                width: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Smile Ziya❤️ ,",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "This is for you. Open with smile my Gurl",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade400,
                              elevation: 5,
                            ),
                            onPressed: () {

 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LetterPage()),
  );

                            },
                            child: Text(
                              "Open Letter",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
