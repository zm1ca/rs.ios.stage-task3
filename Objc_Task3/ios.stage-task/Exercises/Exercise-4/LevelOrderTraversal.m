#import "LevelOrderTraversal.h"
#import "TreeNode.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    TreeNode *builtTree = [TreeNode treeFromPreorder:[tree mutableCopy]];
    return builtTree == nil ? @[] : [builtTree levelOrderTraversal];
}
