
import '../../../../common/entities/entities.dart';

abstract class CourseDetailEvents{
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents{
  const TriggerCourseDetail(this.courseItem):super();
  final CourseItem courseItem;
}

class TriggerLessonList extends CourseDetailEvents{
  const TriggerLessonList(this.lessonItem):super();
  final List<LessonItem> lessonItem;
}

class TriggerCheckBuy extends CourseDetailEvents{
  const TriggerCheckBuy(this.checkBuy):super();
  final bool checkBuy;
}




