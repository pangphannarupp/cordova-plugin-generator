import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/app/pluggy.png'),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cordova Plugin Generator".toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,),
            ),
            // const Text(
            //   'Strategic Planning',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 16,),
            // ),
            const SizedBox(height: 10,),
            const Text(
              'Version 1.2.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,),
            )
          ],
        ),
      ]),
    );
  }
}
