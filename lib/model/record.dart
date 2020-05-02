import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  String id;
  String text;
  String title;
  dynamic _date;

  Record({this.id, this.text, this.title});

  factory Record.fromDocumentSnapshot(DocumentSnapshot snapshot) => _recordFromJson(snapshot);

  DateTime get date {
    if (_date.runtimeType == Timestamp) return _date.toDate();
    return _date;
  }

  set date(date) {
    this._date = date;
  }
}

Record _recordFromJson(DocumentSnapshot document) {
  Record record = Record(
    id: document.documentID,
    title: document['title'],
    text: document['text'],
  );
  record.date = document['date'].toDate();

  return record;
}