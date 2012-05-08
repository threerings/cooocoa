//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOBoxed.h"

#define OOO_DEFINE_BOXED(clazz, type) \
    @implementation clazz  \
    @synthesize value;  \
    + (clazz*)createWith:(type)val { return [[clazz alloc] initWithValue:val]; } \
    + (clazz*)create { return [[clazz alloc] initWithValue:0]; } \
    - (id)initWithValue:(type)val { if ((self = [super init])) { value = val; } return self; } \
    - (id)copyWithZone:(NSZone*)zone { return [[clazz allocWithZone:zone] initWithValue:value]; } \
    - (NSUInteger)hash { return (NSUInteger)value; } \
    - (BOOL)isEqual:(id)other { \
        if (other == self) return YES;  \
        else if (other == nil || ![other isKindOfClass:[self class]]) return NO; \
        else return ((clazz*)other).value == value; \
    } \
    @end

OOO_DEFINE_BOXED(OOOBoxedBool, BOOL);
OOO_DEFINE_BOXED(OOOBoxedInt, int);
OOO_DEFINE_BOXED(OOOBoxedLong, long);
OOO_DEFINE_BOXED(OOOBoxedFloat, float);
OOO_DEFINE_BOXED(OOOBoxedDouble, double);
