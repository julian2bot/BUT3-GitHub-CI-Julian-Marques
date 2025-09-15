""" module main """


def greet(name: str) -> str:
    """
    Renvoi Hello, et le nom donné en param
    Args:
        name (str): nom a saluer
    return:
        Value(str): salutation a param name
    """
    return f"Hello, {name}!"


if __name__ == "__main__":  # pragma: no cover
    print(greet("GitLab CI/CD"))
