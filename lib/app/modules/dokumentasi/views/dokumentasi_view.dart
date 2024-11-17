import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';
import '../controllers/dokumentasi_controller.dart';

class DokumentasiView extends GetView<DokumentasiController> {
  // const DokumentasiView({Key? key}) : super(key: key);
  final DokumentasiController controller = Get.put(DokumentasiController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Dokumentasi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Foto"),
              Tab(text: "Video"),
              Tab(text: "Lainnya"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Foto
            _buildFotoTab(context),
            // Tab Video
            _buildVideoTab(context),
            // Tab Lainnya
            const Center(child: Text('Tab Lainnya')),
          ],
        ),
      ),
    );
  }

  // Tab Foto
  Widget _buildFotoTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // GridView untuk dokumentasi foto
          Expanded(
            child: Obx(() {
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  _buildDokumentasiItem(
                    "Kegiatan",
                    "Dokumentasi Kegiatan Pramuka",
                    "assets/foto.png",
                  ),
                  _buildDokumentasiItem(
                    "Pelatihan",
                    "Dokumentasi Pelatihan Pramuka",
                    "assets/gambar.png",
                  ),
                  // Item untuk gambar yang diambil atau dipilih
                  if (controller.selectedImage.value != null)
                    _buildDokumentasiItem(
                      "Nama Kegiatan",
                      "Deskripsi",
                      null,
                      isCustomImage: true,
                      customImage: controller.selectedImage.value,
                    ),
                ],
              );
            }),
          ),
          const SizedBox(height: 20),
          // Tombol untuk mengambil foto atau memilih dari galeri
          ElevatedButton(
            onPressed: () => _showImageSourceDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "Ambil Foto",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Tab Video
  Widget _buildVideoTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // GridView untuk dokumentasi video
          Expanded(
            child: Obx(() {
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  _buildDokumentasiItem(
                    "Kegiatan Video",
                    "Dokumentasi Video Kegiatan Pramuka",
                    "assets/video1.png",
                  ),
                  _buildDokumentasiItem(
                    "Pelatihan Video",
                    "Dokumentasi Video Pelatihan Pramuka",
                    "assets/video2.png",
                  ),
                  // Item untuk video yang diambil atau dipilih
                  if (controller.selectedVideo.value != null)
                    _buildDokumentasiItem(
                      "Nama Kegiatan Video",
                      "Deskripsi Video",
                      null,
                      isCustomImage: false,
                      customImage: controller.selectedVideo.value,
                      isVideo: true,  // Menandakan ini adalah video
                    ),
                ],
              );
            }),
          ),
          const SizedBox(height: 20),
          // Tombol untuk mengambil video atau memilih dari galeri
          ElevatedButton(
            onPressed: () => _showVideoSourceDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "Ambil Video",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item dokumentasi
  Widget _buildDokumentasiItem(String title, String description, String? imageUrl,
      {bool isCustomImage = false, File? customImage, bool isVideo = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar atau video dokumentasi
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: isVideo
                  ? customImage != null
                      ? VideoPlayerWidget(videoFile: customImage)
                      : const Icon(Icons.video_library, size: 100)
                  : isCustomImage && customImage != null
                      ? Image.file(
                          customImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : imageUrl != null
                          ? Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : const Icon(Icons.image, size: 100),
            ),
          ),
          // Teks deskripsi
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dialog untuk memilih sumber gambar (kamera atau galeri)
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pilih Sumber Gambar"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Kamera"),
                onTap: () {
                  Get.back();
                  controller.ambilFotoDariKamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Galeri"),
                onTap: () {
                  Get.back();
                  controller.ambilFotoDariGaleri();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Dialog untuk memilih sumber video (kamera atau galeri)
  void _showVideoSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pilih Sumber Video"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Kamera"),
                onTap: () {
                  Get.back();
                  controller.ambilVideoDariKamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: const Text("Galeri"),
                onTap: () {
                  Get.back();
                  controller.ambilVideoDariGaleri();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}


  // Widget untuk menampilkan video
class VideoPlayerWidget extends StatefulWidget {
    final File videoFile;
    const VideoPlayerWidget({Key? key, required this.videoFile}) : super(key: key);

    @override
    _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
  }

  class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
    late VideoPlayerController _controller;

    @override
    void initState() {
      super.initState();
      _controller = VideoPlayerController.file(widget.videoFile)
        ..initialize().then((_) {
          setState(() {});
        });
    }

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }

    @override
    Widget build(BuildContext context) {
      if (!_controller.value.isInitialized) {
        return const Center(child: CircularProgressIndicator());
      }
      return GestureDetector(
        onTap: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        ),
      );
    }
}

void main() async{
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DokumentasiView(),
    ),
  );
}

