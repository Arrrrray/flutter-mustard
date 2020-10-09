import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPContentLoading extends StatelessWidget {
  const SPContentLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CircularProgressIndicator(),
        //     Text("loading..."),
        //   ],
        // ),
      ),
    );
  }
}

typedef Widget SPLoadingBuilder(BuildContext context);

class SPLoadingContainer extends StatelessWidget {
  final bool isLoading;
  final bool withScaffold;
  final SPLoadingBuilder builder;
  const SPLoadingContainer({
    Key key,
    this.isLoading,
    this.withScaffold,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = (isLoading ?? true) ? SPContentLoading() : builder(context);
    if (withScaffold == true) {
      return Scaffold(body: content);
    } else {
      return content;
    }
  }
}

class SPCardContainer extends StatelessWidget {
  final Widget child;
  const SPCardContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      child: child,
    );
  }
}
