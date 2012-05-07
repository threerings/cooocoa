//
// cooocoa - Copyright 2012 Three Rings Design

/// Utility functions for collections

@interface OOOCollections : NSObject

+ (NSMutableArray*)filter:(id<NSFastEnumeration>)collection pred:(BOOL (^)(id object))pred;
+ (NSMutableArray*)map:(id<NSFastEnumeration>)collection transformer:(id (^)(id object))transformer;
+ (id)findObject:(id<NSFastEnumeration>)collection pred:(BOOL (^)(id object))pred;

@end
