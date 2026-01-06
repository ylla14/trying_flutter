import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen()
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AboutScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title:  Text(
            currentIndex == 0 ? 'Home' : currentIndex == 1 ? 'About': 'Profile',
            style: TextStyle(
              color: Colors.white,
            )
          ),
        ),

        body: _screens[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.green
                ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
                color: Colors.green
                ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.green
                ),
              label: 'Profile',
              
            ),
          ]
        ),

        drawer: Drawer(
          child: Text ("Hello"),
        ),


      )
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(5),
            child: Text (
              '$count',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold 
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++  ;
            });
          },
        ),
    );
  }
}


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://i.pinimg.com/1200x/0c/88/92/0c8892f70daf23673f363fe216f663d8.jpg',
                width: 300,
                height: 300,
                ),
              SizedBox(height: 20,),
              ElevatedButton(
                child: Text('Next'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> PicturePage()));
                },
              )
            ],
          )
        ),
      ) 
    );
  }
}


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile')
    );
  }
}

class PicturePage extends StatelessWidget {
  const PicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text('picsi'),
        ),

        body: Container(
          child: Image.network('http://i.pinimg.com/736x/8e/a5/cc/8ea5cc3d42bd8a58c93256f89bfca14c.jpg')
        )
      ),
    );
  }
}


