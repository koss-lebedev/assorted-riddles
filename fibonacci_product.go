package main

import (
	"fmt"
)

func solve(prod uint64) (uint64, uint64, bool) {
	var a uint64 = 0
	var b uint64 = 1

	for a*b < prod {
		var temp = b
		b = a + b
		a = temp
	}

	return a, b, a*b == prod
}

func main() {
	{
		var a, b, t = solve(4895)
		var passed = a == 55 && b == 89 && t
		fmt.Println("Case #1:", passed)
	}

	{
		var a, b, t = solve(5895)
		var passed = a == 89 && b == 144 && !t
		fmt.Println("Case #2:", passed)
	}
}
