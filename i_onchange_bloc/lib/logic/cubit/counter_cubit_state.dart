// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit_cubit.dart';

//using dart data class generator we can create these JSON serializable codes
// these automatically convert JSON to Map & map to json.
// the work we used to do manually, when recieved data from API , we used to decode json and then
// put data in local map and put it in an object to show that data.
//  like : UserDetails(name : map['name']) => and show it in UI.

class CounterCubitState {
  int counterValue;
  bool? isIncremented;

  CounterCubitState({required this.counterValue, this.isIncremented});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'isIncremented': isIncremented,
    };
  }

  factory CounterCubitState.fromMap(Map<String, dynamic> map) {
    return CounterCubitState(
      counterValue: map['counterValue'] as int,
      isIncremented:
          map['isIncremented'] != null ? map['isIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterCubitState.fromJson(String source) =>
      CounterCubitState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CounterCubitState(counterValue: $counterValue, isIncremented: $isIncremented)';
}
