import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yokeshinzone/pages/widgets/round_background_text/round_background_text.dart';

class RoundedBackgroundTextField extends StatefulWidget {
  const RoundedBackgroundTextField({
    Key? key,
    this.controller,
    this.style,
    this.backgroundColor,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.textScaleFactor,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines,
    this.cursorWidth = 2.0,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.keyboardType,
    this.hint,
    this.hintStyle,
    this.innerRadius = kDefaultInnerFactor,
    this.outerRadius = kDefaultOuterFactor,
    this.autofocus = false,
    this.focusNode,
    this.keyboardAppearance = Brightness.light,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.autocorrect = true,
    this.autofillClient,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.enableIMEPersonalizedLearning = true,
    this.enableSuggestions = true,
    this.forceLine = true,
    this.inputFormatters,
    this.mouseCursor,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.readOnly = false,
    this.rendererIgnoresPointer = false,
    this.restorationId,
    this.showCursor = true,
    this.showSelectionHandles = true,
    this.smartDashesType = SmartDashesType.enabled,
    this.smartQuotesType = SmartQuotesType.enabled,
    this.textInputAction,
    this.toolbarOptions = const ToolbarOptions(),
    this.onSelectionChanged,
    this.scrollController,
    this.scrollPhysics,
    this.scrollBehavior,
    this.scrollPadding = EdgeInsets.zero,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextCapitalization textCapitalization;
  final double? textScaleFactor;
  final Color? backgroundColor;
  final int? maxLines;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hint;
  final TextStyle? hintStyle;
  final double innerRadius;
  final double outerRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  final Brightness keyboardAppearance;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  bool get selectionEnabled => enableInteractiveSelection;
  final bool readOnly;
  final bool forceLine;
  final ToolbarOptions toolbarOptions;
  final bool showSelectionHandles;
  final bool showCursor;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final Iterable<String>? autofillHints;
  final AutofillClient? autofillClient;
  final Clip clipBehavior;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final List<TextInputFormatter>? inputFormatters;
  final MouseCursor? mouseCursor;
  final bool rendererIgnoresPointer;
  final String obscuringCharacter;
  final bool obscureText;
  final SelectionChangedCallback? onSelectionChanged;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final ScrollBehavior? scrollBehavior;
  final EdgeInsets scrollPadding;

  @override
  State<RoundedBackgroundTextField> createState() =>
      _RoundedBackgroundTextFieldState();
}

class _RoundedBackgroundTextFieldState
    extends State<RoundedBackgroundTextField> {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  final fieldKey = GlobalKey<EditableTextState>();

  late TextEditingController textController =
      widget.controller ?? TextEditingController();
  late ScrollController scrollController =
      widget.scrollController ?? ScrollController();

  @override
  void initState() {
    super.initState();
    textController.addListener(_handleTextChange);
    scrollController.addListener(_handleScrollChange);
  }

  void _handleTextChange() {
    if (mounted) setState(() {});
  }

  void _handleScrollChange() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant RoundedBackgroundTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollController != oldWidget.scrollController) {
      scrollController = widget.scrollController ?? scrollController;
    }

    if (widget.controller != oldWidget.controller) {
      textController = widget.controller ?? textController;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      textController.dispose();
    } else {
      textController.removeListener(_handleTextChange);
    }

    if (widget.scrollController == null) {
      scrollController.dispose();
    } else {
      widget.scrollController!.removeListener(_handleScrollChange);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextSelectionThemeData selectionTheme =
    TextSelectionTheme.of(context);
    final defaultTextStyle = DefaultTextStyle.of(context);

    final fontSize =
    (widget.style?.fontSize ?? defaultTextStyle.style.fontSize ?? 16);

    TextSelectionControls? textSelectionControls = widget.selectionControls;
    final bool paintCursorAboveText;
    final bool cursorOpacityAnimates;
    Offset? cursorOffset;
    Color? cursorColor = widget.cursorColor;
    final Color selectionColor;
    Color? autocorrectionTextRectColor;
    Radius? cursorRadius = widget.cursorRadius;

    switch (theme.platform) {
      case TargetPlatform.iOS:
        final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context);
        textSelectionControls ??= cupertinoTextSelectionControls;
        paintCursorAboveText = true;
        cursorOpacityAnimates = true;
        cursorColor ??=
            selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;
        selectionColor = selectionTheme.selectionColor ??
            cupertinoTheme.primaryColor.withOpacity(0.40);
        cursorRadius ??= const Radius.circular(2.0);
        cursorOffset = Offset(
            iOSHorizontalOffset / MediaQuery.of(context).devicePixelRatio, 0);
        autocorrectionTextRectColor = selectionColor;
        break;

      case TargetPlatform.macOS:
        final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context);
        textSelectionControls ??= cupertinoDesktopTextSelectionControls;
        paintCursorAboveText = true;
        cursorOpacityAnimates = true;
        cursorColor ??=
            selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;
        selectionColor = selectionTheme.selectionColor ??
            cupertinoTheme.primaryColor.withOpacity(0.40);
        cursorRadius ??= const Radius.circular(2.0);
        cursorOffset = Offset(
            iOSHorizontalOffset / MediaQuery.of(context).devicePixelRatio, 0);
        break;

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        textSelectionControls ??= materialTextSelectionControls;
        paintCursorAboveText = false;
        cursorOpacityAnimates = false;
        cursorColor ??= selectionTheme.cursorColor ?? theme.colorScheme.primary;
        selectionColor = selectionTheme.selectionColor ??
            theme.colorScheme.primary.withOpacity(0.40);
        break;

      case TargetPlatform.linux:
      case TargetPlatform.windows:
        textSelectionControls ??= desktopTextSelectionControls;
        paintCursorAboveText = false;
        cursorOpacityAnimates = false;
        cursorColor ??= selectionTheme.cursorColor ?? theme.colorScheme.primary;
        selectionColor = selectionTheme.selectionColor ??
            theme.colorScheme.primary.withOpacity(0.40);
        break;
    }

