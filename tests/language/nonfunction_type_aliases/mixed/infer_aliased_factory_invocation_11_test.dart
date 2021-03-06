// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart = 2.9
// Requirements=nnbd-weak


import 'infer_aliased_factory_invocation_11_lib.dart';

Type typeOf<X>() => X;

void main() {
  T<int> x1 = T(typeOf<List<int>>());
  C<Iterable<num>> x2 = T(typeOf<List<int>>());
}
