local ls = require "luasnip"


ls.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/custom/plugins/luasnip.lua<CR>")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

ls.setup({
	keep_roots = true,
	link_roots = true,
	link_children = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".")
	end,
})

local function copy(args)
	return args[1]
end




ls.add_snippets("dart", {
	s("a-test", {
		t("test(\""),
		i(1, "testname"),
		t("\") async {"),
		i(2),
		t("});"),
	}),
	s("ex", {
		t("export \""),
		i(1, "file.dart"),
		t("\";"),
	}),
	s(
		"fmt1",
		fmt("To {title} {} {}.", {
			i(2, "Name"),
			i(3, "Surname"),
			title = c(1, { t("Mr."), t("Ms.") }),
		})
	),
	s("fn", {
		-- Simple static text.
		t("//Parameters: "),
		-- function, first parameter is the function, second the Placeholders
		-- whose text it gets as input.
		f(copy, 2),
		t({ "", "function " }),
		-- Placeholder/Insert.
		i(1),
		t("("),
		-- Placeholder with initial text.
		i(2, "int foo"),
		-- Linebreak
		t({ ") {", "\t" }),
		-- Last Placeholder, exit Point of the snippet.
		i(0),
		t({ "", "}" }),
	}),

	s("gen-store", {
		t({ "// ignore_for_file: must_be_immutable, library_private_types_in_public_api", "\t" }),
		t({ "import 'package:mobx/mobx.dart';", "\t" }),
		t({ "import 'package:equatable/equatable.dart';", "\t" }),
		t("part '"),
		i(1, 'store_name'),
		t({ "_store.g.dart';", "\t" }),
		t({ "class " }),
		i(2, "StoreName"),
		t("Store = _"),
		f(copy, 2),
		t("StoreBase with _$"),
		f(copy, 2),
		t({ "Store;", "\t", "\t" }),
		t("abstract class _"),
		f(copy, 2),
		t({ "StoreBase extends Equatable with Store {", "\t", }),
		t({ "@override", "\t", "List<Object> get props => [];", "\t", }),
		i(0),
		t("}")
	}),
	s("gen-coord", {
		t({ "// ignore_for_file: must_be_immutable, library_private_types_in_public_api", "\t" }),
		t({ "import 'package:mobx/mobx.dart';", "\t" }),
		t({ "import 'package:equatable/equatable.dart';", "\t" }),
		t("part '"),
		i(1, 'store_name'),
		t({ "_coordinator.g.dart';", "\t" }),
		t({ "class " }),
		i(2, "StoreName"),
		t("Coordinator = _"),
		f(copy, 2),
		t("CoordinatorBase with _$"),
		f(copy, 2),
		t({ "Coordinator;", "\t", "\t" }),
		t("abstract class _"),
		f(copy, 2),
		t({ "CoordinatorBase extends Equatable with Store {", "\t", }),
		t({ "@override", "\t", "List<Object> get props => [];", "\t", }),
		i(0),
		t("}")
	}),
	s("logic", {
		t({ "import 'package:nokhte/app/core/interfaces/logic.dart';", "\t" }),
		t({ "import 'package:nokhte/app", }),
		i(1, "/core"),
		t("/modules/"),
		i(2, "moduleName"),
		t({ "/domain/domain.dart';", "\t" }),
		t({ "class", "\t" }),
		i(3, "LogicClassName"),
		t("implements AbstractFutureLogic<"),
		i(4, "ReturnEntity"),
		t(", "),
		i(5, "NoParams"),
		t({ "> {", "\t" }),
		t({ "final " }),
		i(6, "ContractInterface"),
		t({ " contract;", "\t" }),
		f(copy, 3),
		t({ "({required this.contract});", "\t" }),
		t({ "@override", "\t" }),
		t({ "call(params) async => await contract." }),
		i(7, "methodName"),
		t({ "(params);", "\t", "}" }),
	}),
	s("contract", {
		t({ "import 'package:dartz/dartz.dart';", "\t" }),
		t({ "import 'package:nokhte/app/core/error/failure.dart';", "\t" }),
		t({ "import 'package:nokhte/app/core/interfaces/logic.dart';", "\t" }),
		t({ "import 'package:nokhte/app", }),
		i(1, "/core"),
		t("/modules/"),
		i(2, "moduleName"),
		t({ "/domain/domain.dart';", "\t" }),
		t("abstract class "),
		i(3, "ContractName"),
		t({ "{", "\t" }),
		t("Future<Either<Failure, "),
		i(4, "ReturnEntity"),
		t(">>"),
		i(5, "methodName"),
		t("("),
		i(6, "NoParams"),
		t({ ");", "\t", "}" }),
	}),
	s("contract-impl", {
		t({ "import 'package:nokhte/app", }),
		i(1, "/core"),
		t("/modules/"),
		i(2, "moduleName"),
		t({ "/domain/domain.dart';", "\t" }),
		t({ "import 'package:nokhte/app", }),
		f(copy, 1),
		t("/modules/"),
		f(copy, 2),
		t({ "/data/data.dart';", "\t" }),
		t({ "import 'package:nokhte/app/core/network/network_info.dart';", "\t" }),
		t({ "import 'package:nokhte/app/core/constants/failure_constants.dart';", "\t" }),
		t("class "),
		i(3, "ContractName"),
		t("ContractImpl implements "),
		f(copy, 3),
		t({ "Contract {", "\t" }),
		t("final "),
		f(copy, 3),
		t({ "RemoteSource remoteSource;", "\t" }),
		t({ "final NetworkInfo networkInfo;", "\t" }),
		f(copy, 3),
		t({ "ContractImpl({", "\t" }),
		t({ "required this.remoteSource,", "\t", "required this.networkInfo,", "\t" }),
		t({ "});", "\t", "}" })


	}),
	s("rs", {
		t({ "abstract class " }),
		i(1, "Module"),
		t({ "RemoteSource {", "\t" }),
		t("Future<"),
		i(2, "Type"),
		t("> "),
		i(3, "methodName"),
		t("("),
		i(4),
		t({ ");", "\t", "}" }),
	}),
	s("rs-impl", {
		t("class "),
		i(1, "RSName"),
		t("RemoteSourceImpl implements "),
		f(copy, 1),
		t("RemoteSource {}"),
	}),

})


return {}
