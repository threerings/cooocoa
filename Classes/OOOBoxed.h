//
// cooocoa - Copyright 2012 Three Rings Design

@interface OOOBoxedBool : NSObject
+ (OOOBoxedBool*)withValue:(BOOL)val;
- (id)initWithValue:(BOOL)val;
@property BOOL value;
@end

@interface OOOBoxedInt : NSObject
+ (OOOBoxedInt*)withValue:(int)val;
- (id)initWithValue:(int)val;
@property int value;
@end

@interface OOOBoxedLong : NSObject
+ (OOOBoxedLong*)withValue:(long)val;
- (id)initWithValue:(long)val;
@property long value;
@end

@interface OOOBoxedFloat : NSObject
+ (OOOBoxedFloat*)withValue:(float)val;
- (id)initWithValue:(float)val;
@property float value;
@end

@interface OOOBoxedDouble : NSObject
+ (OOOBoxedDouble*)withValue:(double)val;
- (id)initWithValue:(double)val;
@property double value;
@end
