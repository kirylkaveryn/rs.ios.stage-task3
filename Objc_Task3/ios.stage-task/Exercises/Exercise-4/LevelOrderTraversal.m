#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSInteger arrayLength = [tree count];
    NSInteger currentLevel = -1;
    NSInteger levels = -1;
    NSInteger rightBranchLevel = 0;
    NSInteger branch = 0;
//    NSInteger left = 0;
    
    if (arrayLength == 0) {
        return @[];
    }
    
    if (arrayLength == 1 && tree[0] == [NSNull null]) {
        return @[];
    }
    
    if (arrayLength == 1 && tree[0] != [NSNull null]) {
        NSMutableArray *outputArrayLength1 = [NSMutableArray new];
        [outputArrayLength1 addObject:tree];
        return outputArrayLength1;
    }
    
    NSInteger i = 0;
    
    while (i <  arrayLength) {
        if (tree[i] == [NSNull null]) {
            i++;
            rightBranchLevel ++;
            if (tree[i] == [NSNull null]) {
                currentLevel = currentLevel - rightBranchLevel;
                rightBranchLevel = 0;
//                currentLevel --;
                i++;
            }
        }
        if (tree[i] != [NSNull null]) {
            currentLevel ++;
            if (levels <= currentLevel) {
                levels = currentLevel;
            }
            i++;
        }
    }
    
    NSLog(@"levels: %li", levels);

    NSMutableArray *outputArray = [NSMutableArray new];
    for (int i = 0; i <= levels; i++) {
        [outputArray addObject:[NSMutableArray new]];
    }
    
    currentLevel = 0 ;
    i = 0;
    
    while (i <  arrayLength) {
        if (tree[i] == [NSNull null]) {
            i++;
//            rightBranchLevel ++;
            if (i < arrayLength && tree[i] == [NSNull null]) {
//                currentLevel = currentLevel - rightBranchLevel;
                rightBranchLevel = 0;
                currentLevel --;
                i++;
            }
//            else if (i < arrayLength && tree[i] != [NSNull null]) {
//                [[outputArray objectAtIndex:currentLevel] addObject:tree[i]];
//                currentLevel ++;
//                i++;
//            }
        }
        if (i < arrayLength && tree[i] != [NSNull null]) {
            [[outputArray objectAtIndex:currentLevel] addObject:tree[i]];
            currentLevel ++;
            i++;
        }
    }

    NSLog(@"outputArray: %@", outputArray);
    
    return outputArray;
}


//while (i < arrayLength) {
//
//    if (i == arrayLength - 2 && tree[arrayLength - 1] != [NSNull null]) {
//        [[outputArray objectAtIndex:currentLevel] addObject:tree[arrayLength - 1]];
//        currentLevel ++;
//        i ++;
//    }
//    else if (tree[i] == [NSNull null] && tree[i + 1] == [NSNull null]) {
//        currentLevel --;
//        i += 2;
//    }
//    else if (tree[i] == [NSNull null] && tree[i + 1] != [NSNull null]) {
//        [[outputArray objectAtIndex:currentLevel] addObject:tree[i+1]];
//        currentLevel ++;
//        i ++;
//    }
//    else {
//        [[outputArray objectAtIndex:currentLevel] addObject:tree[i]];
//        currentLevel ++;
//        i ++;
//    }
//}
