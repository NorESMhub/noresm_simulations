# noresm3_dev_simulations

The noresm3_dev_simulations repository is dedicated to **development of new cases for NorESM3** including for NorESM3 component models.

The idea for this repository was stolen shamelessly from the [NCAR amwg_dev repo](https://github.com/NCAR/amwg_dev).

## To start a new development simulation, follow the Wiki instructions
https://github.com/NorESMhub/noresm3_dev_simulations/wiki

- Workflow for including development in NorESM tag version
- Workflow for running coupled NorESM3_0_betaXX simulations on Betzy
- Workflow for producing and managing diagnostics output

## Naming conventions for issues / cases
The title of an issue should be the case name of the simulation, following this format: `Compset.ModelVersionTag.Resolution.IssueNr.Date`

For example: `n1850.n30b22LM.499.20260901`

The components of the name are:
- `n1850` — the compset.
- `n30` — NorESM3.0.
- `b22` — beta22.
- `LM` — the `ne16pg3_tn14` resolution.
- `499` — the issue number.
- `20260901` — the date, in `YYYYMMDD` format.
  
Thus, issue titles should follow the same naming convention as the corresponding simulation case name.

## Discussions
Discussions relevant to NorESM3 development and preparation for CMIP7 could be posted under [Discussions](https://github.com/NorESMhub/noresm3_dev_simulations/discussions).

- Discussions provide you with the ability to directly engage with other developers while staying on GitHub.
- To ensure that the conversation remains productive and helpful, please keep your discussions organized by using relevant titles, applying labels, and refraining from mixing topics.

## Documentation
The `doc/` folder is intended for documentation that is relevant for the model development. Once the NorESM3 model is finalized, a more extensive documentation will be provided in the [NorESM-docs](https://github.com/NorESMhub/NorESM-docs) repository.

- [Model performance for different PE layouts](https://github.com/NorESMhub/noresm3_dev_simulations/blob/main/doc/NorESM3_performance.csv)
