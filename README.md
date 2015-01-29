NSMutableArray-Delegate is a category that adds patern Delegate for mutable array.

## Supported delegate methods

- `- (void)mutableArray:(NSMutableArray *)array
		willAddObject:(id)object`
- `- (void)mutableArray:(NSMutableArray *)array
		didAddObject:(id)object`
- `- (void)mutableArray:(NSMutableArray *)array
		willAddObjectsFromArray:(NSArray *)objects`
- `- (void)mutableArray:(NSMutableArray *)array
		didAddObjectsFromArray:(NSArray *)objects`
- `- (void)mutableArray:(NSMutableArray *)array
	willInsertObject:(id)object
			 atIndex:(NSUInteger) index`
- `- (void)mutableArray:(NSMutableArray *)array
	 didInsertObject:(id)object
			 atIndex:(NSUInteger) index`
- `- (void)mutableArray:(NSMutableArray *)array
   willInsertObjects:(NSArray *)objects
		   atIndexes:(NSIndexSet *)indexes`
- `- (void)mutableArray:(NSMutableArray *)array
	didInsertObjects:(NSArray *)objects
		   atIndexes:(NSIndexSet *) indexes`
- `- (void)mutableArrayWillRemoveAllObjects:(NSMutableArray *)array`
- `- (void)mutableArrayDidRemoveAllObjects:(NSMutableArray *)array`
- `- (void)mutableArray:(NSMutableArray *)array
	willRemoveObject:(id)object`
- `- (void)mutableArray:(NSMutableArray *)array
	 didRemoveObject:(id)object`
- `- (void)mutableArray:(NSMutableArray *)array
		willRemoveObjectAtIndex:(NSUInteger)index`
- `- (void)mutableArray:(NSMutableArray *)array
		didRemoveObjectAtIndex:(NSUInteger)index`

## Example
```
#import "NSMutableArray+Delegate.h"

...

@interface YourClass <NSMutableArrayDelegate>

...

NSMutableArray *array = [NSMutableArra array];
array.delegate = self;

#pragma mark - NSMutableArrayDelegate

- (void)mutableArray:(NSMutableArray *)array
		didAddObject:(id)object
{
  NSLog(@"Object %@ is added to the array", object);
}

```
	
## License
NSMutableArray-Delegate is available under the MIT license. See the LICENSE file for more info.
