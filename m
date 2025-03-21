Return-Path: <linux-gpio+bounces-17844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7AAA6B8A6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74EC13BD11F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6DD1F3B8F;
	Fri, 21 Mar 2025 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YwI4ZXJq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF891EEA42;
	Fri, 21 Mar 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742552294; cv=none; b=Z2+rJb8xtGWF9mQIpXookKrz/i3/sKSNafA+Z4zKx96DiyeXLjixozznoZUem1b3VHNEvf1zjCjVFB/p+2f6UOKRy2BW6rAbhv9t1Wza0h/dTV0rPFxmbOt1zdUI6nAZW2DnkBoqO8dtFky72LXE7m0ZpzzPT6IR0JrxqUFl5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742552294; c=relaxed/simple;
	bh=xtAmD+fgt/NWhVXon0TZz+uyM0rmsfB32Ds4PzNVrM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oQTTIZA8JAPbJOIgwpDxhkv03GjMU4Hr1SsoPVZoRv3yW9hJC1oDGTMk+FPodcXlv4jGL8t/I7g2oZyvBvMiOWHJ5iBuomQrc3Yb/eKZ8LsyVCeFFV5JCe/S8O6x5ugTMolaWtNNXldWpMeUacSKAoCfZ5Zk61CiLDw68m1z+q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YwI4ZXJq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L8jsU6028321;
	Fri, 21 Mar 2025 10:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijZtPvfe4YKXGAViNI51s+ymSMZKXZGPB3c7T0Fqxw4=; b=YwI4ZXJqaUgSI9x/
	defKFmonLWsiYhSRQ4kqKCxYBwqoSI6+bmozVb9xIA2TxDbb4dQjLDYlKD5LcDDf
	IJwBCKOD/I53Oo3uWFtpQ7WYQ6iWXOEtb8nYKjNeldjKcXQQABwd40vAmXyzLpth
	2qWvM/DdZStpUNm7l76677iIMT6hDItuYES49RNQLFMN8yfFJjKBgYoLL108SCKf
	hJbLxQADaQ2YbP+Cqt8QbBJptf9h1hf3zFyhaeM+Zsc3Gd3J87BOi6LJY/CU44jn
	I3/sMbqnLQDFm96RY40/31LFlGCQ/2u+UxmgKrGYKDmDGyLgywYQ7sN6Q0phrNDO
	h3L+8A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1cer4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:17:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LAHo4Q002862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:17:50 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 03:17:43 -0700
Message-ID: <b82afb57-1de3-489f-aa17-91496d0f6a48@quicinc.com>
Date: Fri, 21 Mar 2025 18:17:39 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
        <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>
References: <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
 <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
 <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
 <7vdaasc3flhpabnorjty5qjorlbp22honuscgpbteakgagg2tq@frqa6flk2mmv>
 <df1a4457-129e-452c-8089-ee1e6f9a3e12@quicinc.com>
 <jdw3xuknq2atcowl5xboimp3fol56t5nilefrxzpbdpwdoo5oc@pggif3lysjhh>
 <4c06aeec-161d-4e67-9a64-ac74991a0f73@quicinc.com>
 <m2dz6cw6eq7ztnfdispocvt2dxtumeazbgyts5em55n67cfxlz@fwirkughbj66>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <m2dz6cw6eq7ztnfdispocvt2dxtumeazbgyts5em55n67cfxlz@fwirkughbj66>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd3ccf cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=dmFUCssqxIl4ToPr6JYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ch7No5aJ38x2oKutKiqDoW8TaZEg9gkL
X-Proofpoint-ORIG-GUID: ch7No5aJ38x2oKutKiqDoW8TaZEg9gkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210074



