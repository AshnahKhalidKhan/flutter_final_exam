

import 'package:flutter/material.dart';

class Question2 extends StatefulWidget 
{
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.black,
      body: Padding
      (
        padding: EdgeInsets.all(10.0),
        child: Column
        (
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: 
          [
            ListTile
            (
              tileColor: Colors.black,
              title: Text('Recommended for your devices',
                style: TextStyle
                (
                  
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              trailing: Text('See All',
                style: TextStyle
                (
                  fontSize: 15.0,
                  color: Colors.blue,
                ),
              )
            ),
            Expanded
            (
              child: SizedBox
              (
                width: double.infinity,
                height: double.infinity,
                child: Card
                  (
                    // color: Color.fromARGB(255, 34, 34, 34),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    // RoundedRectangleBorder(),
                    // elevation: 6,
                    child: GridTile
                    (
                      header: 
                      ListTile
                      (
                        // tileColor: Color.fromARGB(255, 34, 34, 34),
                        title: SizedBox(width: double.infinity,),
                        trailing: Icon(Icons.bookmark_outline, color: Colors.blue,),                    
                      ),
                      child: 
                      Container
                      (
                        width: double.infinity,
                        // height: 200,
                        decoration: BoxDecoration
                        (
                          color: Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage
                          (
                            //image: NetworkImage('https://www.cnet.com/a/img/resize/3f9bcdf57677ffcc221f679e18d635c81bfbd49a/hub/2020/12/08/14d95f63-3b9a-4b16-86b3-38d14baee2e5/airpod-max-black-background.png?auto=webp&fit=crop&height=1200&width=1200'),
                            image: AssetImage('lib/Assets/airpod-max-black-background.jpg'),
                            fit: BoxFit.fitWidth
                          ),
                          // borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),

              decoration: BoxDecoration
                        (
                          color: Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text
                  (
                    'Free Engraving',
                      style: TextStyle
                      (
                        backgroundColor: Color.fromARGB(255, 34, 34, 34),
                        fontSize: 15.0,
                        color: const Color.fromARGB(255, 255, 219, 59),
                      ),
                  ),
                  Text
                  (
                    'Airpods Max — Silver',
                      style: TextStyle
                      (
                        backgroundColor: Color.fromARGB(255, 34, 34, 34),
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                  ),
                  SizedBox(height: 10.0),
                  Text
                  (
                    'A\$899.00',
                      style: TextStyle
                      (
                        backgroundColor: Color.fromARGB(255, 34, 34, 34),
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                  ),
                
            Container(
              
              decoration: BoxDecoration
                        (
                          color: Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  Container
                  (
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration
                    (
                      shape: BoxShape.circle,
                      gradient: LinearGradient
                      (
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: 
                        [
                          const Color.fromARGB(255, 45, 42, 42),
                          const Color.fromARGB(255, 45, 42, 42),
                          Color.fromARGB(255, 72, 72, 72),
                        ],
                        stops: [
                          0, 0.5, 0.5
                        ]
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container
                  (
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration
                    (
                      shape: BoxShape.circle,
                      gradient: LinearGradient
                      (
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: 
                        [
                          const Color.fromARGB(255, 199, 76, 67),
                          const Color.fromARGB(255, 199, 76, 67),
                          Color.fromARGB(255, 197, 135, 131),
                        ],
                        stops: [
                          0, 0.5, 0.5
                        ]
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container
                  (
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration
                    (
                      shape: BoxShape.circle,
                      gradient: LinearGradient
                      (
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: 
                        [
                          Color.fromARGB(255, 196, 216, 205),
                          Color.fromARGB(255, 196, 216, 205),
                          Color.fromARGB(255, 126, 168, 145),
                        ],
                        stops: [
                          0, 0.5, 0.5
                        ]
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container
                  (
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration
                    (
                      shape: BoxShape.circle,
                      gradient: LinearGradient
                      (
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: 
                        [
                          Colors.white,
                          Colors.white,
                          const Color.fromARGB(255, 170, 169, 169),
                        ],
                        stops: [
                          0, 0.5, 0.5
                        ]
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text
                  (
                    '+1 more',
                      style: TextStyle
                      (
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                  ),
                ],
              ),
            )
            

            ],
              ),
            ),
          ],
        )
      )
    );

  }
}