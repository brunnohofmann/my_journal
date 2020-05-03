import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_journal/components/button.dart';
import 'package:my_journal/components/circular_button.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/records/form_text.dart';
import 'package:my_journal/contants/records/form_title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/navigation.dart';
import 'package:my_journal/helpers/snackbar.dart';
import 'package:my_journal/model/record.dart';
import 'package:my_journal/repositories/records_repository.dart';
import 'package:my_journal/screens/records/containers/date_field.dart';
import 'package:my_journal/screens/records/containers/images_of_the_day.dart';

class NewRecordScreen extends StatefulWidget {
  @override
  _NewRecordScreenState createState() => _NewRecordScreenState();
}

class _NewRecordScreenState extends State<NewRecordScreen> {
  List<File> _images = new List<File>();

  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ScrollController _controller;

  DateTime _tDate = DateTime.now();
  bool _isLoading = false;
  bool _isStacked = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _isStacked = _controller.offset >= 190 ? true : false;
      });
    });
    super.initState();
  }

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
      showToast(text: 'A new entry was created');
      goHome(context);
    }
  }

  onChooseDate(DateTime date) {
    setState(() {
      _tDate = date;
    });
  }

  Future onGetImageOfTheDay(File image) async {
    _images.add(image);
    setState(() {
      _images = _images;
    });
  }

  Widget _newRecordForm() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 50,
                      height: 5,
                      child: Container(
                        color: secondaryColor,
                      ),
                    )
                ),
              ),
            ],
          ),
          CustomTitle(
            title: "Today's Story",
            weight: FontWeight.bold,
          ),
          FormText(
            controller: _textController,
            isRequired: true,
          ),
          ImagesOfTheDay(
            images: _images,
            onGetImage: onGetImageOfTheDay,
          ),
        ],
      ),
    );
  }

  Widget _screenHeader() {
    return SliverAppBar(
        stretch: true,
        backgroundColor: _isStacked ? secondaryColor : Colors.white,
        expandedHeight: 300,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.all(11),
          child: CircularButton(onPressed: () => pop(context), icon: Icons.keyboard_backspace,),
        ),
        bottom: PreferredSize(                       // Add this code
          preferredSize: Size.fromHeight(60.0),      // Add this code
          child: Text(''),                           // Add this code
        ),
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
            centerTitle: false,
            titlePadding: EdgeInsets.only(left: 20),
            title: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.only(left: _isStacked ? 30 : 0),
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: FormTitle(
                    controller: _titleController,
                    isRequired: true,
                  ),
                ),
                DateField(
                  onChooseDate: onChooseDate,
                  date: _tDate,
                ),
              ]),
            ),
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              child: Image.network(
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                fit: BoxFit.cover,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: CustomScrollView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          slivers: [
            _screenHeader(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _newRecordForm(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
              padding: EdgeInsets.only(top: 24, left: 20, right: 20),
              child: CustomButton(
                text: 'Save',
                onPressed: () => _submitRecord(context),
                isLoading: _isLoading,
              )),
        ),
      ),
    );
  }
}
