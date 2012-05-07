//
// cooocoa - Copyright 2012 Three Rings Design

@class OOORandoms;

@interface OOOWeightedArray : NSObject {
    OOORandoms* _rands;
    NSMutableArray* _objects;
    BOOL _dirty;
}

@property (readonly) int count;

- (id)initWithRands:(OOORandoms*)rands;
- (void)addObject:(id)object withWeight:(float)weight;
- (id)nextObject;
- (NSArray*)allObjects;

@end
