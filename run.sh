#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
JAVAFX_DIR="$SCRIPT_DIR/javafx"
JAVAFX_URL="https://download2.gluonhq.com/openjfx/21.0.6/openjfx-21.0.6_linux-x64_bin-sdk.zip"
if [ ! -d "$JAVAFX_DIR" ]; then
	echo "Directory $JAVAFX_DIR does not exist. Creating it..."
	mkdir -p "$JAVAFX_DIR"
	echo "Downloading ZIP file..."
	curl -L -o "$JAVAFX_DIR/file.zip" "$JAVAFX_URL"

	# Check if the download was successful
	if [ $? -eq 0 ]; then
		echo "Download successful. Extracting ZIP file..."
    		# Extract the ZIP file into the target directory
    		unzip "$JAVAFX_DIR/file.zip" -d "$JAVAFX_DIR"

    		# Delete the ZIP file after extraction
    		echo "Cleaning up ZIP file..."
    		rm "$JAVAFX_DIR/file.zip"

    		echo "Done!"
	else
    		echo "Download failed!"
		echo "Please Install javafx 21.0.6[LTS] SDK in javafx directory manually."
	fi
else
	echo "JavaFX is Installed, skipping"
fi

export PATH_TO_FX_LIBS="$SCRIPT_DIR/javafx/javafx-sdk-21.0.6/lib/"

javac --module-path $PATH_TO_FX_LIBS --add-modules javafx.controls,javafx.fxml,javafx.web WebApp.java
java --module-path $PATH_TO_FX_LIBS --add-modules javafx.controls,javafx.fxml,javafx.web WebApp

