//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOBoxed.h"

@implementation OOOBoxedBool
@synthesize value;
+ (OOOBoxedBool*)withValue:(BOOL)val { return [[OOOBoxedBool alloc] initWithValue:val]; }
- (id)initWithValue:(BOOL)val { if ((self = [super init])) { value = val; } return self; }
@end

@implementation OOOBoxedInt
@synthesize value;
+ (OOOBoxedInt*)withValue:(int)val { return [[OOOBoxedInt alloc] initWithValue:val]; }
- (id)initWithValue:(int)val { if ((self = [super init])) { value = val; } return self; }
@end

@implementation OOOBoxedLong
@synthesize value;
+ (OOOBoxedLong*)withValue:(long)val { return [[OOOBoxedLong alloc] initWithValue:val]; }
- (id)initWithValue:(long)val { if ((self = [super init])) { value = val; } return self; }
@end

@implementation OOOBoxedFloat
@synthesize value;
+ (OOOBoxedFloat*)withValue:(float)val { return [[OOOBoxedFloat alloc] initWithValue:val]; }
- (id)initWithValue:(float)val { if ((self = [super init])) { value = val; } return self; }
@end

@implementation OOOBoxedDouble
@synthesize value;
+ (OOOBoxedDouble*)withValue:(double)val { return [[OOOBoxedDouble alloc] initWithValue:val]; }
- (id)initWithValue:(double)val { if ((self = [super init])) { value = val; } return self; }
@end
