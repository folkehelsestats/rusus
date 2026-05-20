# R/05_render_report.R
#
# Renders the Quarto audit report (audit_report.qmd) to a
# self-contained HTML file after the cleaning pipeline has run.
#
# This script can be:
#   - Sourced at the end of 04_orchestrate.R  (automatic)
#   - Run standalone at any time              (manual re-render)
#
# Requirements:
#   install.packages("quarto")   # R interface to Quarto CLI
#   # Quarto CLI must also be installed: https://quarto.org/docs/get-started/

# ------------------------------------------------------------------
# render_audit_report()
#
# Arguments:
#   log_dir     : path to the folder containing match_log_MASTER.csv
#   output_dir  : where to write the rendered HTML file
#   open_browser: if TRUE, opens the report in the default browser
#                 after rendering (useful during development)
# ------------------------------------------------------------------
render_audit_report <- function(log_dir      = "logs/matching",
                                output_dir   = "reports",
                                open_browser = interactive()) {
  
  # ---- Validate that the master log exists before rendering ----------
  master_path <- file.path(log_dir, "match_log_MASTER.csv")
  if (!file.exists(master_path)) {
    stop(sprintf(
      paste0(
        "Cannot render report: master log not found at '%s'.\n",
        "Run the cleaning pipeline (04_orchestrate.R) first."
      ),
      master_path
    ))
  }
  
  # ---- Ensure output directory exists --------------------------------
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
    message(sprintf("Created output directory: %s", output_dir))
  }
  
  # ---- Locate the .qmd template -------------------------------------
  # By default, look for audit_report.qmd in the project root.
  # Adjust this path if you move the .qmd file elsewhere.
  qmd_path <- "audit_report.qmd"
  if (!file.exists(qmd_path)) {
    stop(sprintf(
      "Quarto template not found at '%s'. Check the file location.", qmd_path
    ))
  }
  
  # ---- Build output filename with timestamp -------------------------
  timestamp   <- format(Sys.time(), "%Y%m%d_%H%M")
  output_file <- file.path(output_dir, sprintf("audit_report_%s.html", timestamp))
  
  # ---- Render via quarto package ------------------------------------
  # quarto::quarto_render() calls the Quarto CLI under the hood.
  # execute_params passes R values into the params: block in the .qmd.
  # output_file controls where the HTML is written.
  
  cat("\n── Rendering audit report ──────────────────────────────────\n")
  cat(sprintf("  Template  : %s\n", qmd_path))
  cat(sprintf("  Log dir   : %s\n", log_dir))
  cat(sprintf("  Output    : %s\n", output_file))
  cat("  Please wait...\n\n")
  
  quarto::quarto_render(
    input          = qmd_path,
    output_file    = output_file,
    execute_params = list(log_dir = log_dir),  # passed to params: in .qmd
    quiet          = FALSE
  )
  
  # ---- Confirm success -----------------------------------------------
  if (file.exists(output_file)) {
    size_kb <- round(file.size(output_file) / 1024, 1)
    cat(sprintf("\n✔ Report rendered successfully: %s (%.1f KB)\n",
                output_file, size_kb))
    
    # Optionally open in browser (only in interactive R sessions)
    if (open_browser) {
      browseURL(output_file)
    }
  } else {
    warning("Rendering appeared to complete but output file was not found.")
  }
  
  invisible(output_file)  # return path for downstream use
}


# ------------------------------------------------------------------
# Quick standalone usage:
# Rscript R/05_render_report.R
# ------------------------------------------------------------------
if (!interactive() && identical(sys.calls(), list())) {
  render_audit_report()
}
