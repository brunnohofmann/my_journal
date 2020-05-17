import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_journal/model/record.dart';
import 'package:my_journal/services/firestore.dart';
import 'package:my_journal/services/storage.dart';

const RECORDS_PATH = "records";

Future<Record> getRecord(String id) async {
  DocumentSnapshot snapshot = await getDocument(RECORDS_PATH, id);
  Record record = Record.fromDocumentSnapshot(snapshot);
  return record;
}

Future<void> removeRecord(Record record) async {
  await removeDocument(RECORDS_PATH, record.id);
}

Future<void> addRecord(Record record) async {
  String cover = null;
  var images = [];

  if (record.cover != null) {
    cover = await uploadFile(record.cover);
  }

  if (record.images != null && record.images.length > 0) {
    await Future.forEach(record.images, (img) async {
      var newImage = await uploadFile(img);
      images.add(newImage);
    });
  }

  await addDocument(RECORDS_PATH, {
    'text': record.text,
    'title': record.title,
    'date': record.date,
    'cover': cover,
    'images': images
  });
}

Future<void> updateRecord(Record record) async {
  await updateDocument(RECORDS_PATH, record.id,
      {'text': record.text, 'title': record.title, 'date': record.date});
}

Stream<QuerySnapshot> streamRecords({limit, search}) {
  return getStreamCollection(RECORDS_PATH,
      orderBy: 'date', descending: true, limit: limit);
}

Future<QuerySnapshot> getCoverRecordsService({limit, search}) async {
  return await Firestore.instance.collection(RECORDS_PATH).where('cover', isGreaterThan: '').limit(5).getDocuments();
}