On 3/6/2025 5:25 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 05, 2025 at 06:20:45PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 12/20/2024 8:01 AM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 18, 2024 at 08:55:54PM +0800, Xiangxu Yin wrote:
>>>>
>>>>
>>>> On 12/12/2024 3:15 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Dec 11, 2024 at 08:50:02PM +0800, Xiangxu Yin wrote:
>>>>>>
>>>>>>
>>>>>> On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
>>>>>>>>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
>>>>>>>>>>>>> different types of cfg and layout attributes during initialization based
>>>>>>>>>>>>> on this type. Static variables are stored in cfg, while parsed values
>>>>>>>>>>>>> are organized into the layout structure.
>>>>>>>>>>>>
>>>>>>>>>>>> We didn't have an understanding / conclusion whether
>>>>>>>>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
>>>>>>>>>>>> or two PHYs being placed next to each other. Could you please start
>>>>>>>>>>>> your commit message by explaining it? Or even better, make that a part
>>>>>>>>>>>> of the cover letter for a new series touching just the USBC PHY
>>>>>>>>>>>> driver. DP changes don't have anything in common with the PHY changes,
>>>>>>>>>>>> so you can split the series into two.
>>>>>>>>>>>>
>>>>>>>>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
>>>>>>>>>>
>>>>>>>>>> What is "DP extension"?
>>>>>>>>>>
>>>>>>>> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
>>>>>>>>>>>
>>>>>>>>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
>>>>>>>>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
>>>>>>>>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
>>>>>>>>>>> It would be more efficient for a single driver to manage these controls. 
>>>>>>>>>>
>>>>>>>>>> The question is about the hardware, not about the driver.
>>>>>>>>>>
>>>>>>>>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
>>>>>>>>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
>>>>>>>>>>> we still decided to base it on the USBC extension.
>>>>>>>>>>
>>>>>>>>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
>>>>>>>>>> thought that usbc-or-dp platforms support that, but they don't
>>>>>>>>>> support DP+USB pin configuration. Note, the question is broader than
>>>>>>>>>> just QCS615, it covers the PHY type itself.
>>>>>>>>>>
>>>>>>>>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
>>>>>>>>>> set the register from OS or are we supposed to read it and thus detemine
>>>>>>>>>> the PHY mode?
>>>>>>>>>
>>>>>>>>> Any updates on these two topics?
>>>>>>>>>
>>>>>>>> Still confirming detail info with HW & design team.
>>>>>>>> I’ll update the information that has been confirmed so far.
>>>>>>>> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
>>>>>>>> TCSR phy mode is read/write reg and we can read for determine phy mode.
>>>>>>>
>>>>>>> Ok, thanks for the explanation. From my point of view:
>>>>>>>
>>>>>>> - Implement the DP PHY to be a part of the same driver. Each device
>>>>>>>   supported by the usbc driver should get both PHYs.
>>>>>>>
>>>>>>> - Make sure not to break the ABI: #phy-cells = <0> should still work and
>>>>>>>   return USB PHY, keeping backwards compatibility. Newer devices or
>>>>>>>   upgraded DT for old devices should return USB PHY for <... 0> and DP
>>>>>>>   PHY for <... 1>.
>>>>>>>
>>>>>> Yes, currently we have implemented like your description,
>>>>>> Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.
>>>>>
>>>>> Please note the backwards compatibility clause.
>>>>>
>>>> For the USB node, we kept the same implementation as the original function interface, and the devicetree node definition also remains unchanged.
>>>> In subsequent patches, I will follow Krzysztof’s suggestion to use a separate DT-binding to describe the DP PHY configuration, 
>>>> without making changes to the USB devicetree and DT-binding implementation.
>>>>>>> - I'm not shure how to handle the USB and DP coexistence, especially in
>>>>>>>   your case of the USB-or-DP PHY.
>>>>>>>
>>>>>> For coexistence process:
>>>>>>
>>>>>> When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
>>>>>> Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.
>>>>>
>>>>> Thanks!
>>>>>
>>>>>> Anyway, even though the original SoC design supports DP or USB over Type-C，
>>>>>> but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
>>>>>> DP port is mappped from usb pin to the video out sub-board.
>>>>>> so we are unable to verify the switching case between DP and USB devices under USB-C.
>>>>>
>>>>> That's also fine. We will get to that point once MSM8998 / SDM660
>>>>> get USB-C support (the only current blocker is the support for the
>>>>> TYPEC block of the PMI8998).
>>>>>
>>>> I can't access MSM8998 / SDM660 documents now, but I have confirmed detail info about USB & DP phy design for sm6150.
>>>>
>>>> The 'usb-ssphy-qmp-usb3-or-dp PHY' on the current platform is essentially composed of three sub-PHYs, 
>>>> which can even be considered as three separate PHYs: USB3 primary PHY, USB3 secondary PHY, and USB3 DP PHY.
>>>
>>> I've looked at sm6150-usb.dtsi and now I'm completely puzzled by your
>>> answer. The msm-4.14 kernel lists a single USB QMP PHY at 0x88e6000,
>>> used for the primary USB3 host. It it defined as
>>> qcom,usb-ssphy-qmp-usb3-or-dp. Secondary USB host is listed as USB 2.0
>>> only. So what do you mean by the USB3 secondary PHY? Which PHY and which
>>> pins are connected to your video-out board?
>>>
>> Five PHYs are integrated into Talos SoC: two USB2 PHYs, two USB3 PHYs, and one DP PHY.
>> PERIPH_SS_QUSB2PHY_PRIM_QUSB2PHY_PRIM_CM_QUSB2_LQ_1EX (0x088E2000)
>> PERIPH_SS_QUSB2PHY_SEC_QUSB2PHY_SEC_CM_QUSB2_LQ_1EX (0x088E3000)
>> PERIPH_SS_USB0_USB3PHY_USB0_USB3PHY_CM_USB3_SW (0x088E6000)
>> PERIPH_SS_USB1_USB3PHY_USB1_USB3PHY_CM_USB3_SW (0x088E8000)
>> PERIPH_SS_DP_PHY_DP_PHY_CM_DP_4LN_SW (0x088E9000)
>>
>> The USB3 secondary PHY(0x088E8000) is the one mutually exclusive with the DP PHY, which controlled by the TCSR switch.
>> USB3 secondary PHY is not configed in qcs615 dtsi.
> 
> Okay, thanks for the explanation. I'm still puzzled by msm-4.14 defining
> primary USB3 PHY as 'qcom,usb-ssphy-qmp-usb3-or-dp', but it might be
> some kind of a hack or just a difference between QCS615 and SM6150.
> 
> If QCS615 follows other platforms of the same generation, I'd assume
> that the correct way to handle it would be:
> 
> - Keep the primary USB3 PHY as is (it needs to be reposted though, the
>   driver part didn't make it in).
> 
> - Extend the qmp-usbc driver to support USB+DP 'exclusive combo' PHYs by
>   registering two PHYs for a single device. Make sure to continue
>   supporting #phy-cells = 0 and region size = 0x1000. Use definitions
>   from include/dt-bindings/phy/phy-qcom-qmp.h .
> 
To avoid any misunderstandings, let me double-confirm these points.

1.In this patch [PATCH 3/8], 
we didn't modify the USB driver logic; we only adjusted the structure and organizational relationships. 
Does the first point suggest splitting this patch and isolating the USB structure changes into a separate patch?
Or did I misunderstand?

2. Does "two PHYs for a single device" means should define both usb PHY and DP PHY in dtsi, the USBC PHY driver's probe will run separately for both USB and DP?
Then USB PHY node can keep forward compatibility with prop '#clock-cells = <0>' & '#phy-cells = <0>',
and DP PHY will define with prop '#clock-cells = <1>' & '#phy-cells = <1>'.

> - Make sure that the PHY driver doesn't allow both PHYs to be powered
>   on. Add TCSR programming to the power_on / power_off callbacks,
>   implementing the switch between DP and USB3.
> 
Ok, I will add TCSR switch logic to DP power_on / power_off callbacks, 
During DP power off, default will reset to USB3 PHY.

> At this point all PHYs in qmp-usbc can be switched to the new USB+DP
> configuration, still providing backwards compatibility with the existing
> board DTs.
> 
>> In Ride, DP PHY, DP lane 0~3 and DP aux pins are connected to video-out board.
>>>>
>>>> On the QCS615, the USB primary PHY is currently used to handle USB 3.0 communication for the previously mentioned four USB Type-A ports, 
>>>> while the USB3 secondary PHY and USB3 DP PHY are used for the output of the Type-C port,
>>>> but since the Type-C port is forcibly pin-to-pin configured to the video out board, the Type-C port will always configure as DP PHY.
>>>>
>>>> The internal registers of these three PHYs are independent of each other, Neither their respective SWPWR_DN nor SWRST will affect the other two PHYs.
>>>> Additionally, there was a misunderstanding about the orientation previously.
>>>> The USB orientation setting only affects the current PHY and does not impact the DP PHY. The DP PHY is configured in the DP_PHY_CFG_1.
>>>>
>>>> TSCR_PHY_MODE can specify which PHY outputs to the Type-C port, and the global reset will simultaneously reset the two associated PHYs. 
>>>> Therefore, the correct switching process is as follows.
>>>> When switching the inserted device:
>>>> 	1.Identify the PHY type.
>>>> 	2.Enable the regulator.
>>>> 	3.Trigger a reset.
>>>> 	4.Enable the clock.
>>>> 	5.Configure PHY type related orientation
>>>> 	6.switch the TCSR PHY mode.
>>>> 	7.Configure the registers of PHY.
>>>> During release:
>>>> 	1.Reset.
>>>> 	2.Disable the clock.
>>>> 	3.Disable the regulator.
>>>>
>>>> Our current design overall complies with this process, but it lacks the configuration for DP_PHY_CFG_1.
>>>>
>>>> Shall we continue the discussion to clarify remain comments of the USBC driver?
>>>>
>>>>>> However, I'm also confirming whether anything other will affect USB and DP each other.
>>>>>
>>>>
>>>
>>
> 


