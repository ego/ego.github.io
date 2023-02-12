---
title: "MacOps"
description: "MacOps"
keywords: "macOS,MacOps,MacBook,automation,automate,control apps,AppleScript,JavaScript,shell scripts,Script Editor"

date: 2023-01-08

categories:
  - projects
  - Automation
  - AppleScript
  - JavaScript
  - Bash scripts
  - Python
  - iTerm2
  - Sublime
tags:
  - macOS
  - MacOps
  - MacBook
  - Automation
  - AppleScript
  - JavaScript
  - Shell scripts
  - Bash scripts
  - Script Editor
  - Python
  - Finder
  - iTerm2
  - Sublime

url: post/projects/MacOS.html

---

# [Project MacOps](/post/projects/MacOS.html) #

Repository: https://github.com/ego/MacOps

MacOS automate tools and scripts. AppleScript and JavaScript for Automation (JXA).

<img src="/post/projects/MacOps.png" alt="" width="500"/>

<!--more-->

## Motivation

Sometimes macOS application state can be broken,
so we need way to restore it especially when macOS cannot do it for us.

## Project automation features:

    * Save Finder tabs
    * Save iTerm2 tabs
    * Save Sublime tabs
    * Save Sublime file history from Session

### Save all opened Finder tabs

File: [SaveFinderTabs.scpt](https://github.com/ego/MacOps/blob/main/SaveFinderTabs.scpt)

{{< highlight JavaScript "linenos=table" >}}
#!/usr/bin/env osascript -l JavaScript

console.log("Get and save Finder tabs.");

const basePath = "~/Workspaces/Finder/Tabs";
const filePath = `${basePath}/$(date '+%Y-%m-%d-%H').txt`;
const Finder = Application("Finder");
Finder.includeStandardAdditions = true;

var tabSet = new Set();
const windows = Finder.finderWindows();
windows.forEach((win) => {
	const tab = win.target();
	const path = decodeURIComponent(tab.url()).slice(7);
	tabSet.add(path);
});

console.log(`Found tabs: ${tabSet.size}.`);
var fileContent = "";
for (const item of tabSet) {
  fileContent += (item + '\n');
};

console.log(`Save Finder tabs to file ${basePath}.`);
app = Application.currentApplication()
app.includeStandardAdditions = true;

app.doShellScript(`mkdir -p ${basePath}`);
app.doShellScript(`echo ${JSON.stringify(fileContent)} > ${filePath}`);
{{< / highlight >}}

This AppleScript/JavaScript script creates folders in `~/Workspaces/Finder/Tabs/`
and save all **Finder** tabs to new file with name `+%Y-%m-%d-%H'.txt`.


### Save all opened iTerm2 tabs

File: [SaveiTerm2Tabs.scpt](https://github.com/ego/MacOps/blob/main/SaveiTerm2Tabs.scpt)

{{< highlight JavaScript "linenos=table" >}}
#!/usr/bin/env osascript -l JavaScript

console.log("Get and save iTerm tabs.");

const basePath = "~/Workspaces/iTerm2/Tabs";
const filePath = `${basePath}/$(date '+%Y-%m-%d-%H').txt`;
const iTerm2 = Application("iTerm2");
iTerm2.includeStandardAdditions = true;

var tabSet = new Set();
const tabs = iTerm2.currentWindow().tabs();
JSON.stringify(tabs.length);

tabs.forEach((tab) => {
// iterm2 https://iterm2.com/documentation-scripting.html
// Variables: https://iterm2.com/documentation-variables.html
const path = tab.currentSession().variable({named: "path"})
tabSet.add(path)
});

console.log(`Found tabs: ${tabSet.size}.`);
var fileContent = "";
for (const item of tabSet) {
fileContent += (item + '\n');
};

console.log(`Save Finder tabs to file ${basePath}.`);
app = Application.currentApplication()
app.includeStandardAdditions = true;

app.doShellScript(`mkdir -p ${basePath}`);
app.doShellScript(`echo ${JSON.stringify(fileContent)} > ${filePath}`);
{{< / highlight >}}

This [**AppleScript/JavaScript**](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/index.html) script creates folders in `~/Workspaces/iTerm2/Tabs/`
and save all **iTerm2** tabs to new file with name `+%Y-%m-%d-%H'.txt`.

Note about [AppleScript](https://en.wikipedia.org/wiki/AppleScript)

Note about [JavaScriptForAutomation](https://developer.apple.com/library/archive/releasenotes/InterapplicationCommunication/RN-JavaScriptForAutomation/Articles/Introduction.html#//apple_ref/doc/uid/TP40014508)

#### How to run **AppleScript/JavaScript** with macOS **Script Editor**
<img src="/post/projects/Script_Editor.png" alt="" width="500"/>

[Script Editor](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/GettoKnowScriptEditor.html#//apple_ref/doc/uid/TP40016239-CH5-SW1)

---

### Save all opened Sublime tabs from Sublime session

File: [SaveSublimeTabs.sh](https://github.com/ego/MacOps/blob/main/SaveSublimeTabs.sh)

{{< highlight sh "linenos=table" >}}
#!/bin/bash

# https://unix.stackexchange.com/questions/548806/how-to-get-just-two-items-of-a-json-like-file
# https://softhints.com/recover-unsaved-files-sublime-linux-mac/#google_vignette

SUBLIME_TABS_PATH=~/Downloads/State/SublimeTabs
SUBLIME_FILE_NAME="$(date '+%Y-%m-%d-%H').txt"
SUBLIME_LOCAL_FIND=`find ~/'Library/Application Support/Sublime Text/Local' -maxdepth 1 -type f -name "*.sublime_session"`

echo
echo 'Parse and save Sublime tabs ...'
echo

mkdir -p "$SUBLIME_TABS_PATH"

OIFS="$IFS"
IFS=$'\n'

for file in $SUBLIME_LOCAL_FIND
do
echo "Processing file: $file"
jq -r '.windows[]|.buffers[]|.file' "$file" >> "$SUBLIME_TABS_PATH/_$SUBLIME_FILE_NAME"
echo "------------------------------------------------------------"
echo
done

IFS="$OIFS"

awk '!seen[$0]++' "$SUBLIME_TABS_PATH/_$SUBLIME_FILE_NAME" > "$SUBLIME_TABS_PATH/$SUBLIME_FILE_NAME"

echo 'Done'

{{< / highlight >}}

This `sh` script creates folders in `~/Downloads/State/SublimeTabs/`,
parse `*.sublime_session` files and save all **Sublime** tabs to new file with
name `+%Y-%m-%d-%H'.txt`.

### Save all opened Sublime tabs from Sublime session file_history

This [SaveSublimeFileHistory.sh](https://github.com/ego/MacOps/blob/main/SaveSublimeFileHistory.sh) `sh` script also
parse `file_history` sections from `*.sublime_session` and save to `~/Downloads/State/SublimeFileHistory/`.

### Save all opened Sublime tabs from Sublime with Console snippet

If you have opened Sublime and want to save all tabs, click to `View` then `Show Console`
<img src="/post/projects/Sublime_Console_snippet.png" alt="" width="500"/>
and paste this snippet [Python](https://www.python.org/) code [SaveSublimeCurrentTabs.py](https://github.com/ego/MacOps/blob/main/SaveSublimeCurrentTabs.py)

{{< highlight Python "linenos=table" >}}
import datetime;
import pathlib;
name = datetime.datetime.now().strftime('%Y-%m-%d-%H');
tabs = list(filter(None, [v.file_name() for v in window.views()]));
home = str(pathlib.Path.home());
f = open(f"{home}/Workspaces/Sublime/Tabs/{name}.txt", "w");
f.write("\n".join(tabs));
f.close();
{{< / highlight >}}

As a result you get file with all tabs (full path).
<img src="/post/projects/Workspaces_Sublime_Tabs.png"/>
<br/>

> Good luck, and save your tabs history :smile:

<br/>
