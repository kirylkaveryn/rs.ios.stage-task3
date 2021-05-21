#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSInteger length = ratingArray.count;
    NSInteger count = 0;
    
    for (NSInteger i = 0; i < length - 2; i++) {
        for (NSInteger j = i + 1; j < length - 1; j++) {
            for (NSInteger k = j + 1; k < length; k++) {
                if ((ratingArray[i].intValue < ratingArray[j].intValue && ratingArray[j].intValue < ratingArray[k].intValue) || (ratingArray[i].intValue > ratingArray[j].intValue && ratingArray[j].intValue > ratingArray[k].intValue)) {
                    count ++;
                    NSLog(@"Team %li: %d, %d, %d", count, ratingArray[i].intValue, ratingArray[j].intValue, ratingArray[k].intValue);
                }
            }
        }
    }
    return count;
}

@end
