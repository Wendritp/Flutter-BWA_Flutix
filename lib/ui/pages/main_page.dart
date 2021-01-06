part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Color(0xffE5E5E5),
          )),
          PageView(
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            controller: pageController,
            children: <Widget>[MoviePage(), Center(child: Text("My Tickets"))],
          ),
          createCustomBottomNavbar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 46,
              height: 46,
              margin: EdgeInsets.only(bottom: 42),
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: accentColor2,
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(MdiIcons.walletPlus,
                        color: Colors.black.withOpacity(0.54)),
                  ),
                  onPressed: () {
                    context.bloc<UserBloc>().add(SignOut());
                    AuthServices.signOut();
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget createCustomBottomNavbar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavbarClipper(),
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: Color(0xffE5E5E5),
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      title: Text("New Movies",
                          style: GoogleFonts.raleway(
                              fontSize: 13, fontWeight: FontWeight.w300)),
                      icon: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          height: 20,
                          child: Image.asset((bottomNavBarIndex == 0)
                              ? "assets/ic_movie.png"
                              : "assets/ic_movie_grey.png"))),
                  BottomNavigationBarItem(
                      title: Text("My Tickets",
                          style: GoogleFonts.raleway(
                              fontSize: 13, fontWeight: FontWeight.w300)),
                      icon: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          height: 20,
                          child: Image.asset((bottomNavBarIndex == 1)
                              ? "assets/ic_tickets.png"
                              : "assets/ic_tickets_grey.png")))
                ],
              )),
        ),
      );
}

class BottomNavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
