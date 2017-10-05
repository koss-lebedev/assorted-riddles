package main

import "fmt"

// Stack data structure
type Stack struct {
	top    *node
	length int
}

type node struct {
	value interface{}
	prev  *node
}

// NewStack - inits empty stack
func NewStack() *Stack {
	return &Stack{}
}

// Push new value on top of the stack
func (s *Stack) Push(value interface{}) {
	n := &node{value: value, prev: s.top}
	s.top = n
	s.length++
}

// Pop the value from the top of the stack
func (s *Stack) Pop() interface{} {
	if s.top != nil {
		popped := s.top
		s.top = popped.prev
		s.length--
		return popped.value
	}
	return nil
}

// Peek the value from the top of the stack without removing it
func (s *Stack) Peek() interface{} {
	return s.top.value
}

func main() {
	stack := NewStack()
	stack.Push(0)
	stack.Push(1)
	stack.Push(2)

	fmt.Println("Top:", stack.Peek())
	fmt.Println("Size:", stack.length)
	fmt.Println("Popped:", stack.Pop(), stack.Pop(), stack.Pop(), stack.Pop())
}
