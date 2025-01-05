package main

import (
  "fmt"
  "net"
  "os"
  "strings"
)

// Returns a physical network interface with a haddr and an ip
func getInterface() string {
  // Fetching interfaces
  interfaces, err := net.Interfaces()
  // Failed to fetch
  if err != nil {
    fmt.Printf("Failed to fetch network interfaces: %s\n", err)
    os.Exit(1)
  }
  // Loop thru interfaces
  for _, iface := range interfaces{
    // Chceking for hardware address
    if iface.HardwareAddr != nil {
      // Getting IP's
      addrs, err := iface.Addrs()
      // Failed to fetch
      if err != nil {
        fmt.Printf("Failed to get addresses on interface %s: %s\n", iface.Name, err)
        os.Exit(1)
      }
      // Has IP's
      if len(addrs) > 0 {
        return iface.Name
      }
    }
  }
  // No result
  return "nil"
}

// Return the type of the interface
func getType() string {
  // Getting interface
  iface := getInterface()

  // If an interface is returned
  if iface != "nil" {
    if strings.HasPrefix(iface, "wlan") || strings.HasPrefix(iface, "wlp") { // Wifi
      return "wireless"
    } else if strings.HasPrefix(iface, "eth") { // Ethernet
      return "ethernet"
    } else { // Others
      return "unknown"
    }
  }

  // No result
  return "nil"
}

// Returns an icon based on status
func getIcon() string {
  // Getting type
  ifaceType := getType()

  // Parsing types
  switch ifaceType {
  case "unknown": // Unknown type
    return ""
  case "ethernet": // Ethernet
    return "󰈀"
  case "wireless": // WiFi
    return "󰤥" // TODO: WiFi signal strength indicator
  }

  // No internet
  return "󰤮" 
}

func getSsid() string {
  // TODO: Ssid queries from system
  return "Unavailable"
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

  // Parsing arguemnets
  switch args[1] {
  case "getInterface":
    fmt.Println(getInterface())
  case "getType":
    fmt.Println(getType())
  case "getIcon":
    fmt.Println(getIcon())
  case "getSsid":
    fmt.Println(getSsid())
  default: // Unknown argument
    fmt.Printf("Unknown query \"%s\"\n", args[1])
    os.Exit(1)
  }
}
