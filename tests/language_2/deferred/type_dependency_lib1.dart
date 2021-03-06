// Copyright (c) 2015, the Dart Team. All rights reserved. Use of this
// source code is governed by a BSD-style license that can be found in
// the LICENSE file.

// @dart = 2.9

library lib1;

import "type_dependency_lib3.dart";

bool fooIs(x) {
  return x is A;
}

bool fooAs(x) {
  try {
    return (x as A).p;
  } on TypeError {
    return false;
  }
}

bool fooAnnotation(x) {
  try {
    A y = x;
    return y is! String;
  } on TypeError {
    return false;
  }
}
