local Https = require "ssl.https"
local helpers = require "OAuth.helpers"
local Ltn12 = require "ltn12"

local url = "https://api.imgflip.com/caption_image"
local imageUrl = "https://imgflip.com/memegenerator/35076327/kicknorris"
local name = ""
local text_0 = ""
local text_1 = ""

function create_meme(imageID, text_up, text_down)
	if text_up == nil then text_0 = ""..name.." has been kicked" else text_0 = text_up end
	if text_down == nil then text_1 = "by Chuck Norris" else text_1 = text_down end
	local arguments = {
		template_id = imageID,
		username = "Ashida",
		password = "024680",
		text0 = text_0,
		text1 = text_1
	}
	local response_body = {}
	local request_constructor = {
		url = url,
		method = "POST",
		headers={}
		sink = Ltn12.sink.table(response_body),
	}

	local source = helpers.url_encode_arguments(arguments)
	request_constructor.headers["Content-Type"] = "application/x-www-form-urlencoded"
	request_constructor.headers["Content-Length"] = tostring(#source)
	request_constructor.source = Ltn12.source.string(source)

	local ok, response_code, response_headers, response_status_line = Https.request(request_constructor)
	if not ok then
		return nil, response_code, response_headers, response_status_line, response_body
	end
   print(table.concat(response_body))
   return response_body.url
end

create_meme(35076327, 'test', 'test2')

local function run(msg, matches)
	local receiver = get_receiver(msg)
	if matches[1] == "!kick" then
   		 name = matches[2]
   		 text_0 = matche[3]
   		 text_1 = matche[4]
  	end
  	if name ~= nil then
    	local ok, meme = create_meme(35076327, text_0, text_1)
    	if ok then
    		send_photo_from_url(receiver, meme)
    	else
    		return 'Chuck Norris had problems to kick'..name..', please try again later.' 
	else
	    return 'Chuck Norris had problems to kick you, please try again later.' 
 	end
end

return {
   description = "Chuck Norris kicks you and your friends",
   usage = {
      "!kick name [text Up] [text Down]: Edit an image of Chuck and write the 'name' on it",
   },
   patterns = {
      "^!kick name (textUp) (textDown)"
   },
   run = run
}