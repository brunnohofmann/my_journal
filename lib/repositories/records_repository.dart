import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_journal/model/record.dart';
import 'package:my_journal/services/firestore.dart';

const RECORDS_PATH = "records";

Future<Record> getRecord(String id) async{
  DocumentSnapshot snapshot = await getDocument(RECORDS_PATH, id);
  Record record = Record.fromDocumentSnapshot(snapshot);
  return record;
}

Future<void> removeRecord(Record record) async{
  await removeDocument(RECORDS_PATH, record.id);
}

Future<void> addRecord(Record record) async{
  await addDocument(RECORDS_PATH, {'text': record.text, 'title': record.title, 'date': record.date });
}

Future<void> updateRecord(Record record) async{
  await updateDocument(RECORDS_PATH, record.id, {'text': record.text, 'title': record.title, 'date': record.date});
}

Stream<QuerySnapshot> streamRecords({limit, search}) {
  return getStreamCollection(RECORDS_PATH, orderBy: 'date', descending: true, limit: limit);
}