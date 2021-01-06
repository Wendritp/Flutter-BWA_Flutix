part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;
  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 90),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToPreferencePage(
                                    widget.registrationData));
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Confirm\nNew Account",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  (widget.registrationData.profileImage == null)
                                      ? AssetImage("assets/user_pic.png")
                                      : FileImage(
                                          widget.registrationData.profileImage),
                              fit: BoxFit.cover)),
                    ),
                    Text("Welcome",
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                    Text(
                      "${widget.registrationData.name}",
                      style: blackTextFont.copyWith(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    (isSignUp)
                        ? SpinKitFadingCircle(
                            color: Color(0xffFF5C83),
                            size: 45,
                          )
                        : SizedBox(
                            width: 250,
                            height: 45,
                            child: RaisedButton(
                                color: Color(0xff3E9D9D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  "Create My Account",
                                  style: whiteTextFont.copyWith(fontSize: 16),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isSignUp = true;
                                  });

                                  imageFileToUpload =
                                      widget.registrationData.profileImage;

                                  SignInSignUpResult result =
                                      await AuthServices.signUp(
                                          widget.registrationData.email,
                                          widget.registrationData.password,
                                          widget.registrationData.name,
                                          widget
                                              .registrationData.selectedGenres,
                                          widget.registrationData.selectedLang);

                                  if (result.user == null) {
                                    setState(() {
                                      isSignUp = false;
                                    });

                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xffFF5C83),
                                      message: result.message,
                                    )..show(context);
                                  }
                                }))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
