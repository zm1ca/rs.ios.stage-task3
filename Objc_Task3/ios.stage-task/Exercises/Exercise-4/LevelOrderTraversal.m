#import "LevelOrderTraversal.h"
#import "TreeNode.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    TreeNode *builtTree = [TreeNode treeFromPreorder:tree];
    
    if (builtTree == nil) {
        return @[];
    } else {
        return [builtTree levelOrderTraversal];
    }
}
