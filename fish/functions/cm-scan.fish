# Defined in - @ line 0
function cm-scan --description 'alias cm-scan sudo arp-scan --localnet |grep Elite'
	sudo arp-scan --localnet |grep Elite $argv;
end
