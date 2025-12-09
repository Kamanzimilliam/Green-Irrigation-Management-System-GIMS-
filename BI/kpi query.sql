SELECT
  COUNT(*) AS total_sessions,
  SUM(water_used_l) AS total_water,
  SUM(energy_used_kwh) AS total_energy,
  COUNT(DISTINCT pump_id) AS total_pumps
FROM irrigation_sessions;
