import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gra_dtc/Screens/invoiceScreen.dart';
import 'package:gra_dtc/Utilities/color.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPatch.pageBackground,
      appBar: AppBar(
        backgroundColor: ColorPatch.pageBackground,
        actionsIconTheme: IconThemeData(
          color: ColorPatch.charcoal
        ),
        title: Text(
          "Welcome, John!",
          style: GoogleFonts.inter(
            fontSize: width*0.04,
            fontWeight: FontWeight.w600,
            color: ColorPatch.charcoal
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.015),
            child: Icon(Icons.notifications_none_outlined, color: ColorPatch.charcoal,),
          )
        ],
      ),
      drawer: Drawer(
          backgroundColor: ColorPatch.primaryTeal,
          width: width * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- Header ----------------
              SizedBox(
                height: height * 0.2,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorPatch.white,
                        radius: width * 0.085,
                        child: Icon(Icons.person, color: ColorPatch.primaryTeal),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "John Doe",
                            style: GoogleFonts.inter(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: ColorPatch.white,
                            ),
                          ),
                          Text(
                            "john.doe@gmail.com",
                            style: GoogleFonts.inter(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: ColorPatch.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ---------------- Menu ----------------
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.dashboard, color: ColorPatch.white),
                      title: Text(
                        "Dashboard",
                        style: GoogleFonts.inter(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: ColorPatch.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.credit_card, color: ColorPatch.white),
                      title: Text(
                        "Pay Taxes",
                        style: GoogleFonts.inter(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: ColorPatch.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.list_alt, color: ColorPatch.white),
                      title: Text(
                        "My Invoice",
                        style: GoogleFonts.inter(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: ColorPatch.white,
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>InvoiceScreen())
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.history, color: ColorPatch.white),
                      title: Text(
                        "History",
                        style: GoogleFonts.inter(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: ColorPatch.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent, color: ColorPatch.white),
                      title: Text(
                        "Support",
                        style: GoogleFonts.inter(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: ColorPatch.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ---------------- Footer ----------------
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.help, color: ColorPatch.white, size: width * 0.055),
                        SizedBox(width: width * 0.03),
                        Text(
                          "Help Center",
                          style: GoogleFonts.inter(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: ColorPatch.white,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.language, color: ColorPatch.white, size: width * 0.055),
                        SizedBox(width: width * 0.03),
                        Text(
                          "Language",
                          style: GoogleFonts.inter(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: ColorPatch.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "EN",
                          style: GoogleFonts.inter(
                            fontSize: width * 0.03,
                            color: ColorPatch.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: ColorPatch.white, size: width * 0.055),
                        SizedBox(width: width * 0.03),
                        Text(
                          "Logout",
                          style: GoogleFonts.inter(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: ColorPatch.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "v1.0.0",
                          style: GoogleFonts.inter(
                            fontSize: width * 0.03,
                            color: ColorPatch.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width*0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //   banner
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account overview",
                      style: GoogleFonts.inter(
                        color: ColorPatch.charcoal,
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.015),
                      decoration: BoxDecoration(
                        color: ColorPatch.primaryTeal,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: ColorPatch.white,
                          ),
                          SizedBox(width: width*0.01,),
                          Text(
                            "Pay Taxes Now",
                            style: GoogleFonts.inter(
                              color: ColorPatch.white,
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                height: height*0.17,
                padding: EdgeInsets.symmetric(vertical: height*0.01),
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: ColorPatch.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.07),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total Paid Taxes",
                              style: GoogleFonts.inter(
                                color: ColorPatch.charcoal.withOpacity(0.7),
                                fontSize: width*0.04,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: height*0.01,),
                            Text(
                              "Ghc 45,000",
                              style: GoogleFonts.inter(
                                  color: ColorPatch.charcoal,
                                  fontSize: width*0.045,
                                  fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: ColorPatch.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.07),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Pending Invoices",
                              style: GoogleFonts.inter(
                                  color: ColorPatch.charcoal.withOpacity(0.7),
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: height*0.01,),
                            Text(
                              "Ghc 45,000",
                              style: GoogleFonts.inter(
                                  color: Colors.amber,
                                  fontSize: width*0.045,
                                  fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: ColorPatch.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.07),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Next Due Date",
                              style: GoogleFonts.inter(
                                  color: ColorPatch.charcoal.withOpacity(0.7),
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: height*0.01,),
                            Text(
                              "15 Nov, 2025",
                              style: GoogleFonts.inter(
                                  color: ColorPatch.charcoal,
                                  fontSize: width*0.045,
                                  fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: height*0.27,
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: Card(
                  color: ColorPatch.white,
                  child: Image.asset(
                    "assets/images/graph.png",
                    fit: BoxFit.cover,
                    height: height*0.25,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: height*0.02),
                child: Text(
                  "Recent Transaction",
                  style: GoogleFonts.inter(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w600,
                    color: ColorPatch.charcoal
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: height*0.005),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: width*0.01,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: width*0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transaction One",
                                  style: GoogleFonts.inter(
                                    fontSize: width*0.04,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text("2025-01-06",
                                  style: GoogleFonts.inter(
                                    fontSize: width*0.025,
                                    color: ColorPatch.charcoal.withOpacity(0.5)
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(color: ColorPatch.charcoal.withOpacity(0.2),)
                    ],
                  );
                },
              )
            ],
          ),
        ),
      )
    );
  }
}
