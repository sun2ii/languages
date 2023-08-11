-- Define the hash table
yoPresent = {
    ser = "soy",
    estar = "estoy",
    ir = "voy",
    tener = "tengo",
    hacer = "hago",
    ver = "veo",
    poder = "puedo",
    dar = "doy",
    saber = "sé",
    poner = "pongo",
    pedir = "pido",
    seguir = "sigo",
    servir = "sirvo",
    elegir = "elijo",
    caer = "caigo",
    oir = "oigo",
    venir = "vengo",
    traer = "traigo",
    haber = "he",
    salir = "salgo",
    hablar = "hablo",
    mirar = "miro",
    escuchar = "escucho",
    ayudar = "ayudo",
    comer = "como",
    aprender = "aprendo",
    deber = "debo",
    leer = "leo",
    vivir = "vivo",
    permitir = "permito",
    recibir = "recibo",
    abrir = "abro",
    alcanzar = "alcanzo",
    llegar = "llego",
    buscar = "busco",
    parecer = "parezco",
    conocer = "conozco",
    querer = "quiero",
    dirigir = "dirijo",
    construir = "construyo",
    exigir = "exijo",
    jugar = "juego",
    pensar = "pienso",
    empezar = "empiezo",
    entender = "entiendo",
    volver = "vuelvo",
    doler = "duelo",
    sentir = "siento",
    morir = "muero",
    conseguir = "consigo"
}

local correct = 0
local total = 0

-- Record starting time
local startTime = os.time()

-- Iterate through translation keys
for verb, translation in pairs(yoPresent) do
    io.write("Translate 'yo " .. verb .. "': ")
    local userInput = io.read()

    if userInput == translation then
        print("Correcto!")
        correct = correct + 1
    else
        print("Incorrecto. La traducción correcta es:", translation)
    end
    total = total + 1
end

-- Calculate elapsed time
local endTime = os.time()
local elapsedTime = endTime - startTime

-- Display summary
print("")
print(correct .. " out of " .. total .. " correct!")
print("Time elapsed:", elapsedTime, "seconds")
