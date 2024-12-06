import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChatsPageShimmerLoading extends StatelessWidget {
  const ChatsPageShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _screenSizeData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .1,
                      height: _screenSizeData.size.height * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .6,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .1,
                      height: _screenSizeData.size.height * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .4,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .4,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .03,
                      height: _screenSizeData.size.height * .03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .7,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .03,
                      height: _screenSizeData.size.height * .03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .1,
                      height: _screenSizeData.size.height * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .6,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .7,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .03,
                      height: _screenSizeData.size.height * .03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .1,
                      height: _screenSizeData.size.height * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .4,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white12,
              ),
              height: _screenSizeData.size.height * .12,
              width: _screenSizeData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: _screenSizeData.size.width * .1,
                      height: _screenSizeData.size.height * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withAlpha(70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _screenSizeData.size.width * .4,
                          height: _screenSizeData.size.height * .03,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(70),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
