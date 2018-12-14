class Caja
  attr_accessor :fila, :cliente

  def initialize(fila)
    @fila=fila
  end

  def atender_cliente

    if fila[0].class==CLiente
      puts "|C|"
      if !fila.empty?
        cliente=fila.delete_at(0)
      end
    end

    if fila[0].class==Array
      # TODO:
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

   def agregar_cliente_fila(cliente)
     clientes.push(cliente)
   end

   def dibujar_fila
     # TODO:
   end

end

class Simulacion

  attr_accessor :caja, :cliente, :numero_de_clientes, :sumatoria_tiempo_espera

  def initialize(caja, cliente, numero_de_clientes, sumatoria_tiempo_espera)
    @caja=caja
    @cliente=cliente
    @numero_de_clientes=numero_de_clientes
    @sumatoria_tiempo_espera=sumatoria_tiempo_espera
  end

  def tiempo_espera_caja
    caja.cliente.tiempo_en_caja= 4+rand(26)
  end

  def encolar_cliente
    random_name = %w{a b c d e f g h i j k l m n o pq r s t u v w x y z}
    n=random_name.length

    if caja.fila[0].class= Cliente
      fila.push(Clinete.new(random_name[rand(n)]))
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

  def desencolar_cliente(numero_fila)
    if fila[0].class= Cliente
      fila.delete_at(0)
    end

    if fila[0].class= Array
      fila[numero_fila].delete_at(0)
    end

  end
end

fila=Fila.new()
caja=Caja.new(fila)
cliente=Cliente.new("N")
cliente2=Cliente.new("N")

class Prueba
  attr_accessor :dato1, :dato2

  def initialize(dato1)
    @dato1=dato1
  end
end

p=Prueba.new(12)

puts p.dato1
puts p.dato2

if p.dato2==nil
  puts "dato 2 = nulo"
end
p.dato1=nil
if p.dato1==nil
  puts "dato 1 = nulo"
else
  puts "dato 1 = NOnulo"
end










###
