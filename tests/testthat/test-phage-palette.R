test_that("default palettes return expected lengths", {
  expect_length(phage_palette(3, mode = "soft"), 3)
  expect_length(phage_palette(8, mode = "vivid"), 8)
  expect_length(phage_palette(8, mode = "forest"), 8)
  expect_length(phage_palette(8, mode = "mineral"), 8)
  expect_length(phage_palette(8, mode = "ocean"), 8)
  expect_length(phage_palette(8, mode = "retro"), 8)
  expect_length(phage_palette(8, mode = "cinema"), 8)
  expect_length(phage_palette(8, mode = "mist"), 8)
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
})

test_that("n above current MVP limit errors", {
  expect_error(phage_palette(9, mode = "soft"), "supports up to 8")
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
