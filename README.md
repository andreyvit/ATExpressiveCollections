# ATExpressiveCollections

NSArray and NSDictionary categories that help you write more expressive code.

Rationale, in 3 simple claims:

1. Algorithmic/data structure-heavy code (“create an empty array with the given capacity, iterate over the input collection, perform a test on each element, add the elements passing the test to the output array”), API-heavy code (“get a file manager, ask for the properties of the given resources, check for error”) and domain logic (“ignore missing files”) are 3 different types of source code.

2. It's a bad idea to mix these types of code in a single method.

3. So when you find yourself writing multiple lines of collection fiddling code and multiple lines of API interaction/domain logic code in the same method, you should extract the algorithmic parts into a separate helper method.

ATExpressiveCollections is a bunch of algorithmic helpers extracted from my apps over a long period of time.

Helpful hint: When using these methods, remember that you can replace “id” with your specific type in a block's argument list.


## Installation

Using CocoaPods:

    pod 'ATExpressiveCollections', '~> 1.0.0'


## Contribution policy

I will accept all pull requests that meet the following requirements:

1. Do not introduce backwards-incompatible breaking changes.

2. Provide test cases for all new (or modified) functionality.

3. Document the new (or modified) functionality in README.md.

4. Follow the current code formatting style.

5. Prefix all names with `at_`.

One of my goals is to use self-explanatory method names, so that people can understand what the code does without looking at the docs. Please spend some time thinking about the method names you introduce.


## NSArray

Mapping:

* `at_arrayWithValuesOfBlock:` (some other libraries call it “map”):

        NSArray *result = [array at_arrayWithValuesOfBlock:^id(NSString *value, NSUInteger idx) {
            return [value uppercaseString];
        }];

* `at_arrayWithValuesOfKeyPath:` (some other libraries call it “pluck”):

        NSArray *result = [array at_arrayWithValuesOfKeyPath:@"uppercaseString"];

    If you're wondering, this is almost the same as `[array valueForKeyPath:...]`, but we skip nil values instead of turning them into NSNull.

Filtering:

* `at_arrayOfElementsPassingTest:`

        NSArray *result = [array at_arrayOfElementsPassingTest:^BOOL(NSString *value, NSUInteger idx) {
            return [value rangeOfString:@"o"].location != NSNotFound;
        }];

Searching:

* `at_firstElementPassingTest:`, `at_lastElementPassingTest:`

        id result = [@[@11, @42, @26, @14, @30] at_firstElementPassingTest:^BOOL(id value, NSUInteger idx, BOOL *stop) {
            return [value integerValue] >= 20;
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

        id result = [@[@11, @42, @26, @14, @30] at_minimalElementOrderedByIntegerScoringBlock:^NSInteger(NSNumber *value, NSUInteger idx) {
            return [value integerValue] % 10;
        }];

