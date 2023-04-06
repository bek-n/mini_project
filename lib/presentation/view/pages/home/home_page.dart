import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/home_provider.dart';
import 'package:setup_provider/domain/model/restaurant_model.dart';
import 'package:setup_provider/presentation/components/loading.dart';
import 'package:setup_provider/presentation/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantModel? rest;
  getDatas() async {
    rest = await context.read<HomeProvider>().getInfos(context: context);
    print('length ${rest?.links}');
  }

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDatas();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeProvider>();
    final state = context.watch<HomeProvider>();
    return Scaffold(
        body: state.isLoading
            ? const Center(child: Loading())
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Restaurants',
                        style: Style.bold(size: 20, color: Style.black),
                      ),
                      12.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: rest?.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 248.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Style.black,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 118.h,
                                    decoration: const BoxDecoration(
                                        // image: DecorationImage(
                                        //     image: NetworkImage(
                                        //         '${rest?.data?[index].backgroundImg}'),
                                        //     fit: BoxFit.cover),
                                        color: Style.primaryColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(24),
                                            topRight: Radius.circular(24))),
                                  ),
                                  27.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      '${rest?.data?[index].status}',
                                      style: Style.bold(),
                                    ),
                                  ),
                                  3.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      'Description',
                                      style: Style.regular(),
                                    ),
                                  ),
                                  16.verticalSpace,
                                  const Divider(
                                    color: Style.white,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
