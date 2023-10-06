import '../../../../common/entities/entities.dart';

class CourseDetailStates {
  const CourseDetailStates({
    this.courseItem,
    this.lessonItem = const <LessonItem>[],
    this.checkBuy = false,
  });

  final CourseItem? courseItem;
  final List<LessonItem> lessonItem;
  final bool? checkBuy;

  CourseDetailStates copyWith({
    CourseItem? courseItem,
    List<LessonItem>? lessonItem,
    bool? checkBuy,
  }) {
    return CourseDetailStates(
      courseItem: courseItem ?? this.courseItem,
      lessonItem: lessonItem ?? this.lessonItem,
      checkBuy: checkBuy ?? this.checkBuy,
    );
  }
}
