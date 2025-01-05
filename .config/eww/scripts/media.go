package main

import (
  "fmt"
  "os"
  "os/exec"
  "strings"
  "strconv"
)

// Returnes current volume level
func getVolume() string {
  // Using wireplumber ctl to get volume
  cmd := exec.Command("wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@")
  output, err := cmd.Output()

  // Could net fetch volume error
  if err != nil {
    fmt.Printf("Could not fetch volume: %s\n", err)  
    os.Exit(1)
  }

  // Getting parts of output
  returnValue := ""
  lines := strings.Split(string(output), " ")

  // Getting volume
  if len(lines) > 2 { // Set to zero if muted
    returnValue = "0"
  } else {
    returnValue = lines[1]
  }

  // Triming
  returnValue = strings.TrimRight(returnValue, "\r\n\t ")

  // Convert to 64
  num, err := strconv.ParseFloat(returnValue, 64)

  // Error
  if err != nil {
    fmt.Printf("Error converting volume to number: %s\n", err)
    os.Exit(1)
  }
  
  // Modifying
  returnNum := num * 100
  
  // Reverting
  returnValue = fmt.Sprint(returnNum)

  // Returning volume
  return returnValue
}

func postVolume(volume string) string {
  cmd := exec.Command("wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", volume+"%")

  output, err := cmd.Output()

  if err != nil {
    fmt.Println("Error setting volume: %s\n", err)
    os.Exit(1)
  }

  return string(output)
}

// Returns icon based on volume status
func getVolumeIcon() string {
  volume, err := strconv.ParseFloat(getVolume(), 64)

  if err != nil {
    fmt.Printf("Error converting volume to number: %s\n", err)
    os.Exit(1)
  }

  if volume >= 65 {
    return ""
  } else if volume >= 35 {
    return ""
  } else if volume >= 1 {
    return ""
  }

  return ""
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
  case "getVolume":
    fmt.Println(getVolume())
  case "getIcon":
    fmt.Println(getVolumeIcon())
  case "postVolume":
    fmt.Println(postVolume(args[2]))
  default: // Unknown argument
    fmt.Printf("Unknown query \"%s\"\n", args[1])
    os.Exit(1)
  }
}
