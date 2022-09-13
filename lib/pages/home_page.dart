import 'package:flutter/material.dart';
import 'package:systemleavesubmission/main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:systemleavesubmission/theme/colors/light_colors.dart';
import 'package:systemleavesubmission/widgets/task_column.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:systemleavesubmission/pages/sign_in.dart';

class HomePage extends StatelessWidget {


  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _currentIndex=0;
    List cardList=[
      Item1(),
      Item2(),
      Item3(),
      Item4(),
      Item5(),
      Item6(),
    ];
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  )),
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          onPressed: () {
                            signOutGoogle();
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return MyApp();}), ModalRoute.withName('/'));
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 45.0,
                            lineWidth: 3.0,
                            animation: true,
                            percent: 1,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kDarkYellow,
                            backgroundColor: LightColors.kDarkYellow,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: NetworkImage(
                                imageUrl,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  email,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            SizedBox(height: 15.0,),
            Container(
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 125.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {

                        },
                      ),
                      items: cardList.map((card){
                        return Builder(
                            builder:(BuildContext context){
                              return Container(
                                height: MediaQuery.of(context).size.height*0.30,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  color: Colors.blueAccent,
                                  child: card,
                                ),
                              );
                            }
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(cardList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        );
                      }),
                    )
                  ],
                ),
            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Daftar Pengajuan'),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.cloud_upload_rounded,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'Unggah Surat Pengantar',
                            subtitle: '',
                            directLink: 'unaggahSuratPengatar',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.cloud_download,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'Unduh Surat Izin Cuti',
                            subtitle: '',
                            directLink: 'unduhSuratIzinCuti',
                          ),
                          SizedBox(height: 15.0,),
                          TaskColumn(
                            icon: Icons.list_alt,
                            iconBackgroundColor: LightColors.kGreen,
                            title: 'Cuti Tahunan',
                            subtitle: '',
                            directLink: 'cutiTahunan',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.list_alt,
                            iconBackgroundColor: LightColors.kGreen,
                            title: 'Cuti Sakit',
                            subtitle: '',
                            directLink: 'cutiSakit',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.list_alt,
                            iconBackgroundColor: LightColors.kGreen,
                            title: 'Cuti Alasan Penting',
                            subtitle: '',
                            directLink: 'cutiAlasanPenting',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.list_alt,
                            iconBackgroundColor: LightColors.kGreen,
                            title: 'Cuti Melahirkan',
                            subtitle: '',
                            directLink: 'cutiMelahirkan',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.list_alt,
                            iconBackgroundColor: LightColors.kGreen,
                            title: 'Cuti Besar',
                            subtitle: '',
                            directLink: 'cutiBesar',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Tutorial'),
                          SizedBox(height: 10.0),
                          TaskColumn(
                            icon: Icons.play_circle_fill,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'Video Tutorial',
                            subtitle: '',
                            directLink: 'videoTutorial',
                          ),
                          SizedBox(height: 10.0),
                          TaskColumn(
                            icon: Icons.cloud_download,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'Download E-Book Cuti',
                            subtitle: '',
                            directLink: 'downloadEbookCuti',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            image: AssetImage("assets/images/bannerSlide1.jpeg"),
          ))
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage("assets/images/bannerSlide2.jpeg"),
            ))
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage("assets/images/bannerSlide3.jpeg"),
            ))
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage("assets/images/bannerSlide4.jpeg"),
            ))
    );
  }
}

class Item5 extends StatelessWidget {
  const Item5({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage("assets/images/bannerSlide5.jpeg"),
            ))
    );
  }
}

class Item6 extends StatelessWidget {
  const Item6({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage("assets/images/bannerSlide6.jpeg"),
            ))
    );
  }
}


