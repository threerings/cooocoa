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

- (id)initWithBits:(uint32_t)bits {
    if ((self = [super init])) {
        _bits = bits;
    }
    return self;
}

- (id)init {
    return [self initWithBits:0];
}

- (BOOL)isSet:(int)flag { 
    return OOOIsFlagSet(_bits, flag); 
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return YES;
    } else if (![object isKindOfClass:[self class]]) {
        return NO;
    } else {
        OOOFlags* o = (OOOFlags*)object;
        return (_bits == o->_bits);
    }
}

- (NSUInteger)hash {
    return _bits;
}

- (id)copyWithZone:(NSZone*)zone {
    return [[[self class] allocWithZone:zone] initWithBits:_bits];
}

@end

@implementation OOOMutableFlags

@dynamic bits;

- (void)setBits:(uint32_t)bits { _bits = bits; }

- (void)setFlag:(int)flag { _bits = OOOSetFlag(_bits, flag); }
- (void)clearFlag:(int)flag { _bits = OOOClearFlag(_bits, flag); }


@end
