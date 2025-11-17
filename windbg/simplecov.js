"use strict";

const execute = cmd => host.namespace.Debugger.Utility.Control.ExecuteCommand(cmd);
const logln  = msg => host.diagnostics.debugLog(`[+] ${msg}\n`);

function initializeScript() {
    return [
        new host.apiVersionSupport(1, 3),
        new host.functionAlias(simpleCov, "simplecov")
    ];
}

function simpleCov(moduleName, outFilePath, count) {

    logln(moduleName)
    logln(outFilePath)
    logln(count)

    const Utility = host.namespace.Debugger.Utility;

    if(Utility.FileSystem.FileExists(outFilePath)) {
        logln('The output file ' + FilePath + ' already exists, exiting.');
        return;
    }

    const FileHandle = Utility.FileSystem.CreateFile(outFilePath, 'CreateAlways');

    const Writer = Utility.FileSystem.CreateTextWriter(FileHandle);

    Writer.WriteLine('Test')

    FileHandle.Close();

    for (let i = 0; i < count; i++) {
        execute(`tr`)
    }

}