class Caja
  attr_accessor :fila_clientes

  def initialize(fila_clientes)
    @fila_clientes=fila_clientes
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
end


fila=Fila.new()
caja=Caja.new(fila)

cliente=Cliente.new("N")

fila.agregar_cliente_fila(cliente)
