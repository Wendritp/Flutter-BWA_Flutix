part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xff503E9D);
Color accentColor1 = Color(0xff2C1F63);
Color accentColor2 = Color(0xffFBD460);
Color accentColor3 = Color(0xffADADAD);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle yellowNumberTextFont =
    GoogleFonts.raleway().copyWith(color: accentColor2);
