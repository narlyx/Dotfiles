return {
  "oclay1st/gradle.nvim",
  cmd = { "Gradle", "GradleExec", "GradleInit" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    projects_view = {
      position = "right", -- Example: right or left
      size = 66,
    },
    initializer_view = {
      default_package = '', -- Example: io.github.username
      workspaces = {
        { name = "HOME", path = vim.loop.os_homedir() },
        { name = "CURRENT_DIR", path = vim.fn.getcwd() },
      },
    },
    console = {
      show_command_execution = true,
      show_task_execution = true,
      show_dependencies_load_execution = false,
      show_tasks_load_execution = false,
      show_project_create_execution = false,
      clean_before_execution = true
    },
    gradle_executable = "gradle", -- Example: gradle, ./gradlew or a path to Gradle executable
    custom_commands = {
      -- Example: 
      -- {
      --   name = "lazy",
      --   cmd_args = { "build" },
      --   description = "build the project",
      -- }
      }, 
    project_scanner_depth = 5
  },  -- options, see default configuration
  keys = { { "<Leader>G", "<cmd>Gradle<cr>", desc = "Gradle" } },
}
