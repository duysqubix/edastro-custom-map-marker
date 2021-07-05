import json

import psycopg2

from subprocess imprt cmd

if __name__ == "__main__":
    conn = psycopg2.connect("host=localhost dbname=postgres user=postgres password=postgres")
    cur = conn.cursor()

    with open("query.sql", 'r') as f:
        stmt = f.read()

    cur.execute(stmt)

    markers = {"markers": list()}
    for record in cur.fetchall():
        marker = {
            "pin": "green",
            "text": f"{record[-1]}/{record[0]}",
            "x": record[1],
            "y": record[2],
            "z": record[3]
        }
        markers['markers'].append(marker)

    json.dump(markers, open('markers.json', 'w'))

    
