void setup() {
  Serial.begin(9600);
  pinMode(horario, OUTPUT);
  pinMode(anti, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(liga_motor, INPUT);
  pinMode(sentido_rot, INPUT);
  pinMode(andar1, OUTPUT);
  pinMode(andar2, OUTPUT);
  pinMode(andar3, OUTPUT);
  pinMode(botao1, INPUT);
  pinMode(botao2, INPUT);
  pinMode(botao3, INPUT);
}

void loop() {
  distancia = ultrasonic.Ranging(CM);

  if ((digitalRead(botao1) == HIGH) && (digitalRead(liga_motor) == HIGH)) {
    while (distancia > 5) {
      digitalWrite(anti, HIGH);
      distancia = ultrasonic.Ranging(CM);
    }
    digitalWrite(anti, LOW);
    digitalWrite(andar1, HIGH);
    digitalWrite(andar2, LOW);
    digitalWrite(andar3, LOW);
  }
  else if ((digitalRead(botao2) == HIGH) && (digitalRead(liga_motor) == HIGH)) {
    if (digitalRead(sentido_rot) == HIGH) {
      while (distancia < 10) {
        digitalWrite(horario, HIGH);
      }
      digitalWrite(horario, LOW);
      digitalWrite(andar1, LOW);
      digitalWrite(andar2, HIGH);
      digitalWrite(andar3, LOW);
    }
    else if (digitalRead(sentido_rot) == LOW) {
      while (distancia > 10) {
        digitalWrite(anti, HIGH);
        distancia = ultrasonic.Ranging(CM);
      }
      digitalWrite(anti, LOW);
      digitalWrite(andar1, LOW);
      digitalWrite(andar2, HIGH);
      digitalWrite(andar3, LOW);
    }
  }
  else if ((digitalRead(botao3) == HIGH) && (digitalRead(liga_motor) == HIGH)) {
    while (distancia < 15) {
      digitalWrite(horario, HIGH);
      distancia = ultrasonic.Ranging(CM);
    }
    digitalWrite(horario, LOW);
    digitalWrite(andar1, LOW);
    digitalWrite(andar2, LOW);
    digitalWrite(andar3, HIGH);
  }
}
