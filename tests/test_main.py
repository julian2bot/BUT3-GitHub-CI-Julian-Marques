""" Test main """
# import pytest
import sys
import os

sys.path.append(os.getcwd())

# pylint: disable=import-error, wrong-import-position

from src.greeting.utils import add # noqa
from src.greeting.main import greet # noqa


def test_greet() -> bool:
    """
    test greet
    Args:
        None
    return:
        Value(bool): resultat de l'assert
    """
    assert greet("World") == "Hello, World!"


def test_add() -> bool:
    """
    test addition de deux nombre
    Args:
        None
    return:
        Value(bool): resultat de l'assert
    """
    assert add(5, 7) == 12
