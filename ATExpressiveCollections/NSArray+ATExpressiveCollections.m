#import "NSArray+ATExpressiveCollections.h"

@implementation NSArray (ATExpressiveCollections_MappingMethods)

- (NSArray *)at_arrayWithValuesOfBlock:(id(^)(id value))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    for (id element in self) {
        id value = block(element);
        if (value != nil) {
            [result addObject:value];
        }
    }
    return result;
}

- (NSArray *)at_arrayWithValuesOfKeyPath:(NSString *)keyPath {
    return [self at_arrayWithValuesOfBlock:^id(id element) {
        return [element valueForKeyPath:keyPath];
    }];
}

@end


@implementation NSArray (ATExpressiveCollections_FilteringMethods)

- (NSArray *)at_arrayOfElementsPassingTest:(BOOL(^)(id value))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    for (id element in self) {
        if (block(element)) {
            [result addObject:element];
        }
    }
    return result;
}

@end
