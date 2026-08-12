class_name SCmdScInterpreterOpenUrlOnKeyword
extends SCmdScInterpreterAbstractBidderNode

@export var _dictionary_keyword_to_url: Dictionary[String, String] = {
	"google": "https://www.google.com",
	"youtube": "https://www.youtube.com",
	"wikipedia": "https://www.wikipedia.org",
	"reddit": "https://www.reddit.com",
	"twitter": "https://www.twitter.com",
	"facebook": "https://www.facebook.com",
	"instagram": "https://www.instagram.com",
	"linkedin": "https://www.linkedin.com",
	"amazon": "https://www.amazon.com",
	"ebay": "https://www.ebay.com",
	"stackoverflow": "https://stackoverflow.com",
	"github": "https://github.com",
	"gmail": "https://mail.google.com",
	"yahoo": "https://www.yahoo.com",
	"bing": "https://www.bing.com",
	"duckduckgo": "https://duckduckgo.com",
	"twitch": "https://www.twitch.tv",
	"spotify": "https://www.spotify.com",
	"discord": "https://discord.com",
}

func is_able_to_interpret_given_word(word: String) -> bool:
	return _dictionary_keyword_to_url.has(word)

func interpret_given_word(word: String) -> void:
	if not _dictionary_keyword_to_url.has(word):
		return
	var url = _dictionary_keyword_to_url[word]
	if url == "":
		return
	OS.shell_open(url)
