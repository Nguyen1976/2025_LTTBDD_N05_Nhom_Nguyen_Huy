import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: Icon(Icons.camera_alt_outlined, size: 35.0),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset("images/send.gif", fit: BoxFit.cover),
          ),
        ],
        title: Center(
          child: Text(
            "Instagram",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontFamily: 'GreatVibes',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  "Stories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70.0,
                          height: 70.0,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  "images/boy1.png",
                                  width: 70.0,
                                  height: 70.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 45.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2.0),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              "images/boy1.png",
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2.0),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              "images/boy1.png",
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2.0),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              "images/boy1.png",
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Your Story",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        "images/boy1.png",
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "Rohit Sharma",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Image.asset(
                "images/post.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(Icons.favorite_border_outlined, size: 30.0),
                  SizedBox(width: 10.0),
                  Icon(Icons.chat_bubble_outline, size: 30.0),
                  SizedBox(width: 10.0),
                  Image.asset('images/send.gif', width: 30.0, height: 30.0),
                  Spacer(),
                  Icon(Icons.bookmark_border, size: 30.0),
                ],
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        "images/boy1.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("  Liked by "),
                    Text(
                      "Virat",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" and "),
                    Text(
                      ' 75k others',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Rohit Sharma: ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text('Living my dream'),
                    Text(
                      ' #VIETNAM #CRICKET',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("View all 1,150 comments"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
