package main

import (
  "fmt"
  "os"
  "os/exec"
  "encoding/json"
  "sort"
)

// Structure of the workspace json
type Workspace struct {
  Id int `json:"id"`
  Name string `json:"name"`
  Windows int `json:"windows"`
}

// Structure of the window json
type Window struct {
  Title string `json:"title"`
}

// Returns a list of workspaces
func getWorkspaces() string {
  // Fetch workspaces from hyprland
  cmd := exec.Command("hyprctl", "-j", "workspaces")
  output, err := cmd.Output()

  // Error handling
  if err != nil {
    fmt.Println("Could not fetch workspace list: %s\n", err)
    os.Exit(1)
  }

  // Converting to readable json
  var workspaces []Workspace
  err = json.Unmarshal([]byte(output), &workspaces)

  // Error handling
  if err != nil {
    fmt.Printf("Could not parse json: %s\n", err)
    os.Exit(1)
  }

  // Sorting workspace by id
  sort.Slice(workspaces, func(i, j int) bool {
    return workspaces[i].Id < workspaces[j].Id
  })

  // Converting back to string
  returnData, err := json.MarshalIndent(workspaces, "", " ")

  // Error handling
  if err != nil {
    fmt.Printf("Could not convert json to string: %s\n", err)
    os.Exit(1)
  }

  // Returning string of workspaces
  return string(returnData)
}

// Returns the current active workspace
func getActiveWorkspace() string {
  // Feching active workspace from hyprland
  cmd := exec.Command("hyprctl", "-j", "activeworkspace")
  output, err := cmd.Output()

  // Error handling
  if err != nil {
    fmt.Println("Could not fetch active workspace: %s\n", err)
    os.Exit(1)
  }

  // Return ouput
  return string(output)
}

// Returns the active window
func getActiveWindow() string {
  // Fetching active window from hyprland
  cmd := exec.Command("hyprctl", "-j", "activewindow")
  output, err := cmd.Output()
  
  // Error handling
  if err != nil {
    fmt.Printf("Could not fetch active window: %s\n", err)
    os.Exit(1)
  }

  // Converting json to readable
  var window Window
  err = json.Unmarshal([]byte(output), &window)

  // Error handling
  if err != nil {
    fmt.Printf("Could not parse json: %s\n", err)
    os.Exit(1)
  }

  // Converting back to string
  returnData, err := json.MarshalIndent(window, "", " ")

  // Error handling
  if err != nil {
    fmt.Printf("Could not convert json to string: %s\n", err)
    os.Exit(1)
  }

  // Returning string
  return string(returnData)
}

// Sets the active workspace
func postWorkspace(id string) string {
  // Sending command
  cmd := exec.Command("hyprctl", "dispatch", "workspace", id)
  output, err := cmd.Output()

  // Error handling
  if err != nil {
    fmt.Println("Could not switch workspaces: %s\n", err)
    os.Exit(1)
  }

  return string(output)
}

// Main function
func main() {
  // Fetching arguments
  args := os.Args

  // No arguments provided
  if len(args) < 2 {
    fmt.Println("No arguments provided")
    os.Exit(1)
  }
  
  // Parsing arguments
  switch args[1] {
  case "getWorkspaces":
    fmt.Println(getWorkspaces())
  case "getActiveWorkspace":
    fmt.Println(getActiveWorkspace())
  case "getActiveWindow":
    fmt.Println(getActiveWindow())
  case "postWorkspace":
    fmt.Println(postWorkspace(args[2]))
  default: // Unknown argument
    fmt.Printf("Unknown query \"%s\"\n", args[1])
    os.Exit(1)
  }
}
