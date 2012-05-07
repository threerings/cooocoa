//
// Betwixt - Copyright 2012 Three Rings Design

@class OOORandoms;

@interface OOOIntRange : NSObject

@property(nonatomic,strong) OOORandoms* rands;
@property(nonatomic,assign) int min;
@property(nonatomic,assign) int max;

- (id)initWithMin:(int)min max:(int)max rands:(OOORandoms*)rands;

/// Returns an int between [min, max]
- (int)next;

@end
