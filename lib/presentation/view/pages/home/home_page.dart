import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/home_provider.dart';
import 'package:setup_provider/domain/model/restaurant_model.dart';
import 'package:setup_provider/presentation/components/custom_network_image.dart';
import 'package:setup_provider/presentation/components/loading.dart';
import 'package:setup_provider/presentation/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProvider>().getInfos(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                          itemCount: state.lst.length,
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
                                  CustomNetworkImage(
                                      url: '${state.lst[index].backgroundImg}',
                                      height: 118,
                                      width: double.infinity,
                                      radius: 24),
                                  27.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      '${state.tr?.title}',
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
