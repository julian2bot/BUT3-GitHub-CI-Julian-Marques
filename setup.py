from setuptools import setup, find_packages

setup(
    name='my_project',  # Remplacez par le nom de votre projet
    version='0.1',  # Remplacez par la version de votre projet
    packages=find_packages(where='src'),
    package_dir={'': 'src'},
    install_requires=[
        # Ajoutez ici les dépendances de votre projet
        # Par exemple: 'requests', 'numpy',
    ],
    entry_points={
        'console_scripts': [
            # Si vous avez des scripts exécutables, définissez-les ici
            # Exemple: 'my_command=my_package.module:function',
        ],
    },
)
