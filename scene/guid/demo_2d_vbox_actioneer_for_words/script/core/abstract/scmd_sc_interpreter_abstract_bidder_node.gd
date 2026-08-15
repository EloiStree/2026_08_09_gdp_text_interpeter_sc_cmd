## To be an valide interpreter of a word actioneer, you need two methods:
## 1. is_able_to_interpret_given_word(word: String) -> bool
## 2. interpret_given_word(word: String) -> void
class_name SCmdScInterpreterAbstractBidderNode
extends Node


func is_able_to_interpret_given_word(word: String) -> bool:
    return false

func interpret_given_word(word: String) -> void:
    pass