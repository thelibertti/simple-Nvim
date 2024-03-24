import socket
import threading
import markdown2
import os


def add_html_structure(markdown_data):
    """This function is to add a html structure to the markdown file"""

    html_structure = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README</title>
    <link rel="stylesheet" type="text/css" href="README.css">
</head>
<body>
<div class="main_div">
{markdown_data}
</div>
</body>
</html>
"""  # end of html structure

    return html_structure


def add_css():
    """This fucntion is to add css to the
    generated html file"""

    # defining pre-configuration for the css
    css_conten = """
body {
    background-color: #1D263B;
    justify-content: center;
    display: flex;
    font-family: 'Segoe UI', Arial, Helvetica, sans-serif;
}

.main_div {
    border: 2px solid black;
    color: white;
}
"""  # end of css configuration
    with open('README.css', 'w') as file:
        file.write(css_conten)
        file.close


def father(file_path):
    """MAIN FUNCTION"""

    with open(file_path, 'r') as file:
        file_data = file.read()
        markdown_data = markdown2.markdown(file_data)

    html_structure = add_html_structure(markdown_data)

    with open('README.html', 'w') as file:
        file.write(html_structure)
        file.close()

    add_css()


def main_markdown_reader():
    css_name, html_name = "README.css", "README.html"

    if os.path.exists(css_name):
        os.remove(css_name)
    if os.path.exists(html_name):
        os.remove(html_name)

    path = os.path.expanduser('~/.config/nvim/custom_plugins/README.md')

    father(path)


def created_web_server():
    



# def main_thread():
    # web_server_thread = threading.Thread(target=start_web_server)

    # web_server_thread.start()
    # print("server has started running on: http://127.0.0.1:8000")

    # try:
        # while True:
            # pass
    # except KeyboardInterrupt:
        # print("Joining threads")
        # web_server_thread.join()


# main_thread()
