-- Replaces the COMMIT_SHA placeholder in link targets with the commit
-- being built. GITHUB_SHA is set automatically in GitHub Actions; for
-- local renders we fall back to the "main" branch.
local sha = os.getenv("GITHUB_SHA")
if sha == nil or sha == "" then
  sha = "main"
end

function Link(el)
  el.target = el.target:gsub("COMMIT_SHA", sha)
  return el
end
