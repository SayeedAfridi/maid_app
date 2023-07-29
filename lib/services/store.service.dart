import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maid/constants/store.constant.dart';
import 'package:maid/models/application_models.dart';

class StoreService {
  late int _currentCycleValue;
  late int _nextCycleValue;
  late String _currentCycleName;
  late String _nextCycleName;
  late FirebaseFirestore _db;
  late CollectionReference _attendanceRef;

  int get currentCycleValue => _currentCycleValue;
  String get currentCycleName => _currentCycleName;
  int get nextCycleValue => _nextCycleValue;
  String get nextCycleName => _nextCycleName;

  StoreService() {
    _db = FirebaseFirestore.instance;
    _attendanceRef = _db.collection(CollectionPath.attendance);
  }

  Future<void> init() async {
    final DocumentSnapshot snapshot =
        await _attendanceRef.doc(DocPath.currentCycle).get();
    if (!snapshot.exists) return;
    final snapData = snapshot.data() as Map<String, dynamic>;
    final data = CurrentCycle.fromJson(snapData);
    _currentCycleValue = data.currentValue;
    _currentCycleName = data.currentCycleName;
    _nextCycleValue = data.nextValue;
    _nextCycleName = data.nextCycleName;
  }

  Future<void> getData() async {
    DocumentSnapshot snapshot =
        await _attendanceRef.doc(DocPath.currentCycle).get();
    if (!snapshot.exists) {
      print('span not exists');
      return null;
    }
    final data = snapshot.data() as Map<String, dynamic>;
    print(CurrentCycle.fromJson(data));
  }
}
