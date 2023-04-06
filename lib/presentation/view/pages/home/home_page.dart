import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setup_provider/presentation/style/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                itemCount: 1,
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
                              color: Style.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                        ),
                        27.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Name',
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
