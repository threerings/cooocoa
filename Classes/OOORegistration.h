//
// cooocoa - Copyright 2012 Three Rings Design

/// Represents something that can be canceled
@protocol OOORegistration
- (void)cancel;
@end

@interface OOORegistrationFactory
/// Creates a BTRegistration object that calls the given block when canceled.
/// The block is guaranteed to only be called once, even if cancel() is called
/// multiple times.
+ (id<OOORegistration>)withBlock:(void(^)())cancelBlock;
@end
