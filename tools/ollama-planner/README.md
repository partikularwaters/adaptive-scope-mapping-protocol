# Ollama Planner (optional)

An optional local assistant that runs an ASMP scoping conversation through [Ollama](https://ollama.com/).

ASMP does not require this tool. Plain Markdown protocols in `protocols/` are the canonical way to run ASMP with any capable assistant.

## Requirements

- Python 3.9+
- Ollama installed and running locally
- A pulled model (default: `qwen3:8b`)

## Setup

```bash
cd tools/ollama-planner
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
ollama pull qwen3:8b
```

## Usage

Compact (default):

```bash
python asmp_planner.py
```

Comprehensive:

```bash
python asmp_planner.py --protocol ../../protocols/ASMP-Comprehensive.md
```

Choose a different model:

```bash
python asmp_planner.py --model llama3.1:8b
```

During the session:

- Answer the model's scoping questions.
- Use `/save` to write the latest response to `IDEA-SCOPE.md` in your chosen folder.
- Use `/quit` to exit.

## Limitations

- The model cannot inspect your files unless you paste or attach them.
- Fit gates, verification, and approval safeguards depend on the model following the protocol; **you** must review output before treating it as decision-ready.
- The planner does not replace stakeholder participation or accountable approval.
- No downstream framework is loaded automatically.

## Audit status (v0.1.0)

Included after audit:

- Uses current protocol files via configurable path (defaults to Compact in this repo)
- No Banka dependency
- Does not bypass protocol safeguards by design; human review required
- Optional; documented here
