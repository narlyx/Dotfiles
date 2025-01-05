package main

import (
  "fmt"
  "os"
  "strings"
)

func main() {
  file, err := os.Open("/etc/os-release")

  if err != nil {
    fmt.Println("Failed to open /etc/os-release: %s\n", err)
    os.Exit(1)
  }

  defer file.Close()

  var dist string
  var line string
  for {
    _, err := fmt.Fscanf(file, "%s", &line)
    if err != nil {
      break
    }

    if strings.HasPrefix(line, "NAME=") {
      dist = strings.TrimPrefix(line, "NAME=")
      dist = strings.Trim(dist, `"`)
      break
    }
  }

  switch dist {
  case "Arch":
    fmt.Println("󰣇")
  case "Fedora":
    fmt.Println("")
  default:
    fmt.Println("")
  }
}
