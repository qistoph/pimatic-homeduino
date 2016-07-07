# #homeduino configuration options
module.exports = {
  title: "Homeduino config"
  type: "object"
  properties:
    driver:
      description: "The driver to connect to the Arduino or 'virtualarduino'"
      type: "string"
      enum: ["serialport", "gpio", "tcp"]
      default: "serialport"
      defines:
        property: "driverOptions"
        options:
          serialport:
            title: "serialport driver options"
            type: "object"
            properties:
              serialDevice:
                description: "The name of the serial device to use"
                type: "string"
                default: "/dev/ttyUSB0"
              baudrate:
                description: "The baudrate to use for serial communication"
                type: "integer"
                default: 115200
          gpio:
            title: "gpio driver options"
            type: "object"
            properties: {}
          tcp:
            title: "TCP/IP driver options"
            type: "object"
            properties:
              host:
                description: "Hostname/IP of the Arduino"
                type: "string"
              port:
                description: "TCP port on the Arduino"
                type: "integer"
                default: 3012
    driverOptions:
      description: "Options for the driver"
      type: "object"
      default: {
        "serialDevice": "/dev/ttyUSB0",
        "baudrate": 115200
      }
    enableReceiving:
      description: "Enable the receiving of 433mhz rf signals?"
      type: "boolean"
      default: true
    receiverPin:
      description: "The Arduino interrupt pin, the 433 MHz receiver is connected to."
      type: "integer"
      default: 0
    transmitterPin:
      description: "The Arduino digital pin, the 433 MHz transmitter is connected to."
      type: "integer"
      default: 4
    enableDSTSensors:
      description: "Enable support for DS18B20 sensors, appropriate homeduino version must be used."
      type: "boolean"
      default: false
    dstSearchAddressPin:
      description: "The Arduino digital pin to search for DS18B20 sensors on."
      type: "integer"
      default: 12
    connectionTimeout:
      description: "Time to wait for ready package on connection"
      type: "integer"
      default: 5*60*1000 # 5min
    debug:
      description: "Log information for debugging, including received messages"
      type: "boolean"
      default: true
    rfrepeats:
      description: "Amount of RF repeats"
      type: "integer"
      default: 7
    apikey:
      description: "Api key for external nodes"
      type: "string"
      required: false
}
