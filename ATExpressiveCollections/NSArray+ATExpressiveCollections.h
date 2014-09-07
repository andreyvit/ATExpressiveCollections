@import Foundation;


@interface NSArray (ATExpressiveCollections_MappingMethods)

- (NSArray *)at_arrayWithValuesOfBlock:(id(^)(id value))block;

- (NSArray *)at_arrayWithValuesOfKeyPath:(NSString *)keyPath;  // like valueOfKeyPath:, but more explicit and skips nil values

@end


@interface NSArray (ATExpressiveCollections_FilteringMethods)

- (NSArray *)at_arrayOfElementsPassingTest:(BOOL(^)(id value))block;

@end
