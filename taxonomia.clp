(deftemplate animal
   (slot vertebrado)
   (slot sangre_fria)
   (slot pelo)
   (slot plumas)
   (slot escamas)
   (slot carnivoro)
   (slot herbivoro)
   (slot omnivoro)
   (slot acuatico)
   (slot vive_mar)
   (slot aletas)
   (slot espinas)
   (slot brazos)
   (slot cuerpo_gelatinoso)
   (slot insecto)
   (slot alas)
   (slot patas)
   (slot garras)
   (slot antenas)
   (slot cola))

(deftemplate pregunta-realizada
   (slot tipo))

(defrule inicio
   =>
   (assert (animal)))

;;Reglas de consistencia
(defrule inconsistente-pelo-plumas
   (animal (pelo si) (plumas si))
   =>
   (printout t "Inconsistencia detectada: Un animal no puede tener pelo y plumas al mismo tiempo." crlf)
   (halt))

(defrule inconsistente-pelo-gelatinoso
   (animal (pelo si) (cuerpo_gelatinoso si))
   =>
   (printout t "Inconsistencia detectada: Un animal con cuerpo gelatinoso no puede tener pelo." crlf)
   (halt))

(defrule inconsistente-plumas-aletas
   (animal (plumas si) (aletas si))
   =>
   (printout t "Inconsistencia detectada: Un animal no puede tener plumas y aletas a la vez." crlf)
   (halt))

(defrule inconsistente-pelo-escamas
   (animal (pelo si) (escamas si))
   =>
   (printout t "Inconsistencia detectada: Un animal no puede tener pelo y escamas al mismo tiempo." crlf)
   (halt))

(defrule inconsistente-vertebrado-insecto
   (animal (vertebrado si) (insecto si))
   =>
   (printout t "Inconsistencia detectada: Un insecto no puede ser vertebrado." crlf)
   (halt))



(defrule inconsistente-alimentacion
   (animal (carnivoro si) (herbivoro si))
   =>
   (printout t "Inconsistencia detectada: Un animal no puede ser carnivoro y herviboro al mismo tiempo." crlf)
   (halt))

(defrule inconsistente-alimentacion-parte-dos
   (animal (carnivoro si) (omnivoro si))
   =>
   (printout t "Inconsistencia detectada: Un animal no puede ser carnivoro y omnivoro al mismo tiempo." crlf)
   (halt))

(defrule inconsistente-alimentacion-parte-tres
   (animal (herbivoro si) (omnivoro si))
   =>
   (printout t "Inconsistencia detectada: Un animal no puede ser herviboro y omnivoro al mismo tiempo." crlf)
   (halt))




;;Reglas para identificar animales
(defrule es-leon
   (animal (vertebrado si) (sangre_fria no) (pelo si) (plumas no) (escamas no) (carnivoro si) 
           (herbivoro no) (omnivoro no) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas si) (garras si) 
           (antenas no) (cola si))
   =>
   (printout t "El animal es un León." crlf))

