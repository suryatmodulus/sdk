// Copyright (c) 2021, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/services/correction/fix.dart';
import 'package:analysis_server/src/services/linter/lint_names.dart';
import 'package:analyzer_plugin/utilities/fixes/fixes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'fix_processor.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(ConvertForEachToForLoopTest);
  });
}

@reflectiveTest
class ConvertForEachToForLoopTest extends FixProcessorLintTest {
  @override
  FixKind get kind => DartFixKind.CONVERT_FOR_EACH_TO_FOR_LOOP;

  @override
  String get lintCode => LintNames.avoid_function_literals_in_foreach_calls;

  Future<void> test_blockBody() async {
    await resolveTestCode('''
void f(List<String> list) {
  list.forEach((e) {
    e.length / 2;
  });
}
''');
    await assertHasFix('''
void f(List<String> list) {
  for (var e in list) {
    e.length / 2;
  }
}
''');
  }

  Future<void> test_expressionBody() async {
    await resolveTestCode('''
void f(List<String> list) {
  list.forEach((e) => e.substring(3, 7));
}
''');
    await assertHasFix('''
void f(List<String> list) {
  for (var e in list) {
    e.substring(3, 7);
  }
}
''');
  }
}
