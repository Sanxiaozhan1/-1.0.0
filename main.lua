require "import"
local check=import "A_check"--AluaDefender防Hook文件
local func=function(FuncName)
  error("检测到HOOK")
  --TODO检测到执行   在打包前你可以自己选择对cracker的操作
  --while true 请勿绕过检测() end   --提供的防手段绕过
end
check("wJYDWJYkoP6LVTVkZPIkZTibdT6DdTVkWNCQZNhLoTW=","dQWSdT6NZQ6D",func)--Key和检测后的函数
if debug.getinfo(2,"S")==nil
  --INSERT
  require "import"
  import {
    "android.app.*",
    "android.os.*",
    "android.widget.*",
    "android.view.*",
    "layout"
  }

  activity.setTheme(android.R.style.Theme_Light_NoTitleBar)
  activity.setContentView(loadlayout(layout))

  task(1000,function()
    t1.setText("2 | 跳过")
    task(1000,function()
      t1.setText("1 | 跳过")
      task(1000,function()
        t1.setText("0 | 跳过")
        task(1000,function()
          activity.newActivity("home")
          activity.finish()
        end)
      end)
    end)
  end)

  function t1.onClick()
    activity.newActivity("home")
    activity.finish()
  end
  --END
 else
  func()
end import "java.io.File"local size=File(activity.getLuaDir("A_check.lua")).length()if size==11601344 or size==11601350 else func()end 