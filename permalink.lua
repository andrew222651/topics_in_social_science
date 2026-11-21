-- Replaces git-history placeholders in the document:
--   COMMIT_SHA   -> commit SHA being built (GITHUB_SHA env, fallback "main")
--   LAST_UPDATED -> date of the last commit touching index.md
-- GITHUB_SHA is set automatically in GitHub Actions; for local renders we
-- fall back to the "main" branch.
local sha = os.getenv("GITHUB_SHA")
if sha == nil or sha == "" then
  sha = "main"
end

local function git_first_line(args)
  -- -c safe.directory='*' lets this open a repo owned by a different user
  -- (e.g. a Termux checkout rendered inside a Debian proot).
  local pipe = io.popen("git -c 'safe.directory=*' " .. args .. " 2>/dev/null", "r")
  if pipe == nil then
    return nil
  end
  local out = pipe:read("*l")
  pipe:close()
  if out == nil then
    return nil
  end
  out = out:gsub("^%s+", ""):gsub("%s+$", "")
  if out == "" then
    return nil
  end
  return out
end

-- Date of the last commit touching index.md, from git author date.
-- Falls back to the HEAD commit date (e.g. a shallow CI checkout where
-- the file's history is not present) and finally to today's date.
local function get_last_updated()
  local args = "log -1 --format=%ad --date=format:\"%B %d, %Y\""
  return git_first_line(args .. " -- index.md")
      or git_first_line(args .. " HEAD")
      or os.date("%B %d, %Y")
end

local last_updated = get_last_updated()

function Link(el)
  el.target = el.target:gsub("COMMIT_SHA", sha)
  return el
end

function Str(el)
  if el.text:find("LAST_UPDATED", 1, true) then
    el.text = el.text:gsub("LAST_UPDATED", last_updated)
  end
  return el
end
