#import <XCTest/XCTest.h>
#import "Environment.h"

@interface EnvironmentTests : XCTestCase

@end

@implementation EnvironmentTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark SingletonInstance Tests
- (void)testSharedInstance {
    Environment* environment = [Environment sharedInstance];
    
    // pointer comparison
    XCTAssertEqualObjects([Environment sharedInstance], environment, @"expected Environment +sharedInstance to be a singleton, but created a new object");
}

#pragma mark Fetch Tests
- (void)testFetchWithUnknownKey {
    NSString* fetchedValue = [[Environment sharedInstance] fetch:@"UnknownKey"];
    XCTAssertNil(fetchedValue, @"expected Environment -fetch with an unknonwn key to return nil, but returned %@", fetchedValue);
}

- (void)testFetchWithKnownKey {
    NSString* fetchedValue = [[Environment sharedInstance] fetch:@"MyAppAPIBaseUrl"];
    XCTAssertNotNil(fetchedValue, @"expected Environment -fetch with a known key to return a value, but returned %@", fetchedValue);
}

@end