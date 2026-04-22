test_that("default palettes return expected lengths", {
  expect_length(phage_palette(3, mode = "soft"), 3)
  expect_length(phage_palette(8, mode = "vivid"), 8)
  expect_length(phage_palette(8, mode = "forest"), 8)
  expect_length(phage_palette(8, mode = "mineral"), 8)
  expect_length(phage_palette(8, mode = "ocean"), 8)
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
})

test_that("n above current MVP limit errors", {
  expect_error(phage_palette(9, mode = "soft"), "supports up to 8")
})

test_that("available palette metadata includes current branches", {
  ids <- available_phage_palettes()$palette_id
  expect_true(all(c(
    "soft_harbor", "vivid_core", "vivid_drama",
    "forest_canopy", "mineral_slate", "ocean_current"
  ) %in% ids))
})
