package main

import "fmt"

type tree struct {
	Value int
	Left  *tree
	Right *tree
}

func isBst(t *tree) bool {
	if t == nil {
		return true
	}
	if t.Left != nil && t.Left.Value >= t.Value {
		return false
	}
	if t.Right != nil && t.Right.Value <= t.Value {
		return false
	}
	return isBst(t.Left) && isBst(t.Right)
}

func main() {
	var tree = &tree{
		Value: 5,
		Left: &tree{
			Value: 4,
			Left: &tree{
				Value: 3,
			},
			Right: &tree{
				Value: 7,
			},
		},
		Right: &tree{
			Value: 6,
			Left: &tree{
				Value: 2,
			},
		},
	}
	fmt.Println("Is BST:", isBst(tree))
}
