//
// cooocoa - Copyright 2012 Three Rings Design

#import "cooocoaTests.h"
#import "OOOKey.h"

@implementation cooocoaTests

- (void)setUp {
    [super setUp];
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    [super tearDown];
}

- (void)testKeys {
    OOOKey* foo = OOO_KEY(Key1);
    OOOKey* bar = OOO_KEY(Key1);
    OOOKey* baz = [OOOKey keyWithString:@"Key1"];
    STAssertEqualObjects(foo, bar, @"Key equality");
    STAssertEqualObjects(foo, baz, @"Key equality");

    STAssertFalse(foo == OOO_KEY(Key2), @"Key inequality");

    STAssertThrows([[OOOKey alloc] init], @"Keys can't be constructed manually");
}

@end
