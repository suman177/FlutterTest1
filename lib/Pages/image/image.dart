import 'package:assessmentapp/Api/common_api.dart';
import 'package:assessmentapp/Controller/slected_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Api/uploded_moments_provider.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final selectedGIFProvider = Provider.of<SelectedGifProvider>(context);
    return Scaffold(
      floatingActionButton: _floatingActionButton(),
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: GridView.builder(
        key: Key(selectedGIFProvider.getLength().toString()),
        itemCount: selectedGIFProvider.getLength(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              bool isSelected = selectedGIFProvider.selectToUpload(index);
              selectedGIFProvider.selectUpload(index, !isSelected);
              print("Clicked" + isSelected.toString());
            },
            child: Stack(
              children: [
                SizedBox(
                  child: Image.network(selectedGIFProvider.getAtIndex(index)),
                ),
                Visibility(
                  visible: selectedGIFProvider.selectToUpload(index),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue[900],
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leadingWidth: 40,
      leading: const Icon(Icons.arrow_back),
      title: const Text("MOMENTS",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await uploadImage();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: const FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Upload",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  uploadImage() async {
    final allImages = context.read<SelectedGifProvider>().selectedUrls;
    final selectedImages =
        context.read<SelectedGifProvider>().getSelectToUploadList;
    int isAdded = 0;
    for (var element in selectedImages) {
      if (element) {
        isAdded++;
      }
    }
    print("upload method");

    if (allImages.isEmpty || isAdded == 0) {
      print("Inside not upload");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Please select Image to upload!!",
        ),
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      print("Inside  upload");

      for (int i = 0; i < allImages.length; i++) {
        if (selectedImages[i]) {
          bool res = await apiServices.uploadImage(imageUrl: allImages[i]);
          if (res) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Successfully Uploaded!!"),
              behavior: SnackBarBehavior.floating,
            ));
          }
        }
      }
    }
    context.read<UploadedMomentsProvider>().fetchData();
  }

  Widget _floatingActionButton() {
    return SizedBox(
      width: 100,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/uploadedMoments');
        },
        child: const Text(
          "Uploaded Moments",
          textAlign: TextAlign.center,
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
