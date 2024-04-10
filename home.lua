require "import"
import
{
  "android.app.*",
  "android.os.*",
  "android.widget.*",
  "android.view.*",
  "layout",
  "android.content.Context",
  "android.provider.Settings",
  "floating_window",
  "android.content.Context",
  "android.view.animation.*",
  "android.animation.ObjectAnimator",
  "android.provider.Settings",
  "android.graphics.drawable.GradientDrawable",
  "android.graphics.Typeface",
  "android.net.Uri",
  "android.content.Intent",
  "android.graphics.Color",
  "suspended_ball",
  "style",
  "pageviewlayout/listlayout1",
  "pageviewlayout/listlayout2",
  "pageviewlayout/listlayout3",
  "pageviewlayout/listlayout4",
  "pageviewlayout/listlayout5"
}


activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
activity.ActionBar.hide()
activity.setContentView(loadlayout("homelayout"))

function 全局字体(A0_8)
  function 字体()
    import "android.graphics.drawable.GradientDrawable"
    import "android.graphics.Typeface"
    import "java.io.File"

    return Typeface.createFromFile(File(activity.getLuaDir() .. "/font/" .. A0_8 .. ".ttf"))
  end
  import "android.graphics.Typeface"

  font = 字体()
  function setFont(A0_9)
    if luajava.instanceof(A0_9, TextView) then
      A0_9.setTypeface(font)
     elseif luajava.instanceof(A0_9, ViewGroup) then
      for _FORV_4_ = 0, A0_9.getChildCount() - 1 do
        setFont(A0_9.getChildAt(_FORV_4_))
      end
    end
  end
  setFont(activity.getDecorView())
end

function wd(view,time)
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end

border(card1, 10, 0xFFFFFFFF, 0x00000000, 40)
border(card2, 5, 0xFFFFFFFF, 0x00000000, 40)
border(card3, 5, 0xFFFFFFFF, 0x00000000, 40)
border(card4, 5, 0xFFFFFFFF, 0x00000000, 40)
border(card5, 5, 0xFFFFFFFF, 0x00000000, 40)
border(card6, 5, 0xFFFFFFFF, 0x00000000, 40)
border(card7, 5, 0xFFFFFFFF, 0x00000000, 40)
border(card8, 5, 0xFFFFFFFF, 0x00000000, 40)
text1.getPaint().setFakeBoldText(true)

Http.get("https://share.weiyun.com/z5McK1uy",nil,nil,nil,function(code,content)
  if code==200 then
    local 链接失败=content:match('<article(.-)</article>')
    local content=链接失败
    :gsub("</p><p>","\n")
    :gsub("</p>"," ")
    :gsub("<p>"," ")
    :gsub("<br  />","")

    公告=content:match("【公告】(.-)【公告】")
    text3.setText(公告)
    ggtext.setText(公告)
  end
end)

Http.get("https://share.weiyun.com/2b5oMWvt",nil,nil,nil,function(code,content)
  if code==200 then
    local 链接失败=content:match('<article(.-)</article>')
    local content=链接失败
    :gsub("</p><p>","\n")
    :gsub("</p>"," ")
    :gsub("<p>"," ")
    :gsub("<br  />","")

    更新修复公告=content:match("【公告】(.-)【公告】")
  end
end)

function text5.onClick()
  wd(card3, 500)
  import "android.content.Intent"
  import "android.net.Uri"

  viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://qm.qq.com/q/DlfeCRMkBG"))
  activity.startActivity(viewIntent)
end

function text6.onClick()
  wd(card4, 500)
  import "android.net.Uri"
  import "android.content.Intent"

  url="mqqwpa://im/chat?chat_type=wpa&uin=3324124608"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end

function text7.onClick()
  wd(card5, 500)
  if pcall(function() activity.getPackageManager().getPackageInfo("com.yiyou.ga",0) end) then
    import "android.content.Intent"
    import "android.content.pm.PackageManager"

    manager = activity.getPackageManager()
    open = manager.getLaunchIntentForPackage("com.yiyou.ga")
    this.startActivity(open)
   else
    Toast.makeText(activity, "你还没安装TT语音",Toast.LENGTH_SHORT).show()
  end
end

