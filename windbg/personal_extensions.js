/// <reference path="JSProvider.d.ts" />

"use strict";

const execute = cmd => host.namespace.Debugger.Utility.Control.ExecuteCommand(cmd);
const logln  = msg => host.diagnostics.debugLog(`[+] ${msg}\n`);

function _getEprocess(cmd) {

    let Control = host.namespace.Debugger.Utility.Control;

    for(let Line of Control.ExecuteCommand(cmd)) {
        if(Line.includes("PROCESS")) {
            let split = Line.split(' ');
            return split[1];
        }
    }

    return '';

}

function _getThread(eprocess) {
    let Control = host.namespace.Debugger.Utility.Control;

    let cmd = `!process ${eprocess}`

    var threadRegex = /THREAD\s+([0-9a-fA-F`]+)/;

    for(let Line of Control.ExecuteCommand(cmd)) {
        var m = threadRegex.exec(Line);
        if(m && m[1]) {
            let threadClean = m[1].replace(/^0x/, '');
            return threadClean;
        }
    }
}
 
// Exported function
function attachusermode(procName) {
    if (!procName || procName.length === 0) {
        logln("Usage: !attachusermode (\"processname.exe\")\n");
        return { error: "missing process name parameter" };
    }

    var control = host.namespace.Debugger.Utility.Control;

    // 1) !process 0 0 <procName>
    var cmd1 = "!process 0 0 " + procName;
    logln("Executing: " + cmd1 + "\n");
    let eprocess = _getEprocess(cmd1);

    if(eprocess === '') {
        return { error: "EPROCESS not found" };
    }

    logln('EPROCESS -> ' + eprocess);

    execute(`.process /i ${eprocess}`)
    execute('g')

    let ethread = _getThread(eprocess)

    logln("ETHREAD -> " + ethread)
    execute(`.thread /w ${ethread}`)
    execute('.reload /f /user')
    logln('Done!')
}

function handle_conditionalBreakpoint(dllName) {
    let Regs = host.currentThread.Registers.User;

    let addr = Regs.rsp

    let value = host.memory.readMemoryValues(addr, 1, 8)[0];

    logln("Value: " + value);
}


function conditionalBreakpoint() {
    execute("bp KernelBase!LoadLibraryW @$scriptContents.handle_conditionalBp('testdll.dll')");
}

function initializeScript() {
    return [
        new host.apiVersionSupport(1, 3),
        new host.functionAlias(
            attachusermode,
            'attachusermode'
        ),
        new host.functionAlias(
            conditionalBreakpoint,
            'conditionalBreakpoint'
        )
    ];
}