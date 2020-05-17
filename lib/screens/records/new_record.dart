import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_journal/components/buttons/primary_button.dart';
import 'package:my_journal/components/circular_button.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/records/form_text.dart';
import 'package:my_journal/contants/records/form_title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/images.dart';
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
  File _cover;

  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ScrollController _controller;
  DateTime _tDate = DateTime.now();

  bool _isLoading = false;
  bool _isStackedOnLeadingBackground = false;
  bool _ignoreCover = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _isStackedOnLeadingBackground =
            _controller.offset >= 100 ? true : false;
      });
    });
    super.initState();
  }

  _submitRecord(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        Record newRecord = Record(
          text: _textController.text,
          title: _titleController.text,
        );
        newRecord.date = _tDate;
        if (_cover != null) {
          newRecord.cover = _cover;
        }
        if(_images.length > 0){
          newRecord.images = _images;
        }

        await addRecord(newRecord);

        setState(() {
          _isLoading = false;
        });
        showToast(text: 'A new entry was created');
        goHome(context);
      }catch(e){
        showToast(text: "Help! We're in trouble! Hide and come back later, please: O");
        setState(() {
          _isLoading = false;
        });
      }
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
                    )),
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

  Future _setRecordCover() async {
    var cover = await getImageFromGallery();
    setState(() {
      _ignoreCover=false;
      _cover = cover;
    });
  }

  Color appBarBackground(){
    if(_ignoreCover || _isStackedOnLeadingBackground){
      return secondaryColor;
    }

    return Colors.white;
  }

  Widget _screenHeader() {
    return SliverAppBar(
        backgroundColor: appBarBackground(),
        expandedHeight: _ignoreCover ? 0 : 300,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.all(11),
              child: CircularButton(
                onPressed: _setRecordCover,
                icon: Icons.image,
              )),
          Container(
              padding: EdgeInsets.all(11),
              child: CircularButton(
                onPressed: () {
                  setState(() {
                    if (_cover == null) {
                      _ignoreCover = true;
                    }
                    _cover = null;
                  });
                },
                icon: Icons.restore_from_trash,
              )),
        ],
        leading: Container(
          padding: EdgeInsets.all(11),
          child: CircularButton(
            onPressed: () => pop(context),
            icon: Icons.keyboard_backspace,
          ),
        ),
        bottom: PreferredSize(
          // Add this code
          preferredSize: Size.fromHeight(60.0), // Add this code
          child: Text(''), // Add this code
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
          background: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: primaryColor),
            child: _cover == null
                ? GestureDetector(
                    onTap: _setRecordCover,
                    child: Container(
                      padding: EdgeInsets.all(70),
                      child: Image.asset(
                        'assets/imgs/interface.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : Image.file(
                    _cover,
                    fit: BoxFit.cover,
                  ),
          ),
        ));
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
