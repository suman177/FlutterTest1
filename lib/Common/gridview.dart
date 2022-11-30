import 'package:flutter/material.dart';

class ReusableGridView extends StatefulWidget {
  const ReusableGridView(
      {Key? key, required this.itemsCount, required this.url})
      : super(key: key);

  final int itemsCount;
  final String url;

  @override
  State<ReusableGridView> createState() => _ReusableGridViewState();
}

class _ReusableGridViewState extends State<ReusableGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: Key(widget.itemsCount.toString()),
      itemCount: widget.itemsCount,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Image.network(widget.url),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
    );
  }
}
