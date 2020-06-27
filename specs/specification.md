# PyCMS Specification

## Milestone 1

### Definitions

**user** ≡ Python scripter/coder  
**model** ≡ specification of species (compartments), reactions (transitions between compartments with reactants, products, and propensity functions), and coefficients ("parameters" in CMS, e.g. beta and recovery rate)  
**pseudo-species**  ≡ a species/compartment which may be a product or reactant, useful for tracking cumulative events, but does not appear in any propensity calculation

### Goals

- users can instantiate a model, including structure and coefficients, in CMS from text (a string) of EMODL via `LoadEMODLModel( model )`
- users can instantiate a CMS solver (e.g. SSA or τ-leaping), via `CreateSolver()`
- `solver.StartRealization()` is available to users to reset the model state for a solver to initial conditions.
- `solver.StepOnce()` is available to users to advance the state of the system
- users can query the current clock, `t` or τ, via `CurrentTime()` for the active solver
- users can get a reference to the current model via `GetModel()` on the active solver
- users can get a list of species/compartments via the `Species` property on a model
- users can get a list of paramters/coefficients via the `Parameters` property on a model
- users can get/set the current population of a species/compartment via the `Count` property (int)
- users can get/set the current value of a parameter/coefficient via the `Value` property (double)
- users can detect threshold events by a combination of pseudo-species and state inspection

### TBD

- exception/error from invalid model passed into `LoadEMODLModel( model )`
- `StepOnce()` returns a list of reactions and counts for a step rather than firing the selected reactions internally.
- add a method to the CMS model object to get the current state, in aggregate, with a single method call, i.e. the current population of all species/compartments
- modify CMS to save state on every step through time rather than a discrete intervals, additionally implement a method to allow the user to retrieve this state or, alternatively, write this state to a file (which could subsequently be loaded into Python with other APIs)
- consider modifying Tau-leaping (and R-leaping?) to automatically back-off leap or transition to SSA if species are driven negative over the leap. Exception to "Non-goals" below.

### Non-Goals

- CMS events are not surfaced to user code, users are responsible for keeping track of time and/or state in order to trigger state changes
- Species values set via the `Count` property are not constrained to non-negative values, _cave usor_
- Model components, e.g. species/compartment, reactions, and parameters/coefficients, are not individually constructable for building a model piece by piece.
- Additional features in CMS beyond exposing current functionality (see one possible exception in "Goals")
- Exposing CMS functionality to other scripting languages at this time, notably R, even though this appears to be possible. See [rClr](https://github.com/rdotnet/rClr) package for R.

#### Future

- Expose Species, Parameter, Function, Reaction, etc. construction directly to Python (c.f. Model construction)
