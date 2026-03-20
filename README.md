# test_vlastnich_lib

Test repository for experimenting with custom C++ libraries (mainly PlajaLogger).

This project exists purely for testing, integration, and sanity checks.
Yes, it's a bit of a playground. That's the point 😄

---

## 🧪 Purpose

* Test custom-built libraries (.dll / .so)
* Verify linking works across Windows and Linux
* Quick environment for debugging integration issues

---

## 📦 Dependencies

### Windows

* CMake (>= 3.20)
* Visual Studio Build Tools 2022 (C++ workload)

Install:

```powershell
winget install Kitware.CMake
winget install Microsoft.VisualStudio.2022.BuildTools
```

---

### Linux / WSL

* g++
* make
* cmake

Install:

```bash
sudo apt update
sudo apt install build-essential cmake
```

---

## 📁 Project Structure (important parts)

```
windows_libs/
└── plaja_logger/
    ├── PlajaLogger.h
    ├── plaja_logger.dll
    └── plaja_logger.lib

linux_libs/
└── plaja_logger/
    ├── PlajaLogger.h
    └── libplaja_logger.so
```

👉 Libraries are expected to be pre-built and placed here.

---

## 🚀 Build & Run

### Windows

```powershell
.\BuildWindows.ps1
```

Output:

```
Builds/WindowsBuild/
├── test_vlastnich_lib.exe
├── plaja_logger.dll
└── plaja_logger.lib
```

Run:

```powershell
.\Builds\WindowsBuild\test_vlastnich_lib.exe
```

---

### Linux

```bash
chmod +x BuildLinux.sh
./BuildLinux.sh
```

Output:

```
Builds/LinuxBuild/
├── test_vlastnich_lib
└── libplaja_logger.so
```

Run:

```bash
./Builds/LinuxBuild/test_vlastnich_lib
```

---

## ⚠️ Important Notes

* The `.dll` / `.so` **must be next to the executable**
* Headers are required at compile time
* If linking fails → check:

    * correct architecture (x64 vs x86)
    * same compiler family (MSVC vs MinGW 💀)

---

## 🧠 Typical Problems (aka pain log)

### ❌ "undefined reference"

→ Wrong `.lib` / `.so` or compiler mismatch

### ❌ "cannot find PlajaLogger.h"

→ include path is wrong (check CMake)

### ❌ DLL not found at runtime

→ not copied next to `.exe`

---

## 💀 Disclaimer

This is not production code.
This is a **testing battlefield**.

Things may break.
That’s literally why this repo exists.

---

## ❤️ Author

Martin Krepčík
(aka "why doesn't this link" specialist)

#ChatGpt README a nestydím se za to :)