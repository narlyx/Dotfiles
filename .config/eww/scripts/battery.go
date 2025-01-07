package main

import (
  "fmt"
  "os"
  "os/exec"
  "strings"
  "math"
  "strconv"
)

// Returns first battery listed on system
func getBattery() string {
  cmd := exec.Command("ls", "/sys/class/power_supply")
  output, err := cmd.Output()

  if err != nil {
    fmt.Printf("Error fetching current battery: %s\n", err)
    os.Exit(1)
  }

  lines := strings.Split(string(output), "\n")

  for _, psu := range lines {
    if strings.HasPrefix(psu, "BAT") {
      return psu
    }
  }

  return "nil"
}

// Returns current battery capacity
func getPercent() string {
  battery := getBattery()

  if battery == "nil" {
    return "nil"
  }

  cmd := exec.Command("cat", "/sys/class/power_supply/"+battery+"/capacity")
  output, err := cmd.Output()

  if err != nil {
    fmt.Printf("Error fetching battery capacity: %s\n", err)
    os.Exit(1)
  }

  returnValue := strings.TrimRight(string(output), "\r\n\t ")


  return returnValue
}

// Returns current battery state
func getState() string {
  battery := getBattery()

  if battery == "nil" {
    return "nil"
  }

  cmd := exec.Command("cat", "/sys/class/power_supply/"+battery+"/status")
  output, err := cmd.Output()

  if err != nil {
    fmt.Printf("Error fetching battery status: %s\n", err)
    os.Exit(1)
  }

  returnValue := strings.TrimRight(string(output), "\r\n\t ")

  return returnValue
}

// Returns an icon that resembles the batterys stae and charge
func getIcon() string {
  // Casting battery percent
  stringPercent := getPercent()

  // If nil
  if stringPercent == "nil" {
    return "󱉞"
  }

  percent, err := strconv.ParseFloat(stringPercent, 64)

  // Error handling
  if err != nil {
    fmt.Println("Unable to convert percent to a float: %s\n", err)
    os.Exit(1)
  }

  // Icon table
  dischargeIcons := []string{"󰂎","󰁺","󰁻","󰁼","󰁽","󰁾","󰁿","󰂀","󰂁","󰂂","󰁹"}
  chargeIcons := []string{"󰢟","󰢜","󰂆","󰂇","󰂈","󰢝","󰂉","󰢞","󰂊","󰂋","󰂅"}
  
  // Selecting correct icon table for status
  var targetList *[]string
  if getState() == "Discharging" {
    targetList = &dischargeIcons
  } else {
    targetList = &chargeIcons
  }

  // Getting closest icon to battery percentage
  increment := float64(len(*targetList)-1)/100
  icon := (*targetList)[int(math.Floor(percent * increment))]
  
  // Returning icon
  return icon
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
  case "getBattery":
    fmt.Println(getBattery())
  case "getPercent":
    fmt.Println(getPercent())
  case "getState":
    fmt.Println(getState())
  case "getIcon":
    fmt.Println(getIcon())
  default: // Unknown argument
    fmt.Printf("Unknown query \"%s\"\n", args[1])
    os.Exit(1)
  }
}
