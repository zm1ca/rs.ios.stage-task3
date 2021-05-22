#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int count = 0;
    BOOL ratingIlessThanJ, ratingJLessThanK, sortedAscending, ratingIGreaterThanJ, ratingJGreaterThanK, sortedDescending;
    
    for (int i = 0; i < ratingArray.count; ++i) {
        for (int j = i + 1; j < ratingArray.count; ++j) {
            for (int k = j + 1; k < ratingArray.count; ++k) {
                // MARK: Preparations
                ratingIlessThanJ = [ratingArray[i] intValue] < [ratingArray[j] intValue];
                ratingJLessThanK = [ratingArray[j] intValue] < [ratingArray[k] intValue];
                sortedAscending = ratingIlessThanJ && ratingJLessThanK;
                ratingIGreaterThanJ = [ratingArray[i] intValue] > [ratingArray[j] intValue];
                ratingJGreaterThanK = [ratingArray[j] intValue] > [ratingArray[k] intValue];
                sortedDescending = ratingIGreaterThanJ && ratingJGreaterThanK;
                
                // MARK: Checking condition
                if (sortedAscending || sortedDescending){
                    count++;
                }
            }
        }
    }
    return count;
}

@end
