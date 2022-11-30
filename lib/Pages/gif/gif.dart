import 'package:assessmentapp/Controller/page_controller.dart';
import 'package:assessmentapp/Controller/slected_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Api/gif_api_provider.dart';

class GifPage extends StatefulWidget {
  const GifPage({Key? key}) : super(key: key);

  @override
  State<GifPage> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  int itemsNumber = 15;
  bool bottomLoading = false;
  @override
  void initState() {
    if (context.read<GifApiProvider>().gifApiResponseModel == null) {
      context.read<GifApiProvider>().fetchData(limit: itemsNumber);
    }
    super.initState();
  }

  Future<void> updateApi() async {
    setState(() {
      bottomLoading = true;
    });
    itemsNumber += 15;
    await context.read<GifApiProvider>().fetchData(limit: itemsNumber);
    setState(() {
      bottomLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("GIF"),
    );
  }

  Widget _body() {
    final gifApiProvider = Provider.of<GifApiProvider>(context);
    print(context.read<GifApiProvider>().gifApiResponseModel?.results?.length);

    if (gifApiProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (gifApiProvider.error) {
      return Center(
        child: Text(gifApiProvider.errorMessage.toString()),
      );
    }
    final gifResponse = gifApiProvider.gifApiResponseModel?.results;
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        print(!bottomLoading &&
            scrollNotification.metrics.pixels ==
                scrollNotification.metrics.maxScrollExtent);
        if (!bottomLoading &&
            scrollNotification.metrics.pixels ==
                scrollNotification.metrics.maxScrollExtent) {
          updateApi();
        }
        return true;
      },
      child: GridView.builder(
        key: Key(gifResponse!.length.toString()),
        itemCount: gifResponse.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final selectItem =
                  Provider.of<SelectedGifProvider>(context, listen: false);
              selectItem
                  .addImageUrl(gifResponse[index].media![0].tinygif!.url!);
              context.read<HomePageController>().bodyIndex = 0;
            },
            child: SizedBox(
              child: Image.network(gifResponse[index].media![0].tinygif!.url!),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      ),
    );
  }
}
