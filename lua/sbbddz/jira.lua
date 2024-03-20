local jira = {}
local Job = require("plenary.job")
local issues = {}
local env = vim.fn.environ()
local jira_query = env["JIRA_QUERY"] or nil
local jira_url = env["JIRA_URL"] or nil

if jira_query ~= nil and jira_url ~= nil then
	Job:new({
		command = "curl",
		args = { jira_url .. jira_query },
		on_exit = function(job, _)
			local issues_response = vim.json.decode(job:result()[1])["issues"]

			for k, v in pairs(issues_response) do
				issues[k] = { label = v["key"], detail = v["fields"]["summary"] }
			end
		end,
	}):start()
end

function jira:is_available()
	return vim.bo.filetype == "gitcommit"
end

function jira:get_keyword_pattern()
	return [[\k\+]]
end

function jira:get_trigger_characters()
	return { "[" }
end

function jira:complete(_, callback)
	callback(issues)
end

return jira
