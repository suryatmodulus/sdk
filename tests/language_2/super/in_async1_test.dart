// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

import "package:expect/expect.dart";

import 'dart:async';

class A {
  Future<int> foo() async => 42;
}

class B extends A {
  Future<int> foo() async {
    var x = await super.foo();
    return x + 1;
  }
}

main() async {
  Expect.equals(43, await new B().foo());
}
