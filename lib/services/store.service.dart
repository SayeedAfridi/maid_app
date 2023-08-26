import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maid/constants/store.constant.dart';
import 'package:maid/models/application_models.dart';
import 'package:maid/utils/converter.dart';

class StoreService {
  int _currentCycleValue = 1;
  int _nextCycleValue = 2;
  String _currentCycleName = 'cycle-1';
  String _nextCycleName = 'cycle-2';
  late FirebaseFirestore _db;
  late CollectionReference _attendanceRef;

  int get currentCycleValue => _currentCycleValue;
  String get currentCycleName => _currentCycleName;
  int get nextCycleValue => _nextCycleValue;
  String get nextCycleName => _nextCycleName;

  Future<void> init() async {
    _db = FirebaseFirestore.instance;
    _attendanceRef = _db.collection(CollectionPath.attendance);

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

  Cycle _getCycleFromDocSnapshot(dynamic snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    data.addEntries({'id': snapshot.id}.entries);
    return Cycle.fromJson(data);
  }

  Future<Cycle?> getCurrentCycle() async {
    DocumentSnapshot snapshot =
        await _attendanceRef.doc(currentCycleName).get();
    if (!snapshot.exists) {
      return null;
    }
    return _getCycleFromDocSnapshot(snapshot);
  }

  Future<Cycle?> getCycle(String cycleId) async {
    DocumentSnapshot snapshot = await _attendanceRef.doc(cycleId).get();
    if (!snapshot.exists) {
      return null;
    }
    return _getCycleFromDocSnapshot(snapshot);
  }

  Future<void> addAttendance(List<DateTime> dates) async {
    try {
      final data = <String, dynamic>{
        'dates': const ListTimestampConverter().toJson(dates),
      };
      return _attendanceRef.doc(currentCycleName).update(data);
    } catch (e) {
      // TODO: add error handling
    }
  }

  Future<void> makePayment() async {
    try {
      final data = <String, dynamic>{
        'isPaid': true,
        'paidAt': Timestamp.now(),
      };
      return _attendanceRef.doc(currentCycleName).update(data);
    } catch (e) {
      // TODO: add error handling
    }
  }

  Future<List<Cycle>> getCycles() async {
    List<Cycle> data = [];
    try {
      QuerySnapshot snap =
          await _attendanceRef.where('isCompleted', isEqualTo: true).get();
      for (var docSnapshot in snap.docs) {
        data.add(_getCycleFromDocSnapshot(docSnapshot));
      }
      return data;
    } catch (e) {
      return data;
    }
  }
}
