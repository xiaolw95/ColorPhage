#' Generate a ColorPhage palette
#'
#' `phage_palette()` returns a colour vector from the current ColorPhage
#' palette library. The current development version supports the confirmed
#' `soft`, `vivid`, `forest`, `mineral`, `ocean`, `retro`, `cinema`, and
#' `mist` palette branches up to 8 colours.
#'
#' @param n Number of colours to return. Must be between 1 and 8 in the
#'   current MVP.
#' @param mode Palette mode. One of `"soft"`, `"vivid"`, `"forest"`,
#'   `"mineral"`, `"ocean"`, `"retro"`, `"cinema"`, or `"mist"`. Ignored
#'   when `palette` is supplied.
#' @param palette Internal palette id, such as `"soft_harbor"` or
#'   `"vivid_core"` or `"forest_canopy"` or `"mineral_slate"` or
#'   `"ocean_current"` or `"retro_film"` or `"cinema_noir"` or
#'   `"mist_cloud"`. When supplied, it takes priority over `mode` and
#'   `variant`.
#' @param variant Optional variant within a mode, such as `"breeze"`,
#'   `"harbor"`, `"mist"`, `"core"`, `"fresh"`, `"drama"`, `"canopy"`,
#'   `"moss"`, `"ember"`, `"slate"`, `"quartz"`, `"oxide"`, `"current"`,
#'   `"glass"`, `"depth"`, `"film"`, `"paper"`, `"signal"`, `"noir"`,
#'   `"marquee"`, `"velvet"`, `"cloud"`, `"lilac"`, or `"shell"`.
#'
#' @return A character vector of hexadecimal colours.
#' @export
#'
#' @examples
#' phage_palette(5, mode = "soft")
#' phage_palette(8, mode = "vivid", variant = "drama")
#' phage_palette(8, mode = "forest", variant = "canopy")
#' phage_palette(8, mode = "mineral", variant = "slate")
#' phage_palette(8, mode = "ocean", variant = "current")
#' phage_palette(8, mode = "retro", variant = "film")
#' phage_palette(8, mode = "cinema", variant = "noir")
#' phage_palette(8, mode = "mist", variant = "cloud")
phage_palette <- function(n,
                          mode = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist"),
                          palette = NULL,
                          variant = NULL) {
  n <- .validate_n(n)
  palette_id <- .resolve_palette_id(mode = mode, palette = palette, variant = variant)
  colors <- .phage_palettes[[palette_id]]$colors

  colors[seq_len(n)]
}

#' List available ColorPhage palettes
#'
#' @return A data frame with palette metadata.
#' @export
#'
#' @examples
#' available_phage_palettes()
available_phage_palettes <- function() {
  rows <- lapply(.phage_palettes, function(x) {
    data.frame(
      palette_id = x$id,
      mode = x$mode,
      variant = x$variant,
      display_name = x$display_name,
      n_max = length(x$colors),
      role = x$role,
      stringsAsFactors = FALSE
    )
  })

  do.call(rbind, rows)
}

.validate_n <- function(n) {
  if (length(n) != 1 || is.na(n) || !is.numeric(n)) {
    stop("`n` must be a single numeric value.", call. = FALSE)
  }

  n <- as.integer(n)

  if (n < 1) {
    stop("`n` must be at least 1.", call. = FALSE)
  }

  if (n > 8) {
    stop("The current ColorPhage MVP supports up to 8 colours per palette.", call. = FALSE)
  }

  n
}

.resolve_palette_id <- function(mode, palette = NULL, variant = NULL) {
  if (!is.null(palette)) {
    if (!palette %in% names(.phage_palettes)) {
      stop(
        "`palette` must be one of: ",
        paste(names(.phage_palettes), collapse = ", "),
        call. = FALSE
      )
    }

    return(palette)
  }

  mode <- match.arg(mode, choices = names(.phage_mode_defaults))

  if (is.null(variant)) {
    return(.phage_mode_defaults[[mode]])
  }

  matches <- vapply(
    .phage_palettes,
    function(x) identical(x$mode, mode) && identical(x$variant, variant),
    logical(1)
  )

  if (!any(matches)) {
    valid <- vapply(.phage_palettes, function(x) {
      if (identical(x$mode, mode)) x$variant else NA_character_
    }, character(1))
    valid <- valid[!is.na(valid)]

    stop(
      "`variant` for mode \"", mode, "\" must be one of: ",
      paste(valid, collapse = ", "),
      call. = FALSE
    )
  }

  names(.phage_palettes)[matches][[1]]
}
