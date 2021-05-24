#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray<NSMutableArray *> *array = [NSMutableArray array]; // [@1, @"Hello"]
//        NSLog(@"string: %@",array);
//        [array addObject:@[@2,@4]]; // [@1, @"Hello", @2
//        NSLog(@"string: %@",array);
//        //NSString *er = lexicographicallyMinimalString.copy;
//         NSLog(@"string: %@",array[0]);
    NSUInteger currentLevel = 0;
    BOOL rightBranch = true;
    BOOL leftBranch = true;
//        if (tree.count != 0) {
//            [array addObject:@[]];
//        }
    NSLog(@"string: %lu",(unsigned long)array.count);
    for (int i = 0; i<tree.count; i++) {
        if (tree[i] !=  [NSNull null]) {
            if (array.count == currentLevel) {
//                    [array addObject:[NSMutableArray arrayWithObjects:@-1, nil]];
//                    [array[currentLevel] addObject:tree[i]];
               [array addObject:[NSMutableArray arrayWithObjects:tree[i], nil]];
                currentLevel = currentLevel+1;
                leftBranch = true;
                continue;
            }else if (leftBranch ) {
                //currentLevel = currentLevel;
//                    if (!(array[currentLevel].count % 2)) {
//                        currentLevel = currentLevel-1;
//                    }
                [array[currentLevel] addObject:tree[i]];
                currentLevel = currentLevel+1;
                //leftBranch = ;
            }
            if (!leftBranch && rightBranch) {
                //currentLevel = currentLevel;
                if (!(array[currentLevel].count % 2)) {
                    currentLevel = currentLevel-1;
                }
                [array[currentLevel] addObject:tree[i]];
                currentLevel = currentLevel+1;
                leftBranch = true;
            }
            

        }else{
            if (leftBranch) {
                leftBranch = false;
            }else if(!leftBranch && rightBranch){
                currentLevel = currentLevel-1;
               // leftBranch = true;
//                    currentLevel = currentLevel-1;
            }
        }
    }
//    NSLog(@"string: %@",array);
    return array;
}
