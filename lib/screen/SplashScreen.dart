import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/LoginScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        onTap: () => Get.off(() => LoginScreen()),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo_klik_igr.svg',
              height: 36,
            ),
            SizedBox(height: 8,),
            Text(
              "Belanja aman dan nyaman",
              style: GoogleFonts.nunito(
                color: Colors.blue,
                fontSize: 14,
              ),
            )
          ],
        ),)
      ),
    );
  }
}
