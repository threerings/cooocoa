//
// cooocoa - Copyright 2012 Three Rings Design

@interface OOOBoxedBool : NSObject <NSCopying>
+ (OOOBoxedBool*)createWith:(BOOL)val;
+ (OOOBoxedBool*)create;
- (id)initWithValue:(BOOL)val;
@property BOOL value;
@end

@interface OOOBoxedInt : NSObject <NSCopying>
+ (OOOBoxedInt*)createWith:(int)val;
+ (OOOBoxedInt*)create;
- (id)initWithValue:(int)val;
@property int value;
@end

@interface OOOBoxedLong : NSObject <NSCopying>
+ (OOOBoxedLong*)createWith:(long)val;
+ (OOOBoxedLong*)create;
- (id)initWithValue:(long)val;
@property long value;
@end

@interface OOOBoxedFloat : NSObject <NSCopying>
+ (OOOBoxedFloat*)createWith:(float)val;
+ (OOOBoxedFloat*)create;
- (id)initWithValue:(float)val;
@property float value;
@end

@interface OOOBoxedDouble : NSObject <NSCopying>
+ (OOOBoxedDouble*)createWith:(double)val;
+ (OOOBoxedDouble*)create;
- (id)initWithValue:(double)val;
@property double value;
@end

@interface OOOBoxedWeakRef : NSObject <NSCopying>
+ (OOOBoxedWeakRef*)createWith:(id)val;
+ (OOOBoxedWeakRef*)create;
- (id)initWithValue:(id)val;
@property (weak) id value;
@end
