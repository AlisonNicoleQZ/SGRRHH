-- CreateTable
CREATE TABLE "Departamento" (
    "departamentoID" SERIAL NOT NULL,
    "NombreDepartamento" TEXT NOT NULL,

    CONSTRAINT "Departamento_pkey" PRIMARY KEY ("departamentoID")
);

-- CreateTable
CREATE TABLE "Rol" (
    "rolID" SERIAL NOT NULL,
    "NombreRol" TEXT NOT NULL,

    CONSTRAINT "Rol_pkey" PRIMARY KEY ("rolID")
);

-- CreateTable
CREATE TABLE "Empleado" (
    "empleadoID" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "correo" TEXT NOT NULL,
    "telefono" TEXT,
    "fechaContratacion" TIMESTAMP(3),
    "departamentoID" INTEGER,
    "rolID" INTEGER,

    CONSTRAINT "Empleado_pkey" PRIMARY KEY ("empleadoID")
);

-- CreateTable
CREATE TABLE "Nomina" (
    "nominaID" SERIAL NOT NULL,
    "empleadoID" INTEGER NOT NULL,
    "salarioBase" DOUBLE PRECISION NOT NULL,
    "bonificaciones" DOUBLE PRECISION NOT NULL,
    "deducciones" DOUBLE PRECISION NOT NULL,
    "fechaPago" TIMESTAMP(3) NOT NULL,
    "fechaTransaccion" TIMESTAMP(3) NOT NULL,
    "personaEncargadaID" INTEGER NOT NULL,

    CONSTRAINT "Nomina_pkey" PRIMARY KEY ("nominaID")
);

-- CreateTable
CREATE TABLE "Asistencia" (
    "asistenciaID" SERIAL NOT NULL,
    "empleadoID" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "horaEntrada" TIMESTAMP(3) NOT NULL,
    "horaSalida" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("asistenciaID")
);

-- CreateTable
CREATE TABLE "Reclutamiento" (
    "reclutamientoID" SERIAL NOT NULL,
    "empleadoID" INTEGER NOT NULL,
    "fechaPublicacion" TIMESTAMP(3) NOT NULL,
    "fechaContratacion" TIMESTAMP(3) NOT NULL,
    "fechaSalida" TIMESTAMP(3),
    "estado" TEXT NOT NULL,

    CONSTRAINT "Reclutamiento_pkey" PRIMARY KEY ("reclutamientoID")
);

-- CreateTable
CREATE TABLE "EvaluacionDesempeno" (
    "evaluacionID" SERIAL NOT NULL,
    "empleadoID" INTEGER NOT NULL,
    "fechaEvaluacion" TIMESTAMP(3) NOT NULL,
    "calificacion" DOUBLE PRECISION NOT NULL,
    "comentarios" TEXT NOT NULL,

    CONSTRAINT "EvaluacionDesempeno_pkey" PRIMARY KEY ("evaluacionID")
);

-- CreateTable
CREATE TABLE "FormacionDesarrollo" (
    "formacionID" SERIAL NOT NULL,
    "empleadoID" INTEGER NOT NULL,
    "curso" TEXT NOT NULL,
    "fechaInicio" TIMESTAMP(3) NOT NULL,
    "fechaFin" TIMESTAMP(3) NOT NULL,
    "estado" TEXT NOT NULL,

    CONSTRAINT "FormacionDesarrollo_pkey" PRIMARY KEY ("formacionID")
);

-- AddForeignKey
ALTER TABLE "Empleado" ADD CONSTRAINT "Empleado_departamentoID_fkey" FOREIGN KEY ("departamentoID") REFERENCES "Departamento"("departamentoID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Empleado" ADD CONSTRAINT "Empleado_rolID_fkey" FOREIGN KEY ("rolID") REFERENCES "Rol"("rolID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Nomina" ADD CONSTRAINT "Nomina_empleadoID_fkey" FOREIGN KEY ("empleadoID") REFERENCES "Empleado"("empleadoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_empleadoID_fkey" FOREIGN KEY ("empleadoID") REFERENCES "Empleado"("empleadoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reclutamiento" ADD CONSTRAINT "Reclutamiento_empleadoID_fkey" FOREIGN KEY ("empleadoID") REFERENCES "Empleado"("empleadoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EvaluacionDesempeno" ADD CONSTRAINT "EvaluacionDesempeno_empleadoID_fkey" FOREIGN KEY ("empleadoID") REFERENCES "Empleado"("empleadoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormacionDesarrollo" ADD CONSTRAINT "FormacionDesarrollo_empleadoID_fkey" FOREIGN KEY ("empleadoID") REFERENCES "Empleado"("empleadoID") ON DELETE RESTRICT ON UPDATE CASCADE;
