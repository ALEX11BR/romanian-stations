# Romanian Stations

A NewGRF with nice Romania-inspired railway stations for OpenTTD.

## Features

- Automatic line end buffers
- Visible passengers, depending on the station load, that can "move"
- Single-sided platforms that can be built in one go with alternating sides (this feature is enabled by default)
- Platform info panel that lights up when a train will arrive at the platform
- Station roofs of configurable colours (by default red, can be configured by NewGRF settings to be any of the company colours or the owning company's colour)
- Trackless platforms that enable the creation of stations with platforms of equal width of both the marginal ones and the middle ones

## How to build from source

Make sure you have installed:
- `make`
- `python3` (for the following 2 dependencies)
- [`nmlc`](https://github.com/OpenTTD/nml), the NML compiler, version 0.8.1 or newer (`pip install nml`)
- [`jinja2`](https://pypi.org/project/jinja2-cli/), CLI for the Jinja2 template engine (`pip install jinja2-cli`)

Run `make`, and the grf file `romanian_stations.grf` will be generated.
You can run `make install` to copy the file to the OpenTTD user NewGRF's directory (may require setting the `OPENTTD_USER_DIR` variable on other systems besides Linux).

Some programs and flags can be overriden.
Refer to the `Makefile` and its variables.

### Code architecture

- `src/` - directory with partial NML source files
    - `src/main.pnml` - entrypoint, will be compiled into a whole NML file (that will be placed in `src`'s parent directory) by the PHP interpreter
- `img/` - directory with images that are used in the NewGRF.
- `lang/` - language files

## Glossary

- **Top**, **Bottom** - directions of the screen
    - e.g. in a tile there can be 2 platforms, or buffers - the top one is the one that is placed closer to the top of the screen
- **X** - the game axis that goes `/`
- **Y** - the game axis that goes `\`
