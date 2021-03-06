#An introduction to `std` lists
##An introduction to `std::array`
`std::array` provides fixed array functionality that won't decay when passed into a function.
Unlike built-in fixed arrays, with `std::array` you can not omit the array length when providing an initializer:
```cpp
std::array<int, > myArray{9,4,3,5,6}; // illegal, array length must be provided
std::array<int> myArray{9,4, 3, 5,6}; // illegal, array length must be provided
```
You can also assign values to the array using an initializer list
```cpp
sdt::array<int, 5> myArray;
myArray = {0, 1, 2, 3, 4};      // okay
myArray = {9, 8, 7};            // okay, elements 3 and 4 are set to zero
myArray = {0, 1, 2, 3, 4, 5};   // not allowed, too many elements in initializer list
```
##An introduction to `std::vector`
`std::vector` provides dynamic array functionality that handles its own memory management.
###Self-cleanup prevents memory leaks
###Vectors remember their length
###Resizing a vector
Resizing a `std::vector` is as simple as calling the `resize()` function.
Frist, when we resized the vector, the existing element values were preserved.
Second, new elements are initialized to the default value for the type (which is 0 for integers).
Resizing a vector is computationally expensive, so you should strive to minimize the number of times you do so. If you need a vector with a specific number of elements but don't know the values of the elements at the point of declaration, you can create a vector with default elements.
###Compacting bools
There is a special implementation for `std::vector` of type bool that will compact 8 booleans into a byte.

##Iterators
Looping using indexes is more typing than needed if we only use the index to access elements.
An iterator is an object designed to traverse through a container, providing access to each element along the way.
###Pointers as an iterator
>Warning
>You might be tempted to calculate the end marker using the address-of operator and array syntax:
>       ```cpp
>           int* end{&array[std::size(array)]};
>       ```
> But this causes undefined behavior, because `array[std::size(array)]` accesses an element that is off the end of the array.
>Instead, use:
>       ```cpp
>           int* end{&array[0]+std::size(array)};
>       ```

###Iterator invalidation (dangling iterators)
Iterators can be left "dangling" if the elements being iterated over change address or are destoryed. When this happeds, we say the iterator has been invalidated. Accessing an invalidated iterator produces undefineed behavior.
