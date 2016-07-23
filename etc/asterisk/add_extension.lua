function add_extension(phone_no)
  if not extensions then
     extensions = {}
  end
  extensions["from-" .. phone_no] = {
    ["_."] = function(context, extension)
      if string.sub(extension, 1, 2) == "00" then
        extension = "+46" .. string.sub(extension, 3)
      end
      if string.sub(extension, 1, 1) == "0" then
        extension = "+46" .. string.sub(extension, 2)
      end
      if not string.sub(extension, 1, 1) == "+" then
        extension = "+" .. extensoin
      end
      app.set("CALLERID(all)=<" .. phone_no .. ">")
      app.dial("PJSIP/twilio0/sip:" .. extension .. "@doubleoseven.pstn.twilio.com")
      app.hangup()
    end;
  }
end;
