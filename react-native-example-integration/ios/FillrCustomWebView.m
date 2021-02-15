/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "FillrCustomWebView.h"

@implementation FillrCustomWebView

- (void)setUrl:(NSString *)url {
  [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
