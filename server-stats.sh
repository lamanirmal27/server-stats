# server status 
echo "##########"
echo "Total Cpu Usage:" 
echo "##########"
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'
echo
echo "##########"
echo "Memory Status"
echo "##########"
free | grep 'Mem:' | awk '{printf "Total: %.2fGb\nFree: %.2f%%\nUsed: %.2f%%\n",$2/(1024*1024), ($4/$2)*100, ($3/$2)*100}'
echo
echo "##########"
echo "Disk Status"
echo "##########"
df -h | grep '/dev/root' | awk '{printf "Total: %dGb\nUsed: %.2f %%\nAvailable: %.2f %%\n", $2, ($3/$2)*100, ($4/$2)*100}'
echo 
echo "##########"
echo "Top 5 process by CPU usage"
echo "##########"
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo
echo "##########"
echo "Top 5 process by Memory usage"
echo "##########"
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
