import 'package:get/get.dart';
import '../db/db_helper.dart';
import '../model/task.dart';

class ReminderController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var reminderList = <Reminder>[].obs;

  Future<int> addReminder(Reminder? reminder) {
    return DBHelper.insert(reminder!);
  }

  void getReminders() async {
    List<Map<String, dynamic>> reminders = await DBHelper.query();
    reminderList
        .assignAll(reminders.map((data) => Reminder.fromJson(data)).toList());
  }

  void delete(Reminder reminder) {
    DBHelper.delete(reminder);
    getReminders();
  }

  void markReminderCompleted(int id) async {
    await DBHelper.update(id);
    getReminders();
  }
}
