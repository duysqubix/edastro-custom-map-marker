SELECT
sys.name,
sys.coords_x,
sys.coords_y,
sys.coords_z,
codex."Codex Entry"
FROM airbyte_codex_dump codex
INNER JOIN db_system sys ON sys.id64=codex."System Address / ID64"
WHERE codex."Codex Entry" like 'Guardian%' 
and (abs(sys.coords_x) > 300.0 and abs(sys.coords_y) > 500.0 and abs(sys.coords_z) > 500.0)