o=`jq -r '.bpi | keys[] as $k | "\($k) \(.[$k])"' bitcoinhist.json`

docker exec influxdata-btc_db_1 influx -execute "CREATE DATABASE bitcoin"

echo "$o" | while IFS= read -r i; do
  echo "Inserting $i..."
  day=`echo $i | cut -d" " -f1`
  timestamp=`date +"%s" -d ${day}`
  price=`echo $i | cut -d" " -f2`

  docker exec influxdata-btc_db_1 influx -database "bitcoin" -execute "INSERT bitcoin price=${price} ${timestamp}000000000"
done
