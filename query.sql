SELECT
sys.name,
sys.coords_x,
sys.coords_y,
sys.coords_z,
codex."Codex Entry"
FROM airbyte_codex_dump codex
INNER JOIN db_system sys ON sys.id64=codex."System Address / ID64"
WHERE codex."Codex Entry" = 'Guardian Ruins'