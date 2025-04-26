import os
import subprocess
import tempfile

from g4f.client import Client
from g4f.models import blackboxai


# WARNING! install g4f 0.4.1.2 version!!!
# COMMAND: python -m venv .venv && source .venv/bin/activate
# COMMAND: pip install g4f==0.4.1.2
# COMMAND: sudo pacman -S glow

client = Client()

def notify_dunst():
    result = subprocess.run(
        ["dunstify", "-p", "AI is thinking..."],
        capture_output=True,
        text=True
    )
    notification_id = result.stdout.strip()
    return notification_id

def run_wofi_prompt():
    try:
        query = subprocess.check_output(
            ["wofi", "--dmenu", "--prompt", "GPT:", "--width", "50%", "--height", "70", "--location", "center"],
            text=True
        ).strip()
        return query
    except subprocess.CalledProcessError:
        return None

def get_gpt_response(prompt):
    response = client.chat.completions.create(
        model=blackboxai,
        messages=[{"role": "user", "content": prompt}],
        web_search=False
    )
    return response.choices[0].message.content

def show_response(response):
    with tempfile.NamedTemporaryFile("w", delete=False, suffix=".md") as f:
        f.write(response)
        file_path = f.name

    subprocess.run(["kitty", "glow", "-p", file_path])

    os.remove(file_path)

def main():
    query = run_wofi_prompt()
    if not query:
        return
    _id = notify_dunst()
    response = get_gpt_response(query)
    subprocess.run(["dunstctl", "close", _id])
    show_response(response)

if __name__ == "__main__":
    main()