function text8.onClick()
  wd(card6, 500)
  dialog=AlertDialog.Builder(this)
  .setTitle("Title")
  .setMessage(更新修复公告)
  .setPositiveButton("我已了解", nil)
  .show()
  .create()

  message=dialog.findViewById(android.R.id.message)
  message.setTextColor(0xFFFFFFFF)

  import "android.graphics.Color"

  dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xFF0095FF)

  import "android.text.SpannableString"
  import "android.text.style.ForegroundColorSpan"
  import "android.text.Spannable"

  sp = SpannableString("以下是更新修复公告")
  sp.setSpan(ForegroundColorSpan(0xFF0095FF),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
  dialog.setTitle(sp)
end

function text9.onClick()
  wd(card7, 500)
  import "android.content.Intent"
  import "android.net.Uri"

  viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://t.me/GTTT8888"))
  activity.startActivity(viewIntent)
end

function text10.onClick()
  wd(card8, 500)
  activity.finish()
end

wmManagers = activity.getSystemService(Context.WINDOW_SERVICE)
HasFocus=false
wmParams = WindowManager.LayoutParams()

if Build.VERSION.SDK_INT >= 26 then
  wmParams.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else
  wmParams.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end

function 判断悬浮窗权限()
  if Settings.canDrawOverlays(this)==false then
    AlertDialog.Builder(this)
    .setTitle("没有悬浮窗权限！")
    .setMessage("检测到没有给予悬浮窗权限，请先给予悬浮窗权限。")
    .setPositiveButton("点击授权悬浮窗权限",{onClick=function(v)
        import "android.net.Uri"
        import "android.content.Intent"
        import "android.provider.Settings"
        intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
        intent.setData(Uri.parse("package:" .. activity.getPackageName()));
        activity.startActivityForResult(intent, 100);
      end})
    .show()
  end
end
判断悬浮窗权限()


import "android.graphics.PixelFormat"

wmParams.format =PixelFormat.RGBA_8888 --设置背景
wmParams.flags=WindowManager.LayoutParams().FLAG_NOT_TOUCH_MODAL--焦点设置
wmParams.gravity = Gravity.LEFT | Gravity.TOP
wmParams.format = 1
wmParams.y = activity.getWidth()/2
wmParams.width = WindowManager.LayoutParams.WRAP_CONTENT
wmParams.height = WindowManager.LayoutParams.WRAP_CONTENT
floating_window=loadlayout(floating_window)
suspendedball=loadlayout(suspended_ball)
local 坐标={x=2,y=2}
local 动画对象 = AnimationSet(true)
local 动画容器 = LayoutAnimationController(动画对象,0.2)
local 渐变动画 = AlphaAnimation(0,1)
动画容器.setOrder(LayoutAnimationController.ORDER_NORMAL)
渐变动画.setDuration(500)
动画对象.addAnimation(渐变动画)

function open_suspendedball()
  if(fb==false)then
    suspendedball.setLayoutAnimation(动画容器)
    wmManagers.addView(suspendedball,wmParams)
    fb = true
  end
end

function close_suspendedball()
  if(fb==true)then
    wmManagers.removeView(suspendedball)
    fb = false
  end
end

function open_floatingwindow()
  local 坐标={x=2,y=2}
  local 动画对象 = AnimationSet(true)
  local 动画容器 = LayoutAnimationController(动画对象,0.2)
  local 渐变动画 = AlphaAnimation(0,1)
  local 滑入动画 = TranslateAnimation(-100,0,0,0)
  动画容器.setOrder(LayoutAnimationController.ORDER_NORMAL)
  渐变动画.setDuration(500)
  滑入动画.setDuration(500)
  动画对象.addAnimation(渐变动画)
  动画对象.addAnimation(滑入动画)
  if(fw==false)then
    floating_window.setLayoutAnimation(动画容器)
    wmManagers.addView(floating_window,wmParams)
    close_suspendedball()
    fw = true
  end
end

local firstX,firstY,wmX,wmY

function openwindow.OnTouchListener(v,event)
  if(fw == false)then
    if(event.getAction() == MotionEvent.ACTION_DOWN)then
      firstX = event.getRawX()
      firstY = event.getRawY()
      wmX = wmParams.x
      wmY = wmParams.y
     elseif(event.getAction() == MotionEvent.ACTION_MOVE)then
      坐标.x = wmX + (event.getRawX() - firstX)
      坐标.y = wmY + (event.getRawY() - firstY)
      wmParams.x = 坐标.x
      wmParams.y = 坐标.y
      wmManagers.updateViewLayout(suspendedball,wmParams)
     elseif(event.getAction() == MotionEvent.ACTION_UP)then
      wmManagers.updateViewLayout(suspendedball,wmParams)
    end
  end
  return false
end

function floating_window.OnTouchListener(v,event)
  if event.getAction() == MotionEvent.ACTION_DOWN then
    firstX = event.getRawX()
    firstY = event.getRawY()
    wmX = wmParams.x
    wmY = wmParams.y
   elseif event.getAction() == MotionEvent.ACTION_MOVE then
    wmParams.x = wmX + (event.getRawX() - firstX)
    wmParams.y = wmY + (event.getRawY() - firstY)
    wmManagers.updateViewLayout(floating_window,wmParams)
   elseif(event.getAction() == MotionEvent.ACTION_UP)then
    wmManagers.updateViewLayout(floating_window,wmParams)
  end
  return false
end

function back.onClick()
  if(fw==true)then
    wmManagers.removeView(floating_window)
    open_suspendedball()
    fw = false
  end
end

function back.onLongClick()
  text4.setText("开启悬浮")
  if(fb==true)then
    wmManagers.removeView(suspendedball)
    fb = false
  end
  if(fw==true)then
    wmManagers.removeView(floating_window)
    fw = false
  end
end

function close.onClick()
  text4.setText("开启悬浮")
  if(fb==true)then
    wmManagers.removeView(suspendedball)
    fb = false
  end
  if(fw==true)then
    wmManagers.removeView(floating_window)
    fw = false
  end
end

fw=false

function openwindow.onClick()
  if(fw==false)then
    open_floatingwindow()
  end
end

fb=false

function text4.onClick()
  wd(card2, 500)
  if fb==false then
    open_suspendedball()
    text4.setText("关闭悬浮")
    fb=true
   else
    text4.setText("开启悬浮")
    close_suspendedball()
    fb=false
    if(fw==true)then
      wmManagers.removeView(floating_window)
      fw = false
    end
  end
end

import "android.media.MediaPlayer"

music = MediaPlayer()
music.reset()

function radio1.onClick()
  if radio1.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/countduck.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio4.onClick()
  if radio4.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/hetangyuese.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio2.onClick()
  if radio2.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/gaopin.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio3.onClick()
  if radio3.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/gundao.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio5.onClick()
  if radio5.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/maren.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio6.onClick()
  if radio6.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/fkjb.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio7.onClick()
  if radio7.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.pause()
    music.setDataSource(activity.getLuaDir() .. "/music/maren2.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio8.onClick()
  if radio8.checked then
    music.pause()
    import "android.media.MediaPlayer"

    music = MediaPlayer()
    music.reset()
    music.setDataSource(activity.getLuaDir() .. "/music/wjp.mp3")
    music.prepare()
    music.setLooping(true)
    music.start()
   else
    music.pause()
  end
end

function radio9.onClick()
  if radio9.checked then
    music.stop()
  end
end

import "android.content.BroadcastReceiver"
import "android.content.IntentFilter"
import "android.media.AudioManager"
import "android.telephony.TelephonyManager"

mAudioManager = activity.getSystemService(Context.AUDIO_SERVICE);

--======================音量调节======================================

bdre={
  AudioManager.STREAM_RING,
  AudioManager.STREAM_MUSIC,
  AudioManager.STREAM_ALARM,
  AudioManager.STREAM_VOICE_CALL}

function Initialization()
  --获取当前音乐音量
  --系统
  mVolume = mAudioManager.getStreamVolume(bdre[1]);
  --媒体
  mVolume1 = mAudioManager.getStreamVolume(bdre[2]);
  --闹钟
  mVolume2 = mAudioManager.getStreamVolume(bdre[3]);
  --通话
  mVolume3 = mAudioManager.getStreamVolume(bdre[4]);
  --部署seekbar初始值
  mct1=mAudioManager.getStreamMaxVolume(bdre[2])
  mpy.Text="媒体音量：".. tostring(tointeger((mVolume1/mct1)*100)).."%"
  --音量级别设置
  fpl.setMax(mct1).setProgress(mVolume1);
end
Initialization()

function mactil(sry,mklo,glp,js,ds)
  sry.setOnSeekBarChangeListener{
    onProgressChanged=function(seekBar,progress,fromUser)
      mAudioManager.setStreamVolume(mklo, progress,AudioManager.FLAG_SHOW_UI);
      js.Text=ds.. tostring(tointeger((progress/glp)*100)).."%"
    end,}
end
mactil(fpl,bdre[2],mct1,mpy,"媒体音量：")

--=======================声音开关=====================================
mad=function(a)
  if a then
    return 1
   else
    return 0
  end
end

resolver = activity.getContentResolver();
activePhoneType = TelephonyManager.getDefault().getCurrentPhoneType();

sdre={
  Settings.System.SOUND_EFFECTS_ENABLED,
  Settings.System.DTMF_TONE_WHEN_DIALING,
  Settings.System.LOCKSCREEN_SOUNDS_ENABLED,
  Settings.System.HAPTIC_FEEDBACK_ENABLED,
  Settings.System.VIBRATE_WHEN_RINGING}

function onResume()
  Initialization()
end

onReceive=function(c,intent)
  --如果音量发生变化则更改seekbar的位置
  if intent.getAction()=="android.media.VOLUME_CHANGED_ACTION" then
    Initialization()
  end
end
filter=IntentFilter() ;
filter.addAction("android.media.VOLUME_CHANGED_ACTION") ;
this.registerReceiver(filter) ;

pageview.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    --htcd=activity.getWidth()/3.5
    -- br.setX(htcd*(b+a))
    if c==0 then
      if a==0 then
        card_zs1.setBackgroundColor(0xFF007DFF)
        card_zs2.setBackgroundColor(0xFFFFFFFF)
        card_zs3.setBackgroundColor(0xFFFFFFFF)
        card_zs4.setBackgroundColor(0xFFFFFFFF)
        card_zs5.setBackgroundColor(0xFFFFFFFF)
       elseif a==1 then
        card_zs1.setBackgroundColor(0xFFFFFFFF)
        card_zs2.setBackgroundColor(0xFF007DFF)
        card_zs3.setBackgroundColor(0xFFFFFFFF)
        card_zs4.setBackgroundColor(0xFFFFFFFF)
        card_zs5.setBackgroundColor(0xFFFFFFFF)
       elseif a==2 then
        card_zs1.setBackgroundColor(0xFFFFFFFF)
        card_zs2.setBackgroundColor(0xFFFFFFFF)
        card_zs3.setBackgroundColor(0xFF007DFF)
        card_zs4.setBackgroundColor(0xFFFFFFFF)
        card_zs5.setBackgroundColor(0xFFFFFFFF)
       elseif a==3 then
        card_zs1.setBackgroundColor(0xFFFFFFFF)
        card_zs2.setBackgroundColor(0xFFFFFFFF)
        card_zs3.setBackgroundColor(0xFFFFFFFF)
        card_zs4.setBackgroundColor(0xFF007DFF)
        card_zs5.setBackgroundColor(0xFFFFFFFF)
       elseif a==4 then
        card_zs1.setBackgroundColor(0xFFFFFFFF)
        card_zs2.setBackgroundColor(0xFFFFFFFF)
        card_zs3.setBackgroundColor(0xFFFFFFFF)
        card_zs4.setBackgroundColor(0xFFFFFFFF)
        card_zs5.setBackgroundColor(0xFF007DFF)
      end
    end
  end})

