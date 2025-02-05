package main

import "fmt"

func merge(a []int, b []int) []int {
	var as, bs int = len(a), len(b)
	var c []int
	var i, j int = 0, 0

	for i < as && j < bs {
		if a[i] < b[j] {
			c = append(c, a[i])
			i++
		} else {
			c = append(c, b[j])
			j++
		}
	}

	c = append(c, a[i:]...) // ... means append all elements of a[i:] to c in slices other wise it will look like [ 1 , 2 , 3 , [ 4 , 5 , 6 ] ]
	c = append(c, b[j:]...)
	return c
}

func merger_sort(a []int) []int {
	var n = len(a)
	if n <= 1 {
		return a
	}
	var mid = n / 2
	var left = merger_sort(a[:mid])
	var right = merger_sort(a[mid:])
	return merge(left, right)
}

func main() {
	var a = []int{10, 5, 3, 8, 2, 6, 4, 7}
	fmt.Println(merger_sort(a))
}
