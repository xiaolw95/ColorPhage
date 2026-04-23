test_that("default palettes return expected lengths", {
  expect_length(phage_palette(3, mode = "soft"), 3)
  expect_length(phage_palette(8, mode = "vivid"), 8)
  expect_length(phage_palette(10, mode = "soft"), 10)
  expect_length(phage_palette(12, mode = "vivid"), 12)
  expect_length(phage_palette(8, mode = "forest"), 8)
  expect_length(phage_palette(10, mode = "forest"), 10)
  expect_length(phage_palette(8, mode = "mineral"), 8)
  expect_length(phage_palette(12, mode = "mineral"), 12)
  expect_length(phage_palette(8, mode = "ocean"), 8)
  expect_length(phage_palette(10, mode = "ocean"), 10)
  expect_length(phage_palette(8, mode = "retro"), 8)
  expect_length(phage_palette(12, mode = "retro"), 12)
  expect_length(phage_palette(8, mode = "cinema"), 8)
  expect_length(phage_palette(10, mode = "cinema"), 10)
  expect_length(phage_palette(8, mode = "mist"), 8)
  expect_length(phage_palette(12, mode = "mist"), 12)
})

test_that("palette ids and variants resolve", {
  expect_identical(
    phage_palette(2, palette = "soft_breeze"),
    c("#0C9A89", "#74BDB0")
  )
  expect_identical(
    phage_palette(2, mode = "vivid", variant = "drama"),
    c("#415A80", "#4B6A97")
  )
  expect_identical(
    phage_palette(2, mode = "forest", variant = "canopy"),
    c("#23483A", "#6F8F62")
  )
  expect_identical(
    phage_palette(2, palette = "forest_ember"),
    c("#1F3F35", "#496B57")
  )
  expect_identical(
    phage_palette(2, mode = "mineral", variant = "slate"),
    c("#26384A", "#536879")
  )
  expect_identical(
    phage_palette(2, palette = "mineral_oxide"),
    c("#2B3F4A", "#4E6B73")
  )
  expect_identical(
    phage_palette(2, mode = "ocean", variant = "current"),
    c("#1F4E5F", "#337A84")
  )
  expect_identical(
    phage_palette(2, palette = "ocean_depth"),
    c("#123B4A", "#245E70")
  )
  expect_identical(
    phage_palette(2, mode = "retro", variant = "film"),
    c("#4A4E46", "#6F7764")
  )
  expect_identical(
    phage_palette(2, palette = "retro_signal"),
    c("#3F4A46", "#697464")
  )
  expect_identical(
    phage_palette(2, mode = "cinema", variant = "noir"),
    c("#1F2A36", "#3C4E63")
  )
  expect_identical(
    phage_palette(2, palette = "cinema_velvet"),
    c("#2A2632", "#51455E")
  )
  expect_identical(
    phage_palette(2, mode = "mist", variant = "cloud"),
    c("#8CA0B3", "#B3C0C9")
  )
  expect_identical(
    phage_palette(2, palette = "mist_shell"),
    c("#95A7A0", "#B9C7C1")
  )
  expect_identical(
    phage_palette(10, mode = "soft")[c(1, 6, 10)],
    c("#6F8EA8", "#E2C788", "#F3B1A6")
  )
  expect_identical(
    phage_palette(12, mode = "ocean")[c(1, 8, 12)],
    c("#153C4A", "#5E89A9", "#B6635C")
  )
})

test_that("unsupported palette sizes error clearly", {
  expect_error(phage_palette(9, palette = "soft_breeze"), "currently supports up to 8")
  expect_error(phage_palette(13, mode = "soft"), "supports up to 12")
})

test_that("available palette metadata includes current branches", {
  ids <- available_phage_palettes()$palette_id
  expect_true(all(c(
    "soft_harbor", "vivid_core", "vivid_drama",
    "forest_canopy", "mineral_slate", "ocean_current", "retro_film",
    "cinema_noir", "mist_cloud"
  ) %in% ids))
})

test_that("theme_phage returns a ggplot2 theme", {
  skip_if_not_installed("ggplot2")

  theme_obj <- theme_phage()

  expect_s3_class(theme_obj, "theme")
})

test_that("clustered large-scale palettes return expected lengths", {
  cols <- phage_large_palette(n = 24, strategy = "clustered", family = "ocean")

  expect_length(cols, 24)
  expect_true(all(grepl("^#", cols)))
})

test_that("hierarchical large-scale palettes return named vectors", {
  labels <- paste0("Subtype_", 1:12)
  groups <- rep(c("A", "B", "C"), each = 4)
  cols <- phage_large_palette(
    labels = labels,
    groups = groups,
    strategy = "hierarchical",
    family = "forest"
  )

  expect_length(cols, 12)
  expect_identical(names(cols), labels)
})

test_that("tail collapse preserves top labels and collapses others", {
  collapsed <- phage_collapse_tail(
    labels = c("A", "B", "C", "D", "E"),
    values = c(10, 8, 2, 1, 1),
    top_n = 3
  )

  expect_identical(collapsed, c("A", "B", "C", "Other", "Other"))
})

test_that("continuous palettes return expected lengths", {
  cols <- phage_continuous_palette(9, family = "ocean")

  expect_length(cols, 9)
  expect_true(all(grepl("^#", cols)))
})

test_that("diverging palettes return expected lengths", {
  cols <- phage_diverging_palette(11, family = "mineral")

  expect_length(cols, 11)
  expect_true(all(grepl("^#", cols)))
})

test_that("continuous and diverging scales return ggplot objects", {
  skip_if_not_installed("ggplot2")

  continuous_scale <- scale_colour_continuous_phage(family = "ocean")
  diverging_scale <- scale_fill_diverging_phage(family = "mineral")

  expect_s3_class(continuous_scale, "Scale")
  expect_s3_class(diverging_scale, "Scale")
})
