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
