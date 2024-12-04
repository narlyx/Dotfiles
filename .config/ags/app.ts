import { App } from "astal/gtk3"
import style from "./style.scss"
import Activate from "./widget/Activate"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Activate)
    },
})
