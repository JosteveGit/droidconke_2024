import 'package:droidconke_showcase/colors.dart';
import 'package:droidconke_showcase/showcase_2/clippers.dart';
import 'package:droidconke_showcase/showcase_2/logo.dart';
import 'package:flutter/material.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gold,
              blue,
            ],
          ),
        ),
        child: Transform.translate(
          offset: const Offset(0, 40),
          child: FittedBox(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 480,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: gwrBlue,
                        width: 4,
                      ),
                      color: Colors.white,
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: blue,
                      //     blurRadius: 10,
                      //     offset: Offset(0, 0),
                      //   ),
                      //   BoxShadow(
                      //     color: gold,
                      //     blurRadius: 10,
                      //     offset: Offset(10, 10),
                      //   ),
                      // ],
                    ),
                    padding: const EdgeInsets.all(40),
                    child: Column(children: body),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Center(
                      child: ClipPath(
                        clipper: BannerClipper(),
                        child: Container(
                          width: 500,
                          height: 80,
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipPath(
                                  clipper: LeftBannerClipper(),
                                  child: Container(
                                    color: gwrGold,
                                    padding: const EdgeInsets.all(10),
                                    height: 80,
                                    child: const Center(
                                      child: Text(
                                        "RECORD",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 100),
                              Expanded(
                                child: ClipPath(
                                  clipper: RightBannerClipper(),
                                  child: Container(
                                    color: gwrGold,
                                    padding: const EdgeInsets.all(10),
                                    height: 80,
                                    child: const Center(
                                      child: Text(
                                        "HOLDER",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.scale(
                        scale: 1.5,
                        child: Transform.translate(
                          offset: const Offset(0, -53),
                          child: const Logo(
                            shouldBeep: false,
                            size: 80,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get body {
    const data = """
The first-ever FlutterCon in Africa and the record 5th Droidcon Kenya were successfully hosted in Nairobi, 2024.
""";
    return [
      const Logo(
        size: 200,
        color: Colors.black,
        shouldBeep: true,
      ),
      const SizedBox(height: 40),
      const Text(
        "CERTIFICATE",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: gwrBlue,
          decoration: TextDecoration.underline,
          decorationColor: gwrBlue,
        ),
      ),
      const SizedBox(height: 50),
      const Text(
        data,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: gwrBlue,
        ),
      ),
      const SizedBox(height: 50),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "OFFICIALLY",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: gwrBlue,
            ),
          ),
          SizedBox(width: 2),
          Text(
            "AMAZING",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: gwrGold,
            ),
          ),
        ],
      ),
    ];
  }
}
