#!/usr/bin/env ruby

require 'json'

# event types extracted from Karabiner-Elements/src/share/event_queue.hpp
event_types = [
  "key_code",
  "pointing_button",
  "pointing_x",
  "pointing_y",
  "pointing_vertical_wheel",
  "pointing_horizontal_wheel",
  "shell_command",
  "device_keys_are_released",
  "device_pointing_buttons_are_released",
  "device_ungrabbed",
  "caps_lock_state_changed",
  "event_from_ignored_device",
  "frontmost_application_changed",
  "set_variable"
]

html = ""
data = JSON.parse($stdin.read)
data["rules"].each do |rule|
  description = rule["description"]
  extra_description_level = rule.key?("extra_description_level") ?
    rule["extra_description_level"] : 2
  next if extra_description_level < 1
  ex_desc = rule.key?("extra_descriptions") ? rule["extra_descriptions"] : []
  extra_descriptions = ""
  if ex_desc.length > 0
    extra_descriptions += "<ul>\n"
    ex_desc.each do |d|
      extra_descriptions += "  <li>#{d}</li>\n"
    end
    extra_descriptions += "</ul>\n"
  end
  keys = ""
  if extra_description_level >= 2
    keys += "<table class=\"table\">\n"
    keys += "  <captions>Key bindings</captions>\n"
    rule["manipulators"].each do |manipulator|
      from = manipulator["from"]
      from_key = from.key?("key_code") ?
        from["key_code"] : from["pointing_button"]
      from_modifiers = (from.key?("modifiers") and
                        from["modifiers"].key?("mandatory")) ?
                          from["modifiers"]["mandatory"] : []

      to = manipulator["to"]
      if not to
        next
      end
      to_keys = []
      to_modifiers = []
      to.each do |t|
        event_types.each do |e|
          if t.key?(e)
            if ["key_code", "pointing_button"].include?(e)
              to_keys.push(t[e])
            else
              to_keys.push("#{e}: #{t[e]}")
            end
            to_modifiers.push(t.key?("modifiers") ? t["modifiers"] : [])
            next
          end
        end
      end
      keys += "  <tr>\n"
      keys += "    <td>"
      from_modifiers.each do |m|
        keys += "#{m}-"
      end
      keys += "#{from_key}</td>\n"
      keys += "    <td>"
      to_keys.each_with_index do |t, i|
        keys += ", " if i > 0
        to_modifiers[i].each do |m|
          keys += "#{m}-"
        end
        keys += "#{t}"
      end
      keys += "</td>\n"
      keys += "  </tr>\n"
    end
    keys  += "</table>\n"
  end

  html += <<~EOS
    <p style="margin-top: 20px; font-weight: bold">
      #{description}
    </p>

    #{extra_descriptions}

    #{keys}
  EOS
end
puts html
