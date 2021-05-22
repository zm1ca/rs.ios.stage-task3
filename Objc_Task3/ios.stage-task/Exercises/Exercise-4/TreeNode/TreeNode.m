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
    // MARK: Рассматриваем простые/особые случаи
        // Пустой/nil массив на входе
    if (preorder.count == 0 || preorder[0] == [NSNull null]) {
        return nil;
    }
    
    // Массив из одного элемента
    TreeNode *tree = [[TreeNode alloc] initWithValue:preorder[0]];
    
    if (preorder.count == 1) {
        return tree;
    }
    
    // MARK: Ищем правого сына
    ///Заметим, что по индексу 0 расположен корень, а сразу за ним (индекс 1) идёт его левый сын т.к. обход preorder (корень-лево-право).
    ///Для того чтобы решить задачу построения дерева, нам нужно понять, где находится правый сын корня.
    ///Другими словами, мы пытаемся понять, когда закончится левое поддерево (т.к. правый сын идет сразу после него)
    ///Заметим, что если правый сын равен нулю, он не попадёт в запись preorder (т.к. будет стоять в конце, а нули из конца обрезаются), значит мы ищем ненулевой элемент, перед которым идёт полноценное бинарное дерево.
    ///Из условия следует, что все элементы [NSNull null] соответствуют листьям дерева (вершинам без наследников), и других листьев быть не может. Из теории графов известен критерий быть бинарным деревом: для этого число листьев должно равняться  (n + 1) / 2, где n - число вершин.
    unsigned long rightNodePosition = preorder.count; //preorder.count используется для удобства в строке 64. Можно -1.
    unsigned int numberOfNulls = 0;
    for (unsigned long i = 1; i < preorder.count; ++i) {
        if (preorder[i] == [NSNull null]) {
            numberOfNulls++;
        } else {
            //Перед этим элементом бинарное дерево?
            if ((numberOfNulls > 0) && (i % 2 == 0) && (numberOfNulls == i / 2)) {
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
        //Заметим, что уровень i потомка мы для родителя является уровнем i+1
        if (i + 1 < result.count) {
            //Если в result уже есть подмассив для level i+1 - кладем всё из уровня i в него
            [result[i + 1] addObjectsFromArray:rightNodeResult[i]];
        } else {
            //Если такого массива нет - создаём.
            [result addObject:[NSMutableArray arrayWithArray:rightNodeResult[i]]];
        }
    }
}



@end
