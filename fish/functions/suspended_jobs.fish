# Defined in - @ line 0
function suspended_jobs --description 'shows the suspended jobs as emojis'
	set -l running_jobs_count (jobs | wc -l)

	if test $running_jobs_count -gt 0
    set -l counter $running_jobs_count
		for x in (seq $running_jobs_count)
			printf " 👾"
		end
	end
end
