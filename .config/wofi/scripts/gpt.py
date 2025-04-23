import subprocess

from g4f.client import Client

client = Client()
def run_wofi_prompt():
    try:
        query = subprocess.check_output(
            ["wofi", "--dmenu", "--prompt", "GPT:"],
            text=True
        ).strip()
        return query
    except subprocess.CalledProcessError:
        return None

def get_gpt_response(prompt):
    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}],
        web_search=False
    )
    return response.choices[0].message.content

def show_response(response):
    subprocess.run(["wofi", "--dmenu"], input=response, text=True)

def main():
    query = run_wofi_prompt()
    if not query:
        return
    response = get_gpt_response(query)
    show_response(response)

if __name__ == "__main__":
    main()
