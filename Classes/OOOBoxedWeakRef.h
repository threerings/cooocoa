//
// cooocoa - Copyright 2012 Three Rings Design

@interface OOOBoxedWeakRef : NSObject <NSCopying>

@property (weak) id value;

+ (OOOBoxedWeakRef*)boxedWeakRefWithValue:(id)val;
+ (OOOBoxedWeakRef*)boxedWeakRef;

- (id)initWithValue:(id)val;

@end
