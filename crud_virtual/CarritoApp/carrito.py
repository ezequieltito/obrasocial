class Carrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        carrito = self.session.get("carrito")
        if not carrito:
            self.session["carrito"] = {}
            self.carrito = self.session["carrito"]
        else:
            self.carrito = carrito

    def agregar(self, medicamento, cantidad):
        id = str(medicamento.id_medicamento)
        if id not in self.carrito.keys():
            self.carrito[id] = {
                "medicamento_id": medicamento.id_medicamento,
                "nombre": medicamento.nombre_medicamento,
                "acumulado": medicamento.precio * cantidad,  # Actualiza el acumulado
                "cantidad": cantidad  # Establece la cantidad proporcionada
            }
        else:
            self.carrito[id]["cantidad"] += cantidad
            self.carrito[id]["acumulado"] += medicamento.precio * cantidad  # Actualiza el acumulado
        self.guardar_carrito()

    def guardar_carrito(self):
        self.session["carrito"] = self.carrito
        self.session.modified = True

    def eliminar(self, medicamento):
        id = str(medicamento.id_medicamento)
        if id in self.carrito:
            del self.carrito[id]
            self.guardar_carrito()

    def restar(self, medicamento):
        id = str(medicamento.id_medicamento)
        if id in self.carrito.keys():
            self.carrito[id]["cantidad"] -= 1
            self.carrito[id]["acumulado"] -= medicamento.precio
            if self.carrito[id]["cantidad"] <= 0:
                self.eliminar(medicamento)
            self.guardar_carrito()

    def limpiar(self):
        self.session["carrito"] = {}
        self.session.modified = True

    def obtener_cantidad_total(self):
        return sum(item['cantidad'] for item in self.carrito.values())
