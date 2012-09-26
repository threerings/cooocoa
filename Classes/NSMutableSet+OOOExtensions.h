//
// cooocoa - Copyright 2012 Three Rings Design

@interface NSMutableSet (OOOExtensions)

/// Returns YES if the object was added, NO if it was already contained in the set.
- (BOOL)addObjectAndReport:(id)object;

/// Returns YES if the object was removed, NO if it was not contained in the set.
- (BOOL)removeObjectAndReport:(id)object;

@end
