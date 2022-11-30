import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Api/uploded_moments_provider.dart';

class UploadedMoments extends StatefulWidget {
  const UploadedMoments({Key? key}) : super(key: key);

  @override
  State<UploadedMoments> createState() => _UploadedMomentsState();
}

class _UploadedMomentsState extends State<UploadedMoments> {
  @override
  void initState() {
    if (context.read<UploadedMomentsProvider>().gifApiResponseModel == null) {
      context.read<UploadedMomentsProvider>().fetchData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Uploaded Moments"),
    );
  }

  Widget _body() {
    final gifApiProvider = Provider.of<UploadedMomentsProvider>(context);
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
    final gifResponse = gifApiProvider.gifApiResponseModel?.items;
    return GridView.builder(
      key: Key(gifResponse!.length.toString()),
      itemCount: gifResponse.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Image.network(gifResponse[index].url!),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
    );
  }
}
