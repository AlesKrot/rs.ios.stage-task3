#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    int count = 0;
      
    if (ratingArray.count < 3)
        return 0;
        
       for (int i = 0; i < [ratingArray count]; i++){
           for (int j = i + 1; j < [ratingArray count]; j++){
               for (int k = j + 1; k < [ratingArray count]; k++){
                    if (([ratingArray objectAtIndex:(i)].intValue < [ratingArray objectAtIndex:(j)].intValue && [ratingArray objectAtIndex:(j)].intValue < [ratingArray objectAtIndex:(k)].intValue) || ([ratingArray objectAtIndex:(i)].intValue > [ratingArray objectAtIndex:(j)].intValue && [ratingArray objectAtIndex:(j)].intValue > [ratingArray objectAtIndex:(k)].intValue)){
                        count+=1;
                    }
               }
           }
       }
    return count;
}

@end
