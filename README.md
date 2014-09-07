# ATExpressiveCollections

TODO description.

Remember that you can replace “id” with specific types in the block argument lists.


## NSArray mapping methods

* `at_arrayWithValuesOfBlock:` (also known as “map”):

        NSArray *result = [array at_arrayWithValuesOfBlock:^id(NSString *value) {
            return [value uppercaseString];
        }];

* `at_arrayWithValuesOfKeyPath:` (also known as “pluck”):

        NSArray *result = [array at_arrayWithValuesOfKeyPath:@"uppercaseString"];
