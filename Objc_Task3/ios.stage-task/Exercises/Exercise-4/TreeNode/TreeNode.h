//
//  TreeNode.h
//  ios.stage-task
//
//  Created by Źmicier Fiedčanka on 22.05.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property(nonatomic, retain) NSNumber *value;
@property(nonatomic, retain, nullable) TreeNode *leftNode;
@property(nonatomic, retain, nullable) TreeNode *rightNode;

- (instancetype)initWithValue:(NSNumber *)value;
+ (instancetype)treeNodeWithValue:(NSNumber *)value;
+ (instancetype)treeFromPreorder:(NSMutableArray *)preorder;
- (NSArray<NSArray *> *)levelOrderTraversal;
- (void)appendLevelOrderTraversalResultsTo: (NSMutableArray *)array;

@end

NS_ASSUME_NONNULL_END
