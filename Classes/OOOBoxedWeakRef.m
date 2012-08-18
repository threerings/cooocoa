//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOBoxedWeakRef.h"

@interface OOOBoxedWeakRef () {
    __weak id _value;
}

@end

@implementation OOOBoxedWeakRef

@synthesize value = _value;

+ (OOOBoxedWeakRef*)boxedWeakRefWithValue:(id)val {
    return [[OOOBoxedWeakRef alloc] initWithValue:val];
}

+ (OOOBoxedWeakRef*)boxedWeakRef {
    return [[OOOBoxedWeakRef alloc] initWithValue:nil];
}

- (id)initWithValue:(id)val {
    if ((self = [super init])) {
        _value = val;
    }
    return self;
}

- (id)copyWithZone:(NSZone*)zone {
    return [[OOOBoxedWeakRef allocWithZone:zone] initWithValue:_value];
}

- (NSUInteger)hash {
    return (NSUInteger)_value;
}

- (BOOL)isEqual:(id)other {
    if (other == self) {
        return YES;
    } else if (other == nil || ![other isKindOfClass:[self class]]) {
        return NO;
    } else {
        return ((OOOBoxedWeakRef*)other)->_value == _value;
    }
}

@end