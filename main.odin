package main

import "core:fmt"
import "util"

main :: proc() {
	day_one()
}

day_one :: proc() {
	data := util.read_file("./input/day_one_one.txt")
	left, right := util.parse_numbers(data)
	defer delete(left)
	defer delete(right)

	for r in left {
		fmt.println(r)
	}
	free_all(context.temp_allocator)
}
