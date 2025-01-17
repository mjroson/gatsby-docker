import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="gatsbyjs-client",
    version="0.0.3",
    author="Matias Roson",
    author_email="matiroson@gmail.com",
    description="Client to working gatsby docker image",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/mjroson/gatsby-docker",
    packages=setuptools.find_packages(),
    entry_points={
        'console_scripts': ['gatsbyjs=gatsbyjs_cli.run:main'],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: Ubuntu 18.04 LTS",
    ],
    python_requires='>=3.6',
)