Sub Process_Globals
    'this is the name of the page
    Public name As String = "kanban"
    Public title As String = "Kanban Board"
    Public icon As String = "fa-solid fa-swatchbook"
    Public color As String = "#000000"
    'this variable holds reference to the app
    'usually for constants and other things
    Public app As SDUIApp
    'the variable referencing banano lib
    Private banano As BANano						'ignore
    'this variable holds the page controller
    Public page As SDUIPage			'ignore
    Private Mode As String		'ignore
    Private row1 As SDUIRow		'ignore
    Private col2 As SDUICol		'ignore
    Private taskcard As SDUIBasicCard		'ignore
    Private taskcardbody As SDUICardBody		'ignore
    Private toolbar1 As SDUIToolBar		'ignore
    Private taskpriority As SDUIBadge		'ignore
    Private tasktype As SDUIBadge		'ignore
    Private taskmenu As SDUIDropDown		'ignore
    Private taskname As SDUILabel		'ignore
    Private taskduedate As SDUILabel		'ignore
    Private taskprogress As SDUIProgress		'ignore
    Private taskresponsible As SDUIBadge		'ignore
End Sub
'show the page
Sub Show(duiapp As SDUIApp)			'ignore
    'get the reference to the app
    app = duiapp
    BANano.Await(BuildPage)
End Sub
'start building the page
Private Sub BuildPage
    'initialize the page
    page.Initialize(Me, "page", "page")
    'clear the pageviewer
    banano.Await(page.ClearPageView)
    'set the page properties
    page.PageName = "kanban"
    page.Title = "Kanban Board"
    page.FullPage = true
    page.Container = false
    page.MxAuto = false
    page.Flex = false
    page.FlexWrap = false
    page.PaddingAXYTBLR = "a=5px; x=?; y=?; t=?; b=?; l=?; r=?"
    banano.Await(page.AddToParent(app.PageViewer, page.CustProps))
    '
    row1.Initialize(Me, "row1", "row1")
    row1.ParentID = "kanban"
    row1.Gap = "4"
    row1.Grid = true
    row1.GridCols = "12"
    row1.Classes = "my-4"
    row1.AddToParent("kanban", row1.CustProps)
    '
    '
    col2.Initialize(Me, "col2", "col2")
    col2.ParentID = "row1"
    col2.Size = "12"
    col2.AddToParent("row1", col2.CustProps)
    '
    '
    taskcard.Initialize(Me, "taskcard", "taskcard")
    taskcard.ParentID = "col2"
    taskcard.CardBordered = true
    taskcard.Width = ""
    taskcard.Shadow = ""
    taskcard.BorderStyle = ""
    taskcard.Classes = "border-t-[#00FF00] border-t-[6px]"
    taskcard.AddToParent("col2", taskcard.CustProps)
    '
    '
    taskcardbody.Initialize(Me, "taskcardbody", "taskcardbody")
    taskcardbody.ParentID = "taskcard"
    taskcardbody.Classes = "shadow-none"
    taskcardbody.Styles = "padding-bottom:10px;padding-left:3px;padding-right:3px;padding-top:3px"
    taskcardbody.AddToParent("taskcard", taskcardbody.CustProps)
    '
    '
    toolbar1.Initialize(Me, "toolbar1", "toolbar1")
    toolbar1.ParentID = "taskcardbody"
    toolbar1.HasCenter = false
    toolbar1.Title = ""
    toolbar1.TitleSize = "1.5xl"
    toolbar1.HasHamburger = false
    toolbar1.HasHamburgerOnSmallOnly = false
    toolbar1.LogoShape = "squircle"
    toolbar1.HasMenuButton = false
    toolbar1.Shadow = false
    toolbar1.AddToParent("taskcardbody", toolbar1.CustProps)
    '
    '
    taskpriority.Initialize(Me, "taskpriority", "taskpriority")
    taskpriority.ParentID = "toolbar1start"
    taskpriority.Variant = "success"
    taskpriority.Caption = "High"
    taskpriority.AddToParent("toolbar1start", taskpriority.CustProps)
    '
    '
    tasktype.Initialize(Me, "tasktype", "tasktype")
    tasktype.ParentID = "toolbar1start"
    tasktype.Variant = "success"
    tasktype.Caption = "Feature"
    tasktype.MarginAXYTBLR = "a=?; x=3px; y=?; t=?; b=?; l=?; r=?"
    tasktype.AddToParent("toolbar1start", tasktype.CustProps)
    '
    '
    taskmenu.Initialize(Me, "taskmenu", "taskmenu")
    taskmenu.ParentID = "toolbar1end"
    taskmenu.Activator = "icon"
    taskmenu.IconName = "fa-solid fa-ellipsis-vertical"
    taskmenu.AvatarSize = "2lg"
    taskmenu.AvatarUrl = ""
    taskmenu.KeyValues = ""
    taskmenu.Position = "end"
    taskmenu.MenuNormal = true
    taskmenu.RoundedBox = true
    taskmenu.AddToParent("toolbar1end", taskmenu.CustProps)
    '
    '
    taskname.Initialize(Me, "taskname", "taskname")
    taskname.ParentID = "taskcardbody"
    taskname.Caption = "This is my task name kjshjdhaskj kjhafjhk khdfjhks kjshfkjhkjs kjhsjkhfkjhska kjshkfhkhaskf kjhjshfkjhka "
    taskname.MarginAXYTBLR = "a=?; x=10px; y=?; t=?; b=?; l=?; r=?"
    taskname.Classes = "text-wrap"
    taskname.AddToParent("taskcardbody", taskname.CustProps)
    '
    '
    taskduedate.Initialize(Me, "taskduedate", "taskduedate")
    taskduedate.ParentID = "taskcardbody"
    taskduedate.Caption = "Due Date:"
    taskduedate.MarginAXYTBLR = "a=?; x=10px; y=?; t=2px; b=1px; l=?; r=?"
    taskduedate.Classes = "text-wrap"
    taskduedate.AddToParent("taskcardbody", taskduedate.CustProps)
    '
    '
    taskprogress.Initialize(Me, "taskprogress", "taskprogress")
    taskprogress.ParentID = "taskcardbody"
    taskprogress.ProgressType = "input-group"
    taskprogress.Width = ""
    taskprogress.Caption = "Progress"
    taskprogress.AppendIconRemoved = true
    taskprogress.HintTextRemoved = true
    taskprogress.IndicatorRemoved = true
    taskprogress.PrefixRemoved = true
    taskprogress.PrependButtonRemoved = true
    taskprogress.SuffixRemoved = true
    taskprogress.MarginAXYTBLR = "a=?; x=10px; y=?; t=5px; b=?; l=?; r=?"
    taskprogress.AddToParent("taskcardbody", taskprogress.CustProps)
    '
    '
    taskresponsible.Initialize(Me, "taskresponsible", "taskresponsible")
    taskresponsible.ParentID = "taskcardbody"
    taskresponsible.BadgeType = "image-left"
    taskresponsible.Caption = "Anele Mbanga"
    taskresponsible.MarginAXYTBLR = "a=?; x=10px; y=?; t=5px; b=?; l=?; r=?"
    taskresponsible.AddToParent("taskcardbody", taskresponsible.CustProps)
    '
End Sub
Sub getName As String		'ignore
    Return name
End Sub
'
Sub getIcon As String		'ignore
    Return icon
End Sub
'
Sub getTitle As String		'ignore
    Return title
End Sub
'
Sub getColor As String		'ignore
    Return color
End Sub
'
