//
// Betwixt - Copyright 2012 Three Rings Design

@class OOORandoms;

@interface OOOFloatRange : NSObject

@property(nonatomic,strong) OOORandoms* rands;
@property(nonatomic,assign) float min;
@property(nonatomic,assign) float max;

- (id)initWithMin:(float)min max:(float)max rands:(OOORandoms*)rands;

/// Returns a float between [min, max)
- (float)next;

@end
