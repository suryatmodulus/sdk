// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart=2.9
void test(List<String> args) {
  args.foo('1', 2);
}

extension on List<String> {
  void foo(String bar) {
    print(1);
  }

  void foo(String baz, int a) {
    print(2);
  }
}

main() {}
