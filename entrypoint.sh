
#!/bin/sh

echo "Copie des fichiers utilisateur à la racine de plantuml"

cp /plantuml/user_content/* /plantuml

echo "Creation du repertoire output si il n'existe pas"

mkdir /plantuml/user_content/output

echo "Deplacement dans le reprtoire plantuml"

cd /plantuml

echo "Compilation du plantuml"

java -jar ./plantuml.jar -o /latex/user_content/output -t${OUTPUT_TYPE} ${ENTRYPOINT_PLANTUML_FILE}
