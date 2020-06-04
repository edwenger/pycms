# CMS From Python Proof of Concept with [Python.NET](https://pythonnet.github.io/)

## Setup

- consider creating a virtual environment with `python -m virtualenv venv`
- activate your virtual environment with `venv\scripts\activate.bat`
- install requirements (Python.NET and Matplotlib) with `pip install -r requirements.txt`

## Execution

- run the simple SEIR model with `python seir.py`

## Ideas for Extension

- Convert trajectory data from the solver to a pandas dataframe.
- `ISolver.Solve()` repeatedly calls `StartRealization()` followed by `SolveOnce()` - expose these calls in `ISolver`.
- `SolveOnce()` calls `StepOnce()` while `CurrentTime < duration` followed by `trajectories.RecordObservables()` - expose `StepOnce()` in `ISolver` and `RecordObservables()` (TBD)
- Expose `SolverBase.model` to Python code to inspect state.

### Additional Extensions

- Creating the textual representation of the model and loading it with the EMODL parser is a little clunky. Consider wrapping a Python class around the `ModelBuilder` and its various parts, e.g. `SpeciesDescription`, in order to build the model directly.

### [Mono](https://www.mono-project.com/)

- Investigate building `compartments` with Mono on macOS &| Linux.
- Verify that Python.NET on macOS &| Linux works with Mono version of `compartments`
- Might need [IronScheme](https://github.com/IronScheme/IronScheme) to compile against Mono if we don't have "Additional Extensions" above.

### [.NET Core](https://docs.microsoft.com/en-us/dotnet/core/)

- Investigate building `compartments` with .NET Core on macOS &| Linux.
- Look for Python.NET to [support .NET Core](https://github.com/pythonnet/pythonnet/issues/984)
- Might need [IronScheme](https://github.com/IronScheme/IronScheme) to compile against .NET Core if we don't have "Additional Extensions" above.
