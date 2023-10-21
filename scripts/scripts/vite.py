import argparse
import subprocess
from pathlib import Path


def parse_args():
    """
    Returns:
        args.build {bool} -- check if we are in "build" mode vs "dev" mode.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("vite_app")
    parser.add_argument("--build", action="store_true")
    args = parser.parse_args()
    return args


class ViteHandler:
    """

    """

    def __init__(self, vite_app: str, build: bool=False):
        self.vite_app = vite_app
        self.build = build

    def run(self):
        # Set the package.json script to run
        if self.build:
            script = "build"
        else:
            script = "dev"

        # Set the file_path of the vite.config.js to use
        config_file_path = (
            Path(__file__).resolve().parent / self.vite_app / "vite.config.js"
        )

        # Run the npm script
        cmd = f"V_CONFIG_FILE=\"{config_file_path}\" npm run {script}"
        self._run_subprocess(cmd)
    
    def _run_subprocess(self, cmd: str):
        process = subprocess.run(
            cmd, stderr=subprocess.STDOUT, shell=True  # noqa: S602
        )
        process.check_returncode()


if __name__ == "__main__":
    args = parse_args()
    handler = ViteHandler(vite_app=args.vite_app, build=args.build)
    handler.run()
