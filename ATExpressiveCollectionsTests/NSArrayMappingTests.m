@import XCTest;
#import "ATExpressiveCollections.h"

@interface NSArrayMappingTests : XCTestCase

@end

@implementation NSArrayMappingTests

- (void)test_arrayWithValuesOfBlock {
    NSArray *array = @[@"foo", @"bar", @"boz"];
    NSArray *result = [array at_arrayOfElementsPassingTest:^BOOL(NSString *value) {
        return [value rangeOfString:@"o"].location != NSNotFound;
    }];
    NSArray *expected = @[@"foo", @"boz"];
    XCTAssertEqualObjects(result, expected);
}

@end
