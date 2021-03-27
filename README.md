## Things Needed to Work

---

### Common Requirements

- CMake version <= 3.14
- Python
  - in path
  - both version 3 and 2 work
- xxd
  - in path
  - included in GCC
    - Windows users can get it through:
      - VIM
      - Git (which includes VIM, and xxd)
      - search "xxd.exe" on PC to find where it is
- Ninja
  - add to path
  - optional, but recommended

### Windows Requirements

- Visual Studio 2019 (Build Tools/Community)
  - another compiler may work, but untested

### Linux Requirements

- please see note at the bottom about GLFW
- currently untested on Linux
  - should work with a compiler of choice
  - if not, please report

## Build + Run

---

### Configure

Configure by running `cmake -B build`. A generator can be optionally specified using `-G <generator_name>`. Check `cmake --help` for a list of available generators for your computer system. If you're using Ninja as I am, you'd run:

```
cmake -G Ninja -B build
```

Otherwise,

```
cmake -G "Visual Studio 2019" -B build
```

or simply:

```
cmake -B build
```

if you're on a \*NIX system, or would like to let CMake decide.

### Build

`cmake --build build` should do the trick, regardless of generator. If you're using Ninja, you can alternatively use `ninja -C build` to accomplish the same task.

#### **Run** `build/glfw_glad_test` (`.exe` on Windows)

## Note to **Linux Users**

---

Please note that I haven't linked the right libraries for Linux. GLFW is currently only linked using the `glfw3dll` target, as I don't know the correct library to link against on Linux.
