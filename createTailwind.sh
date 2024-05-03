# !/bin/bash
# ================================================
# Script para crear proyecto base de TAILWINDCSS
# Autor: pablo figueroa
# email: pablo.figueroa.7once@gmail.com
# ================================================

# Variable Global
PROJECTNAME=""

# Función para crear la estructura del proyecto.
create_tailwind_project (){
    npm init -y > /dev/null
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init

    rm tailwind.config.js
    touch tailwind.config.js
    echo 'module.exports = {' >> tailwind.config.js
    echo "purge: []," >> tailwind.config.js
    echo "darkMode: false, // or 'media' or 'class'" >> tailwind.config.js
    echo '  content: ["./src/**/*.{html,js}"],' >> tailwind.config.js
    echo '  theme: {' >> tailwind.config.js
    echo '    extend: {},' >> tailwind.config.js
    echo '  },' >> tailwind.config.js
    echo '  variants:{' >> tailwind.config.js
    echo '    extend:{' >> tailwind.config.js
    echo "      with:['responsive','hover','focus']" >> tailwind.config.js
    echo '    }' >> tailwind.config.js
    echo '  },' >> tailwind.config.js
    echo '  plugins: [' >> tailwind.config.js
    echo '  ],' >> tailwind.config.js
    echo '}' >> tailwind.config.js
    
    mkdir src && cd src && mkdir css && cd css && touch input.css
    echo "@tailwind base;" >> input.css
    echo "@tailwind components;" >> input.css
    echo "@tailwind utilities;" >> input.css

    cd ..
    # ./src
    
    touch index.html
    touch test-me-first.html
    
    echo '<!DOCTYPE html>' > test-me-first.html
    echo '<html lang="en">' >> test-me-first.html
    echo '<head>' >> test-me-first.html
    echo '    <meta charset="UTF-8">' >> test-me-first.html
    echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> test-me-first.html
    echo '    <title>test-me-first</title>' >> test-me-first.html
    echo '    <link rel="stylesheet" href="./css/output.css">' >> test-me-first.html
    echo '</head>' >> test-me-first.html
    echo '<body>' >> test-me-first.html
    echo '    <div class="h-svh flex items-center justify-center">' >> test-me-first.html
    echo '        <div class="w-52 h-72 bg-gradient-to-b from-blue-200 to-blue-50 shadow-2xl rounded-lg border border-blue-200 flex flex-col justify-center gap-2 hover:animate-pulse">' >> test-me-first.html
    echo '            <div class="w-12 mx-auto">' >> test-me-first.html
    echo '                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 54 33"><g clip-path="url(#prefix__clip0)"><path fill="#38bdf8" fill-rule="evenodd" d="M27 0c-7.2 0-11.7 3.6-13.5 10.8 2.7-3.6 5.85-4.95 9.45-4.05 2.054.513 3.522 2.004 5.147 3.653C30.744 13.09 33.808 16.2 40.5 16.2c7.2 0 11.7-3.6 13.5-10.8-2.7 3.6-5.85 4.95-9.45 4.05-2.054-.513-3.522-2.004-5.147-3.653C36.756 3.11 33.692 0 27 0zM13.5 16.2C6.3 16.2 1.8 19.8 0 27c2.7-3.6 5.85-4.95 9.45-4.05 2.054.514 3.522 2.004 5.147 3.653C17.244 29.29 20.308 32.4 27 32.4c7.2 0 11.7-3.6 13.5-10.8-2.7 3.6-5.85 4.95-9.45 4.05-2.054-.513-3.522-2.004-5.147-3.653C23.256 19.31 20.192 16.2 13.5 16.2z" clip-rule="evenodd"/></g><defs><clipPath id="prefix__clip0"><path fill="#fff" d="M0 0h54v32.4H0z"/></clipPath></defs></svg>' >> test-me-first.html
    echo '            </div>' >> test-me-first.html
    echo '' >> test-me-first.html
    echo '            <p class="text-center">' >> test-me-first.html
    echo '                <a class="text-blue-600" href="https://tailwindcss.com/docs/installation" target="_blank">tailwindcss</a>' >> test-me-first.html
    echo '            </p>' >> test-me-first.html
    echo '        </div>' >> test-me-first.html
    echo '    </div>' >> test-me-first.html
    echo '</body>' >> test-me-first.html
    echo '</html>' >> test-me-first.html

    cd ..
    # ./main_folder

    

    # Definir la ruta al archivo package.json
    PACKAGE_JSON="package.json"
    
    # Agregar la línea "watch" al objeto "scripts" en package.json
    sed -i '/"scripts": {/a \    "dev": "tailwindcss -i ./src/css/input.css -o ./src/css/output.css --watch",' "$PACKAGE_JSON"
    # Agregar la línea "minify" al objeto "scripts" en package.json
    sed -i '/"scripts": {/a \    "build": "npx tailwindcss -i ./src/css/input.css -o ./src/css/output.css --minify",' "$PACKAGE_JSON"
        
    npx tailwindcss -i ./src/css/input.css -o ./src/css/output.css
    
    echo ""
    echo "========================================================="
    echo "\e[92mModo desarrollo: npm run dev\e[0m"
    echo "---------------------------------------------------------"
    echo "\e[96mModo producción: npm run build\e[0m"
    echo "========================================================="
    echo "\e[33m                                       by: Pablo Figueroa\e[0m"
    echo "========================================================="

    touch install-plugins.sh
    echo "npm install -D @tailwindcss/forms" >> install-plugins.sh
    echo "npm install -D @tailwindcss/typography" >> install-plugins.sh
    echo "npm install -D @tailwindcss/aspect-ratio" >> install-plugins.sh
    echo "" >> install-plugins.sh
    
    echo "# Define el archivo tailwind.config.js" >> install-plugins.sh
    echo 'FILE="tailwind.config.js"' >> install-plugins.sh
    echo "" >> install-plugins.sh
    echo "# Verifica si el archivo existe" >> install-plugins.sh
    echo 'if [ -f "$FILE" ]; then' >> install-plugins.sh
    echo "# Agrega los plugins al final del archivo usando sed" >> install-plugins.sh
    echo "" >> install-plugins.sh
    echo 'sed -i "/plugins: \[/a \    require("@tailwindcss/typography")," "$FILE"' >> install-plugins.sh
    echo 'sed -i "/plugins: \[/a \    require("@tailwindcss/aspect-ratio")," "$FILE"' >> install-plugins.sh
    echo 'sed -i "/plugins: \[/a \    require("@tailwindcss/forms")," "$FILE"' >> install-plugins.sh
    echo "" >> install-plugins.sh
    echo "echo '\e[32mPlugins agregados en tailwind.config.js\e[0m' " >> install-plugins.sh
    echo 'echo "\e[31mAgregar las comillas en plugins en tailwind.config.js\e[0m"' >> install-plugins.sh
    echo "" >> install-plugins.sh
    echo "else" >> install-plugins.sh
    echo '    echo "El archivo $FILE no existe."' >> install-plugins.sh
    echo "fi" >> install-plugins.sh
    

    
    # Mensaje de confirmación
    echo "¿Desea instalar los plugins (forms|typography|aspect-ratio) ahora? (Escriba 'y' para confirmar)"

    # Leer la entrada del usuario
    read respuesta

    # Verificar la respuesta
    if [ "$respuesta" = "y" ] || [ "$respuesta" = "Y" ]; then
        # Instalar plugins
        sh install-plugins.sh
    else
        # Mensaje de información
        echo "La instalación de plugins se puede realizar en cualquier momento ejecutando el comando 'sh install-plugins.sh'."
    fi


}

# Función para crear el directorio.
create_project_directory () {
    mkdir $1
    echo "\e[32mDirectorio creado: $1\e[0m"
    echo ""
    cd $1
    sleep 2
    create_tailwind_project
}

# Bucle para solicitar el nombre del proyecto
while [ -z "$PROJECTNAME" ]; do
    read -p "Nombre del proyecto: " PROJECTNAME
    if [ -z "$PROJECTNAME" ]; then
        echo "\e[91mDebe ingresar Nombre del Proyecto!!!\e[0m"
        echo ""
    else
        create_project_directory $PROJECTNAME
    fi
done