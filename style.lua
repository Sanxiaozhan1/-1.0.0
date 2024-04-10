require "import"
import
{
  "android.app.*",
  "android.os.*",
  "android.widget.*",
  "android.view.*",
  "layout"
}

activity.setTheme(R.Theme_Black)
activity.setContentView(loadlayout(layout))

function tg(id, lcolor, rcolor, direction)
  import "android.graphics.drawable.GradientDrawable"
  import "com.androlua.R$drawable"
  import "android.R$drawable"

  if direction == "v" then
    --纵向双色渐变
    direction=GradientDrawable.Orientation.TOP_BOTTOM
   elseif direction == "t" then
    --横向双色渐变
    direction=GradientDrawable.Orientation.LEFT_RIGHT
  end
  drawable = GradientDrawable(direction ,{lcolor,rcolor})
  id.setBackgroundDrawable(drawable)
end

import "android.graphics.Typeface"
import "java.io.File"

function font(id, file_name)
  id.setTypeface(Typeface.createFromFile(File(activity.getLuaDir() .. "/font/" .. file_name .. ".ttf")))
end

function bold(ida)
  ida.getPaint().setFakeBoldText(true)
end

function slide_bar(idb, colour)
  import "android.graphics.PorterDuff"

  idb.ProgressDrawable.setColorFilter(PorterDuffColorFilter(colour,PorterDuff.Mode.SRC_ATOP))
end

function csb(id, colour)
  import "android.graphics.PorterDuffColorFilter"
  import "android.graphics.PorterDuff"

  id.Thumb.setColorFilter(PorterDuffColorFilter(colour,PorterDuff.Mode.SRC_ATOP))
end

function re(id, colour)
  local attrsArray={android.R.attr.selectableItemBackgroundBorderless}
  local typedArray=activity.obtainStyledAttributes(attrsArray)
  Pretend = activity.Resources.getDrawable(typedArray.getResourceId(0,0))
  Pretend.setColor(ColorStateList(int[0].class{int{}},nt{colour}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{colour})))
end

function border(ida, 厚度, 边框颜色, 背景颜色, 圆角度)
  import "android.graphics.drawable.GradientDrawable"

  drawable=GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setStroke(厚度,tonumber(边框颜色))
  drawable.setColor(tonumber(背景颜色))
  drawable.setCornerRadius(圆角度)
  ida.BackgroundDrawable = drawable
end

function ebcc(id, colour)
  import "android.content.res.ColorStateList"

  id.getTextCursorDrawable().setTintList(ColorStateList.valueOf(colour))
end

function cm(value, sc, lc)
  local color = sc - (value / 100) * (sc - lc)
  if color < lc then
    color = lc
    return color
   else
    return color
  end
end

function toast(resource, text)
  toast_layout = {
    LinearLayout;
    orientation="vertical";
    {
      LinearLayout;
      gravity="center";
      layout_width="wrap_content";
      layout_height="wrap_content";
      {
        CardView;
        layout_marginLeft="10dp";
        radius="15dp";
        layout_width="wrap_content";
        layout_marginBottom="10dp";
        CardElevation="0dp";
        layout_marginRight="10dp";
        layout_marginTop="10dp";
        backgroundColor="0xFF38393B";
        layout_height="wrap_content";
        {
          LinearLayout;
          layout_marginLeft="10%w";
          layout_gravity="right";
          gravity="center";
          layout_width="wrap_content";
          layout_height="5%h";
          {
            TextView;
            layout_marginLeft="5dp";
            id="text_toast";
            layout_marginRight="10dp";
            textSize="14sp";
            textColor="0xFFFFFFFF";
          };
        };
        {
          LinearLayout;
          gravity="center";
          layout_height="5%h";
          layout_width="10%w";
          layout_gravity="left";
          {
            ImageView;
            padding="5dp";
            src="icon.png";
            id="image_toast";
          };
        };
      };
    };
  };
  
布局 = loadlayout(toast_layout)
  local toast = Toast.makeText(activity,"",Toast.LENGTH_SHORT).setView(布局).show()
  image_toast.setImageBitmap(loadbitmap(activity.getLuaDir() .. "/resource/" .. resource))
  text_toast.setText(text)
end

function ll(id, colour)
  import "android.graphics.PorterDuff"

  id.getBackground().setColorFilter(colour,PorterDuff.Mode.ADD)
end

function sl(id, colour)
  import "android.graphics.PorterDuffColorFilter"

  id.getBackground().setColorFilter(PorterDuffColorFilter(colour,PorterDuff.Mode.SRC_ATOP));
end

function cfillet(id, InsideColor, radiu)
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  id.setBackgroundDrawable(drawable)
end

function font_batch(first_id, last_id, font_path)
  local start_index = tonumber(string.match(first_id, "%d+"))
  local end_index = tonumber(string.match(last_id, "%d+"))

  for i = start_index, end_index do
    local current_id = string.gsub(first_id, "%d+", tostring(i))
    local text_view = activity.getWindow().getDecorView().findViewById(current_id)
    text_view:setTypeface(Typeface.createFromFile(File(activity.getLuaDir() .. "/font/" .. font_path .. ".ttf")))
  end
end

function time_noun()
  local hour = os.date("%H")

  if hour >= "0" and hour < "5" then
    return "午夜，\n休息好才能更好的学习与工作哦"
   elseif hour >= "5" and hour < "6" then
    return "清晨，\n\"一日之计在于晨\""
   elseif hour >= "6" and hour < "11" then
    return "早晨，\n一顿美味的早餐有助于身心健康"
   elseif hour >= "11" and hour < "12" then
    return "中午"
   elseif hour >= "12" and hour < "18" then
    return "下午，\n来一杯下午茶开始新一轮工作吧"
   elseif hour >= "18" and hour < "20" then
    return "黄昏"
   elseif hour >= "18" and hour < "21" then
    return "傍晚"
   elseif hour >= "21" and hour < "0" then
    return "深夜，\n不早了，该休息了哦"
   else
    return false
  end
