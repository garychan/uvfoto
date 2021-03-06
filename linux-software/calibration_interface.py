#!/usr/bin/env python
import serial
import argparse
import threading
import Queue
import time

import sys
import tty
import termios

from py_usb import PhoneKeys, SkypePhoneDriver


class CalibrationInterface():
    serial = None
    angle = 17.0
    position = 150.0

    def run(self, port):
        self.queue = Queue.Queue()
        self.thread = threading.Thread(
            target=serial_worker,
            args=(port, self.queue))
        self.thread.setDaemon(True)
        self.thread.start()
        self.phone = SkypePhoneDriver()
        self.phone.map_action(PhoneKeys.KEY_1, self._increase_angle)
        self.phone.map_action(PhoneKeys.KEY_4, self._decrease_angle)
        self.phone.map_action(PhoneKeys.KEY_2, self._increase_position)
        self.phone.map_action(PhoneKeys.KEY_5, self._decrease_position)
        self.phone.listen()

    def _increase_angle(self):
        self.angle += 0.1
        self._send_angle()

    def _decrease_angle(self):
        self.angle -= 0.1
        self._send_angle()

    def _send_angle(self):
        self.queue.put("M2 A%f" % self.angle)
        self.queue.put("M3")

    def _increase_position(self):
        self.position += 1
        self._send_position()

    def _decrease_position(self):
        self.position -= 1
        self._send_position()

    def _send_position(self):
        self.queue.put("M1 Y%f" % self.position)


def serial_worker(port, queue):
    ser = serial.Serial(port, baudrate=115200, timeout=1)
    queue = queue
    try:
        while True:
            try:
                msg = queue.get(False)
                print("$ %s\n\n" % msg)
                ser.write("%s\n" % (msg.strip()))
            except Queue.Empty:
                pass

            numchars = ser.inWaiting()
            if numchars > 0:
                received_line = ser.readline()
                print(received_line)
                print("\n\n")

            time.sleep(0.1)
    except KeyboardInterrupt:
        pass

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("port", help="Serial port to use")
    args = parser.parse_args()
    c = CalibrationInterface()
    c.run(args.port)
