#import "City.h"

@interface City ()

// Private interface goes here.

@end

@implementation City

+ (NSFetchRequest *)allCountersFetchRequestInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[City entityInManagedObjectContext:context]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortName];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    return fetchRequest;
}

@end
