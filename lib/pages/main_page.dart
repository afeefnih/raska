import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:raska/config/colors.dart';
import 'package:raska/domain/providers/theme_provider.dart';
import 'package:raska/pages/article_page.dart';
import 'package:raska/pages/donate_page.dart';
import 'package:raska/pages/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainPage> {
  int currentPageIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    DonateScreen(),
    ArticleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.grey[900]),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: Row(
          children: [
            Image.asset('lib/images/food-donation.png',  
            fit: BoxFit.contain,
            height: 45,
            ),
              Text(
                '  R A S K A',
                style: GoogleFonts.openSans(color: Colors.grey[900], 
                fontWeight: FontWeight.bold,), 
              ),          
              ],
        ), 
      ),
            drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
              child: Text("User Profile")),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("E D I T  P R O F I L E"), onTap: () {}
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("D A R K  M O D E"),
              trailing: Switch(
              value: Provider.of<ThemeProvider>(context).themeData.brightness == Brightness.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
              },
            ),
          ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"), onTap: () {}
            ),
          ],
        ),
      ),
        body: IndexedStack(
          index: currentPageIndex,
          children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).primaryColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.volunteer_activism_outlined),
            selectedIcon: Icon(Icons.volunteer_activism),
            label: 'Donate',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article),
            label: 'Articles',
          ),
        ],
      ),
    );
  }
}
