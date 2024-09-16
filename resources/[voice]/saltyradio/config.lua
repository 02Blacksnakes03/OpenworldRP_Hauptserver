Config = {}

Config.enableCmd = true --  /radio command should be active or not (if not you have to carry the item "radio") true / false

Config.RestrictedChannels = {
  [110] = {
    ['police'] = true
  },
  [112] = {
    ['ambulance'] = true
  },
  [113] = {
    ['police'] = true,
    ['ambulance'] = true
  },
}

Config.messages = {
  ['not_on_radio'] = 'Du bist aktuell mit keinem Funkkanal verbunden.',
  ['on_radio'] = 'Funkverbindung aktiv: <b>%s</b>',
  ['joined_to_radio'] = 'Du bist dem Funkkanal <b>%s</b>.00 MHz beigetreten.',
  ['restricted_channel_error'] = 'Du kannst dem verschlüsselten Funkkanal <b>%s</b>.00 MHz nicht beitreten!',
  ['you_on_radio'] = 'Du bist bereits im <b>%s</b>.00 MHz Funkkanal.',
  ['you_leave'] = 'Du hast die Verbindung von Funkkanal <b>%s</b>.00 MHz getrennt.'
}
