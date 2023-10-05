import '../../../common/entities/entities.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;
  const HomePageDots(this.index) : super();
}

class HomePageCourseItem extends HomePageEvent {
  const HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}
