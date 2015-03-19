//
//  NSMutableArray+Delegate.m
//
//  Created by IVAN CHIRKOV on 26.01.15.
//  Copyright (c) 2015 IVAN CHIRKOV. All rights reserved.
//

#import "NSMutableArray+Delegate.h"

static const void *kDelegateKey = &kDelegateKey;

static void LSDSwizzleMethod(Class c, SEL original, SEL alternate) {
	Method origMethod = class_getInstanceMethod(c, original);
	Method newMethod = class_getInstanceMethod(c, alternate);
	
	if(class_addMethod(c, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
		class_replaceMethod(c, alternate, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
	} else {
		method_exchangeImplementations(origMethod, newMethod);
	}
}

@implementation NSMutableArray (Delegate)

- (void)lsd_setup
{
	Class arrayClass = [self class];
    
    LSDSwizzleMethod(arrayClass, @selector(addObject:), @selector(lsd_addObject:));
    LSDSwizzleMethod(arrayClass, @selector(addObjectsFromArray:), @selector(lsd_addObjectsFromArray:));
    LSDSwizzleMethod(arrayClass, @selector(insertObject:atIndex:), @selector(lsd_insertObject:atIndex:));
    LSDSwizzleMethod(arrayClass, @selector(insertObjects:atIndexes:), @selector(lsd_insertObjects:atIndexes:));
    
    LSDSwizzleMethod(arrayClass, @selector(removeAllObjects), @selector(lsd_removeAllObjects));
    LSDSwizzleMethod(arrayClass, @selector(removeObject:), @selector(lsd_removeObject:));
    LSDSwizzleMethod(arrayClass, @selector(removeObjectAtIndex:), @selector(lsd_removeObjectAtIndex:));
}

#pragma mark - Swizzle methods

- (void)lsd_addObject : (id)object
{
	if ([self.delegate respondsToSelector:@selector(mutableArray:willAddObject:)]) {
		[self.delegate mutableArray:self willAddObject:object];
	}
	
	[self lsd_addObject:object];
	
	if ([self.delegate respondsToSelector:@selector(mutableArray:didAddObject:)]) {
		[self.delegate mutableArray:self didAddObject:object];
	}
}

- (void)lsd_addObjectsFromArray: (NSArray *)objects
{
	if ([self.delegate respondsToSelector:@selector(mutableArray:willAddObjectsFromArray:)]) {
		[self.delegate mutableArray:self willAddObjectsFromArray:objects];
	}
	
	[self lsd_addObjectsFromArray:objects];
	
	if ([self.delegate respondsToSelector:@selector(mutableArray:didAddObjectsFromArray:)]) {
		[self.delegate mutableArray:self didAddObjectsFromArray:objects];
	}
}

- (void)lsd_insertObject : (id)object atIndex : (NSUInteger) index
{
	if ([self.delegate respondsToSelector:@selector(mutableArray:willInsertObject:atIndex:)]) {
		[self.delegate mutableArray:self willInsertObject:object atIndex:index];
	}
	
	[self lsd_insertObject:object atIndex:index];
	
	if ([self.delegate respondsToSelector:@selector(mutableArray:didInsertObject:atIndex:)]) {
		[self.delegate mutableArray:self didInsertObject:object atIndex:index];
	}
}

- (void)lsd_insertObjects : (NSArray *)objects atIndexes : (NSIndexSet *)indexes
{
	if ([self.delegate respondsToSelector:@selector(mutableArray:willInsertObjects:atIndexes:)]) {
		[self.delegate mutableArray:self willInsertObjects:objects atIndexes:indexes];
	}
	
	[self lsd_insertObjects:objects atIndexes:indexes];
	
	if ([self.delegate respondsToSelector:@selector(mutableArray:didInsertObjects:atIndexes:)]) {
		[self.delegate mutableArray:self didInsertObjects:objects atIndexes:indexes];
	}
}

- (void)lsd_removeAllObjects
{
	if ([self.delegate respondsToSelector:@selector(mutableArrayWillRemoveAllObjects:)]) {
		[self.delegate mutableArrayWillRemoveAllObjects:self];
	}
	
	[self lsd_removeAllObjects];
	
	if ([self.delegate respondsToSelector:@selector(mutableArrayDidRemoveAllObjects:)]) {
		[self.delegate mutableArrayDidRemoveAllObjects:self];
	}
}

- (void)lsd_removeObject: (id)object
{
	if ([self.delegate respondsToSelector:@selector(mutableArray:willRemoveObject:)]) {
		[self.delegate mutableArray:self willRemoveObject:object];
	}
	
	[self lsd_removeObject:object];
	
	if ([self.delegate respondsToSelector:@selector(mutableArray:didRemoveObject:)]) {
		[self.delegate mutableArray:self didRemoveObject:object];
	}
}

- (void)lsd_removeObjectAtIndex: (NSUInteger)index
{
	if ([self.delegate respondsToSelector:@selector(mutableArray:willRemoveObjectAtIndex:)]) {
		[self.delegate mutableArray:self willRemoveObjectAtIndex:index];
	}
	
	[self lsd_removeObjectAtIndex:index];
	
	if ([self.delegate respondsToSelector:@selector(mutableArray:didRemoveObjectAtIndex:)]) {
		[self.delegate mutableArray:self didRemoveObjectAtIndex:index];
	}
}

#pragma mark - Accessors

- (id<NSMutableArrayDelegate>)delegate
{
	return objc_getAssociatedObject(self, kDelegateKey);
}

- (void)setDelegate : (id<NSMutableArrayDelegate>)delegate
{
    objc_setAssociatedObject(self, kDelegateKey, delegate, OBJC_ASSOCIATION_ASSIGN);
    [self lsd_setup];
}

@end
