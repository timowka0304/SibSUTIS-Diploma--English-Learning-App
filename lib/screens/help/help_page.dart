import 'package:easy_peasy/constants.dart';
import 'package:easy_peasy/models/help_model.dart';
import 'package:easy_peasy/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_peasy/size_config.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondBlue,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(15),
                          getProportionateScreenHeight(25),
                          getProportionateScreenWidth(15),
                          getProportionateScreenHeight(30),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              return kMainPurple.withOpacity(0.1);
                            }),
                          ),
                          child: Text(
                            'Назад',
                            style: TextStyle(
                              color: kMainTextColor,
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const MainScreen(
                                        pageIndex: 2,
                                        isStart: false,
                                      ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = 0.0;
                                    const end = 1.0;
                                    const curve = Curves.ease;

                                    var tween = Tween(
                                      begin: begin,
                                      end: end,
                                    ).chain(
                                      CurveTween(
                                        curve: curve,
                                      ),
                                    );

                                    return FadeTransition(
                                      opacity: animation.drive(tween),
                                      child: child,
                                    );
                                  }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: HelpModel.list.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getProportionateScreenHeight(20),
                    );
                  },
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      textColor: kMainPurple,
                      iconColor: kMainPurple,
                      title: Text(
                        HelpModel.list[index].title,
                        style: TextStyle(
                          color: kMainTextColor,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            HelpModel.list[index].text,
                            style: TextStyle(
                              color: kMainTextColor,
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
