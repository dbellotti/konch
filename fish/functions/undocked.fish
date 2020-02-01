# Defined in - @ line 0
function undocked --description 'shows the docker containers as whales'
	set -l running_container_count (docker ps -q | wc -l)

	if test $running_container_count -gt 0
    set -l counter $running_container_count
		for x in (seq $running_container_count)
			printf " 🐳"
		end
	end
end