(defrule es-aguila
   (animal (vertebrado si) (sangre_fria no) (pelo no) (plumas si) (escamas no) (carnivoro si) 
           (herbivoro no) (omnivoro no) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas si) (patas no) (garras si) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es un Águila." crlf))

(defrule es-tiburon
   (animal (vertebrado si) (sangre_fria si) (pelo no) (plumas no) (escamas si) (carnivoro si) 
           (herbivoro no) (omnivoro no) (acuatico si) (vive_mar si) (aletas si) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas no) (garras no) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es un Tiburón." crlf))

(defrule es-pulpo
   (animal (vertebrado no) (sangre_fria si) (pelo no) (plumas no) (escamas no) (carnivoro no) 
           (herbivoro no) (omnivoro no) (acuatico si) (vive_mar si) (aletas no) (espinas no) 
           (brazos si) (cuerpo_gelatinoso si) (insecto no) (alas no) (patas no) (garras no) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es un Pulpo." crlf))

(defrule es-mariposa
   (animal (vertebrado no) (sangre_fria no) (pelo no) (plumas no) (escamas no) (carnivoro no) 
           (herbivoro si) (omnivoro no) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto si) (alas si) (patas no) (garras no) 
           (antenas si) (cola no))
   =>
   (printout t "El animal es una Mariposa." crlf))

(defrule es-elefante
   (animal (vertebrado si) (sangre_fria no) (pelo si) (plumas no) (escamas no) (carnivoro no) 
           (herbivoro si) (omnivoro no) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas si) (garras no) 
           (antenas no) (cola si))
   =>
   (printout t "El animal es un Elefante." crlf))

(defrule es-serpiente
   (animal (vertebrado si) (sangre_fria si) (pelo no) (plumas no) (escamas si) (carnivoro si) 
           (herbivoro no) (omnivoro no) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas no) (garras no) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es una Serpiente." crlf))

(defrule es-rana
   (animal (vertebrado si) (sangre_fria si) (pelo no) (plumas no) (escamas no) (carnivoro no) 
           (herbivoro si) (omnivoro no) (acuatico si) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas no) (garras no) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es una Rana." crlf))

(defrule es-pez_payaso
   (animal (vertebrado si) (sangre_fria si) (pelo no) (plumas no) (escamas si) (carnivoro no) 
           (herbivoro no) (omnivoro si) (acuatico si) (vive_mar si) (aletas si) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas no) (garras no) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es un Pez Payaso." crlf))

(defrule es-perro
   (animal (vertebrado si) (sangre_fria no) (pelo si) (plumas no) (escamas no) (carnivoro no) 
           (herbivoro no) (omnivoro si) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto no) (alas no) (patas si) (garras no) 
           (antenas no) (cola si))
   =>
   (printout t "El animal es un Perro." crlf))

(defrule es-araña
   (animal (vertebrado no) (sangre_fria no) (pelo no) (plumas no) (escamas no) (carnivoro si) 
           (herbivoro no) (omnivoro no) (acuatico no) (vive_mar no) (aletas no) (espinas no) 
           (brazos no) (cuerpo_gelatinoso no) (insecto si) (alas no) (patas si) (garras si) 
           (antenas no) (cola no))
   =>
   (printout t "El animal es una Araña." crlf))

;;Preguntas para el usuario
(defrule pregunta-vertebrado
   (animal (vertebrado ?)) 
   (not (pregunta-realizada (tipo vertebrado)))
   =>
   (printout t "¿El animal es vertebrado? (si/no): ")
   (bind ?resp (read))
   (modify 1 (vertebrado ?resp))
   (assert (pregunta-realizada (tipo vertebrado))))

(defrule pregunta-sangre-fria
   (animal (sangre_fria ?)) 
   (not (pregunta-realizada (tipo sangre_fria)))
   =>
   (printout t "¿El animal tiene sangre fría? (si/no): ")
   (bind ?resp (read))
   (modify 1 (sangre_fria ?resp))
   (assert (pregunta-realizada (tipo sangre_fria))))

(defrule pregunta-pelo
   (animal (pelo ?)) 
   (not (pregunta-realizada (tipo pelo)))
   =>
   (printout t "¿El animal tiene pelo? (si/no): ")
   (bind ?resp (read))
   (modify 1 (pelo ?resp))
   (assert (pregunta-realizada (tipo pelo))))

(defrule pregunta-plumas
   (animal (plumas ?)) 
   (not (pregunta-realizada (tipo plumas)))
   =>
   (printout t "¿El animal tiene plumas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (plumas ?resp))
   (assert (pregunta-realizada (tipo plumas))))

(defrule pregunta-escamas
   (animal (escamas ?)) 
   (not (pregunta-realizada (tipo escamas)))
   =>
   (printout t "¿El animal tiene escamas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (escamas ?resp))
   (assert (pregunta-realizada (tipo escamas))))

(defrule pregunta-carnivoro
   (animal (carnivoro ?)) 
   (not (pregunta-realizada (tipo carnivoro)))
   =>
   (printout t "¿El animal es carnívoro? (si/no): ")
   (bind ?resp (read))
   (modify 1 (carnivoro ?resp))
   (assert (pregunta-realizada (tipo carnivoro))))

(defrule pregunta-herbivoro
   (animal (herbivoro ?)) 
   (not (pregunta-realizada (tipo herbivoro)))
   =>
   (printout t "¿El animal es herbívoro? (si/no): ")
   (bind ?resp (read))
   (modify 1 (herbivoro ?resp))
   (assert (pregunta-realizada (tipo herbivoro))))

(defrule pregunta-omnivoro
   (animal (omnivoro ?)) 
   (not (pregunta-realizada (tipo omnivoro)))
   =>
   (printout t "¿El animal es omnívoro? (si/no): ")
   (bind ?resp (read))
   (modify 1 (omnivoro ?resp))
   (assert (pregunta-realizada (tipo omnivoro))))



(defrule pregunta-acuatico
   (animal (acuatico ?))
   (not (pregunta-realizada (tipo acuatico)))
   =>
   (printout t "¿El animal es acuático? (si/no): ")
   (bind ?resp (read))
   (modify 1 (acuatico ?resp))
   (assert (pregunta-realizada (tipo acuatico))))

(defrule pregunta-vive_mar
   (animal (vive_mar ?))
   (not (pregunta-realizada (tipo vive_mar)))
   =>
   (printout t "¿El animal vive en el mar? (si/no): ")
   (bind ?resp (read))
   (modify 1 (vive_mar ?resp))
   (assert (pregunta-realizada (tipo vive_mar))))

(defrule pregunta-aletas
   (animal (aletas ?))
   (not (pregunta-realizada (tipo aletas)))
   =>
   (printout t "¿El animal tiene aletas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (aletas ?resp))
   (assert (pregunta-realizada (tipo aletas))))

(defrule pregunta-espinas
   (animal (espinas ?))
   (not (pregunta-realizada (tipo espinas)))
   =>
   (printout t "¿El animal tiene espinas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (espinas ?resp))
   (assert (pregunta-realizada (tipo espinas))))

(defrule pregunta-brazos
   (animal (brazos ?))
   (not (pregunta-realizada (tipo brazos)))
   =>
   (printout t "¿El animal tiene brazos? (si/no): ")
   (bind ?resp (read))
   (modify 1 (brazos ?resp))
   (assert (pregunta-realizada (tipo brazos))))

(defrule pregunta-cuerpo-gelatinoso
   (animal (cuerpo_gelatinoso ?))
   (not (pregunta-realizada (tipo cuerpo_gelatinoso)))
   =>
   (printout t "¿El animal tiene cuerpo gelatinoso? (si/no): ")
   (bind ?resp (read))
   (modify 1 (cuerpo_gelatinoso ?resp))
   (assert (pregunta-realizada (tipo cuerpo_gelatinoso))))

(defrule pregunta-insecto
   (animal (insecto ?))
   (not (pregunta-realizada (tipo insecto)))
   =>
   (printout t "¿El animal es un insecto? (si/no): ")
   (bind ?resp (read))
   (modify 1 (insecto ?resp))
   (assert (pregunta-realizada (tipo insecto))))

(defrule pregunta-alas
   (animal (alas ?))
   (not (pregunta-realizada (tipo alas)))
   =>
   (printout t "¿El animal tiene alas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (alas ?resp))
   (assert (pregunta-realizada (tipo alas))))

(defrule pregunta-patas
   (animal (patas ?))
   (not (pregunta-realizada (tipo patas)))
   =>
   (printout t "¿El animal tiene patas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (patas ?resp))
   (assert (pregunta-realizada (tipo patas))))

(defrule pregunta-garras
   (animal (garras ?))
   (not (pregunta-realizada (tipo garras)))
   =>
   (printout t "¿El animal tiene garras? (si/no): ")
   (bind ?resp (read))
   (modify 1 (garras ?resp))
   (assert (pregunta-realizada (tipo garras))))

(defrule pregunta-antenas
   (animal (antenas ?))
   (not (pregunta-realizada (tipo antenas)))
   =>
   (printout t "¿El animal tiene antenas? (si/no): ")
   (bind ?resp (read))
   (modify 1 (antenas ?resp))
   (assert (pregunta-realizada (tipo antenas))))

(defrule pregunta-cola
   (animal (cola ?))
   (not (pregunta-realizada (tipo cola)))
   =>
   (printout t "¿El animal tiene cola? (si/no): ")
   (bind ?resp (read))
   (modify 1 (cola ?resp))
   (assert (pregunta-realizada (tipo cola))))


;;Regla para cuando no se encuentra el animal
;;(defrule no-encontrado
;;(animal)
;;=>
;;(printout t "Lo siento, no se ha podido identificar el animal con las características proporcionadas." crlf))