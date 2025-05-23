// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import camera_avfoundation

// Import Objectice-C part of the implementation when SwiftPM is used.
#if canImport(camera_avfoundation_objc)
  import camera_avfoundation_objc
#endif

/// A mock implementation of `FLTWritableData` that allows injecting a custom implementation
/// for writing to a file.
final class MockWritableData: NSObject, FLTWritableData {
  var writeToFileStub: ((String, NSData.WritingOptions) throws -> Void)?

  func write(toFile path: String, options writeOptionsMask: NSData.WritingOptions) throws {
    if let stub = self.writeToFileStub {
      try stub(path, writeOptionsMask)
    }
  }
}
