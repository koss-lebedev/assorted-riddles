package main

import (
	"fmt"
	"reflect"
)

func solution(left []int, right []int) []int {
	result := make([]int, len(left) + len(right))
	var (
		l = 0
		r = 0
		i = 0
	)

	for {
		if len(left) <= l && len(right) <= r {
			break
		} else if len(left) <= l {
			result[i] = right[r]
			r++
		} else if len(right) <= r {
			result[i] = left[l]
			l++
		} else {
			if left[l] < right[r] {
				result[i] = left[l]
				l++
			} else {
				result[i] = right[r]
				r++
			}
		}
		i++
	}

	return result
}

func main() {
	{
		expected := []int { }
		actual := solution([]int { }, []int { })
		fmt.Println("Merges empty arrays: ", reflect.DeepEqual(expected, actual))
	}

	{
		expected := []int { 1, 2, 3 }
		actual := solution([]int { }, []int { 1, 2, 3 })
		fmt.Println("Merges with empty array: ", reflect.DeepEqual(expected, actual))
	}

	{
		expected := []int { 1, 2, 3, 4, 5, 5, 6 }
		actual := solution([]int { 1, 5 }, []int { 2, 3, 4, 5, 6 })
		fmt.Println("Merges arrays of different length: ", reflect.DeepEqual(expected, actual))
	}
}
