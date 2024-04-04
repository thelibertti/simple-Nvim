import os
import socket


class web_server:

    def __init__(self):
        self.SERVER_IP = '127.0.0.1'
        self.SERVER_PORT = 8000

        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.s.bind((self.SERVER_IP, self.SERVER_PORT))
        self.s.listen(1)
        print("running in http://127.0.0.1:8000")

    def accept_conections(self):
        while True:
            self.client_connection, self.client_address = self.s.accept()
            self.request = self.client_connection.recv(1024).decode('utf-8')

            request_lines = self.request.split()
            method = request_lines[0]
            file_requested = request_lines[1]
            path = os.path.expanduser("~/.config/nvim/custom_plugins")
            file_path = path + file_requested

            with open('README.html', 'r') as file:
                data = file.read()
                file.close()

            if file_requested == '/':
                response = f"HTTP/1.1 200 OK\n\n{data}"
                self.client_connection.sendall(response.encode())
                print("Index was succefully deployed")

            elif os.path.exists(file_path):
                status = "200 OK"
                file_content = open(file_path, 'rb').read()

                response = f"HTTP/1.1 {status}\n\n{file_content.decode()}"
                self.client_connection.send(response.encode())

                print(f"[{method}] {file_path}: status {status}")
                self.client_connection.close()

            else:
                status = "404 Not Found"
                file_content = b"File not found"

                response = f"HTTP/1.1 {status}\n\n{file_content.decode()}"
                self.client_connection.send(response.encode())

                print(f"[{method}] {file_path}: status {status}")
                self.client_connection.close()

    def hot_reload_handler():
        print("NOT READY YET")


web_server.start_web_server()
