class Cliente
  attr_accessor :nombre, :tiempo_espera_fila, :tiempo_en_caja

  def initialize(nombre)
    @nombre=nombre
    @tiempo_espera_fila=0
    @tiempo_en_caja=0
  end
end


class Caja
  attr_accessor :fila, :cliente

  def initialize(fila, cliente)
    @fila=fila
    @cliente=cliente
  end

  def atender_cliente

    if !fila.empty?
      cliente=fila.delete_at(0)
      cliente.tiempo_en_caja=4+rand(21)
      puts "atendiendo a #{cliente.nombre}"
    end

  end

  def dibujar_caja
    print "          |C|"
  end

  def dibujar_clente_caja
    #print cliente
    print "          |#{cliente.nombre}|"
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
        for i in (0...cantidad_de_cajas)
          cliente=Cliente.new(nil)
          cajas[i]=Caja.new(filas,cliente)
        end
      else
        for i in (0...cantidad_de_cajas)
          cliente=Cliente.new(nil)
          cajas[i]=Caja.new(filas[i], cliente)
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

    if filas[0].class== Cliente
      fila.push(Cliente.new(random_name[rand(n)]))
    end

    if filas[0].class==Array
      fila_mas_corta =filas[0].length
      contador=0
      filas.each do |i|
        if i.length < fila_mas_corta #< >
          fila_mas_corta=contador
          puts "i.l: #{i.length}, fi ms: #{fila_mas_corta}"
          puts "contadot #{contador}"
        end
        contador+=1
      end
      filas[fila_mas_corta].push(Cliente.new(random_name[rand(n)]))
      puts "encolo en array #{fila_mas_corta}"
    end
  end

end

fila=[]
#caja=Caja.new(fila)
cliente=Cliente.new("N")
simulacion=Simulacion.new(4,4)

simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente
simulacion.encolar_cliente



c=0
simulacion.filas.each do |i|
  i.each do |j|
    print "#{j.nombre} "
  end
  puts ""
end


c=0
simulacion.cajas.each do |i|
  simulacion.cajas[c].atender_cliente
  puts "nombre de cliente at #{simulacion.cajas[c].cliente.nombre}"
  c+=1
end
puts ""
puts "despues"
puts ""
simulacion.filas.each do |i|
  i.each do |j|
    print "#{j.nombre} "
  end
  puts ""
end

c=0
simulacion.cajas.each do |i|
  simulacion.cajas[c].dibujar_caja
  c+=1
end
c=0
puts ""
simulacion.cajas.each do |i|
  puts simulacion.cajas[c].fila.class
  c+=1
end

c=0
puts ""
simulacion.cajas.each do |i|
  puts simulacion.cajas[c].cliente.class
  c+=1
end


c=0
puts ""

simulacion.cajas.each do |i|
  simulacion.cajas[c].dibujar_clente_caja
  c+=1
end
puts ""
