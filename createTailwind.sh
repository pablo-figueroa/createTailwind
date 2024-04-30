# !/bin/bash
# ================================================
# Script para crear proyecto base de TAILWINDCSS
# Autor: pablo figueroa
# email: pablo.figueroa.7once@gmail.com
# ================================================

# Variable Global
PROJECTNAME=""
PWD=`pwd`


# Función encargada de crear la estructura del proyecto base.
create_tailwind_project (){
    npm init -y
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init
    # cat ../createTailwind/tailwind-config.txt > ./tailwind.config.js

    rm tailwind.config.js
    touch tailwind.config.js
    echo 'module.exports = {' >> tailwind.config.js
    echo 'content: ["./src/**/*.{html,js}"],' >> tailwind.config.js
    echo 'theme: {' >> tailwind.config.js
    echo '    extend: {},' >> tailwind.config.js
    echo '},' >> tailwind.config.js
    echo 'variants:{' >> tailwind.config.js
    echo '    extend:{' >> tailwind.config.js
    echo "        with:['responsive','hover','focus']" >> tailwind.config.js
    echo '    }' >> tailwind.config.js
    echo '},' >> tailwind.config.js
    echo 'plugins: [],' >> tailwind.config.js
    echo '}' >> tailwind.config.js
    
    mkdir src && cd src && mkdir css && cd css && touch input.css
    echo "@tailwind base;" >> input.css
    echo "@tailwind components;" >> input.css
    echo "@tailwind utilities;" >> input.css

    cd ..
    # ./src
    touch index.html
    
    echo '<!DOCTYPE html>' > index.html
    echo '<html lang="en">' >> index.html
    echo '<head>' >> index.html
    echo '    <meta charset="UTF-8">' >> index.html
    echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> index.html
    echo '    <title>Success</title>' >> index.html
    echo '    <link rel="stylesheet" href="./css/output.css">' >> index.html
    echo '</head>' >> index.html
    echo '<body>' >> index.html
    echo '    <div class="h-svh flex items-center justify-center">' >> index.html
    echo '        <div class="w-52 h-72 bg-neutral-100 shadow-2xl rounded-lg border border-blue-200 flex flex-col justify-center gap-2 hover:animate-pulse">' >> index.html
    echo '            <div class="w-12 mx-auto">' >> index.html
    echo '                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 54 33"><g clip-path="url(#prefix__clip0)"><path fill="#38bdf8" fill-rule="evenodd" d="M27 0c-7.2 0-11.7 3.6-13.5 10.8 2.7-3.6 5.85-4.95 9.45-4.05 2.054.513 3.522 2.004 5.147 3.653C30.744 13.09 33.808 16.2 40.5 16.2c7.2 0 11.7-3.6 13.5-10.8-2.7 3.6-5.85 4.95-9.45 4.05-2.054-.513-3.522-2.004-5.147-3.653C36.756 3.11 33.692 0 27 0zM13.5 16.2C6.3 16.2 1.8 19.8 0 27c2.7-3.6 5.85-4.95 9.45-4.05 2.054.514 3.522 2.004 5.147 3.653C17.244 29.29 20.308 32.4 27 32.4c7.2 0 11.7-3.6 13.5-10.8-2.7 3.6-5.85 4.95-9.45 4.05-2.054-.513-3.522-2.004-5.147-3.653C23.256 19.31 20.192 16.2 13.5 16.2z" clip-rule="evenodd"/></g><defs><clipPath id="prefix__clip0"><path fill="#fff" d="M0 0h54v32.4H0z"/></clipPath></defs></svg>' >> index.html
    echo '            </div>' >> index.html
    echo '' >> index.html
    echo '            <p class="text-center">' >> index.html
    echo '                <a class="text-blue-600" href="https://tailwindcss.com/docs/installation" target="_blank">tailwindcss</a>' >> index.html
    echo '            </p>' >> index.html
    echo '        </div>' >> index.html
    echo '    </div>' >> index.html
    echo '</body>' >> index.html
    echo '</html>' >> index.html

    cd ..
    # ./main_folder

    # Definir la ruta al archivo package.json
    PACKAGE_JSON="package.json"
    # Agregar la línea "watch" al objeto "scripts" en package.json
    sed -i '/"scripts": {/a \    "watch": "tailwindcss -i ./src/css/input.css -o ./src/css/output.css --watch",' "$PACKAGE_JSON"
        
    npx tailwindcss -i ./src/css/input.css -o ./src/css/output.css
    
    echo ""
    echo "==================="
    echo "   run npm watch"
    echo "==================="
    sleep 3
    
    npx tailwindcss -i ./src/css/input.css -o ./src/css/output.css --watch
}

# Función para crear el directorio base.
create_project_directory () {
    mkdir $1
    echo "Directorio creado: $1"
    cd $1
    echo ""
    echo " ================================================"
    echo  "El proyecto será creado en la siguiente ruta: " 
    echo " ================================================"
    echo $PWD
    sleep 3
    create_tailwind_project
}

# Solicitud del nombre del proyecto
read -p "Nombre del proyecto: " PROJECTNAME

# Validación del ingreso del nombre del proyecto
if [  -z "$PROJECTNAME" ]; then
    echo "Debe ingresar nombre del proyecto"
else
    create_project_directory $PROJECTNAME;   
fi