end

function hide(id)
  id.setVisibility(View.GONE)
  return true
end

function show(id)
  id.setVisibility(View.VISIBLE)
  return true
end

function edit_dialog(texttitle, edithint)
  edit_layout = {
    LinearLayout;
    orientation="vertical";
    gravity="center";
    {
      CardView;
      layout_height="wrap_content";
      radius="15dp";
      backgroundColor="0xFF38393B";
      layout_width="wrap_content";
      CardElevation="0dp";
      layout_gravity="center";
      {
        LinearLayout;
        layout_width="wrap_content";
        orientation="vertical";
        layout_height="wrap_content";
        {
          LinearLayout;
          layout_width="match_parent";
          layout_height="wrap_content";
          layout_gravity="top";
          gravity="center";
          {
            TextView;
            textSize="18sp";
            id="text_title";
            textColor="0xFFFFFFFF";
            layout_marginBottom="5dp";
            layout_marginTop="10dp";
            layout_marginRight="15dp";
            layout_marginLeft="15dp";
          };
        };
        {
          LinearLayout;
          layout_width="match_parent";
          layout_gravity="center";
          gravity="center";
          {
            EditText;
            hintTextColor="0xB1FFFFFF";
            textSize="15sp";
            id="edit_dialog";
            textColor="0xFFFFFFFF";
            layout_marginBottom="5dp";
            layout_marginTop="10dp";
            layout_marginRight="10dp";
            layout_marginLeft="10dp";
          };
        };
        {
          LinearLayout;
          layout_width="match_parent";
          layout_gravity="bottom";
          gravity="center";
          {
            LinearLayout;
            gravity="center";
            layout_marginBottom="10dp";
            layout_marginTop="10dp";
            layout_marginRight="5dp";
            layout_marginLeft="5dp";
            {
              CardView;
              radius="15dp";
              layout_marginBottom="5dp";
              layout_marginTop="5dp";
              layout_marginRight="5dp";
              layout_marginLeft="5dp";
              {
                CardView;
                id="card_cancle";
                radius="15dp";
                {
                  TextView;
                  layout_marginLeft="15dp";
                  textSize="14sp";
                  id="cancle";
                  textColor="0xFFFFFFFF";
                  layout_marginBottom="10dp";
                  layout_marginTop="10dp";
                  layout_marginRight="15dp";
                  text="取消";
                };
              };
            };
          };
          {
            LinearLayout;
            layout_marginBottom="10dp";
            layout_marginTop="10dp";
            layout_marginRight="5dp";
            gravity="center";
            {
              CardView;
              radius="15dp";
              layout_marginBottom="5dp";
              layout_marginTop="5dp";
              layout_marginRight="5dp";
              layout_marginLeft="5dp";
              {
                CardView;
                radius="15dp";
                id="card_confirm";
                {
                  TextView;
                  layout_marginLeft="15dp";
                  textSize="14sp";
                  id="confirm";
                  textColor="0xFFFFFFFF";
                  layout_marginBottom="10dp";
                  layout_marginTop="10dp";
                  layout_marginRight="15dp";
                  text="确定";
                };
              };
            };
          };
        };
      };
    };
  };

  xxx = AlertDialog.Builder(this)
  xxx.setView(loadlayout(edit_layout))--框架
  xxx.setPositiveButton("确定",function()--积极按钮
    --执行的事件
  end)
  xxx.setNegativeButton("取消",nil)--消极按钮
  xxx.setNeutralButton("其他",nil)--中立按钮
  xxx = xxx.show()
  xxx.creat()
  import "android.graphics.drawable.ColorDrawable"

  tc_edit1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
  text_title.setText(texttitle)
  edit_dialog.setHint(" " .. edithint .. " ")
  import "android.content.res.ColorStateList"

  edit_dialog.getTextCursorDrawable().setTintList(ColorStateList.valueOf(0xFF00BEFF))
  import "android.graphics.PorterDuff"

  edit_dialog.getBackground().setColorFilter(0xFFFFFFFF, PorterDuff.Mode.ADD)
  import "android.graphics.PorterDuffColorFilter"

  edit_dialog.getBackground().setColorFilter(PorterDuffColorFilter(0xFFFFFFFF, PorterDuff.Mode.SRC_ATOP));
  import "android.graphics.drawable.GradientDrawable"

  drawable=GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setStroke(2, tonumber("0xFFFFFFFF"))
  drawable.setColor(tonumber("0xFF38393B"))
  drawable.setCornerRadius(10)
  edit_dialog.BackgroundDrawable = drawable
  import "android.graphics.drawable.GradientDrawable"
  import "com.androlua.R$drawable"
  import "android.R$drawable"

  direction = GradientDrawable.Orientation.LEFT_RIGHT
  drawable = GradientDrawable(direction ,{0x5C000000,0x22000004})
  card_cancle.setBackgroundDrawable(drawable)
  drawable1 = GradientDrawable(direction ,{0xFF6C71FF,0xFF00BEFF})
  card_confirm.setBackgroundDrawable(drawable1)

  function cancle.onClick()
    xxx.dismiss()
    return false
  end

  function confirm.onClick()
    xxx.dismiss()
    return edit_dialog.getText()
  end
end