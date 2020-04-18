import 'package:doctorapp/Doctor_files/DoctorA.dart';
import 'Doctor_files/DoctorA.dart';
import 'Doctor_files/D_Location.dart';
import 'Doctor_files/D_emergency.dart';
import 'Doctor_files/DoctorLogin.dart';
import 'user_files/U_Location.dart';
import 'user_files/UserLogin.dart';
import 'package:flutter/material.dart';
import 'WelcomeScreen.dart';
import 'Doctor_files/Doctoreg.dart';
import 'user_files/UserRegistration.dart';
import 'Doctor_files/Doctor1.dart';
import 'user_files/UserEmergencyCall.dart';
import 'user_files/User1.dart';


void main()=>runApp(App());

    class App extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          theme: ThemeData.dark(),
          initialRoute: WelcomeScreen.id,
          routes: {
            WelcomeScreen.id:(context)=>WelcomeScreen(),
            Doctoreg.id:(context)=>Doctoreg(),
            UserLogin.id:(context)=>UserLogin(),
            UserRegistration.id:(context)=>UserRegistration(),
            DoctorLogin.id:(context)=>DoctorLogin(),
            User1.id:(context)=>User1(),
            Doctor1.id:(context)=>Doctor1(),
            DLocation.id:(context)=>DLocation(),
            ULocation.id:(context)=>ULocation(),
            DEmergency.id:(context)=>DEmergency(),
            UserEmergencyCall.id:(context)=>UserEmergencyCall(),
            DoctorA.id:(context)=>DoctorA(),
          },
        );
      }
    }
