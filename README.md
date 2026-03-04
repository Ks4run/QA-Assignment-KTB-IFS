# Robot Framework | Browser Library

UI automation project built with **Robot Framework** and **Browser Library (Playwright)**.
Dependencies are managed using **uv** for fast and reproducible environments.

---

## Tech Stack

- Robot Framework
- robotframework-browser (Playwright)
- Python
- uv

---

## Project Structure

```
.
├── tests/
├── results/
├── pyproject.toml
└── README.md
```

---

## Prerequisites

- Python 3.10+
- uv

Install uv

```
brew install uv
```

or

```
curl -Ls https://astral.sh/uv/install.sh | sh
```

---

## Setup

Clone repository

```
git clone https://github.com/Ks4run/QA-Assignment-KTB-IFS.git
cd QA-Assignment-KTB-IFS
```

Install dependencies

```
uv sync
```

Install browser binaries

```
uv run rfbrowser init
```

---

## Run Tests
Run with output directory

```
robot -d results tests/odt-merchandise.robot | uv run robot -d results tests/odt-merchandise.robot
```

---

## Test Report

After execution:

```
results/
├── log.html
├── report.html
└── output.xml
```

Open report

```
results/report.html
```
