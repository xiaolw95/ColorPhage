# ColorPhage

ColorPhage is an early-stage R package for high-aesthetic scientific figure palettes. The current MVP includes simple `soft` and `vivid` modes plus the advanced `forest`, `mineral`, `ocean`, `retro`, `cinema`, and `mist` families for publication-oriented discrete colour palettes.

## Current Scope

- `phage_palette()` returns colour vectors.
- `phage_continuous_palette()` and `phage_diverging_palette()` cover gradients, heatmaps, and centered quantitative displays.
- `scale_color_phage()` and `scale_fill_phage()` provide ggplot2 discrete scales.
- `theme_phage()` provides a matching ggplot2 publication theme.
- The MVP includes 24 confirmed `n = 8` palettes.
- The eight default palettes now include structured `n = 10 / 12` extensions.
- Experimental helpers now cover `20-30` category scenarios through clustered and hierarchical strategies.
- The first six advanced families, `forest`, `mineral`, `ocean`, `retro`, `cinema`, and `mist`, are implemented.
- Continuous palettes and diverging palettes are now available in a first implementation.
- Prompt-based generation is still planned but not implemented yet.

## Installation

This package is currently local-development only.

```r
# From the parent directory:
# install.packages("remotes")
remotes::install_local("ColorPhage")
```

## Usage

```r
library(ColorPhage)

phage_palette(6, mode = "soft")
scale_color_phage(mode = "vivid")
theme_phage()
phage_continuous_palette(9, family = "ocean")

```

## Recommended Quick Starts

For most figures, the recommended starting points are:

```r
library(ggplot2)
library(ColorPhage)

# Discrete groups
ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "vivid") +
  theme_phage()

# Continuous value mapping
ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
  geom_point(size = 3) +
  scale_colour_continuous_phage(family = "ocean") +
  theme_phage()

# Signed quantitative effects
ggplot(mtcars, aes(wt, mpg, colour = mpg - mean(mpg))) +
  geom_point(size = 3) +
  scale_colour_diverging_phage(family = "mineral") +
  theme_phage()
```

## More Examples

```r
library(ColorPhage)

phage_palette(5, mode = "soft")
phage_palette(8, mode = "vivid", variant = "drama")
phage_palette(8, mode = "forest", variant = "canopy")
phage_palette(8, mode = "mineral", variant = "slate")
phage_palette(8, mode = "ocean", variant = "current")
phage_palette(8, mode = "retro", variant = "film")
phage_palette(8, mode = "cinema", variant = "noir")
phage_palette(8, mode = "mist", variant = "cloud")
phage_palette(8, palette = "soft_harbor")
phage_palette(10, mode = "soft")
phage_palette(12, mode = "vivid")
phage_palette(12, mode = "forest")
phage_continuous_palette(9, family = "ocean")
phage_diverging_palette(11, family = "mineral")
phage_large_palette(24, strategy = "clustered", family = "ocean")
phage_collapse_tail(
  labels = c("A", "B", "C", "D", "E"),
  values = c(10, 8, 2, 1, 1),
  top_n = 3
)
```

With ggplot2:

```r
library(ggplot2)
library(ColorPhage)

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "vivid") +
  theme_phage()

ggplot(mtcars, aes(factor(cyl), fill = factor(cyl))) +
  geom_bar() +
  scale_fill_phage(mode = "soft") +
  theme_phage()

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "forest")

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "mineral")

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "ocean")

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "retro")

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "cinema")

ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_phage(mode = "mist") +
  theme_phage(grid = "none")

ggplot(mtcars, aes(wt, mpg, colour = mpg)) +
  geom_point(size = 3) +
  scale_colour_continuous_phage(family = "ocean") +
  theme_phage()

ggplot(mtcars, aes(wt, mpg, colour = mpg - mean(mpg))) +
  geom_point(size = 3) +
  scale_colour_diverging_phage(family = "mineral") +
  theme_phage()
```

## Available Palettes

```r
available_phage_palettes()
```

Current palette IDs:

- `soft_breeze`
- `soft_harbor`
- `soft_mist`
- `vivid_core`
- `vivid_fresh`
- `vivid_drama`
- `forest_canopy`
- `forest_moss`
- `forest_ember`
- `mineral_slate`
- `mineral_quartz`
- `mineral_oxide`
- `ocean_current`
- `ocean_glass`
- `ocean_depth`
- `retro_film`
- `retro_paper`
- `retro_signal`
- `cinema_noir`
- `cinema_marquee`
- `cinema_velvet`
- `mist_cloud`
- `mist_lilac`
- `mist_shell`

Default mappings:

- `mode = "soft"` uses `soft_harbor`
- `mode = "vivid"` uses `vivid_core`
- `mode = "forest"` uses `forest_canopy`
- `mode = "mineral"` uses `mineral_slate`
- `mode = "ocean"` uses `ocean_current`
- `mode = "retro"` uses `retro_film`
- `mode = "cinema"` uses `cinema_noir`
- `mode = "mist"` uses `mist_cloud`

## Development Notes

The current MVP supports:

- up to `n = 12` for the eight default palettes
- mainly up to `n = 8` for other discrete palettes

High-cardinality support is intentionally structured rather than interpolated.

Project planning and palette design notes are kept in `docs/`.

The first `theme_phage()` release focuses on:

- warm off-white backgrounds
- restrained grid lines
- cleaner titles and legends
- compatibility with the current discrete palette system

The first high-cardinality release currently supports `n = 10 / 12` for the
default palettes only:

- `soft_harbor`
- `vivid_core`
- `forest_canopy`
- `mineral_slate`
- `ocean_current`
- `retro_film`
- `cinema_noir`
- `mist_cloud`

For `20-30` categories, ColorPhage now recommends strategy helpers instead of
flat colour enumeration. These helpers should currently be treated as
experimental advanced interfaces:

- `phage_large_palette(..., strategy = "clustered")`
- `phage_large_palette(..., strategy = "hierarchical")`
- `phage_collapse_tail()` for long-tail composition plots

Use them when:

- many labels must remain visible in a clustered or grouped figure
- labels have a parent-child grouping structure
- a composition plot has a long tail that should be collapsed into `Other`

Avoid treating them as:

- direct replacements for `phage_palette(n = 20+)`
- guarantees that every 20-30 category figure should stay fully expanded

For quantitative gradients and heatmap-like displays, ColorPhage now also
provides:

- `phage_continuous_palette()`
- `phage_diverging_palette()`
- `scale_colour_continuous_phage()` / `scale_fill_continuous_phage()`
- `scale_colour_diverging_phage()` / `scale_fill_diverging_phage()`

Recommended stable entry points for most users are:

- `phage_palette()`
- `scale_color_phage()` / `scale_fill_phage()`
- `theme_phage()`
- `phage_continuous_palette()` / `phage_diverging_palette()`
- `scale_colour_continuous_phage()` / `scale_fill_continuous_phage()`
- `scale_colour_diverging_phage()` / `scale_fill_diverging_phage()`

## Gallery

The first simple-mode gallery is available at:

- [inst/gallery/simple_modes_gallery.html](inst/gallery/simple_modes_gallery.html)

It is generated by:

```r
source("inst/gallery/build_simple_modes_gallery.R")
```
