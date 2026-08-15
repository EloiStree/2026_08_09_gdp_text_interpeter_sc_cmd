## Convert 
## tbio:name:i:2032
## tbio:name:i:2032
## tbio:name:i:2032 
## ♜paul|1032
## 🛜|1032
## ♙♘♗♖♕♔♚♛♜♝♞♟
##~1032> Send to all alias in TBIO
##~Paul|1032> Send a int to Paul
##~Paul|1032> Send a int to Paul
##~Paul|1|1032> Send a int to Paul with index 1
##~Paul|1|1032|500> Send a int to Paul with index 1 to execute in 500 after reception


class_name SCmdScInterpreterTbioIID
extends SCmdScInterpreterAbstractBidderNode


signal on_integer_found_for_all(integer_value: int)
signal on_index_integer_found_for_all(index:int,integer_value: int)
signal on_integer_found_for_alias(alias: String, integer_value: int)
signal on_index_value_integer_found_for_alias(alias: String, index: int, integer_value: int)
signal on_index_value_date_found_for_alias(alias: String, index: int,value:int, date_value: int)
signal on_request_to_send_small_text_to_alias(alias: String,text: String)


@export_multiline var _unicode_to_int_add_at_ready: String = """
 🕹️U+☗1281 🕹️R+☗1282 🕹️D+☗1283 🕹️L+☗1284 🕹️A+☗1285 🕹️B+☗1286
  🕹️ML+☗1287 🕹️MR+☗1288  🕹️U-☗2281 🕹️R-☗2282 🕹️D-☗2283 
  🕹️L-☗2284 🕹️A-☗2285 🕹️B-☗2286 🕹️ML-☗2287 🕹️MR-☗2288  
  🎹Do+☗1660 🎹Re+☗1662 🎹Mi+☗1664 🎹Fa+☗1665 🎹Sol+☗1667 
  🎹La+☗1669 🎹Si+☗1671 🎹Do-☗2660 🎹Re-☗2662 🎹Mi-☗2664 
  🎹Fa-☗2665 🎹Sol-☗2667 🎹La-☗2669 🎹Si-☗2671  🖱️R+☗1262
   🖱️R-☗2262 🖱️L+☗1260 🖱️L-☗2260 🖱️M+☗1261 🖱️M-☗2261 
   🖱️1+☗1263 🖱️1-☗2263 🖱️2+☗1264 🖱️2-☗2264 🖱️SU+☗1268 
   🖱️SU-☗2268 🖱️SD+☗1269 🖱️SD-☗2269 🖱️SR+☗1271 🖱️SR-☗2271
    🖱️SL+☗1270 🖱️SL-☗2270  🎮A+☗1300 🎮B+☗1302 🎮X+☗1301
	 🎮Y+☗1303 🎮ML+☗1309 🎮MC+☗1319 🎮MR+☗1308 🎮LSB+☗1304
	  🎮RSB+☗1305 🎮LJ+☗1306 🎮RJ+☗1307 🎮AL+☗1317 🎮AR+☗1313
	   🎮AD+☗1315 🎮AU+☗1311 🎮AUR+☗1318 🎮AUL+☗1312 🎮ADR+☗1314
	    🎮ADL+☗1316 🎮JLU+☗1352 🎮JLR+☗1350 🎮JLD+☗1353 🎮JLL+☗1351
		 🎮JRU+☗1356 🎮JRR+☗1354 🎮JRD+☗1357 🎮JRL+☗1355 🎮LT+☗1358
		  🎮RT+☗1359 🎮L↑+☗1331 🎮L↗+☗1332 🎮L→+☗1333 🎮L↘+☗1334 
		  🎮L↓+☗1335 🎮L↙+☗1336 🎮L←+☗1337 🎮L↖+☗1338 🎮R↑+☗1341 
		  🎮R↗+☗1342 🎮R→+☗1343 🎮R↘+☗1344 🎮R↓+☗1345 🎮R↙+☗1346 
		  🎮R←+☗1347 🎮R↖+☗1348 🎮↑+☗1311 🎮↗+☗1312 🎮→+☗1313 
		  🎮↘+☗1314 🎮↓+☗1315 🎮↙+☗1316 🎮←+☗1317 🎮↖+☗1318 
		  🎮🔴+☗1321  🎮A-☗2300 🎮B-☗2302 🎮X-☗2301 🎮Y-☗2303
		   🎮ML-☗2309 🎮MC-☗2319 🎮MR-☗2308 🎮LSB-☗2304 🎮RSB-☗2305
		    🎮LJ-☗2306 🎮RJ-☗2307 🎮AL-☗2317 🎮AR-☗2313 🎮AD-☗2315 
			🎮AU-☗2311 🎮AUR-☗2318 🎮AUL-☗2312 🎮ADR-☗2314 🎮ADL-☗2316
			 🎮JLU-☗2352 🎮JLR-☗2350 🎮JLD-☗2353 🎮JLL-☗2351 🎮JRU-☗2356
			  🎮JRR-☗2354 🎮JRD-☗2357 🎮JRL-☗2355 🎮LT-☗2358 🎮RT-☗2359
			   🎮L↑-☗2331 🎮L↗-☗2332 🎮L→-☗2333 🎮L↘-☗2334 🎮L↓-☗2335 
			   🎮L↙-☗2336 🎮L←-☗2337 🎮L↖-☗2338 🎮R↑-☗2341 🎮R↗-☗2342 
			   🎮R→-☗2343 🎮R↘-☗2344 🎮R↓-☗2345 🎮R↙-☗2346 🎮R←-☗2347 
			   🎮R↖-☗2348 🎮↑-☗2311 🎮↗-☗2312 🎮→-☗2313 🎮↘-☗2314 
			   🎮↓-☗2315 🎮↙-☗2316 🎮←-☗2317 🎮↖-☗2318 🎮🔴-☗2321  
			   
			   ⌨️.!☗4033 ⌨️."☗4034 ⌨️.#☗4035 ⌨️.$☗4036 ⌨️.%☗4037 
			   ⌨️.&☗4038 ⌨️.'☗4039 ⌨️.(☗4040 ⌨️.)☗4041 ⌨️.*☗4042 
			   ⌨️.+☗4043 ⌨️.,☗4044 ⌨️.-☗4045 ⌨️..☗4046 ⌨️./☗4047 
			   ⌨️.0☗4048 ⌨️.1☗4049 ⌨️.2☗4050 ⌨️.3☗4051 ⌨️.4☗4052 
			   ⌨️.5☗4053 ⌨️.6☗4054 ⌨️.7☗4055 ⌨️.8☗4056 ⌨️.9☗4057 
			   ⌨️.:☗4058 ⌨️.;☗4059 ⌨️.<☗4060 ⌨️.=☗4061 ⌨️.>☗4062 
			   ⌨️.?☗4063 ⌨️.@☗4064 ⌨️.A☗4065 ⌨️.B☗4066 ⌨️.C☗4067 
			   ⌨️.D☗4068 ⌨️.E☗4069 ⌨️.F☗4070 ⌨️.G☗4071 ⌨️.H☗4072 
			   ⌨️.I☗4073 ⌨️.J☗4074 ⌨️.K☗4075 ⌨️.L☗4076 ⌨️.M☗4077 
			   ⌨️.N☗4078 ⌨️.O☗4079 ⌨️.P☗4080 ⌨️.Q☗4081 ⌨️.R☗4082 
			   ⌨️.S☗4083 ⌨️.T☗4084 ⌨️.U☗4085 ⌨️.V☗4086 ⌨️.W☗4087 
			   ⌨️.X☗4088 ⌨️.Y☗4089 ⌨️.Z☗4090 ⌨️.[☗4091 ⌨️.\\☗4092 
			   ⌨️.]☗4093 ⌨️.^☗4094 ⌨️._☗4095 ⌨️.`☗4096 ⌨️.a☗4097 
			   ⌨️.b☗4098 ⌨️.c☗4099 ⌨️.d☗4100 ⌨️.e☗4101 ⌨️.f☗4102 
			   ⌨️.g☗4103 ⌨️.h☗4104 ⌨️.i☗4105 ⌨️.j☗4106 ⌨️.k☗4107 
			   ⌨️.l☗4108 ⌨️.m☗4109 ⌨️.n☗4110 ⌨️.o☗4111 ⌨️.p☗4112 
			   ⌨️.q☗4113 ⌨️.r☗4114 ⌨️.s☗4115 ⌨️.t☗4116 ⌨️.u☗4117 
			   ⌨️.v☗4118 ⌨️.w☗4119 ⌨️.x☗4120 ⌨️.y☗4121 ⌨️.z☗4122 
			   ⌨️.{☗4123 ⌨️.|☗4124 ⌨️.}☗4125 ⌨️.~☗4126 ⌨️.¡☗4161 
			   ⌨️.¢☗4162 ⌨️.£☗4163 ⌨️.¤☗4164 ⌨️.¥☗4165 ⌨️.¦☗4166 
			   ⌨️.§☗4167 ⌨️.¨☗4168 ⌨️.©☗4169 ⌨️.ª☗4170 ⌨️.«☗4171 
			   ⌨️.¬☗4172 ⌨️.®☗4174 ⌨️.¯☗4175 ⌨️.°☗4176 ⌨️.±☗4177 
			   ⌨️.²☗4178 ⌨️.³☗4179 ⌨️.´☗4180 ⌨️.µ☗4181 ⌨️.¶☗4182 
			   ⌨️.·☗4183 ⌨️.¸☗4184 ⌨️.¹☗4185 ⌨️.º☗4186 ⌨️.»☗4187 
			   ⌨️.¼☗4188 ⌨️.½☗4189 ⌨️.¾☗4190 ⌨️.¿☗4191 ⌨️.À☗4192 
			   ⌨️.Á☗4193 ⌨️.Â☗4194 ⌨️.Ã☗4195 ⌨️.Ä☗4196 ⌨️.Å☗4197 
			   ⌨️.Æ☗4198 ⌨️.Ç☗4199 ⌨️.È☗4200 ⌨️.É☗4201 ⌨️.Ê☗4202 
			   ⌨️.Ë☗4203 ⌨️.Ì☗4204 ⌨️.Í☗4205 ⌨️.Î☗4206 ⌨️.Ï☗4207 
			   ⌨️.Ð☗4208 ⌨️.Ñ☗4209 ⌨️.Ò☗4210 ⌨️.Ó☗4211 ⌨️.Ô☗4212 
			   ⌨️.Õ☗4213 ⌨️.Ö☗4214 ⌨️.×☗4215 ⌨️.Ø☗4216 ⌨️.Ù☗4217 
			   ⌨️.Ú☗4218 ⌨️.Û☗4219 ⌨️.Ü☗4220 ⌨️.Ý☗4221 ⌨️.Þ☗4222 
			   ⌨️.ß☗4223 ⌨️.à☗4224 ⌨️.á☗4225 ⌨️.â☗4226 ⌨️.ã☗4227 
			   ⌨️.ä☗4228 ⌨️.å☗4229 ⌨️.æ☗4230 ⌨️.ç☗4231 ⌨️.è☗4232 
			   ⌨️.é☗4233 ⌨️.ê☗4234 ⌨️.ë☗4235 ⌨️.ì☗4236 ⌨️.í☗4237 
			   ⌨️.î☗4238 ⌨️.ï☗4239 ⌨️.ð☗4240 ⌨️.ñ☗4241 ⌨️.ò☗4242 
			   ⌨️.ó☗4243 ⌨️.ô☗4244 ⌨️.õ☗4245 ⌨️.ö☗4246 ⌨️.÷☗4247 
			   ⌨️.ø☗4248 ⌨️.ù☗4249 ⌨️.ú☗4250 ⌨️.û☗4251 ⌨️.ü☗4252 
			   ⌨️.ý☗4253 ⌨️.þ☗4254 ⌨️.ÿ☗4255 
			   ⌨️Backspace-☗2008 
			   ⌨️Tab-☗2009 ⌨️Enter-☗2013 ⌨️Shift-☗2016 ⌨️Ctrl-☗2017 
			   ⌨️Alt-☗2018 ⌨️CapsLock-☗2020 ⌨️Escape-☗2027 ⌨️Space-☗2032 
			   ⌨️PageUp-☗2033 ⌨️PageDown-☗2034 ⌨️End-☗2035 ⌨️Home-☗2036 
			   ⌨️Left-☗2037 ⌨️Up-☗2038 ⌨️Right-☗2039 ⌨️Down-☗2040 
			   ⌨️Insert-☗2045 ⌨️Delete-☗2046 ⌨️0-☗2048 ⌨️1-☗2049 
			   ⌨️2-☗2050 ⌨️3-☗2051 ⌨️4-☗2052 ⌨️5-☗2053 ⌨️6-☗2054 
			   ⌨️7-☗2055 ⌨️8-☗2056 ⌨️9-☗2057 ⌨️A-☗2065 ⌨️B-☗2066 
			   ⌨️C-☗2067 ⌨️D-☗2068 ⌨️E-☗2069 ⌨️F-☗2070 ⌨️G-☗2071 
			   ⌨️H-☗2072 ⌨️I-☗2073 ⌨️J-☗2074 ⌨️K-☗2075 ⌨️L-☗2076 
			   ⌨️M-☗2077 ⌨️N-☗2078 ⌨️O-☗2079 ⌨️P-☗2080 ⌨️Q-☗2081 
			   ⌨️R-☗2082 ⌨️S-☗2083 ⌨️T-☗2084 ⌨️U-☗2085 ⌨️V-☗2086 
			   ⌨️W-☗2087 ⌨️X-☗2088 ⌨️Y-☗2089 ⌨️Z-☗2090 ⌨️NP0-☗2096 
			   ⌨️NP1-☗2097 ⌨️NP2-☗2098 ⌨️NP3-☗2099 ⌨️NP4-☗2100 
			   ⌨️NP5-☗2101 ⌨️NP6-☗2102 ⌨️NP7-☗2103 ⌨️NP8-☗2104 
			   ⌨️NP9-☗2105 ⌨️*-☗2106 ⌨️+-☗2107 ⌨️--☗2109 ⌨️/-☗2111 
			   ⌨️F1-☗2112 ⌨️F2-☗2113 ⌨️F3-☗2114 ⌨️F4-☗2115 ⌨️F5-☗2116
			    ⌨️F6-☗2117 ⌨️F7-☗2118 ⌨️F8-☗2119 ⌨️F9-☗2120 ⌨️F10-☗2121 
				⌨️F11-☗2122 ⌨️F12-☗2123 ⌨️F13-☗2124 ⌨️F14-☗2125 ⌨️F15-☗2126 
				⌨️F16-☗2127 ⌨️F17-☗2128 ⌨️F18-☗2129 ⌨️F19-☗2130 ⌨️F20-☗2131 
				⌨️F21-☗2132 ⌨️F22-☗2133 ⌨️F23-☗2134 ⌨️F24-☗2135 ⌨️NumLock-☗2144 
				⌨️ScrollLock-☗2145 ⌨️Shift-☗2160 ⌨️Control-☗2162 ⌨️Alt-☗2164 
				⌨️Menu-☗2164 ⌨️🔇-☗2173 ⌨️🔉-☗2174 ⌨️🔊-☗2175 ⌨️Next-☗2176 
				⌨️Previous-☗2177 ⌨️Stop-☗2178 ⌨️Play-☗2179 ⌨️OEM1-☗2186 
				⌨️OEMPlus-☗2187 ⌨️OEMComma-☗2188 ⌨️OEMMinus-☗2189 
				⌨️OEMPeriod-☗2190 ⌨️OEM2-☗2191 ⌨️OEM3-☗2192 ⌨️OEM4-☗2219 
				⌨️OEM5-☗2220 ⌨️OEM6-☗2221 ⌨️OEM7-☗2222 ⌨️OEM8-☗2223 
				⌨️OEM102-☗2226  ⌨️Backspace+☗1008 ⌨️Tab+☗1009 ⌨️Enter+☗1013 
				⌨️Shift+☗1016 ⌨️Ctrl+☗1017 ⌨️Alt+☗1018 ⌨️CapsLock+☗1020 
				⌨️Escape+☗1027 ⌨️Space+☗1032 ⌨️PageUp+☗1033 ⌨️PageDown+☗1034 
				⌨️End+☗1035 ⌨️Home+☗1036 ⌨️Left+☗1037 ⌨️Up+☗1038 ⌨️Right+☗1039 
				⌨️Down+☗1040 ⌨️Insert+☗1045 ⌨️Delete+☗1046 ⌨️0+☗1048 ⌨️1+☗1049 
				⌨️2+☗1050 ⌨️3+☗1051 ⌨️4+☗1052 ⌨️5+☗1053 ⌨️6+☗1054 ⌨️7+☗1055 
				⌨️8+☗1056 ⌨️9+☗1057 ⌨️A+☗1065 ⌨️B+☗1066 ⌨️C+☗1067 ⌨️D+☗1068 
				⌨️E+☗1069 ⌨️F+☗1070 ⌨️G+☗1071 ⌨️H+☗1072 ⌨️I+☗1073 ⌨️J+☗1074 
				⌨️K+☗1075 ⌨️L+☗1076 ⌨️M+☗1077 ⌨️N+☗1078 ⌨️O+☗1079 ⌨️P+☗1080 
				⌨️Q+☗1081 ⌨️R+☗1082 ⌨️S+☗1083 ⌨️T+☗1084 ⌨️U+☗1085 ⌨️V+☗1086 
				⌨️W+☗1087 ⌨️X+☗1088 ⌨️Y+☗1089 ⌨️Z+☗1090 ⌨️NP0+☗1096 ⌨️NP1+☗1097 
				⌨️NP2+☗1098 ⌨️NP3+☗1099 ⌨️NP4+☗1100 ⌨️NP5+☗1101 ⌨️NP6+☗1102 
				⌨️NP7+☗1103 ⌨️NP8+☗1104 ⌨️NP9+☗1105 ⌨️*+☗1106 ⌨️++☗1107 
				⌨️-+☗1109 ⌨️/+☗1111 ⌨️F1+☗1112 ⌨️F2+☗1113 ⌨️F3+☗1114 
				⌨️F4+☗1115 ⌨️F5+☗1116 ⌨️F6+☗1117 ⌨️F7+☗1118 ⌨️F8+☗1119 
				⌨️F9+☗1120 ⌨️F10+☗1121 ⌨️F11+☗1122 ⌨️F12+☗1123 ⌨️F13+☗1124 
				⌨️F14+☗1125 ⌨️F15+☗1126 ⌨️F16+☗1127 ⌨️F17+☗1128 ⌨️F18+☗1129
				 ⌨️F19+☗1130 ⌨️F20+☗1131 ⌨️F21+☗1132 ⌨️F22+☗1133 ⌨️F23+☗1134
				  ⌨️F24+☗1135 ⌨️NumLock+☗1144 ⌨️ScrollLock+☗1145 ⌨️Shift+☗1160 
				  ⌨️Control+☗1162 ⌨️Alt+☗1164 ⌨️Menu+☗1164 ⌨️🔇+☗1173 
				  ⌨️🔉+☗1174 ⌨️🔊+☗1175 ⌨️Next+☗1176 ⌨️Previous+☗1177 
				  ⌨️Stop+☗1178 ⌨️Play+☗1179 ⌨️OEM1+☗1186 ⌨️OEMPlus+☗1187
				   ⌨️OEMComma+☗1188 ⌨️OEMMinus+☗1189 ⌨️OEMPeriod+☗1190 
				   ⌨️OEM2+☗1191 ⌨️OEM3+☗1192 ⌨️OEM4+☗1219 ⌨️OEM5+☗1220 
				   ⌨️OEM6+☗1221 ⌨️OEM7+☗1222 ⌨️OEM8+☗1223 ⌨️OEM102+☗1226  

"""

