import 'dart:io' show Platform, Process, ProcessResult;

void main() async {
  String assemblyFilePath = '/path/to/assembly/file.asm';
  String outputFilePath = '/path/to/output/file';

  if (Platform.isLinux) {
    // Compilação para Linux com NASM e LD
    await compileWithNASMandLD(assemblyFilePath, outputFilePath);
  } else if (Platform.isWindows) {
    // Compilação para Windows com MASM e LINK
    await compileWithMASMandLINK(assemblyFilePath, outputFilePath);
  } else if (Platform.isMacOS) {
    // Compilação para macOS com AS e LD
    await compileWithASandLD(assemblyFilePath, outputFilePath);
  } else {
    print('Plataforma não suportada');
  }
}

Future<void> compileWithNASMandLD(
    String assemblyFilePath, String outputFilePath) async {
  ProcessResult nasmResult = await Process.run(
      'nasm',
      ['-f', 'elf64', '-o', '$outputFilePath.o', assemblyFilePath]);

  if (nasmResult.exitCode != 0) {
    print('Erro durante a compilação do código assembly com NASM');
    print(nasmResult.stderr);
    return;
  }

  ProcessResult ldResult = await Process.run(
      'ld',
      ['-s', '-o', outputFilePath, '$outputFilePath.o']);

  if (ldResult.exitCode != 0) {
    print('Erro durante a linkagem com LD');
    print(ldResult.stderr);
    return;
  }

  print('Compilação concluída com sucesso!');
}

Future<void> compileWithMASMandLINK(
    String assemblyFilePath, String outputFilePath) async {
  // Implementação para Windows com MASM e LINK
  // ...
}

Future<void> compileWithASandLD(
    String assemblyFilePath, String outputFilePath) async {
  // Implementação para macOS com AS e LD
  // ...
}
