@import Foundation;


@interface NSArray (ATExpressiveCollections_MappingMethods)

- (NSArray *)at_arrayWithValuesOfBlock:(id(^)(id value, NSUInteger idx))block;

- (NSArray *)at_arrayWithValuesOfKeyPath:(NSString *)keyPath;  // like valueOfKeyPath:, but more explicit and skips nil values

@end


@interface NSArray (ATExpressiveCollections_FilteringMethods)

- (NSArray *)at_arrayOfElementsPassingTest:(BOOL(^)(id value, NSUInteger idx))block;

@end


@interface NSArray (ATExpressiveCollections_SearchingMethods)

- (id)at_firstElementPassingTest:(BOOL(^)(id value, NSUInteger idx, BOOL *stop))block;
- (id)at_lastElementPassingTest:(BOOL(^)(id value, NSUInteger idx, BOOL *stop))block;

@end


@interface NSArray (ATExpressiveCollections_OrderingMethods)

- (id)at_minimalElement;
- (id)at_maximalElement;

- (id)at_minimalElementOrderedByIntegerScoringBlock:(NSInteger(^)(id value, NSUInteger idx))block;
- (id)at_maximalElementOrderedByIntegerScoringBlock:(NSInteger(^)(id value, NSUInteger idx))block;

- (id)at_minimalElementOrderedByDoubleScoringBlock:(double(^)(id value, NSUInteger idx))block;
- (id)at_maximalElementOrderedByDoubleScoringBlock:(double(^)(id value, NSUInteger idx))block;

- (id)at_minimalElementOrderedByObjectScoringBlock:(id(^)(id value, NSUInteger idx))block;
- (id)at_maximalElementOrderedByObjectScoringBlock:(id(^)(id value, NSUInteger idx))block;

@end
