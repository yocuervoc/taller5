class Caja
  attr_accessor :fila, :cliente

  def initialize(fila)
    @fila=fila
  end

  def atender_cliente(numero_fila)

    if fila[0].class==CLiente
      if !fila.empty?
        cliente=fila.delete_at(0)
        cliente.tiempo_en_caja=4+rand(21)
      end
    end

    if fila[0].class==Array
      if !fila.empty?
        cliente= fila[numero_fila].delete_at(0)
        cliente.tiempo_en_caja=4+rand(21)
      end
    end

  end

  def dibujar_caja

    if fila.empty?
      puts "           |C|             "
    else
      if fila[0].class==CLiente
        puts "           |C|             "
      end

      if fila[0].class==Array
        fila.each do |i|
          puts "     |C|"
        end
      end
    end


  end
end

class Cliente
  attr_accessor :nombre, :tiempo_espera_fila, :tiempo_en_caja

  def initialize(nombre)
    @nombre=nombre
    @tiempo_espera_fila=0
    @tiempo_en_caja=0
  end
end

class Fila
   attr_accessor :clientes

   def initialize()
    @clientes=[]
   end

   def dibujar_fila
     # TODO:
   end

end

class Simulacion

  attr_accessor :cajas, :filas, :numero_de_clientes, :sumatoria_tiempo_espera, :cantidad_de_cajas, :cantidad_de_filas

  def initialize(cantidad_de_cajas, cantidad_de_filas)
    @cajas=[]
    @filas=[]
    @numero_de_clientes=0
    @sumatoria_tiempo_espera=0
    @cantidad_de_cajas=cantidad_de_cajas
    @cantidad_de_filas=cantidad_de_filas

    if cantidad_de_filas>1
      cantidad_de_filas.times do
        filas.push([])
      end
    end

    for i in (0..cantidad_de_cajas)
      if cantidad_de_filas==1
        for i in (0..cantidad_de_cajas)
          cajas[i]=Caja.new(filas)
        end
      else
        for i in (0..cantidad_de_cajas)
          cajas[i]=Caja.new(filas[i])
        end
      end
    end
  end

  def tiempo_espera_caja
    caja.cliente.tiempo_en_caja= 4+rand(21)
  end

  def encolar_cliente
    random_name = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
    n=random_name.length

    if caja.fila[0].class= Cliente
      fila.push(Cliente.new(random_name[rand(n)]))
    end

    if caja.fila[0].class==Array
      fila_mas_corta =0
      contador=0
      fila.each do |i|
        if i.length<fila_mas_corta
          fila_mas_corta=contador
        end
        contador+=1
      end
      fila[fila_mas_corta].push(Clinete.new(random_name[rand(n)]))
    end
  end

end
fila=[]
caja=Caja.new(fila)
cliente=Cliente.new("N")
simulacion=Simulacion.new(4,1)
