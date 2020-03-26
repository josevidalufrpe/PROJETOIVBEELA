import json
import facebook

ACESS_TOKEN = "EAADIGMeKxFQBAO8BryEnIiFnu0QiTgIUj4rEWgsCanUmXt5ZB03z2SEVfjZBd35ZAWZATEawbCLC40NSy4hFMZCO3XzDTo4y1t6PUcd9LldxeUGpuLwamZBWPSsKfuCyN3TKBOT1L0IO7qc7vwSHDPmF4Mi5c46GruOylFAdEM4NTQXdUghKExOAdzSgHZCWVLnCE9pGNtcjQZDZD"

token = ACESS_TOKEN
graph = facebook.GraphAPI(token)
profile = graph.get_object('me',fields="first_name,email,posts")
print("Perfil")
print(type(profile))

print(json.dumps(profile,indent=3))
print(type(json.dumps(profile,indent=3)))