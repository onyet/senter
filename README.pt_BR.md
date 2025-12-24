<div align="center">

**Escolher Idioma**

Clique em uma opção de idioma para alternar idiomas.

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md) | [Deutsch](README.de.md) | [Português](README.pt_BR.md) | [Kiswahili](README.sw.md)

</div>

# App de Lanterna

Um aplicativo simples de lanterna baseado em Flutter, projetado com um tema de banana amarela. Este app permite que os usuários liguem o flash da câmera como fonte de luz, com uma interface intuitiva e suporte multilíngue.

## Principais Recursos

- **Controle da Lanterna**: Botão de energia para ligar/desligar o flash da câmera.
- **Animações Dinâmicas**: Transições suaves com efeitos de brilho e gradiente quando a luz está ligada.
- **Multilíngue**: Suporte para 9 idiomas: Indonésio, Inglês, Mandarim, Japonês, Russo, Árabe, Alemão, Português e Suaíli.
- **Anúncios AdMob**: Integração de anúncios intersticiais ao sair do app para monetização.
- **Responsivo**: Design que se adapta a vários tamanhos de tela e botões de navegação virtual.
- **Tela de Splash**: Tela de abertura com ícone OpenMoji.

## Screenshots

| Screenshot 1 | Screenshot 2 |
|--------------|--------------|
| ![Screenshot 1](screenshot/1.jpeg) | ![Screenshot 2](screenshot/2.jpeg) |

| Screenshot 3 | Screenshot 4 |
|--------------|--------------|
| ![Screenshot 3](screenshot/3.jpeg) | ![Screenshot 4](screenshot/4.jpeg) |

## Requisitos do Sistema

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Destino de implantação 11.0 (se necessário)

## Configurando o App

### 1. Clonar Repositório

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. Instalar Dependências

Certifique-se de que o Flutter esteja instalado e o caminho configurado.

```bash
flutter pub get
```

### 3. Configuração do AdMob (Opcional, para Monetização)

- Crie uma conta AdMob em [admob.google.com](https://admob.google.com).
- Crie um app e uma unidade de anúncio intersticial.
- Atualize o ID do app e da unidade de anúncio nos seguintes arquivos:
  - `android/app/src/main/AndroidManifest.xml`: Substitua `android:value` pelo seu ID de app AdMob.
  - `lib/main.dart`: Substitua `adUnitId` em `_loadInterstitialAd()` pelo seu ID de unidade intersticial.

### 4. Gerar Localização (se necessário)

Se houver alterações nos arquivos ARB em `lib/l10n/`, gere novamente:

```bash
flutter pub run intl_utils:generate
```

### 5. Construir para Android

```bash
flutter build apk --release
```

Ou para debug:

```bash
flutter build apk --debug
```

## Executando o App

### Modo Debug

```bash
flutter run
```

Selecione o dispositivo de destino (emulador Android/iOS ou dispositivo físico).

### Modo Release

```bash
flutter run --release
```

## Contribuindo

Nós agradecemos contribuições da comunidade! Siga estes passos:

1. Faça um fork deste repositório.
2. Crie um novo branch de feature: `git checkout -b novo-recurso`.
3. Faça alterações e commite: `git commit -m 'Adicionar novo recurso'`.
4. Faça push para o branch: `git push origin novo-recurso`.
5. Crie um Pull Request no GitHub.

### Diretrizes de Contribuição

- Certifique-se de que o código segue o estilo Flutter (use `flutter format`).
- Adicione testes se necessário.
- Atualize a documentação em caso de mudanças de recursos.
- Siga o [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## Licença

Este app é licenciado sob a [MIT License](LICENSE). Veja o arquivo LICENSE para detalhes.

O ícone do app (lâmpada) é do [OpenMoji](https://openmoji.org/library/emoji-1F4A1/) por Sina Schulz, usa a licença [CC BY-SA 4.0](https://openmoji.org/).

## Contato

- **Desenvolvedor**: Dian Mukti Wibowo
- **E-mail**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **Website**: [onyet.id](https://onyet.id)

Se você tiver dúvidas ou problemas, crie um issue neste repositório.