project ('com.github.naaando.lyrics', 'vala', 'c',
    license: 'GPL3'
)

gnome = import ('gnome')
i18n = import('i18n')
add_project_arguments('-DGETTEXT_PACKAGE="lyrics"', language:'c')

asresources = gnome.compile_resources(
    'as-resources', 'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

executable(
    meson.project_name(),
    asresources,
    'src/Application.vala',
    'src/Core/Factory/MetasongFactory.vala',
    'src/Core/Lyric.vala',
    'src/Core/LyricsService.vala',
    'src/Core/Metasong.vala',
    'src/Core/Player.vala',
    'src/Core/Players.vala',
    'src/Mpris/MprisClient.vala',
    'src/Mpris/MprisPlayer.vala',
    'src/Mpris/MprisService.vala',
    'src/Parser/LRC-Parser.vala',
    'src/Parser/LyricFormatter.vala',
    'src/Parser/ParserChain/AChainOfResponsibility.vala',
    'src/Parser/ParserChain/CompressedLyricContentParser.vala',
    'src/Parser/ParserChain/LyricContentParser.vala',
    'src/Parser/ParserChain/LyricEmptyStringParser.vala',
    'src/Parser/ParserChain/LyricMetadataParser.vala',
    'src/Repository/Interfaces/ILyricFile.vala',
    'src/Repository/Interfaces/IRepository.vala',
    'src/Repository/Local/LocalFile.vala',
    'src/Repository/Local/LocalRepository.vala',
    'src/Repository/LyricSources/LyricSourcesDownloader.vala',
    'src/Repository/LyricSources/LyricSourcesRemoteFile.vala',
    'src/Repository/LyricSources/LyricSourcesRepository.vala',
    'src/Repository/Remote/ViewlyricsRemoteFile.vala',
    'src/Repository/Remote/ViewlyricsRepository.vala',
    'src/Repository/Repository.vala',
    'src/SimplePlayer.vala',
    'src/View/Factory/ViewFactory.vala',
    'src/View/HeaderBar.vala',
    'src/View/Helper/ClickThroughHelper.vala',
    'src/View/Helper/SaveWindowStateMixin.vala',
    'src/View/MainStack.vala',
    'src/View/MainWindow.vala',
    'src/View/PlayerChooser.vala',
    'src/View/SearchLyricDialog.vala',
    'src/View/SettingsPopover.vala',
    'src/View/Widgets/Displays/IDisplay.vala',
    'src/View/Widgets/Displays/ScrolledDisplay.vala',
    'src/View/Widgets/DownloadView.vala',
    'src/View/Widgets/FileChooserButton.vala',
    'src/View/Widgets/ModeSwitch.vala',
    dependencies: [
        dependency ('glib-2.0'),
        dependency ('gtk+-3.0'),
        dependency ('gee-0.8'),
        dependency ('libsoup-2.4'),
        dependency ('xmlbird'),
    ],
    install: true
)

subdir ('data')
subdir('po')

meson.add_install_script('meson/post_install.py')
