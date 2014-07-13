#import "Environment.h"

static Environment* sharedInstance = nil;

@interface Environment()
@property (strong, nonatomic) NSDictionary* environment;
@end


@implementation Environment

+ (Environment*) sharedInstance {
    
    static Environment* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[Environment alloc] init];
    });
    
    return _sharedInstance;
}


- (id)init
{
    self = [super init];
    if (self) {
        NSBundle* bundle = [NSBundle mainBundle];
        
        // Read in the 'Environment' name used to build the application (Debug or Release)
        NSString* configuration = [bundle objectForInfoDictionaryKey:@"Configuration"];
        
        // Load the Environment.plist
        NSString* environmentsPListPath = [bundle pathForResource:@"Environments" ofType:@"plist"];
        NSDictionary* environments = [[NSDictionary alloc] initWithContentsOfFile:environmentsPListPath];
        
        // Read the values for the 'Environment' name into the 'environment property'
        NSDictionary* environment = [environments objectForKey:configuration];
        self.environment = environment;
    }
    
    return self;
}

- (id)fetch:(NSString*)key {
    
    /**
     * If the key is present in the environment, then return its value;
     * otherwise return nil.
     */
    
    return [self.environment objectForKey:key];
}
@end