@export var _unicode_to_integer: Dictionary[String, int] = {}


# 🖱️R+ 2000> 🖱️R-hot 

func _ready() -> void:
	append_unicode_to_integer_from_text_mapping(_unicode_to_int_add_at_ready)

func append_unicode_to_integer_mapping(unicode_char: String, integer_value: int) -> void:
	_unicode_to_integer[unicode_char] = integer_value


func append_unicode_to_integer_from_text_mapping(text: String, splitter_word: String = "☗") -> void:
	text = text.replace("\n"," ").replace("\t"," ").replace("\r"," ")
	while text.find("  ") != -1:
		text = text.replace("  "," ")

	var lines = text.split(" ")
	for line in lines:
		var parts = line.split(splitter_word)
		if parts.size() == 2:
			parts[0] = parts[0].strip_edges()
			parts[1] = parts[1].strip_edges()
			if parts[0] != "" and is_text_integer(parts[1]):
				var integer_value = int(parts[1])
				append_unicode_to_integer_mapping(parts[0].to_lower(), integer_value)


var _digits: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
func is_char_digit(c: String) -> bool:
	if c in _digits:
		return true
	else:
		return false

func is_able_to_interpret_given_word(word: String) -> bool:
	## of size over 2 and start with ~ and finish with > and the middle is a number
	return word.length() > 2 and word.begins_with("~") and word.ends_with(">")
	
