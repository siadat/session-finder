TMUX = %(/usr/bin/env tmux)
PROMPT = "session> "
CMD_HELP = {":help", ":h"}
CMD_RENAME = {":rename"}
CMD_NEXT = {":next"}
COLORS = %w(red green yellow blue magenta cyan white)
STYLE_NORMAL = "#[fg=%s]%s#[fg=default,bg=default]"
STYLE_ACTIVE = "#[bg=%s,fg=default]%s#[bg=default]"
SESSION_ATTACHED = 1
RE_SESSIONS = /^(\d+) (\d+) (\d+) \$(\d+) (\d+) (.+)$/
HELP = "Usage:" +
       "  existing-session-name<CR>" +
       "  new-session-name<CR>" +
       "  :rename new-name-for-current-session<CR>"

def session_names
	%x(#{TMUX} ls -F "\#{session_attached} \#{session_last_attached}\#{?session_last_attached,,0} \#{session_created} \#{session_id} \#{session_windows} \#{session_name}")
end

def session_select
	%x(#{TMUX} ls -F '\#{session_attached} \#{?session_last_attached,,0}\#{session_last_attached} \#{session_name}' | grep -v '^1' | sort -r | perl -pe 's/^0 [0-9]+//' | fzf --print-query --prompt='#{PROMPT}').split(/[\n\r]+/)
end

def session_rename name
	%x(#{TMUX} rename-session #{name}) unless name.empty?
end

def session_new name
	ENV["TMUX"] = ""
	%x(#{TMUX} new-session -d -s #{name}) unless name.empty?
end

def client_switch name
	%x(#{TMUX} switch-client -t #{name}) unless name.empty?
end

def client_width
	%x(#{TMUX} list-clients -F '\#{client_activity} \#{client_width}' | sort | head -n 1).split.last.to_i
end

def status_line
	windows = [] of String
	max_width = client_width * 3/4.0
	width = 0
	session_names.split(/\n/).sort.reverse.each_with_index do |line, i|
		_, flag, attached_at, created_at, id, windows_count, name = line.scan(RE_SESSIONS).first
		colori = (id[/\d+/].to_i + 2) % COLORS.count
		break if width + name.length + windows.count > max_width
		width += name.length
		if flag.to_i == SESSION_ATTACHED
			windows = [STYLE_ACTIVE % [COLORS[colori], name]] + windows
		else
			windows << STYLE_NORMAL % [COLORS[colori], name]
		end
	end
	windows.join("|")
end

def main
	exit 1 if ARGV.none?
	refresh = true

	case ARGV.pop
	when "status"
		refresh = false
		print status_line
		exit 0
	when "new"
		%x(#{TMUX} new-session)
	when "next"
		%x(#{TMUX} switch-client -n)
	when "prev"
		%x(#{TMUX} switch-client -p)
	when "last"
		%x(#{TMUX} switch-client -l)
	when "command"
		fzf_result = session_select
		exit 0 if fzf_result.none?

		session = fzf_result.last
		words = session.split(/\s+/)

		if CMD_RENAME.includes?(words.first)
			session_rename words[1..-1].join(" ")
			return
		elsif CMD_HELP.includes?(words.first)
			puts HELP
			return gets
		end

		case fzf_result.length
		when 1
			# Session not found, create a new session.
			session_new session
			client_switch session
		when 2
			# Session found, switch.
			client_switch session
		end
	end

	if refresh
		%x(#{TMUX} refresh -S)
	end
end

main
