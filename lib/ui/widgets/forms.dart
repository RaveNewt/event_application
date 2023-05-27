import 'package:event_application/models/event_model.dart';
import 'package:event_application/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String value;
  final String hintText;
  final Icon icon;
  final bool obscureText;
  final bool isPassword;
  final TextEditingController? controller;
  final bool isShowTitle;
  final bool isShowIcon;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  CustomFormField(
      {Key? key,
      required this.title,
      this.icon = const Icon(
        Icons.email_outlined,
      ),
      this.onTap,
      this.value = '',
      this.isShowIcon = true,
      this.hintText = '',
      this.isPassword = false,
      this.obscureText = false,
      this.controller,
      this.isShowTitle = true,
      this.onFieldSubmitted,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        (isShowIcon)
            ? TextFormField(
                validator: validator,
                onTap: onTap,
                obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  prefixIcon: icon,

                  // suffixIcon: (isPassword)
                  //     ? IconButton(
                  //         onPressed: () {
                  //           setState(){
                  //             obscureText = !obscureText;
                  //           }
                  //         },
                  //         icon: Icon(
                  //           obscureText ? Icons.visibility : Icons.visibility_off,
                  //         ),
                  //         color: primaryColor,
                  //       )
                  //     : null,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
                onFieldSubmitted: onFieldSubmitted,
              )
            : TextFormField(
                onTap: onTap,
                obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  // suffixIcon: (isPassword)
                  //     ? IconButton(
                  //         onPressed: () {
                  //           setState(){
                  //             obscureText = !obscureText;
                  //           }
                  //         },
                  //         icon: Icon(
                  //           obscureText ? Icons.visibility : Icons.visibility_off,
                  //         ),
                  //         color: primaryColor,
                  //       )
                  //     : null,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
                onFieldSubmitted: onFieldSubmitted,
              ),
      ],
    );
  }
}

class CustomSearchForm extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController? controller;
  final bool isShowTitle;
  final Function(String)? onFieldSubmitted;

  CustomSearchForm({
    Key? key,
    this.icon = const Icon(
      Icons.email_outlined,
    ),
    this.hintText = '',
    this.controller,
    this.isShowTitle = true,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            iconColor: primaryColor,
            // suffixIcon: (isPassword)
            //     ? IconButton(
            //         onPressed: () {
            //           setState(){
            //             obscureText = !obscureText;
            //           }
            //         },
            //         icon: Icon(
            //           obscureText ? Icons.visibility : Icons.visibility_off,
            //         ),
            //         color: primaryColor,
            //       )
            //     : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}

class DescriptionFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  const DescriptionFormField(
      {this.title = '', this.hintText = '', this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          keyboardAppearance: Brightness.dark,
          minLines: 1,
          maxLines: 10,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 16,
            ),
            hintText: hintText,
            hintStyle: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryForm extends StatefulWidget {
  //final Category category;
  List<String> list = <String>['Webinar'];
  String controller = '';
  CategoryForm(
      {required this.list,
      this.controller = '',
      //required this.category,
      super.key});

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  @override
  Widget build(BuildContext context) {
    List<String> list = widget.list;
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Kategori Event',
        labelStyle: blackTextStyle.copyWith(fontSize: 16, fontWeight: light),
        hintText: 'Pilih Kategori Event',
        hintStyle: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        // This is called when the user selects an item.
        setState(() {
          value = value!;
          widget.controller = value.toString();
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class FormCalendarPicker extends StatefulWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  const FormCalendarPicker({this.controller, this.onTap, super.key});

  @override
  State<FormCalendarPicker> createState() => _FormCalendarPickerState();
}

class _FormCalendarPickerState extends State<FormCalendarPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Event',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          controller: widget.controller,
          keyboardAppearance: Brightness.dark,
          onTap: widget.onTap,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calendar_today, color: primaryColor),
            hintText: 'Enter Date',
            hintStyle: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
