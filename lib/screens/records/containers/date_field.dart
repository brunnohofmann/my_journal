import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final DateTime date;
  final Function onChooseDate;
  final List<String> formats;

  const DateField(
      {Key key,
      this.date,
      this.onChooseDate,
      this.formats: const [MM, ", ", dd, " - ", D]})
      : super(key: key);

  _getDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1999, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      onChooseDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      child: Text(
        formatDate(
          date,
          formats
        ),
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
      ),
      onPressed: () => _getDate(context),
    );
  }
}
