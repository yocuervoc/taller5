class Cliente
  attr_accessor :nombre, :tiempo_espera_fila, :tiempo_en_caja

  def initialize(nombre)
    @nombre=nombre
    @tiempo_espera_fila=0
    @tiempo_en_caja=0
  end
end


class Caja
  attr_accessor :fila, :cliente, :sumatoria_tiempo_espera_caja

  def initialize(fila, cliente)
    @fila=fila
    @cliente=cliente
    @sumatoria_tiempo_espera_caja = 0
  end

  def atender_cliente

    if fila.class==Fila
      if @cliente.nombre ==nil
        if !fila.clientes.empty?
          @sumatoria_tiempo_espera_caja += fila.clientes[0].tiempo_espera_fila
          @cliente=fila.clientes.delete_at(0)
          @cliente.tiempo_en_caja=4+rand(21)
        end
      end
    end

    if fila.class==Array
      if @cliente.nombre ==nil
        if !fila.empty?
          @sumatoria_tiempo_espera_caja += fila[0].tiempo_espera_fila
          @cliente=fila.delete_at(0)
          @cliente.tiempo_en_caja=4+rand(21)

        end
      end
    end

  end

  def disminuir_tiempo_en_caja
    if @cliente.tiempo_en_caja!=nil
      if @cliente.tiempo_en_caja >0
        @cliente.tiempo_en_caja-=1
      end

    end
  end

  def abandonar_caja
    if cliente.tiempo_en_caja==0
      @cliente=Cliente.new(nil)
    end
  end

  def dibujar_caja
    print "          |C|"
  end

  def dibujar_cliente_caja
    if cliente.nombre==nil
      print "          | |"
    else
      print "          |#{cliente.nombre}|"
    end
  end
end


class Fila
   attr_accessor :clientes

   def initialize()
    @clientes=[]
   end

   def dibujar_fila

     if clientes[0].class== Cliente
       #puts "dibuja en clase cliente"
       clientes.each do |i|
         puts "    |#{i.nombre}|"
       end
     end

     if clientes[0].class==Array
       #puts "dibuja a clase array"
       fila_mas_larga=1
       clientes.each do |i|
         if i.length>fila_mas_larga      #< >
           fila_mas_larga=i.length
         end
       end

       c=0
       contador=1
       for j in 0...fila_mas_larga
         for i in 0...clientes.length
           if clientes[i]==nil
              print  "          | |"
           else
             if clientes[i][j]==nil
               print  "          | |"
             else
                  print  "          |#{clientes[i][j].nombre}|"
             end
           end
         end
         puts ""
       end
       puts ""
     end
     if clientes[0].class== NilClass
       puts ""
       puts "        | |"
     end
   end

   def aumenta_tiempo_espera_fila
     clientes.each do |i|
       if i.class== Cliente
         i.tiempo_espera_fila+=1
       end
       if i.class == Array
         i.each do |j|
           j.tiempo_espera_fila+=1
         end
       end
     end
   end
end

class Simulacion

  attr_accessor :cajas, :filas, :numero_de_clientes, :sumatoria_tiempo_espera,  :cantidad_de_cajas, :cantidad_de_filas

  def initialize(cantidad_de_cajas, cantidad_de_filas)
    @cajas=[]
    @filas=Fila.new()
    @numero_de_clientes=0
    @sumatoria_tiempo_espera=0
    @cantidad_de_cajas=cantidad_de_cajas
    @cantidad_de_filas=cantidad_de_filas

    if cantidad_de_filas > 1
      cantidad_de_filas.times do
        filas.clientes.push([])
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
          cajas[i]=Caja.new(filas.clientes[i], cliente)
        end
      end
    end
  end

  def encolar_cliente
    random_name = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
    n=random_name.length


    if filas.clientes[0].class== Cliente
      filas.clientes.push(Cliente.new(random_name[rand(n)]))
    end

    if filas.clientes[0].class==Array
      fila_mas_corta =filas.clientes[0].length
      contador=0
      posicion=0
      filas.clientes.each do |i|
        if i.length < fila_mas_corta#< >
          if cajas[contador].cliente.nombre==nil
            posicion= contador
            break
          else
            fila_mas_corta=i.length
            posicion=contador
          end
        end
        contador+=1
      end

      filas.clientes[posicion].push(Cliente.new(random_name[rand(n)]))
    end

    if filas.clientes[0].class== NilClass
      filas.clientes.push(Cliente.new(random_name[rand(n)]))
    end
  end

end

class App

  puts "Tipos de simulacion:"
  puts "* Unica fila: oprima 1"
  puts "* multiples filas: oprima 2"
  cantidad_de_filas=gets.to_i
  puts "ingrese la cantidad de cajas"
  cantidad_de_cajas=gets.to_i

  if cantidad_de_filas==1
    simulacion=Simulacion.new(cantidad_de_cajas,1)
  else
    simulacion=Simulacion.new(cantidad_de_cajas,cantidad_de_cajas)

  end

  puts "ingrese le tiempo de simulacion"
  tiempo_de_simulacion=gets.to_i
  puts "ingrese el delta"
  delta=gets.to_i
  puts "________________________________________________________"
  tiempo_reloj=1
  while tiempo_reloj<=tiempo_de_simulacion
    puts "  Minuto #{tiempo_reloj}"
    puts "________________________________________________________"

    if tiempo_reloj%3 == 0
      clientes_nuevos=rand(5)
      puts "encola #{clientes_nuevos} clientes"
      simulacion.numero_de_clientes+=clientes_nuevos
      clientes_nuevos.times do
        simulacion.encolar_cliente
      end
    end


    simulacion.filas.aumenta_tiempo_espera_fila
    c=0
    simulacion.cajas.each do |i|
      simulacion.cajas[c].dibujar_caja
      c+=1
    end
    c=0
    simulacion.cajas.each do |i|
      simulacion.cajas[c].atender_cliente
      c+=1
    end
    puts ""
    c=0
    simulacion.cajas.each do |i|
      simulacion.cajas[c].dibujar_cliente_caja
      c+=1
    end
    c=0
    simulacion.cajas.each do |i|
      simulacion.cajas[c].disminuir_tiempo_en_caja
      c+=1
    end
    c=0
    simulacion.cajas.each do |i|
      simulacion.cajas[c].abandonar_caja
      c+=1
    end

    puts ""
    puts "       ------------------------------------------------"

    simulacion.filas.dibujar_fila

    sleep(delta)
    tiempo_reloj+=1
    puts "________________________________________________________"
  end

  c=0
  simulacion.cajas.each do |i|
    simulacion.sumatoria_tiempo_espera += simulacion.cajas[c].sumatoria_tiempo_espera_caja
    c+=1
  end

puts "tiemp total de espera de todos lo clientes atendidos fue de #{simulacion.sumatoria_tiempo_espera}"
puts "tiempo promedio de espera de los clientes atndidos fue de: #{simulacion.sumatoria_tiempo_espera/simulacion.numero_de_clientes} minutos"
end

App.new()

#by Yocc
