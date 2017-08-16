package main

import (
	"fmt"
	"math/rand"
	"strconv"
)

func randomThree() int64 {
	var binaryStr = fmt.Sprintf("%d%d", rand.Intn(2), rand.Intn(2))
	var n, _ = strconv.ParseInt(binaryStr, 2, 64)
	if n == 3 {
		return randomThree()
	}
	return n
}

func printPercentages(title string, arr []int64, total int) {
	fmt.Println(title, "\n------------------")
	for i := 0; i < len(arr); i++ {
		var val = float64(arr[i]) / float64(total) * 100
		fmt.Printf("%d: %.2f%%\n", i, val)
	}
	fmt.Println()
}

func main() {
	var real = []int64{0, 0, 0}
	var pseudo = []int64{0, 0, 0}
	var n = 1000000

	for i := 0; i < n; i++ {
		real[rand.Intn(3)]++
		pseudo[randomThree()]++
	}

	printPercentages("REAL", real, n)
	printPercentages("PSEUDO", pseudo, n)
}
