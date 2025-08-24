# Romanian Stations

A NewGRF with romanian-inspired railway stations for OpenTTD.

## How to build from source
Make sure you have installed:
- [`nmlc`](https://github.com/OpenTTD/nml), the NML compiler
- `make`
- `php` - the PHP interpreter, version 8 or newer

Run `make`, and the grf file `romanian-stations.grf` will be generated.
You can run `make install` to copy the file to the OpenTTD user NewGRF's directory (may require special configuration on other systems besides Linux).

Some programs and flags can be overriden.
Refer to the `Makefile` and its variables.

### Code architecture
- `src/` - directory with partial NML source files
    - `src/main.pnml` - entrypoint, will be compiled into a whole NML file (that will be placed in `src`'s parent directory) by the PHP interpreter
- `img/` - directory with images that are used in the NewGRF.
- `lang/` - language files
