part of '../view.dart';

class _ListProduct extends StatefulWidget {
  const _ListProduct({super.key});

  @override
  State<_ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<_ListProduct> {
  List<Model>? list;

  Future<void> getData() async {


    final resp = await Dio().get(
      'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/categories.json',
    );
    list = ProductList.jsonData(resp.data).list;

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
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  _Item(model: list![index]),

              separatorBuilder: (context, index) => Divider(),

              itemCount: list!.length,
            ),
          );
  }
}

class _Item extends StatelessWidget {
  final Model model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(path: model.image, height: 70.h, width: 70.w),
        SizedBox(width: 12.w),
        Text(
          model.name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff434C6D),
            fontFamily: 'Montserrat',
          ),
        ),

        Expanded(child: SizedBox(width: 290.w)),
        GestureDetector(
          onTap: () {},
          child: AppImage(path: 'arrow_right.png', height: 70.h, width: 70.w),
        ),
      ],
    );
  }
}

class ProductList {
  late final List<Model> list;

  ProductList.jsonData(List<dynamic> jsonData) {
    list = jsonData.map((e) => Model.json(e)).toList();
  }
}




class Model {
  late final num id;
  late final String image,name;


  Model.json(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    image = json['image'] ?? '';
    name = json['name'] ?? '';
  }
}
