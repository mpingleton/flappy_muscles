import processing.serial.*;

class Controller {

  Serial port;
  boolean sensorWaiting = false;
  int sensorWaitingTime = 0;
  int sensorValue = 0;
  int sensorValuePrev = 0;
  
  void connect(PApplet parent, String portName) {
    port = new Serial(parent, portName, 115200);
  }
  
  void check() {
    if(sensorWaiting) {
      if(millis() - sensorWaitingTime >= 500) {
        sensorWaiting = false;
        sensorWaitingTime = millis();
      }
    }
    else {
      if(millis() - sensorWaitingTime >= 50) {
        port.write("AD");
        sensorWaiting = true;
        sensorWaitingTime = millis();
      }
    }
  }
  
  void event(Serial s) {
    if(s != port) {
      return;
    }
    
    if(!sensorWaiting) {
      return;
    }
    
    String inputString = s.readStringUntil('\n');
    if(inputString != null) {
      sensorValuePrev = sensorValue;
      sensorValue = Integer.parseInt(inputString.trim());
      sensorWaiting = false;
      sensorWaitingTime = millis();
      if(sensorValue > 0 && sensorValuePrev > 0) {
        sensorEvent();
      }
    }
  }
}
