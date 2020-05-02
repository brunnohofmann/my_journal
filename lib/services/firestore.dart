import 'package:cloud_firestore/cloud_firestore.dart';

Future addDocument(String collection, object) async {
  return await Firestore.instance
      .collection(collection)
      .document()
      .setData(object);
}

Future updateDocument(String collection, String id, object) async {
  return await Firestore.instance
      .collection(collection)
      .document(id)
      .updateData(object);
}

Future getDocument(String collectionPath, id) async {
  return await Firestore.instance.collection(collectionPath).document(id).get();
}

Stream<QuerySnapshot> getStreamCollection(String collectionPath,
    {startAfter, limit, orderBy, descending}) {
  dynamic query;
  query = Firestore.instance.collection(collectionPath);

  if (orderBy != null) query = query.orderBy(orderBy, descending: descending);
  if (startAfter != null) query = query.startAfter(startAfter);
  if (limit != null) query = query.limit(limit);

  return query.snapshots();
}

Future removeDocument(String collectionPath, id) async {
  return await Firestore.instance
      .collection(collectionPath)
      .document(id)
      .delete();
}

DocumentReference getDocumentReference(String path, String id) {
  return Firestore.instance.collection(path).document(id);
}