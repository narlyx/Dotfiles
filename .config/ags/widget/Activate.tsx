import { App, Astal, Gdk } from "astal/gtk3"

export default function Activat(gdkmonitor: Gdk.Monitor) {
  return <window
    className = "Activate"
    gdkmonitor = {gdkmonitor}
    exclusivity = {Astal.Exclusivity.IGNORE}
    anchor = {Astal.WindowAnchor.BOTTOM | Astal.WindowAnchor.RIGHT}
    margin-right = {60}
    margin-bottom = {50}
    layer = {Astal.Layer.TOP}
    application = {App}>
    <box vertical>
      <label xalign = {0.0} label = "Activate Linux"/>
      <label xalign = {0.0} label = "Go to settings to activate Linux."/>
    </box>
  </window>
}
