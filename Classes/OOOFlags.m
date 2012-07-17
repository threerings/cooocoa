//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOFlags.h"

uint32_t OOOSetFlag (uint32_t bits, int flag) {
    NSCAssert(flag >= 0 && flag < 32, @"Flag out of range");
    return (bits | (1 << flag));
}

uint32_t OOOClearFlag (uint32_t bits, int flag) {
    NSCAssert(flag >= 0 && flag < 32, @"Flag out of range");
    return (bits & ~(1 << flag));
}

BOOL OOOIsFlagSet (uint32_t bits, int flag) {
    NSCAssert(flag >= 0 && flag < 32, @"Flag out of range");
    return (bits & (1 << flag)) != 0;
}

@implementation OOOFlags

@synthesize bits = _bits;

- (void)setFlag:(int)flag { _bits = OOOSetFlag(_bits, flag); }
- (void)clearFlag:(int)flag { _bits = OOOClearFlag(_bits, flag); }
- (BOOL)isSet:(int)flag { return OOOIsFlagSet(_bits, flag); }

@end
