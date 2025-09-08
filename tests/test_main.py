import pytest 
import os 
import sys
sys.path.append(os.getcwd())
from src.greeting.main import greet   
from src.greeting.utils import add   

def test_greet(): 
    assert greet("World") == "Hello, World!"

def test_add(): 
    assert add(5,7) == 12  


    