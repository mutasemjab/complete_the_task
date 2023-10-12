import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class LoggedInCustomDrawer extends StatefulWidget {
  const LoggedInCustomDrawer({super.key});

  @override
  State<LoggedInCustomDrawer> createState() => _LoggedInCustomDrawerState();
}

class _LoggedInCustomDrawerState extends State<LoggedInCustomDrawer> {

  bool showSettings = false;
  bool darkEnabled = true;
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Column(
        children: <Widget>[
        Container(
          height: 180,
          color: secondaryColor,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CircleAvatar(
                  radius:40,
                  backgroundImage: AssetImage('assets/images/images.jpg')
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        Text('Rima Dardar',style: textStyleWhite18,),
                        SizedBox(width: 5,),
                        Icon(Icons.verified_rounded, color: primaryColor,),
                      ],
                    ),
                    SizedBox(height: 18,),
                    Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                        ),

                     child: Padding(
                       padding: const EdgeInsets.only(left: 10.0,right: 25,top: 10,bottom: 10),
                       child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: secondaryColor,
                            ),
                            SizedBox(width: 12,),
                            Text("Manager",style: textStyleSecondary16,),
                          ],
                        ),
                     )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
          if (!showSettings)
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomListTile(
                    icon: Icons.home,
                    title: "Home",
                  ),
                ),
                Divider(),
                CustomListTile(
                  icon: Icons.wallet,
                  title: "Wallets",
                ),
                Divider(),

                CustomListTile(
                  icon: Icons.person,
                  title: "My Profile",
                ),
                Divider(),

                CustomListTile(
                  icon: Icons.lock,
                  title: "Change PIN",
                ),
                Divider(),

                CustomListTile(
                  icon: Icons.notifications,
                  title: "Notifications",
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 18),
                  child: ListTile(
                    leading: Icon(Icons.settings,color: darkGreyColor,size: 30,),
                    title: Text("Settings",style: backAndSkipButtonTextWhiteBgStyle,),
                    trailing: Icon(Icons.arrow_forward_ios,size: 18,color: darkGreyColor),
                    onTap: () {
                      setState(() {
                        showSettings = !showSettings;
                      });
                    },
                  ),
                ),
                Divider()
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.arrow_back_ios, size: 18, color: darkGreyColor),
                      title: Text("Back",style: backAndSkipButtonTextWhiteBgStyle,),
                      onTap: () {
                        setState(() {
                          showSettings = !showSettings;
                        });
                      },
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ListTile(
                        title: Text("Allow Notifications",style: backAndSkipButtonTextWhiteBgStyle,),
                        trailing: Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            activeColor: whiteColor,
                            activeTrackColor: primaryColor,
                            value: notificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                notificationsEnabled = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ListTile(
                        title: Text("Dark Mode",style: backAndSkipButtonTextWhiteBgStyle,),
                        trailing: Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            activeColor: whiteColor,
                            activeTrackColor: primaryColor,
                            value: darkEnabled,
                            onChanged: (value) {
                              setState(() {
                                darkEnabled = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Text("English",style: backAndSkipButtonTextWhiteBgStyle,),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 13.0),
                              child: Icon(Icons.arrow_drop_down, size: 30, color: darkGreyColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),


                  ],
                ),
              ),
            ),
          Spacer(),
          CustomListTile(
            icon: Icons.info,
            title: "Help",
          ),
          Divider(),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout,color: redColor,size: 30,),
              title: Text("Logout",style:textStyle2Red.copyWith(
                fontWeight: FontWeight.w600,
              ) ,),
            ),
          ),

        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  CustomListTile({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Icon(icon,color: darkGreyColor,size: 30,),
        title: Text(title,style: backAndSkipButtonTextWhiteBgStyle,),
        onTap: onTap,
      ),
    );
  }
}