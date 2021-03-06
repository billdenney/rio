context("Excel (xlsx) imports/exports")
require("datasets")

test_that("Export to Excel (.xlsx)", {
    expect_true(export(iris, "iris.xlsx") %in% dir())
    expect_true(export(mtcars, "iris.xlsx", which = 2) %in% dir())
})

test_that("Import from Excel (.xlsx)", {
    expect_true(is.data.frame(import("iris.xlsx", readxl = FALSE)))
    expect_true(is.data.frame(import("iris.xlsx", readxl = TRUE)))
    expect_true(is.data.frame(import("iris.xlsx", sheet = 1)))
    expect_true(is.data.frame(import("iris.xlsx", which = 1)))
    expect_true(nrow(import("iris.xlsx", n_max = 42))==42)
    expect_true(is.data.frame(import("iris.xlsx", nrows = 42)))
})

test_that("Import from Excel (.xls)", {
    expect_true(is.data.frame(import(system.file('examples','iris.xls',
                                                 package='rio'))))
    expect_true(is.data.frame(import(system.file('examples','iris.xls',
                                                 package='rio'), sheet = 1)))
    expect_true(is.data.frame(import(system.file('examples','iris.xls',
                                                 package='rio'), which = 1)))
})


unlink("iris.xlsx")
