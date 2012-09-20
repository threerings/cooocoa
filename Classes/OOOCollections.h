//
// cooocoa - Copyright 2012 Three Rings Design

/// Utility functions for collections

@interface OOOCollections : NSObject

/// Returns an array containing all objects in the collection
/// (nil objects will be converted to NSNull)
+ (NSMutableArray*)allObjects:(id<NSFastEnumeration>)collection;

/// Returns an array containing all objects in the collection for which 'pred' returns YES
/// (nil objects will be converted to NSNull)
+ (NSMutableArray*)filter:(id<NSFastEnumeration>)collection pred:(BOOL(^)(id object))pred;

/// Returns an array containing the given transform applied to each object in the collection
/// (nil objects will be converted to NSNull)
+ (NSMutableArray*)map:(id<NSFastEnumeration>)collection transformer:(id(^)(id object))transformer;

/// Returns the first object in the collection for which 'pred' returns YES,
/// or nil if no such object exists.
+ (id)findObject:(id<NSFastEnumeration>)collection pred:(BOOL(^)(id object))pred;

/// Returns the smallest of the objects in the collection, according to the ordering produced by
/// 'comp' (does not sort the collection)
+ (id)findMin:(id<NSFastEnumeration>)collection withComparator:(NSComparator)comp;

/// Returns the smallest of the objects in the collection, according to the ordering produced by
/// 'comp' (does not sort the collection)
+ (id)findMax:(id<NSFastEnumeration>)collection withComparator:(NSComparator)comp;

@end
