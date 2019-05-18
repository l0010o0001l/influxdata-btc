# InfluxDB / Chronograf w/ Coindesk BTC Data

This is me playing with InfluxDB and Chronograf using [Coindesk's API](https://www.coindesk.com/api) to look through historical bitcoin prices.

### If you wanna play too

- Ensure [JQ](https://stedolan.github.io/jq/download/), [Docker Engine](https://docs.docker.com/install/), and [Docker Compose](https://docs.docker.com/compose/install/) is installed on the host machine
- Clone the project repository
- `cd` into the project repository and run `docker-compose up`
- Run `./ingest.sh`

The ingest will take a minute, but in the meantime you can point your browser to `http://localhost:8888`. When creating the InfluxDB Connection, point the `Connection URL` to `http://db:8086` (uses Docker Compose’s built-in DNS resolution to connect to the influxdb container).

Check out the Explore tab on the left, where you can execute InfluxQL queries. See what's been inserted so far with `SELECT * FROM "bitcoin"."autogen"."bitcoin"`. You can create visualizations for dashboards from data retrieved through this sweet query interface.

I'm impressed with these products so far. Chronograf is slick like butter. :scream:
