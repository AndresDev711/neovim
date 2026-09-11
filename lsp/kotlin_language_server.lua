---@type vim.lsp.Config
return {
	cmd = {
		"/usr/bin/env",
		"JAVA_HOME=/Users/andredev711/Library/Java/JavaVirtualMachines/temurin-21.0.12.1/Contents/Home",
		"PATH=/Users/andredev711/Library/Java/JavaVirtualMachines/temurin-21.0.12.1/Contents/Home/bin:" .. vim.env.PATH,
		vim.fn.stdpath("data") .. "/mason/bin/kotlin-language-server",
	},
	filetypes = { "kotlin" },
	root_markers = {
		"settings.gradle",
		"settings.gradle.kts",
		"build.gradle",
		"build.gradle.kts",
		"pom.xml",
		".git",
	},
	single_file_support = true,
}
