import pytest 

from greeting.main import greet   
from greeting.utils import add   

def test_greet(): 
    assert greet("World") == "Hello, World!"

def test_add(): 
    assert add(5,7) == 12  


    