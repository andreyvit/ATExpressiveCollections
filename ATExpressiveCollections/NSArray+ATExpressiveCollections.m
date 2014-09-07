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


@implementation NSArray (ATExpressiveCollections_SearchingMethods)

- (id)at_firstElementPassingTest:(BOOL(^)(id value, NSUInteger idx, BOOL *stop))block {
    NSUInteger idx = [self indexOfObjectWithOptions:0 passingTest:block];
    if (idx == NSNotFound) {
        return nil;
    } else {
        return self[idx];
    }
}

- (id)at_lastElementPassingTest:(BOOL(^)(id value, NSUInteger idx, BOOL *stop))block {
    NSUInteger idx = [self indexOfObjectWithOptions:NSEnumerationReverse passingTest:block];
    if (idx == NSNotFound) {
        return nil;
    } else {
        return self[idx];
    }
}

@end


@implementation NSArray (ATExpressiveCollections_OrderingMethods)

- (id)at_minimalElementOrderedByIntegerScoringBlock:(NSInteger(^)(id value))block {
    id bestElement = nil;
    NSInteger bestScore = NSIntegerMax;

    for (id element in self) {
        NSInteger score = block(element);
        if (bestElement == nil || score < bestScore) {
            bestElement = element;
            bestScore = score;
        }
    }
    return bestElement;
}

- (id)at_minimalElementOrderedByDoubleScoringBlock:(double(^)(id value))block {
    id bestElement = nil;
    double bestScore = DBL_MAX;

    for (id element in self) {
        double score = block(element);
        if (bestElement == nil || score < bestScore) {
            bestElement = element;
            bestScore = score;
        }
    }
    return bestElement;
}

- (id)at_minimalElementOrderedByObjectScoringBlock:(id(^)(id value))block {
    id bestElement = nil;
    id bestScore = nil;

    for (id element in self) {
        id score = block(element);
        if (bestElement == nil || [score compare:bestScore] == NSOrderedAscending) {
            bestElement = element;
            bestScore = score;
        }
    }
    return bestElement;
}

- (id)at_minimalElement {
    return [self at_minimalElementOrderedByObjectScoringBlock:^id(id value) {
        return value;
    }];
}

- (id)at_maximalElementOrderedByIntegerScoringBlock:(NSInteger(^)(id value))block {
    id bestElement = nil;
    NSInteger bestScore = NSIntegerMax;

    for (id element in self) {
        NSInteger score = block(element);
        if (bestElement == nil || score > bestScore) {
            bestElement = element;
            bestScore = score;
        }
    }
    return bestElement;
}

- (id)at_maximalElementOrderedByDoubleScoringBlock:(double(^)(id value))block {
    id bestElement = nil;
    double bestScore = DBL_MIN;

    for (id element in self) {
        double score = block(element);
        if (bestElement == nil || score > bestScore) {
            bestElement = element;
            bestScore = score;
        }
    }
    return bestElement;
}

- (id)at_maximalElementOrderedByObjectScoringBlock:(id(^)(id value))block {
    id bestElement = nil;
    id bestScore = nil;

    for (id element in self) {
        id score = block(element);
        if (bestElement == nil || [score compare:bestScore] == NSOrderedDescending) {
            bestElement = element;
            bestScore = score;
        }
    }
    return bestElement;
}

- (id)at_maximalElement {
    return [self at_maximalElementOrderedByObjectScoringBlock:^id(id value) {
        return value;
    }];
}

@end
