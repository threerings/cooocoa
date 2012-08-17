//
// cooocoa - Copyright 2012 Three Rings Design

@interface OOOBoxedBool : NSObject <NSCopying>
+ (OOOBoxedBool*)boxedBoolWithValue:(BOOL)val;
+ (OOOBoxedBool*)boxedBool;;
- (id)initWithValue:(BOOL)val;
@property BOOL value;
@end

@interface OOOBoxedInt : NSObject <NSCopying>
+ (OOOBoxedInt*)boxedIntWithValue:(int)val;
+ (OOOBoxedInt*)boxedInt;
- (id)initWithValue:(int)val;
@property int value;
@end

@interface OOOBoxedLong : NSObject <NSCopying>
+ (OOOBoxedLong*)boxedLongWithValue:(long)val;
+ (OOOBoxedLong*)boxedLong;
- (id)initWithValue:(long)val;
@property long value;
@end

@interface OOOBoxedFloat : NSObject <NSCopying>
+ (OOOBoxedFloat*)boxedFloatWithValue:(float)val;
+ (OOOBoxedFloat*)boxedFloat;
- (id)initWithValue:(float)val;
@property float value;
@end

@interface OOOBoxedDouble : NSObject <NSCopying>
+ (OOOBoxedDouble*)boxedDoubleWithValue:(double)val;
+ (OOOBoxedDouble*)boxedDouble;
- (id)initWithValue:(double)val;
@property double value;
@end

@interface OOOBoxedWeakRef : NSObject <NSCopying>
+ (OOOBoxedWeakRef*)boxedWeakRefWithValue:(id)val;
+ (OOOBoxedWeakRef*)boxedWeakRef;
- (id)initWithValue:(id)val;
@property (weak) id value;
@end
