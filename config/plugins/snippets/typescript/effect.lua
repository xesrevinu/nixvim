return {
	s("gg", {
		t({ "Effect.gen(function*() {", "" }),
		t("\t"),
		i(1),
		t({ "", "})" }),
	}),
	s("yy", {
		t({ "yield*", " " }),
		i(1),
	}),
	s("internal", {
		t({ "/** @internal */" }),
	}),
}
