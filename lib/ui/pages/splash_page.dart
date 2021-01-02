part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 136,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 16),
                  child: Text(
                    "New Experience",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
                Text(
                  "Watch a new movie much\neasier than any before",
                  style: greyTextFont.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 250,
                  height: 45,
                  margin: EdgeInsets.only(top: 75, bottom: 20),
                  child: RaisedButton(
                      child: Text(
                        "Get Started",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      color: mainColor,
                      onPressed: () {}),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text(
                        "Sign In",
                        style: purpleTextFont,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
