//
//  TreeNode.m
//  ios.stage-task
//
//  Created by Źmicier Fiedčanka on 22.05.21.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithValue:(NSNumber *)value {
    self = [super init];
    if (self) {
        _value = value;
        _leftNode = nil;
        _rightNode = nil;
    }
    return self;
}

+ (instancetype)treeNodeWithValue:(NSNumber *)value {
    return [[TreeNode alloc] initWithValue:value];
}

+ (instancetype)treeFromPreorder:(NSArray *)preorder {
    if (preorder.count == 0 || preorder[0] == [NSNull null]) {
        return nil;
    }
    
    TreeNode *tree = [[TreeNode alloc] initWithValue:preorder[0]];
    
    if (preorder.count == 1) {
        return tree;
    }
    
    unsigned long rightNodePosition = preorder.count;
    unsigned int numberOfNulls = 0;
    for (unsigned long i = 1; i < preorder.count; ++i) {
        if (preorder[i] == [NSNull null]) {
            numberOfNulls++;
        } else {
            if ((numberOfNulls > 0) && (i % 2 == 0) && (numberOfNulls == i >> 1)) {
                rightNodePosition = i;
                break;
            }
        }
    }
    
    if (rightNodePosition == preorder.count) {
        tree.rightNode = nil;
    } else {
        tree.rightNode = [TreeNode treeFromPreorder:[preorder subarrayWithRange:NSMakeRange(rightNodePosition, preorder.count - rightNodePosition)]];
    }
    
    tree.leftNode = [TreeNode treeFromPreorder:[preorder subarrayWithRange:NSMakeRange(1, rightNodePosition - 1)]];
    
    return tree;
}

- (NSArray<NSArray *> *)levelOrderTraversal {
    NSMutableArray<NSMutableArray *> *result = [NSMutableArray new];
    
    [result addObject:[NSMutableArray arrayWithObject:self.value]];
    [self.leftNode  appendLevelOrderTraversalResultsTo:&result];
    [self.rightNode appendLevelOrderTraversalResultsTo:&result];
    
    return result;
}

- (void)appendLevelOrderTraversalResultsTo:(NSMutableArray **)array {
    NSMutableArray *result = *array;
    
    NSArray<NSArray *> *rightNodeResult = [self levelOrderTraversal];
    for (int i = 0; i < rightNodeResult.count; ++i) {
        if (i + 1 < result.count) {
            [array[i + 1] addObjectsFromArray:rightNodeResult[i]];
        } else {
            [result addObject:[NSMutableArray arrayWithArray:rightNodeResult[i]]];
        }
    }
}



@end
