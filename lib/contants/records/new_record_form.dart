import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_journal/components/button.dart';
import 'package:my_journal/components/rounded_image.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/records/form_text.dart';
import 'package:my_journal/contants/records/form_title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/navigation.dart';
import 'package:my_journal/model/record.dart';
import 'package:my_journal/repositories/records_repository.dart';

class NewRecordForm extends StatefulWidget {
  @override
  _NewRecordFormState createState() => _NewRecordFormState();
}

class _NewRecordFormState extends State<NewRecordForm> {
  List<File> _images = new List<File>();

  final _titleController = TextEditingController();

  final _textController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime _tDate = DateTime.now();

  bool _isLoading = false;

  _submitRecord(BuildContext context) async {
    Record newRecord = Record(
      text: _textController.text,
      title: _titleController.text,
    );
    newRecord.date = _tDate;

    print(_textController.text);

    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      await addRecord(newRecord);

      setState(() {
        _isLoading = false;
      });
      goHome(context);
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _images.add(image);

    print(image.absolute);

    setState(() {
      _images = _images;
    });
  }

  Widget _addImages() {
    return Container(
        padding: EdgeInsets.only(top: 24),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomTitle(
                    title: 'Images of the Day', weight: FontWeight.bold),
                IconButton(
                  color: secondaryColor,
                  icon: Icon(Icons.add),
                  onPressed: getImage,
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: _images.length > 0 ? 400 : 0,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              for (var item in _images)
                RoundedImage(
                  imageURL: item,
                ),
            ]),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: FormTitle(
              controller: _titleController,
              isRequired: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: FormText(
              controller: _textController,
              isRequired: true,
            ),
          ),
          _addImages(),
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 24, left: 20, right: 20),
              child: CustomButton(
                text: 'Save',
                onPressed: () => _submitRecord(context),
                isLoading: _isLoading,
              ))
        ],
      ),
    );
  }
}
