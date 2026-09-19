<!-- Source: Best-README-Template BLANK_README (Unlicense) — https://github.com/othneildrew/Best-README-Template -->
<a id="readme-top"></a>

# DK_SMPGM

A CMake-based C++ project that links Main, Game, System, SayHello, module1 and module2 into one executable through a chain of static libraries, but nearly all of that code is commented out, so the program currently builds and exits without doing anything.

**English** · [简体中文](README.zh-CN.md)

[![CI](https://github.com/anyingiit/DK_SMPGM/actions/workflows/ci.yml/badge.svg)](https://github.com/anyingiit/DK_SMPGM/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/anyingiit/DK_SMPGM)](LICENSE)

[Report a bug](https://github.com/anyingiit/DK_SMPGM/issues/new?template=bug_report.yml) · [Request a feature](https://github.com/anyingiit/DK_SMPGM/issues/new?template=feature_request.yml)

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Project

The root `CMakeLists.txt` builds a single executable, `V4_DK_SMPGM`, out of a chain of
static libraries: `src/Main` depends on `game_static` (`src/Game/CMakeLists.txt`), which
in turn depends on `system_static` (`src/Game/System`), `module1_static` and
`module2_static`. `system_static` further depends on a `sayHello_static` library built
from `src/Game/System/SayHello`.

Almost none of that structure does anything at runtime yet. `src/Main/src/main.cpp`'s
`main()` body is entirely commented out except for `return 0;`, `src/Game/game.h` and
`src/Game/System/system.h` define empty classes, and `SayHello::hello()`
(`src/Game/System/SayHello/src/sayHello.cpp`) is never called from anywhere in the tree.
The two functions that are not commented out, `module1_hello()` and `module2_hello()`
(`src/Game/module1`, `src/Game/module2`), each just print a fixed line and are likewise
never invoked from `main()`. What this repository currently is, is a working CMake
build skeleton for a C++ project, not yet a program with behavior.

See the [open issues](https://github.com/anyingiit/DK_SMPGM/issues) for planned features and known issues.

## Getting Started

### Prerequisites

- CMake 3.16 or newer — the floor set by `cmake_minimum_required(VERSION 3.16)` in the
  root `CMakeLists.txt`
- A C++ compiler and a build tool CMake can drive (Make, Ninja, or an IDE generator);
  no C++ standard is pinned anywhere in the build, so any recent compiler will do
- On Linux and macOS only: the repository ships `PreLoad.cmake`, which forces
  `CMAKE_GENERATOR` to `MinGW Makefiles` for every fresh build directory. That generator
  does not exist outside a MinGW toolchain, so `cmake` fails immediately unless this
  file is removed or renamed first — see Installation.

### Installation

```sh
git clone https://github.com/anyingiit/DK_SMPGM.git
cd DK_SMPGM
rm PreLoad.cmake   # forces a Windows/MinGW-only generator; harmless to remove elsewhere
cmake -S . -B build
cmake --build build
```

On Windows with MinGW, keep `PreLoad.cmake` and skip the `rm` line; that is the
toolchain it was written for.

## Usage

```sh
./build/Bin/V4_DK_SMPGM
```

The program starts and exits with status 0. It has no observable output or behavior
yet, because `main()`'s body is commented out; the modules it links against
(`module1_hello()`, `module2_hello()`, `SayHello::hello()`) are reachable from code but
not called from `main()`.

## Contributing

Contributions are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) for how to open an issue or a pull request, and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for the standards expected of everyone taking part.

Please do not report security issues in public issues or pull requests. [SECURITY.md](SECURITY.md) explains how to report them privately.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for details.

## Contact

Project link: [https://github.com/anyingiit/DK_SMPGM](https://github.com/anyingiit/DK_SMPGM)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
