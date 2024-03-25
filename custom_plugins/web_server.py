import os
import socket


class web_server:

    def __init__(self):
        pass

    def start_web_server():

        SERVER_IP = '127.0.0.1'
        SERVER_PORT = 8000

        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        s.bind((SERVER_IP, SERVER_PORT))
        s.listen(1)
        print("running in http://127.0.0.1:8000")

        while True:
            client_connection, client_address = s.accept()
            request = client_connection.recv(1024).decode('utf-8')

            request_lines = request.split()
            method = request_lines[0]
            file_requested = request_lines[1]
            path = os.path.expanduser("~/.config/nvim/custom_plugins")
            file_path = path + file_requested

            with open('README.html', 'r') as file:
                data = file.read()
                file.close()

            if file_requested == '/':
                response = f"HTTP/1.1 200 OK\n\n{data}"
                client_connection.sendall(response.encode())
                print("Index was succefully deployed")

            elif os.path.exists(file_path):
                status = "200 OK"
                file_content = open(file_path, 'rb').read()

                response = f"HTTP/1.1 {status}\n\n{file_content.decode()}"
                client_connection.send(response.encode())

                print(f"[{method}] {file_path}: status {status}")
                client_connection.close()

            else:
                status = "404 Not Found"
                file_content = b"File not found"

                response = f"HTTP/1.1 {status}\n\n{file_content.decode()}"
                client_connection.send(response.encode())

                print(f"[{method}] {file_path}: status {status}")
                client_connection.close()

    def hot_reload_handler():
        print("NOT READY YET")


web_server.start_web_server()
