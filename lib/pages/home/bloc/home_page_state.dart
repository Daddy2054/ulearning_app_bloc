import '../../../common/entities/course.dart';

class HomePageState {
  const HomePageState({
    this.courseItem = const <CourseItem>[],
    this.index = 0,
  });

  final int index;
  final List<CourseItem> courseItem;

  HomePageState copyWith({
    int? index,
    List<CourseItem>? courseItem,
  }) {
    return HomePageState(
      courseItem: courseItem ?? this.courseItem,
      index: index ?? this.index,
    );
  }
}
