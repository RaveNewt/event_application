import 'dart:io';

import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/admin/event_admin.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final titleController = TextEditingController(text: '');
  final aboutController = TextEditingController(text: '');
  final locationController = TextEditingController(text: '');
  String categoryString = '';
  TextEditingController categoryController = TextEditingController(text: '');
  final priceController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  TextEditingController dateInput = TextEditingController();
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  bool isonline = true;
  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    ShowDialog();
  }

  bool onlineEvent = false;
  List<String> list = <String>['Online Event', 'Music Concert', 'Seminar'];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(listener: (context, state) {
      if (state is PostEvent) {
        Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
      }
    }, builder: (context, state) {
      if (state is EventLoadingState) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
          drawer: DrawerCustom(),
          appBar: AppBarCostum(),
          body: ListView(children: [
            Container(
              child: Column(children: [
                Container(
                  width: double.maxFinite,
                  height: 100,
                  color: greyColor,
                  child: Center(
                    child: Text(
                      'Buat Event',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                InformasiEvent(),
                SizedBox(
                  height: 32,
                ),
                UploadImage(),
                SizedBox(
                  height: 32,
                ),
                LokasiEvent(),
                SizedBox(
                  height: 32,
                ),
                EventDate(),
                SizedBox(
                  height: 32,
                ),
                Price(),
                SizedBox(
                  height: 32,
                ),
                CustomFilledButton(
                  title: 'Submit & Save',
                  onPressed: () {},
                  width: 200,
                ),
              ]),
            ),
          ]));
    });
    ;
  }

  Widget InformasiEvent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informasi Event',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: light)),
          Divider(
            color: greyColor,
          ),
          CustomFormField(
            controller: titleController,
            title: 'Nama Event',
            hintText: 'Masukkan Nama Event',
            isShowIcon: false,
          ),
          SizedBox(
            height: 24,
          ),
          DescriptionFormField(
            title: 'Deskripsi Event',
            hintText: 'Masukkan Deskripsi Event',
          ),
          SizedBox(
            height: 24,
          ),
          // CategoryForm(
          //   list: list,
          //   controller: categoryController,
          // ),
          DropdownButtonFormField(
            value: categoryString,
            decoration: InputDecoration(
              labelText: 'Kategori Event',
              labelStyle:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: light),
              hintText: 'Pilih Kategori Event',
              hintStyle:
                  greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: list.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              // This is called when the user selects an item.
              setState(() {
                categoryString = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget LokasiEvent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lokasi Event',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: light)),
          Divider(
            color: greyColor,
          ),
          CustomFormField(
            title: 'Lokasi Event',
            hintText: 'Masukkan Lokasi',
            isShowIcon: false,
            controller: locationController,
          ),
          SizedBox(
            height: 24,
          ),
          (isonline)
              ? CustomFormField(
                  title: 'Lokasi',
                  controller: TextEditingController(text: 'Online'),
                  icon: Icon(
                    Icons.online_prediction_rounded,
                    color: Colors.green,
                  ),
                )
              : CustomFormField(
                  title: 'Lokasi',
                  controller: TextEditingController(text: 'Offline'),
                  isShowIcon: false,
                ),
        ],
      ),
    );
  }

  Widget EventDate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date and Time', style: blackTextStyle.copyWith(fontSize: 16)),
          Divider(
            color: greyColor,
          ),
          FormCalendarPicker(
            controller: dateInput,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));
              if (pickedDate != null) {
                String formattedDate = pickedDate.toString();
                dateInput.text = formattedDate.substring(0, 10);
              } else {
                print("Date is not selected");
              }
            },
          ),
        ],
      ),
    );
  }

  Widget Price() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Harga Tiket', style: blackTextStyle.copyWith(fontSize: 16)),
          Divider(
            color: greyColor,
          ),
          CustomFormField(
            title: 'Harga Tiket',
            hintText: 'Masukkan Harga Tiket',
            isShowIcon: false,
            controller: priceController,
          ),
        ],
      ),
    );
  }

  Widget UploadImage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gambar Event',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: light)),
          Divider(
            color: greyColor,
          ),
          Text(
            'Ukuran Gambar yang disarankan 1076x 764pixel.\nBesar Gambar maksimal 3MB. Jenis File jepg,png\nGambar bisa Dignati setelah unggah gambar pertama',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: light),
            textAlign: TextAlign.justify,
            textWidthBasis: TextWidthBasis.parent,
          ),
          SizedBox(
            height: 12,
          ),
          Center(
            child: CustomFilledButton(
              title: 'Unggah Photo',
              onPressed: () {
                myAlert();
              },
              width: 150,
              height: 40,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //if image not null show the image
          //if image null show text
          image != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(image!.path),
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                )
              : Text(
                  "No Image",
                  style: TextStyle(fontSize: 20),
                )
        ],
      ),
    );
  }

  Widget DrawerCustom() {
    return Drawer(
      backgroundColor: blackColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_image.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Center(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ihsan',
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold),
                      ),
                      Text(
                        'Admin',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Event',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Future ShowDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  PreferredSizeWidget AppBarCostum() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Eventify',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Manager Event',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Logout'),
                onTap: () {},
              ),
            ];
          },
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
