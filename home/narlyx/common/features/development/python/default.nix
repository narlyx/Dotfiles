{pkgs, ...}: {
  home.packages = [
    (pkgs.python312.withPackages (p:
      with p; [
        requests
        tkinter
        typer
      ]))
  ];
}
