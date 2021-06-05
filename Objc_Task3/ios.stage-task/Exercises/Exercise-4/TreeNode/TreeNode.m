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

// MARK: Deserializing tree from array
+ (instancetype)treeFromPreorder:(NSMutableArray *)preorder {
    if (preorder.count == 0) {
        return nil;
    }
    
    id val = preorder.firstObject;
    [preorder removeObjectAtIndex:0];
    
    if (val == [NSNull null]) {
        return nil;
    }

    TreeNode *node = [[TreeNode alloc] initWithValue:val];
    node.leftNode  = [TreeNode treeFromPreorder:preorder];
    node.rightNode = [TreeNode treeFromPreorder:preorder];
    
    return node;
}

// MARK: Traversing tree to compute level order structure
- (NSArray<NSArray *> *)levelOrderTraversal {
    NSMutableArray<NSMutableArray *> *result = [NSMutableArray new];
    
    [result addObject:[NSMutableArray arrayWithObject:self.value]];
    [self.leftNode  appendLevelOrderTraversalResultsTo:result];
    [self.rightNode appendLevelOrderTraversalResultsTo:result];
    
    return result;
}

- (void)appendLevelOrderTraversalResultsTo:(NSMutableArray *)result {
    NSArray<NSArray *> *rightNodeResult = [self levelOrderTraversal];
    for (int i = 0; i < rightNodeResult.count; ++i) {
        if (i + 1 < result.count) {
            [result[i + 1] addObjectsFromArray:rightNodeResult[i]];
        } else {
            [result addObject:[NSMutableArray arrayWithArray:rightNodeResult[i]]];
        }
    }
}



@end
