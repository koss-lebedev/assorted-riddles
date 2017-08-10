package main

import "fmt"

type tree struct {
	Value interface{}
	Left  *tree
	Right *tree
}

func traverse(node *tree, sum int, exp int, found *bool) {
	if *found {
		return
	}
	if node.Left == nil && node.Right == nil {
		if (sum + node.Value.(int)) == exp {
			*found = true
		}
	} else {
		if node.Left != nil {
			traverse(node.Left, sum+node.Value.(int), exp, found)
		}
		if node.Right != nil {
			traverse(node.Right, sum+node.Value.(int), exp, found)
		}
	}
}

func hasPathWithGivenSum(t *tree, s int) bool {
	var found = false
	if t != nil {
		traverse(t, 0, s, &found)
	}
	return found
}

//     4
//    / \
//   1   3
//  /   / \
// -2  1   2
//   \    / \
// 	 3  -2 -3

func main() {
	var tree = &tree{
		Value: 4,
		Left: &tree{
			Value: 1,
			Left: &tree{
				Value: -2,
				Right: &tree{
					Value: 3,
				},
			},
		},
		Right: &tree{
			Value: 3,
			Left: &tree{
				Value: 1,
			},
			Right: &tree{
				Value: 2,
				Left: &tree{
					Value: -2,
				},
				Right: &tree{
					Value: -3,
				},
			},
		},
	}
	fmt.Println(hasPathWithGivenSum(tree, 7))
}
