#!/usr/bin/env python3
"""Optional ASMP planning assistant using a local Ollama model.

This tool is optional. ASMP remains fully usable as plain Markdown without it.
The model follows whichever protocol file you supply; it does not bypass fit,
evidence, approval, or uncertainty safeguards — but you must still review output.
"""

from __future__ import annotations

import argparse
from pathlib import Path

from ollama import chat

DEFAULT_MODEL = "qwen3:8b"
REPO_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_PROTOCOL = REPO_ROOT / "protocols" / "ASMP-Compact.md"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run an ASMP scoping conversation via a local Ollama model."
    )
    parser.add_argument(
        "--protocol",
        type=Path,
        default=DEFAULT_PROTOCOL,
        help="Path to ASMP-Compact.md or ASMP-Comprehensive.md (default: Compact)",
    )
    parser.add_argument(
        "--model",
        default=DEFAULT_MODEL,
        help=f"Ollama model name (default: {DEFAULT_MODEL})",
    )
    return parser.parse_args()


def load_protocol(path: Path) -> str:
    if not path.is_file():
        raise FileNotFoundError(f"Protocol not found: {path}")
    return path.read_text(encoding="utf-8", errors="replace")


def get_response(messages: list[dict], model: str) -> str:
    print("\nModel is thinking...\n")

    answer = ""
    started_answer = False

    stream = chat(
        model=model,
        messages=messages,
        think=True,
        stream=True,
        options={
            "temperature": 0.2,
            "num_ctx": 32768,
        },
    )

    for chunk in stream:
        content = chunk.message.content
        if content:
            if not started_answer:
                print("Assistant:\n")
                started_answer = True
            print(content, end="", flush=True)
            answer += content

    print("\n")
    return answer


def main() -> None:
    args = parse_args()
    protocol_path = args.protocol.expanduser().resolve()
    protocol = load_protocol(protocol_path)

    print("ASMP Planner (optional tool)")
    print(f"Protocol: {protocol_path}")
    print(f"Model: {args.model}")
    print()
    print("This planner reads only the supplied ASMP protocol.")
    print("It does not automatically read other project files.")
    print("Review all output; do not treat the model as an accountable approver.")
    print()

    destination_input = input(
        "Where should the final IDEA-SCOPE.md be saved?\n"
        "Enter a project folder, or leave blank to use this folder:\n> "
    ).strip()

    destination_folder = (
        Path(destination_input).expanduser().resolve()
        if destination_input
        else Path.cwd()
    )
    destination_file = destination_folder / "IDEA-SCOPE.md"

    print()
    print("Commands:")
    print("  /save  Save the latest response as IDEA-SCOPE.md")
    print("  /quit  End the planning session")
    print()

    messages = [
        {
            "role": "system",
            "content": f"""
The document inside <ASMP_PROTOCOL> is the controlling protocol for this
conversation. Adopt its assigned role and follow it faithfully.

Operating boundaries:
- You have been given the protocol's complete contents.
- You cannot independently inspect the user's computer.
- Do not claim to have read files that were not supplied in this conversation.
- Ask the user for relevant existing material as required by the protocol.
- Do not claim that you saved or modified a file.
- When the scope artifact is ready, return the complete IDEA-SCOPE.md content
  in a single Markdown response.
- Keep the final document separate from conversational commentary.
- Do not mention or require downstream frameworks unless the user explicitly
  requests a compatibility pass after scope completion.

<ASMP_PROTOCOL>
{protocol}
</ASMP_PROTOCOL>
""".strip(),
        },
        {
            "role": "user",
            "content": (
                "Begin the protocol now. Follow its required first-response "
                "instructions and start the planning conversation with me."
            ),
        },
    ]

    last_answer = ""

    try:
        while True:
            last_answer = get_response(messages, args.model)
            messages.append({"role": "assistant", "content": last_answer})

            user_input = input("You:\n> ").strip()

            if user_input.lower() in {"/quit", "/exit"}:
                print("Planning session ended.")
                break

            if user_input.lower() == "/save":
                if not last_answer:
                    print("There is no response to save yet.")
                    continue

                destination_folder.mkdir(parents=True, exist_ok=True)
                destination_file.write_text(last_answer, encoding="utf-8")
                print(f"\nSaved: {destination_file}\n")
                continue

            if not user_input:
                continue

            messages.append({"role": "user", "content": user_input})

    except KeyboardInterrupt:
        print("\n\nPlanning session stopped without saving.")


if __name__ == "__main__":
    main()
