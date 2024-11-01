import type { Config } from "release-it";
import { repository } from "./package.json";

export default {
	npm: {
		publish: true,
	},
	github: {
		release: true,
		tokenRef: "GITHUB_TOKEN",
		releaseName: "v${version}",
	},
	git: {
		tagName: "v${version}",
		commitMessage: "chore(release): v${version} [skip ci]",
		tagAnnotation: "v${version}",
		push: true,
		commit: true,
		tag: true,
		requireCommits: false,
		requireCleanWorkingDir: false,
	},
	plugins: {
		"@release-it/conventional-changelog": {
			preset: {
				name: "conventionalcommits",
				types: [
					{
						type: "feat",
						section: "✨ Novos Recursos",
					},
					{
						type: "fix",
						section: "🐛 Correções de Bugs",
					},
					{
						type: "chore",
						section: "🔧 Outras Tarefas",
					},
					{
						type: "docs",
						section: "📝 Documentação",
					},
					{
						type: "style",
						section: "💄 Estilo",
					},
					{
						type: "refactor",
						section: "♻️ Refatoração",
					},
					{
						type: "perf",
						section: "⚡️ Desempenho",
					},
					{
						type: "test",
						section: "✅ Testes",
					},
				],
			},
			infile: "CHANGELOG.md",
			header: "# Changelog\n\nTodos os lançamentos.",
			gitRawCommitsOpts: {
				format: `%s (%cn) ([%h](${repository.url.replaceAll(/(\.git)|(git\+)/g, "")}/commit/%h)) [%ai]`,
			},
		},
	},
} satisfies Config;
