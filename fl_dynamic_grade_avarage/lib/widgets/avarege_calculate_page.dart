import 'package:flutter/material.dart';
import '../helper/data_helper.dart';
import '/constants/app_constant.dart';
import './show_avarage.dart';
import '/model/lesson.dart';

class AverageCalculatePage extends StatefulWidget {
  const AverageCalculatePage({super.key});

  @override
  State<AverageCalculatePage> createState() => _AverageCalculatePageState();
}

class _AverageCalculatePageState extends State<AverageCalculatePage> {
  var formKey = GlobalKey<FormState>();
  double selectedValue = 4.0;
  double selectedCredit = 1.0;
  String selectedLessonName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Constants.headerText,
          style: Constants.headerTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: _buildForm(),
                ),
              ),
              Expanded(
                child: Container(
                    child: ShowAverage(
                        average: DataHelper.calculateAverage(),
                        lessonCount: DataHelper.getLessonCount())),
              ),
            ],
          ),
          Expanded(
              child: (DataHelper.getLessonCount() > 0)
                  ? myList()
                  : myTextForList()),
        ],
      ),
    );
  }

  myTextForList() {
    return (Center(
      child: Text(
        'Please add a lesson',
        style: Constants.bodyTextStyle,
      ),
    ));
  }

  Container myList() {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var lesson = DataHelper.getLesson(index);
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                DataHelper.lessons.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(lesson.lessonName),
              subtitle: Text(lesson.letterGrade.toString()),
              trailing: Text(lesson.credit.toString()),
            ),
          );
        },
        itemCount: DataHelper.getLessonCount(),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            children: [
              Expanded(
                child: _buildLetterGrade(),
              ),
              Expanded(
                child: _buildCredit(),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var newLesson = Lesson(
                          lessonName: selectedLessonName,
                          letterGrade: selectedValue,
                          credit: selectedCredit);
                      DataHelper.addLesson(newLesson);
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        onSaved: (value) {
          setState(() {
            selectedLessonName = value!;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: Constants.borderRadius,
          ),
          labelText: 'Lesson',
          filled: true,
          fillColor: Constants.mainColor.shade300.withOpacity(0.5),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your lesson name';
          }
          return null;
        },
      ),
    );
  }

  _buildLetterGrade() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Constants.mainColor),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        underline: Container(),
        items: DataHelper.getLetterGradeItems(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
          });
        },
      ),
    );
  }

  _buildCredit() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Constants.mainColor),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        underline: Container(),
        value: selectedCredit,
        items: DataHelper.getCreditItems(),
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
          });
        },
      ),
    );
  }
}
