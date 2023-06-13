import 'dart:convert';
import 'dart:io';

import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/models/event_form_model.dart';
import 'package:event_application/models/event_model.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/event_create.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EventUpdateAdmin extends StatefulWidget {
  final EventModel? eventadmin;
  final EventForm? event;
  final Category? categorymodel;
  const EventUpdateAdmin(
      {this.eventadmin, this.event, this.categorymodel, super.key});

  @override
  State<EventUpdateAdmin> createState() => _EventUpdateAdminState();
}

class _EventUpdateAdminState extends State<EventUpdateAdmin> {
  String list1 = '645a7ad9a939d6ed0838438a';
  String list2 = '645a7ad9a939d6ed0838438a';

  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController aboutController = TextEditingController(text: '');
  TextEditingController locationController = TextEditingController(text: '');
  TextEditingController categoryController = TextEditingController(text: '');
  TextEditingController priceController = TextEditingController(text: '');
  TextEditingController timeController = TextEditingController(text: '');
  TextEditingController ticketController = TextEditingController(text: '');

  TextEditingController dateInput = TextEditingController();
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    aboutController.dispose();
    locationController.dispose();
    categoryController.dispose();
    priceController.dispose();
    timeController.dispose();
    super.dispose();
  }

  bool isonline = true;
  File? selectedImage;
  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File? compressed = await compressImage(image.path);
      setState(() {
        selectedImage = compressed;
      });
    }
  }

  // void myAlert() {
  //   ShowDialog();
  // }

  bool onlineEvent = false;
  List<String> list = <String>[
    'Webinar',
    'Concert',
  ];

  @override
  Widget build(BuildContext context) {
    String list3 = list.first;
    return BlocConsumer<EventBloc, EventState>(listener: (context, state) {
      if (state is EventSuccessAdmin) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/event-admin', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/event-admin', (route) => false);
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
                      'Update Info Event',
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
                Stock(),
                SizedBox(
                  height: 32,
                ),
                CustomFilledButton(
                  title: 'Submit & Save',
                  onPressed: () {
                    context.read<EventBloc>().add(
                          EventUpdate(
                              widget.eventadmin!.id.toString(),
                              EventForm(
                                  about: aboutController.text,
                                  title: titleController.text,
                                  category: categoryController.text == 'Concert'
                                      ? list1
                                      : list2,
                                  price: priceController.text,
                                  stock: ticketController.text,
                                  location: locationController.text,
                                  date: dateInput.text,
                                  cover: 'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()))),
                        );
                  },
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
            controller: titleController =
                TextEditingController(text: widget.eventadmin!.title),
            title: 'Nama Event',
            hintText: 'Masukkan Nama Event',
            isShowIcon: false,
          ),
          SizedBox(
            height: 24,
          ),
          DescriptionFormField(
            controller: aboutController =
                TextEditingController(text: widget.eventadmin!.about),
            title: 'Deskripsi Event',
            hintText: 'Masukkan Deskripsi Event',
          ),
          SizedBox(
            height: 24,
          ),
          BlocBuilder<EventBloc, EventState>(builder: (context, state) {
            return CategoryForm(
              list: list,
              onChanged: (value) {
                // This is called when the user selects an item.
                setState(() {
                  value = value!;
                  categoryController.text = value.toString();
                  print(categoryController.text);
                });
              },
            );
          }),
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
            controller: locationController =
                TextEditingController(text: widget.eventadmin!.location),
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
            controller: dateInput = TextEditingController(
                text: ConvertDate(widget.eventadmin!.date.toString())),
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
            controller: priceController = TextEditingController(
                text: widget.eventadmin!.price.toString()),
          ),
        ],
      ),
    );
  }

  Widget Stock() {
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
            title: 'Ticket',
            hintText: 'Masukkan Tiket',
            isShowIcon: false,
            controller: ticketController = TextEditingController(
                text: widget.eventadmin!.stock.toString()),
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
            child: GestureDetector(
              onTap: () {
                selectImage();
              },
              child: Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: greyColor,
                    image: selectedImage == null
                        ? null
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              File(
                                selectedImage!.path,
                              ),
                            ),
                          )),
                child: selectedImage != null
                    ? null
                    : Center(child: Icon(Icons.upload_file)),
              ),
            ),
          ),
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
