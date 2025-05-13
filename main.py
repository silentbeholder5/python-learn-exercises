import unittest

# FizzBuzz: Print numbers from 1 to 100, but for multiples of 3 print "Fizz", for 5 print "Buzz", for both print "FizzBuzz"
def fizzbuzz() -> None:
    pass

# Sum all elements in an array and return the result
def array_sum(arr: list) -> int:
    pass

# Remove duplicate elements from an array and return the unique values
def remove_duplicates(arr: list) -> list:
    pass

# Check if a given string is a palindrome (reads the same backward and forward)
def is_palindrome(s: str) -> bool:
    pass

# Count the number of vowels (a, e, i, o, u) in a string
def count_vowels(s: str) -> int:
    pass

# Check if two strings are anagrams (contain the same characters in any order)
def is_anagram(str1: str, str2: str) -> bool:
    pass

# Find and return the maximum and minimum values in an array as a tuple
def find_max_min(arr: list) -> tuple:
    pass

# Calculate the factorial of a number (n!) using iteration or recursion
def factorial(n: int) -> int:
    pass

# Generate the first N Fibonacci numbers as a list
def fibonacci(n: int) -> list:
    pass

# A simple number guessing game: return "Correct" if the guess matches the secret number
def number_guessing_game(secret: int, guess: int) -> str:
    pass

class TestBeginnerExercises(unittest.TestCase):

    # Test for FizzBuzz
    def test_fizzbuzz(self):
        import io
        import sys
        captured_output = io.StringIO()
        sys.stdout = captured_output

        fizzbuzz()
        sys.stdout = sys.__stdout__

        output = captured_output.getvalue().splitlines()
        self.assertEqual(output[:15], ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"])

    # Test for Array Sum
    def test_array_sum(self):
        self.assertEqual(array_sum([1, 2, 3, 4]), 10)
        self.assertEqual(array_sum([]), 0)

    # Test for Removing Duplicates
    def test_remove_duplicates(self):
        self.assertEqual(remove_duplicates([1, 1, 2, 3, 3]), [1, 2, 3])

    # Test for Palindrome Check
    def test_palindrome(self):
        self.assertTrue(is_palindrome("racecar"))
        self.assertFalse(is_palindrome("hello"))

    # Test for Counting Vowels
    def test_count_vowels(self):
        self.assertEqual(count_vowels("hello"), 2)
        self.assertEqual(count_vowels("sky"), 0)

    # Test for Anagram Check
    def test_anagram(self):
        self.assertTrue(is_anagram("listen", "silent"))
        self.assertFalse(is_anagram("hello", "world"))

    # Test for Max/Min in Array
    def test_max_min(self):
        self.assertEqual(find_max_min([1, 2, 3, 4]), (4, 1))

    # Test for Factorial Calculation
    def test_factorial(self):
        self.assertEqual(factorial(5), 120)
        self.assertEqual(factorial(0), 1)

    # Test for Fibonacci Sequence
    def test_fibonacci(self):
        self.assertEqual(fibonacci(5), [0, 1, 1, 2, 3])

    # Test for Number Guessing Game
    def test_number_guessing_game(self):
        result = number_guessing_game(50, 50)
        self.assertEqual(result, "Correct")

if __name__ == "__main__":
    print("Running Beginner Test Suite...")
    unittest.main(verbosity=2)
