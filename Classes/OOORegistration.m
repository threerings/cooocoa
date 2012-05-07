//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOORegistration.h"

typedef void (^OOOCancelBlock)();

@interface OOOCanceler : NSObject <OOORegistration> {
@protected
    OOOCancelBlock _block;
}
- (id)initWithBlock:(OOOCancelBlock)block;
@end

@implementation OOOCanceler
- (id)initWithBlock:(OOOCancelBlock)block {
    if ((self = [super init])) {
        _block = [block copy];
    }
    return self;
}

- (void)cancel {
    if (_block != nil) {
        // ensure that the block can't be called twice
        OOOCancelBlock block = _block;
        _block = nil;
        block();
    }
}
@end

@implementation OOORegistrationFactory
+ (id<OOORegistration>)withBlock:(OOOCancelBlock)cancelBlock {
    return [[OOOCanceler alloc] initWithBlock:cancelBlock];
}
@end