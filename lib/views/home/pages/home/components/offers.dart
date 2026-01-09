part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<Model>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/offers.json',
    );

    list = OfferList.jsonData(resp.data).list;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return list == null
        ? Center(child: CircularProgressIndicator())
        : CarouselSlider.builder(
            itemCount: list!.length,

            itemBuilder: (context, index, realIndex) => Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  list![index].image,
                  fit: BoxFit.cover,
                  height: 320.h,
                  width: double.infinity,
                ),
                Container(
                  height: 151.h,
                  width: double.infinity,
                  color: Color(0xffE9DCD3).withValues(alpha: .5),
                ),

                SizedBox(height: 5.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${list![index].discount} % OFF DISCOUNT\nCUPON CODE : ${list![index].coupon}',
                              style: TextStyle(
                                color: Color(0xff62322D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/icons/offer.svg',
                            height: 60.h,
                            width: 60.w,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0.r),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              'assets/icons/offer.svg',
                              height: 60.h,
                              width: 60.w,
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Text(
                              '${list![index].subtitle1}\nCUPON CODE : ${list![index].subtitle2}',
                              style: TextStyle(
                                color: Color(0xff434C6D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 320.h / 360.w,
              autoPlay: true,
              height: 320.h,
            ),
          );
  }
}

class OfferList {
  late final List<Model> list;

  OfferList.jsonData(List<dynamic> jsonList) {
    list = jsonList.map((e) => Model.fromJson(e)).toList();
  }
}

class Model {
  late final String coupon;
  late final num discount;
  late final num id;
  late final String image;
  late final num productId;
  late final String subtitle1;
  late final String subtitle2;

  Model.fromJson(Map<String, dynamic> json) {
    coupon = json['cupon'] ?? '';
    discount = json['discound'] ?? 0;
    id = json['id'] ?? 0;
    image = json['image'] ?? '';
    productId = json['product_id'] ?? 0;
    subtitle1 = json['sub_title1'] ?? '';
    subtitle2 = json['sub_title2'] ?? '';
  }
}
