#import "_City.h"

@interface City : _City {}

+ (NSFetchRequest *)allCountersFetchRequestInContext:(NSManagedObjectContext *)context;

@end
