package main

import "fmt"

func slice(s []int) []int {
	newSlice := make([]int, 0, len(s))
	for i := len(s) - 1; i >= 0; i-- {
		newSlice = append(newSlice, s[i])
	}
	return newSlice
}

func main() {
	firstSlice := []int{1, 3, 6, 8, 5}
	secondSlice := slice(firstSlice)
	fmt.Println("Начальный слайс:", firstSlice)
	fmt.Println("Слайс наоборот:", secondSlice)
}
