SQLite format 3   @    ,            u                                                , -�r	O C ���
�C
I
I                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             	O�        ��tableschedulescheduleCREATE TABLE schedule (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "startdate" INTEGER NOT NULL DEFAULT (18990101),
    "enddate" INTEGER,
    "sunday" INTEGER NOT NULL DEFAULT (0),
    "monday" INTEGER NOT NULL DEFAULT (0),
    "tuesday" INTEGER NOT NULL DEFAULT (0),
    "wednesday" INTEGER NOT NULL DEFAULT (0),
    "thursday" INTEGER NOT NULL DEFAULT (0),
    "friday" INTEGER NOT NULL DEFAULT (0),
    "saturday" INTEGER NOT NULL DEFAULT (0),
    "station" INTEGER NOT NULL DEFAULT (0),
    "starttime" INTEGER NOT NULL DEFAULT (0),
    "duration" INTEGER NOT NULL DEFAULT (0),
    "repeat" INTEGER NOT NULL DEFAULT (0)
)j�#tablegpio_pinsgpio_pinsCREATE TABLE gpio_pins (
    "gpio" PK INTEGER NOT NULL,
    "notes" TEXT
)@3                                                                                                                                                                                                                                                                                                               ��_tablehistoryhistoryCREATE TABLE "history" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "sid" INTEGER NOT NULL DEFAULT (0),
    "schedule_id" INTEGER NOT NULL DEFAULT (0),
    "duration" INTEGER NOT NULL DEFAULT (0),
    "starttime" TEXT
)�4�;tablestationsstationsCREATE TABLE "stations" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "gpio" INTEGER NOT NULL DEFAULT (0),
    "notes" TEXT,
    "common" INTEGER
)v                                                                                                                                                                                                                                                                                          X                                                                                                                                                                                                                                                                                                                                                    P++Ytablesqlite_sequencesqlite_sequenceCREATE TABLE sqlite_sequence(name,seq)   �                                                                                                                                                                                                                                                       P ���pL(���tP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "G A.<2016-10-01 20:01:10.656289"F A0<2016-10-01 20:00:10.553244"E A1<2016-10-01 19:59:10.445966"D A2<2016-10-01 19:58:10.338973"C A;<2016-10-01 19:53:48.884032"B A:<2016-10-01 19:52:33.158464"A A9<2016-10-01 19:50:47.359216"@ A8<2016-10-01 19:49:10.348779"? A7<2016-10-01 19:48:04.471949"> A6<2016-10-01 19:47:00.781354"= A5<2016-10-01 19:46:00.667992"< A4<2016-10-01 19:18:47.786467� ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           schedulestations;             historyG                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             � 	� n���P4��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   3���À;�� 		3���À:> 		3���À9� 		3���À8� 		3���À7�� 		3���À/��                         
 		3���À0�X	 				3���À.�� 		3���À1��� � ���������������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
common     
 	             j ?�O�7y�����h�?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         '; OB1 - front left / lining driveway79 oB3 - front right / row closer to road than gravel68 mB4 - front right gravel / property line on right'7 OB5 - far left front (facing road)2 7A3 - back bottom lawn1 +A4 - back patio0 -A5 - back middle. 3A7 - back yard drip�       �  3 !A2 - EMPTY: +B2 - front drip�6 !B7 - EMPTY5 !B8 - EMPTY4 !A1 - EMPTY             / A6 ---- 	A8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                