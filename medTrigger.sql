/* ============================================================================
   triggers.sql
   Sistema Médico 
   ============================================================================ */
USE medsys;
DELIMITER $$

/* ---------------------------------------------------------
   TRIGGER: enfermedad_regla_sintoma BEFORE UPDATE
--------------------------------------------------------- */
DROP TRIGGER IF EXISTS trg_ers_bu$$
CREATE TRIGGER trg_ers_bu
BEFORE UPDATE ON enfermedad_regla_sintoma
FOR EACH ROW
BEGIN
  INSERT INTO enfermedad_regla_sintoma_hist
    (id_origen, enfermedad_id, sintoma_id, peso, nivel_min, nivel_max,
     severidad_min_id, severidad_max_id, frecuente, secuencia_min, secuencia_max,
     comentario, vigente_desde, vigente_hasta, created_by, created_at, cambio_usuario)
  VALUES
    (OLD.id, OLD.enfermedad_id, OLD.sintoma_id, OLD.peso, OLD.nivel_min, OLD.nivel_max,
     OLD.severidad_min_id, OLD.severidad_max_id, OLD.frecuente, OLD.secuencia_min, OLD.secuencia_max,
     OLD.comentario, OLD.vigente_desde, OLD.vigente_hasta, OLD.created_by, OLD.created_at, CURRENT_USER());
END$$

/* ---------------------------------------------------------
   TRIGGER: configuracion BEFORE UPDATE
--------------------------------------------------------- */
DROP TRIGGER IF EXISTS trg_conf_bu$$
CREATE TRIGGER trg_conf_bu
BEFORE UPDATE ON configuracion
FOR EACH ROW
BEGIN
  INSERT INTO configuracion_hist
    (id_origen, nombre, descripcion, valor, vigente_desde, vigente_hasta,
     created_by, created_at, cambio_usuario)
  VALUES
    (OLD.id, OLD.nombre, OLD.descripcion, OLD.valor, OLD.vigente_desde, OLD.vigente_hasta,
     OLD.created_by, OLD.created_at, CURRENT_USER());
END$$

/* ---------------------------------------------------------
   TRIGGER: paciente BEFORE UPDATE
--------------------------------------------------------- */
DROP TRIGGER IF EXISTS trg_paciente_bu$$
CREATE TRIGGER trg_paciente_bu
BEFORE UPDATE ON paciente
FOR EACH ROW
BEGIN
  SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

/* ---------------------------------------------------------
   TRIGGER: consulta BEFORE UPDATE
--------------------------------------------------------- */
DROP TRIGGER IF EXISTS trg_consulta_bu$$
CREATE TRIGGER trg_consulta_bu
BEFORE UPDATE ON consulta
FOR EACH ROW
BEGIN
  SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

/* ---------------------------------------------------------
   TRIGGER: sintoma_observado BEFORE UPDATE
--------------------------------------------------------- */
DROP TRIGGER IF EXISTS trg_sintoma_obs_bu$$
CREATE TRIGGER trg_sintoma_obs_bu
BEFORE UPDATE ON sintoma_observado
FOR EACH ROW
BEGIN
  SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

/* ---------------------------------------------------------
   TRIGGER: diagnostico BEFORE UPDATE
--------------------------------------------------------- */
DROP TRIGGER IF EXISTS trg_diagnostico_bu$$
CREATE TRIGGER trg_diagnostico_bu
BEFORE UPDATE ON diagnostico
FOR EACH ROW
BEGIN
  SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

DELIMITER ;