function list1.onClick()
  card_zs1.setBackgroundColor(0xFF007DFF)
  card_zs2.setBackgroundColor(0xFFFFFFFF)
  card_zs3.setBackgroundColor(0xFFFFFFFF)
  card_zs4.setBackgroundColor(0xFFFFFFFF)
  card_zs5.setBackgroundColor(0xFFFFFFFF)
  pageview.showPage(0)
end

function list2.onClick()
  card_zs1.setBackgroundColor(0xFFFFFFFF)
  card_zs2.setBackgroundColor(0xFF007DFF)
  card_zs3.setBackgroundColor(0xFFFFFFFF)
  card_zs4.setBackgroundColor(0xFFFFFFFF)
  card_zs5.setBackgroundColor(0xFFFFFFFF)
  pageview.showPage(1)
end

function list3.onClick()
  card_zs1.setBackgroundColor(0xFFFFFFFF)
  card_zs2.setBackgroundColor(0xFFFFFFFF)
  card_zs3.setBackgroundColor(0xFF007DFF)
  card_zs4.setBackgroundColor(0xFFFFFFFF)
  card_zs5.setBackgroundColor(0xFFFFFFFF)
  pageview.showPage(2)
end

function list4.onClick()
  card_zs1.setBackgroundColor(0xFFFFFFFF)
  card_zs2.setBackgroundColor(0xFFFFFFFF)
  card_zs3.setBackgroundColor(0xFFFFFFFF)
  card_zs4.setBackgroundColor(0xFF007DFF)
  card_zs5.setBackgroundColor(0xFFFFFFFF)
  pageview.showPage(3)
end

function list5.onClick()
  card_zs1.setBackgroundColor(0xFFFFFFFF)
  card_zs2.setBackgroundColor(0xFFFFFFFF)
  card_zs3.setBackgroundColor(0xFFFFFFFF)
  card_zs4.setBackgroundColor(0xFFFFFFFF)
  card_zs5.setBackgroundColor(0xFF007DFF)
  pageview.showPage(4)
end

全局字体("Facon")