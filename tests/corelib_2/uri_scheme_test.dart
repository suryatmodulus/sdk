// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

import "package:expect/expect.dart";

void testInvalidArguments() {
  Expect.throwsFormatException(() => new Uri(scheme: "_"));
  Expect.throwsFormatException(() => new Uri(scheme: "http_s"));
  Expect.throwsFormatException(() => new Uri(scheme: "127.0.0.1:80"));
}

void testScheme() {
  test(String expectedScheme, String expectedUri, String scheme) {
    var uri = new Uri(scheme: scheme);
    Expect.equals(expectedScheme, uri.scheme);
    Expect.equals(expectedUri, uri.toString());
    uri = Uri.parse("$scheme:");
    Expect.equals(expectedScheme, uri.scheme);
    Expect.equals(expectedUri, uri.toString());
  }

  test("http", "http:", "http");
  test("http", "http:", "HTTP");
  test("http", "http:", "hTTP");
  test("http", "http:", "Http");
  test("http+ssl", "http+ssl:", "HTTP+ssl");
  test("urn", "urn:", "urn");
  test("urn", "urn:", "UrN");
  test("a123.432", "a123.432:", "a123.432");
}

main() {
  testInvalidArguments();
  testScheme();
}
