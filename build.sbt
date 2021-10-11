ThisBuild / version      := "2.0.0"
ThisBuild / scalaVersion := "2.12.13"
ThisBuild / organization := "bkr"

lazy val app = (project in file("."))
  .settings(
    name := "Bkr.Demo",
    assembly / assemblyJarName := s"${name.value}.jar", // this is for sbt-assembly plugin
)