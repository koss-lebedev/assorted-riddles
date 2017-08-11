package main

import "fmt"

type tree struct {
	Value interface{}
	Left  *tree
	Right *tree
}

func hasPathWithGivenSum(t *tree, s int) bool {
	if t == nil {
		return s == 0
	}
	var rem = s - t.Value.(int)
	return hasPathWithGivenSum(t.Left, rem) || hasPathWithGivenSum(t.Right, rem)
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

	fmt.Println("Case #1:", hasPathWithGivenSum(tree, 7) == true)
	fmt.Println("Case #2:", hasPathWithGivenSum(tree, 2) == false)
}
