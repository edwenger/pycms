# PyCMS Specification

## Milestone 1

### Goals

- Consider modifying Tau-leaping (and R-leaping?) to automatically back-off leap or transition to SSA if species are driven negative over the leap. Exception to "Non-goals" below.

### Non-goals

- Additional features in CMS beyond exposing current functionality (see one possible exception in "Goals")
- Exposing CMS functionality to other scripting languages at this time, notably R, even though this appears to be possible. See [rClr](https://github.com/rdotnet/rClr) package for R.