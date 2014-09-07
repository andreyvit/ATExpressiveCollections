# ATExpressiveCollections

TODO description.

Remember that you can replace “id” with specific types in the block argument lists.


## NSArray

Mapping:

* `at_arrayWithValuesOfBlock:` (also known as “map”):

        NSArray *result = [array at_arrayWithValuesOfBlock:^id(NSString *value) {
            return [value uppercaseString];
        }];

* `at_arrayWithValuesOfKeyPath:` (also known as “pluck”):

        NSArray *result = [array at_arrayWithValuesOfKeyPath:@"uppercaseString"];

Filtering:

* `at_arrayOfElementsPassingTest:`

        NSArray *result = [array at_arrayOfElementsPassingTest:^BOOL(NSString *value) {
            return [value rangeOfString:@"o"].location != NSNotFound;
        }];

Ordering:

* `at_minimalElement`, `at_maximalElement`:

        id result = [@[@11, @42, @26, @14, @30] at_maximalElement]  // @42

* Minimal/maximal elements with a separate scoring block:

        at_minimalElementOrderedByIntegerScoringBlock:
        at_maximalElementOrderedByIntegerScoringBlock:
        at_minimalElementOrderedByDoubleScoringBlock:
        at_maximalElementOrderedByDoubleScoringBlock:
        at_minimalElementOrderedByObjectScoringBlock:
        at_maximalElementOrderedByObjectScoringBlock:

    Example:

        id result = [@[@11, @42, @26, @14, @30] at_minimalElementOrderedByIntegerScoringBlock:^NSInteger(NSNumber *value) {
            return [value integerValue] % 10;
        }];

