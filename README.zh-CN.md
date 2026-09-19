[English](README.md) · **简体中文**

> 英文版是规范版本。本页与 [README.md](README.md) 不一致时，以英文版为准。

<!-- translation-of: README.md sha256:85bff67189a8b12f -->

<!-- Source: Best-README-Template BLANK_README (Unlicense) — https://github.com/othneildrew/Best-README-Template -->
<a id="readme-top"></a>

# DK_SMPGM

一个基于 CMake 的 C++ 项目，通过一条静态库依赖链把 Main、Game、System、SayHello、module1
和 module2 链接成一个可执行文件，但其中几乎所有代码都被注释掉了，因此程序目前只是构建、
运行、退出，什么也不做。

[![CI](https://github.com/anyingiit/DK_SMPGM/actions/workflows/ci.yml/badge.svg)](https://github.com/anyingiit/DK_SMPGM/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/anyingiit/DK_SMPGM)](LICENSE)

[报告问题](https://github.com/anyingiit/DK_SMPGM/issues/new?template=bug_report.yml) · [提出需求](https://github.com/anyingiit/DK_SMPGM/issues/new?template=feature_request.yml)

<details>
  <summary>目录</summary>
  <ol>
    <li><a href="#about-the-project">关于本项目</a></li>
    <li><a href="#getting-started">开始使用</a></li>
    <li><a href="#usage">用法</a></li>
    <li><a href="#contributing">参与贡献</a></li>
    <li><a href="#license">许可证</a></li>
    <li><a href="#contact">联系方式</a></li>
  </ol>
</details>

## 关于本项目

根目录的 `CMakeLists.txt` 通过一条静态库依赖链构建出一个可执行文件 `V4_DK_SMPGM`：
`src/Main` 依赖 `game_static`（`src/Game/CMakeLists.txt`），后者又依赖 `system_static`
（`src/Game/System`）、`module1_static` 和 `module2_static`；`system_static` 再进一步
依赖由 `src/Game/System/SayHello` 构建出的 `sayHello_static`。

但这套结构目前在运行时几乎什么都不做。`src/Main/src/main.cpp` 里 `main()` 的函数体
除了 `return 0;` 之外全部被注释掉，`src/Game/game.h` 和 `src/Game/System/system.h`
定义的都是空类，`SayHello::hello()`（`src/Game/System/SayHello/src/sayHello.cpp`）
在整个代码树中从未被调用过。唯二没有被注释掉的函数 `module1_hello()` 和
`module2_hello()`（分别在 `src/Game/module1`、`src/Game/module2` 中）也只是各自打印
一行固定文字，同样没有被 `main()` 调用。这个仓库目前提供的，是一套能正常工作的 C++
CMake 构建骨架，而不是一个已经有行为的程序。

计划中的功能与已知问题，见 [open issues](https://github.com/anyingiit/DK_SMPGM/issues)。

## 开始使用

### 环境要求

- CMake 3.16 或更高版本——根目录 `CMakeLists.txt` 中
  `cmake_minimum_required(VERSION 3.16)` 设定的下限
- 一个 C++ 编译器，以及 CMake 能驱动的构建工具（Make、Ninja 或某个 IDE 生成器）；
  构建脚本中没有固定任何 C++ 标准版本，所以近几年的编译器都可以
- 仅在 Linux 和 macOS 上：仓库自带的 `PreLoad.cmake` 会为每一个全新的构建目录强制把
  `CMAKE_GENERATOR` 设为 `MinGW Makefiles`。这个生成器在没有 MinGW 工具链的环境下并不
  存在，因此除非先删除或重命名这个文件，否则 `cmake` 会直接失败——详见"安装"一节。

### 安装

```sh
git clone https://github.com/anyingiit/DK_SMPGM.git
cd DK_SMPGM
rm PreLoad.cmake   # 强制指定 Windows/MinGW 专用生成器；在其他平台上删掉它无妨
cmake -S . -B build
cmake --build build
```

如果是在 Windows 上使用 MinGW，请保留 `PreLoad.cmake`，跳过上面的 `rm` 那一行——
它本来就是为这套工具链准备的。

## 用法

```sh
./build/Bin/V4_DK_SMPGM
```

程序会启动并以状态码 0 退出。目前没有任何可观察到的输出或行为，因为 `main()` 的函数体
已被注释掉；它链接到的那些模块（`module1_hello()`、`module2_hello()`、
`SayHello::hello()`）在代码里是可达的，但都没有被 `main()` 调用。

## 参与贡献

欢迎参与。[CONTRIBUTING.md](CONTRIBUTING.md) 说明如何提交 issue 或 pull request，[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) 说明对所有参与者的行为要求。

请不要在公开的 issue 或 pull request 中报告安全问题。[SECURITY.md](SECURITY.md) 说明了私下报告的方式。

## 许可证

以 MIT 许可证分发。详见 [LICENSE](LICENSE)。

## 联系方式

项目地址：[https://github.com/anyingiit/DK_SMPGM](https://github.com/anyingiit/DK_SMPGM)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
