import socket
import datetime
import os
import platform

def get_servers_informations():
    server_hosts_name = socket.gethostname()
    server_ip_address = socket.gethostbyname(server_hosts_name)
    os_details = {
        "systems": platform.system(),
        "version": platform.version()
    }

    todays_date = datetime.datetime.now()

    server_details = {
        "server_host_name": server_hosts_name,
        "server_ip_address": server_ip_address,
        "operating systems version ": os_details,
        "Systems Date": todays_date
    }

    return server_details

from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def main():
    return get_servers_informations()

if __name__ == "__main__":
    app.run("0.0.0.0", port=8080)