func interpret_given_word(word: String) -> void:
	var is_valid_integer = is_able_to_interpret_given_word(word)
	if not is_valid_integer:
		return 
	word = word.strip_edges()
	word = word.substr(1, word.length() - 2) # Remove the ~ and >
	
	if word.find("|") < 0:
		if is_text_integer(word):
			##~1032> Send to all alias in TBIO
			var integer_value = int(word)
			on_integer_found_for_all.emit(integer_value)
			return 
		else:
			if _unicode_to_integer.has(word.to_lower()):
				var integer_value = _unicode_to_integer[word.to_lower()]
				on_integer_found_for_all.emit(integer_value)
			return
	
	var parts = word.split("|")
	if parts.size() == 2:
		##~1|1032> Send to all alias in TBIO
		var alias = parts[0]
		var integer_part = try_to_replace_text_by_integer_if_not_integer(parts[1])
		if is_text_integer(parts[0]) and is_text_integer(integer_part):
			on_index_integer_found_for_all.emit(int(parts[0]), int(integer_part))
		elif not is_text_integer(alias) and is_text_integer(integer_part):
			var integer_value = int(integer_part)
			on_integer_found_for_alias.emit(alias, integer_value)
	elif parts.size() == 3:
		var alias = parts[0]
		var index_part = parts[1]
		var integer_part = try_to_replace_text_by_integer_if_not_integer(parts[2])
		if is_text_integer(index_part) and is_text_integer(integer_part):
			var index = int(index_part)
			var integer_value = int(integer_part)
			on_index_value_integer_found_for_alias.emit(alias, index, integer_value)
		elif parts[1] == "t":
			var text_part = parts[2]
			on_request_to_send_small_text_to_alias.emit(alias, text_part)
	elif parts.size() == 4:
		var alias = parts[0]
		var index_part = parts[1]
		var integer_part = try_to_replace_text_by_integer_if_not_integer(parts[2])
		var date_part = parts[3]
		if is_text_integer(index_part) and is_text_integer(integer_part) and is_text_integer(date_part):
			var index = int(index_part)
			var integer_value = int(integer_part)
			var date_value = int(date_part)
			on_index_value_date_found_for_alias.emit(alias, index, integer_value, date_value)	
	
		##~Paul|1032> Send a int to Paul
		##~Paul|1032> Send a int to Paul
		##~Paul|1|1032> Send a int to Paul with index 1
		##~Paul|1|1032|500> Send a int to Paul with index 1 to execute in 500 after reception
		##~Paul|t|Hello> Send Hello to Paul (no spaces in the text)
	

const digit_chars: String = "-0123456789"
func is_text_digit(text: String) -> bool:
	## Check if the text is a valid integer representation
	if text.length() == 0:
		return false
	for c in text:
		if not digit_chars.find(c) != -1:
			return false
	return true

func is_text_integer(text: String) -> bool:
	for c in text:
		if not is_text_digit(c) and c != "-":
			return false
	return true


func try_to_replace_text_by_integer_if_not_integer(text: String) -> String:
	if is_text_integer(text):
		return text
	else:
		if _unicode_to_integer.has(text.to_lower()):
			return str(_unicode_to_integer[text.to_lower()])
		else:
			return text
