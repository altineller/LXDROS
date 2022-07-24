#!/bin/bash
sudo iptables -F FORWARD && sudo iptables -P FORWARD ACCEPT;
