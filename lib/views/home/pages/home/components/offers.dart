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
      'http://www.cosmatics.growfet.com/api/Sliders',
    );
    //await DioHelper.getData(pass: '/api/Sliders');
    print(resp.data);
    list = AutoGenerate.fromList(resp.data).list;

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
                  list![index].imageUrl
                    ,
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
                              '${list![index].discountPercent} % OFF DISCOUNT\nCUPON CODE : ${list![index].couponCode}',
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
                              '${list![index].descriptionTitle1}\nCUPON CODE : ${list![index].descriptionTitle2}',
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

class AutoGenerate {
  final List<Model> list;

  AutoGenerate.fromList(List<dynamic> jsonList)
    : list = jsonList.map((e) => Model.fromJson(e)).toList();
}

class Model {
  late final num id;
  late final String couponCode;
  late final num discountPercent;
  late final String descriptionTitle1;
  late final String descriptionTitle2;
  late final String imageUrl;

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    couponCode = json['couponCode'] ?? '';
    discountPercent = json['discountPercent'] ?? 0;
    descriptionTitle1 = json['descriptionTitle1'] ?? '';
    descriptionTitle2 = json['descriptionTitle2'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
  }
}
