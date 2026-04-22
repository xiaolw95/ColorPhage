test_that("default soft and vivid palettes return expected lengths", {
  expect_length(phage_palette(3, mode = "soft"), 3)
  expect_length(phage_palette(8, mode = "vivid"), 8)
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
})

test_that("n above current MVP limit errors", {
  expect_error(phage_palette(9, mode = "soft"), "supports up to 8")
})

test_that("available palette metadata includes current branches", {
  ids <- available_phage_palettes()$palette_id
  expect_true(all(c("soft_harbor", "vivid_core", "vivid_drama") %in% ids))
})

