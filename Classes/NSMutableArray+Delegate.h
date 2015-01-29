//
//  NSMutableArray+Delegate.h
//
//  Created by IVAN CHIRKOV on 26.01.15.
//  Copyright (c) 2015 IVAN CHIRKOV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@protocol NSMutableArrayDelegate <NSObject>

@optional

- (void)mutableArray : (NSMutableArray *)array
		willAddObject : (id)object;

- (void)mutableArray : (NSMutableArray *)array
		didAddObject : (id)object;

- (void)mutableArray:(NSMutableArray *)array
		willAddObjectsFromArray : (NSArray *)objects;

- (void)mutableArray:(NSMutableArray *)array
		didAddObjectsFromArray : (NSArray *)objects;

/** @warning This method is called when you call addObject: and addObjects: */
- (void)mutableArray : (NSMutableArray *)array
	willInsertObject : (id)object
			 atIndex : (NSUInteger) index;

/** @warning This method is called when you call addObject: and addObjects: */
- (void)mutableArray : (NSMutableArray *)array
	 didInsertObject : (id)object
			 atIndex : (NSUInteger) index;

- (void)mutableArray : (NSMutableArray *)array
   willInsertObjects : (NSArray *)objects
		   atIndexes : (NSIndexSet *)indexes;

- (void)mutableArray : (NSMutableArray *)array
	didInsertObjects : (NSArray *)objects
		   atIndexes : (NSIndexSet *) indexes;


- (void)mutableArrayWillRemoveAllObjects : (NSMutableArray *)array;

- (void)mutableArrayDidRemoveAllObjects : (NSMutableArray *)array;

- (void)mutableArray : (NSMutableArray *)array
	willRemoveObject : (id)object;

- (void)mutableArray : (NSMutableArray *)array
	 didRemoveObject : (id)object;

- (void)mutableArray : (NSMutableArray *)array
		willRemoveObjectAtIndex : (NSUInteger)index;

- (void)mutableArray : (NSMutableArray *)array
		didRemoveObjectAtIndex : (NSUInteger)index;

@end


@interface NSMutableArray (Delegate)

@property (weak, nonatomic) id <NSMutableArrayDelegate> delegate;

@end