    Alignment alignment = () {
      switch (widget.textAlign) {
        case TextAlign.justify:
        case TextAlign.center:
          return Alignment.center;
        case TextAlign.left:
        case TextAlign.start:
          return Alignment.centerLeft;
        case TextAlign.right:
        case TextAlign.end:
          return Alignment.centerRight;
      }
    }();

    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned.fill(child: SizedBox.expand()),
        if (textController.text.isNotEmpty)
          Positioned.fill(
            top: scrollController.hasClients
                ? -scrollController.position.pixels
                : null,
            child: IgnorePointer(
              child: Container(
                alignment: alignment,
                padding: const EdgeInsets.only(
                  right: 2.0,
                  left: 1.0,
                  bottom: 3.0,
                ),
                child: RoundedBackgroundText.rich(
                  text: textController.buildTextSpan(
                    context: context,
                    withComposing: !widget.readOnly,
                    style: (widget.style ?? const TextStyle()).copyWith(
                      color: Colors.transparent,
                    ),
                  ),
                  textAlign: widget.textAlign,
                  backgroundColor: widget.backgroundColor,
                  innerRadius: widget.innerRadius,
                  outerRadius: widget.outerRadius,
                  textDirection: widget.textDirection,
                  textScaleFactor: widget.textScaleFactor ?? 1.0,
                ),
              ),
            ),
          )
        else if (widget.hint != null)
          Positioned.fill(
            child: Text(
              widget.hint!,
              style: (widget.hintStyle ?? TextStyle(color: theme.hintColor))
                  .copyWith(
                fontSize: fontSize,
              ),
              textAlign: widget.textAlign,
              maxLines: widget.maxLines,
            ),
          ),
        Positioned.fill(
          child: EditableText(
            key: fieldKey,
            autofocus: widget.autofocus,
            controller: textController,
            focusNode: _effectiveFocusNode,
            scrollPhysics: widget.scrollPhysics,
            scrollBehavior: widget.scrollBehavior,
            scrollController: scrollController,
            scrollPadding: widget.scrollPadding,
            style: (widget.style ?? const TextStyle()).copyWith(
              fontSize: fontSize,
              leadingDistribution: TextLeadingDistribution.proportional,
            ),
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: CupertinoColors.inactiveGray,
            cursorColor: widget.cursorColor ??
                widget.style?.color ??
                selectionTheme.cursorColor ??
                foregroundColor(widget.backgroundColor) ??
                Colors.black,
            cursorWidth: widget.cursorWidth,
            cursorHeight: widget.cursorHeight,
            cursorRadius: widget.cursorRadius,
            paintCursorAboveText: paintCursorAboveText,
            cursorOpacityAnimates: cursorOpacityAnimates,
            cursorOffset: cursorOffset,
            autocorrectionTextRectColor: autocorrectionTextRectColor,
            textCapitalization: widget.textCapitalization,
            keyboardAppearance: widget.keyboardAppearance,
            textScaleFactor: widget.textScaleFactor,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            selectionColor: selectionColor,
            selectionControls:
            widget.selectionEnabled ? textSelectionControls : null,
            textDirection: widget.textDirection,
            showSelectionHandles: widget.showSelectionHandles,
            showCursor: widget.showCursor,
            textWidthBasis: TextWidthBasis.parent,
            autocorrect: widget.autocorrect,
            forceLine: widget.forceLine,
            readOnly: widget.readOnly,
            toolbarOptions: widget.toolbarOptions,
            smartDashesType: widget.smartDashesType,
            smartQuotesType: widget.smartQuotesType,
            enableSuggestions: widget.enableSuggestions,
            autofillHints: widget.autofillHints,
            autofillClient: widget.autofillClient,
            clipBehavior: widget.clipBehavior,
            restorationId: widget.restorationId,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            inputFormatters: widget.inputFormatters,
            mouseCursor: widget.mouseCursor,
            rendererIgnoresPointer: widget.rendererIgnoresPointer,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            textInputAction: widget.textInputAction,
            onSelectionChanged: widget.onSelectionChanged,
          ),
        ),
      ],
    );
  }
}