import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timosh_app/DataList.dart';
import 'package:timosh_app/Searchb__location.dart';
import 'package:timosh_app/Searchb__location_add.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'SliderWidget.dart';

class FavoriteWidget4 extends StatefulWidget {
  @override
  _BottomSheetContent4 createState() => _BottomSheetContent4();
}

class _BottomSheetContent4 extends State<FavoriteWidget4> {
  String quarey = "";

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.90,
      minChildSize: 0.25,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Color.fromRGBO(2, 7, 39, 1),
            ),
            child: SafeArea(
                bottom: true,
                child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.only(bottom: 25),
                    children: [
                      Wrap(direction: Axis.horizontal, children: [
                        Container(
                          padding: EdgeInsets.only(top: 25, left: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Фільтр',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 30),
                            ),
                          ),
                        ),

//Container(margin:EdgeInsets.only(top:20), width:double.infinity, height:1, color:Color.fromRGBO(5, 30, 70, 1)),

                        Padding(
                          padding: EdgeInsets.only(top: 25, left: 12),
                          child: Text(
                            "Кузов",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: bodyAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapBody_filter[index] == true)
                                            setState(() {
                                              mapBody_filter.remove(index);
                                              removeitemca(
                                                  'body', bodyAdsEng[index]);
                                            });
                                          else
                                            setState(() {
                                              additemca(
                                                  'body', bodyAdsEng[index]);
                                              mapBody_filter[index] = true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color:
                                                  mapBody_filter[index] == true
                                                      ? Color(0xff7FB800)
                                                      : Color.fromRGBO(
                                                          5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              bodyAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),

                        /* Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Локація",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            checksavesearch_location =
                                savesearch_text_ar_val_location.toString() +
                                    savesearch_text_ar_val_gl_location
                                        .toString();

                            showSearch(
                                    context: context,
                                    delegate:
                                        DataSearchLocationAdd(listLocation))
                                .whenComplete(() {
                              if (checksavesearch_location !=
                                  savesearch_text_ar_val_location.toString() +
                                      savesearch_text_ar_val_gl_location
                                          .toString()) {
                                for (int i = 0;
                                    i < savesearch_text_ar_val_location.length;
                                    i++) {}

                                //  closebottom();
                              } else
                                setState(() {});
                            });
                          },
                          child: Container(
                              child: savesearch_text_ar_val_location.length >
                                          0 ||
                                      savesearch_text_ar_val_gl_location
                                              .length >
                                          0
                                  ? Text(
                                      savesearch_text_ar_val_location.length >
                                                  0 ||
                                              savesearch_text_ar_val_gl_location
                                                      .length >
                                                  0
                                          ? savesearch_text_ar_location
                                              .join(', ')
                                          : "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))
                                  : Text(
                                      "Київ",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 30),
                                    )),
                        ),
*/
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Привід",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: driveAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapDrive_filter[index] == true)
                                            setState(() {
                                              mapDrive_filter.remove(index);
                                              removeitemca(
                                                  'drive', driveAdsEng[index]);
                                            });
                                          else
                                            setState(() {
                                              additemca(
                                                  'drive', driveAdsEng[index]);
                                              mapDrive_filter[index] = true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color:
                                                  mapDrive_filter[index] == true
                                                      ? Color(0xff7FB800)
                                                      : Color.fromRGBO(
                                                          5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              driveAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),

                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Коробка",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: transmissionAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapTransmission_filter[index] ==
                                              true)
                                            setState(() {
                                              mapTransmission_filter
                                                  .remove(index);
                                              removeitemca('transmission',
                                                  transmissionAdsEng[index]);
                                            });
                                          else
                                            setState(() {
                                              additemca('transmission',
                                                  transmissionAdsEng[index]);
                                              mapTransmission_filter[index] =
                                                  true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color: mapTransmission_filter[
                                                          index] ==
                                                      true
                                                  ? Color(0xff7FB800)
                                                  : Color.fromRGBO(
                                                      5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              transmissionAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Паливо",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: fuelAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapFuel_filter[index] == true)
                                            setState(() {
                                              mapFuel_filter.remove(index);
                                              removeitemca(
                                                  'fuel', fuelAdsEng[index]);
                                            });
                                          else
                                            setState(() {
                                              additemca(
                                                  'fuel', fuelAdsEng[index]);
                                              mapFuel_filter[index] = true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color:
                                                  mapFuel_filter[index] == true
                                                      ? Color(0xff7FB800)
                                                      : Color.fromRGBO(
                                                          5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              fuelAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),
                        Padding(
                          padding: EdgeInsets.only(top: 25, left: 12),
                          child: Text(
                            "Локація",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                              height: 62,
                              width: double.infinity,
                              child: GestureDetector(
                                  onTap: () {
                                    checksavesearch_location =
                                        savesearch_text_ar_val_location
                                                .toString() +
                                            savesearch_text_ar_val_gl_location
                                                .toString();

                                    showSearch(
                                            context: context,
                                            delegate: DataSearchLocationAdd(
                                                listLocation))
                                        .whenComplete(() {
                                      setState(() {});
                                      /*  if (checksavesearch_location !=
                                          savesearch_text_ar_val_location
                                                  .toString() +
                                              savesearch_text_ar_val_gl_location
                                                  .toString()) {
                                        for (int i = 0;
                                            i <
                                                savesearch_text_ar_val_location
                                                    .length;
                                            i++) {}

                                        //  closebottom();
                                      } else
                                        setState(() {});*/
                                    });
                                  },
                                  child: savesearch_text_ar_val_location
                                                  .length >
                                              0 ||
                                          savesearch_text_ar_val_gl_location
                                                  .length >
                                              0
                                      ? ListView.builder(
                                          itemCount: savesearch_text_ar_location
                                              .length,
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          scrollDirection: Axis.horizontal,
                                          // padding: const EdgeInsets.only(right: 12),
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                padding: EdgeInsets.fromLTRB(
                                                    24.0, 13.0, 24.0, 13.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                14)),
                                                    color: Color(
                                                        0xff7FB800) //Color(0xff27415b),//Color.fromRGBO(5, 30, 70, 1),
                                                    ),
                                                child: Center(
                                                    child: Text(
                                                  savesearch_text_ar_location[
                                                          index]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )));
                                          },
                                        )
                                      : ListView.builder(
                                          itemCount: locAds.length,
                                          scrollDirection: Axis.horizontal,
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin: EdgeInsets.only(
                                                    left: 12, top: 18),
                                                padding: EdgeInsets.fromLTRB(
                                                    24.0, 13.0, 24.0, 13.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14)),
                                                  color: Color.fromRGBO(
                                                      5, 30, 70, 1),
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 6),
                                                        child: Icon(
                                                          Icons.location_on,
                                                          color: Colors.white,
                                                          size: 16.0,
                                                          semanticLabel:
                                                              'Локація',
                                                        ),
                                                      ),
                                                      Text(
                                                        locAds[index],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )
                                                    ]));
                                          },
                                        )),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Таможня",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: customsAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapCustoms_filter[index] == true)
                                            setState(() {
                                              mapCustoms_filter.remove(index);
                                              removeitemca('customs',
                                                  customsAdsEng[index]);
                                            });
                                          else
                                            setState(() {
                                              additemca('customs',
                                                  customsAdsEng[index]);
                                              mapCustoms_filter[index] = true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color: mapCustoms_filter[index] ==
                                                      true
                                                  ? Color(0xff7FB800)
                                                  : Color.fromRGBO(
                                                      5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              customsAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),

                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Об'єм мотора",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: mileageAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapMileage_filter[index] == true)
                                            setState(() {
                                              remove_string_filter(
                                                  mileageAdsEng[index]);
                                              mapMileage_filter.remove(index);
                                              //removeitemca('customs', customsAdsEng[index]);
                                            });
                                          else
                                            setState(() {
//additemca('customs', customsAdsEng[index]);
                                              add_string_filter(
                                                  mileageAdsEng[index]);
                                              mapMileage_filter[index] = true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color: mapMileage_filter[index] ==
                                                      true
                                                  ? Color(0xff7FB800)
                                                  : Color.fromRGBO(
                                                      5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              mileageAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),

                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 12),
                          child: Text(
                            "Рік випуску",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Container(
                                height: 62,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: ageAds.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(right: 12),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.lightImpact();
                                          if (mapAge_filter[index] == true)
                                            setState(() {
                                              mapAge_filter.remove(index);
                                              removeitemca(
                                                  'age', ageAds[index]);
                                            });
                                          else
                                            setState(() {
                                              additemca('age', ageAds[index]);
                                              mapAge_filter[index] = true;
                                            });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 18),
                                            padding: EdgeInsets.fromLTRB(
                                                24.0, 13.0, 24.0, 13.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(14)),
                                              color:
                                                  mapAge_filter[index] == true
                                                      ? Color(0xff7FB800)
                                                      : Color.fromRGBO(
                                                          5, 30, 70, 1),
                                            ),
                                            child: Text(
                                              ageAds[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )));
                                  },
                                ))),

                        SliderWidget(),
                      ])
                    ])));
      },
    );
  }
}
