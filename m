Return-Path: <linux-gpio+bounces-17134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA5A50D4F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 22:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 210723AEE50
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 21:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA330202C5C;
	Wed,  5 Mar 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0E1+HOA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2C1FF7D7
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741209935; cv=none; b=kZJC2CIdfrUeZ12E+HYX1aanmd8WkUGCmS8HgHOqSnsmMdvav+L+uyuRngnSG/kMyau3NJs4tc2Jw2g3G0pH2tL27WI13F0d8HZdoHhnGO20VmErtgDMverFaiHaJgQmx+Ovxv+FHDoyMykEZTf3e1iTBhgjwXDXRGqLuLSfew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741209935; c=relaxed/simple;
	bh=esrvNlm32DlnibCiG0nOdE1R5i010boRi9l0PcFJ6D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+k+ps1qxHW726fL9HergZy8dO2RTn7tA+DQn2x7pMlB0cVaq6bGmc28eraftgTR/afffOQJw3JBqBZhxfXc7A8Y4IqXFBuYiwqxv+LNahKGZD/xC9K7Tl0AflIjdl1cBVHR/3aCBtUU5Jpn7LQbdm1yxj5MB1f3LlT4D4qIFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n0E1+HOA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549662705ffso4405457e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 13:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741209931; x=1741814731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faRfnrcoG4SSamBdtghqJxZW4T93bB85k7OWcAst0eM=;
        b=n0E1+HOA38qENs8TropcP0ecgLXnXqwefAr8cDX7waYS7bz6DfKkVtUgMajQMKQJ46
         k0CW6qLpXs0XjR6ywuJG0NGjTbNol9PnsBj7qxp9G8TIEcdfEch4grNq+IFFsGmVvh7H
         E5IwtSbEU5jC10BDN4n82a7s/oUOIUIPWPawbNl1LMXuEmkdKXjsb5Fp6Af2uomiiXcK
         npHQIxUqyjRp2ulMtJp0kCNbDVVZxGyqcEAjYtx7n2rEbzi9GDkAf6mluifQ69VaGckI
         xjn1inkYEcXxcU01LWNFuIQtK20gkTtnpMTC2zVkrybiaUnbZY2wnEnW2SZdvLm6fWb7
         CYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741209931; x=1741814731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faRfnrcoG4SSamBdtghqJxZW4T93bB85k7OWcAst0eM=;
        b=LwU9CSSmPrYDxi3Ct4/nQW1xoyP8bqx0nB9/hCcnG077HQyNboProsQb9AszEEwzwu
         9Sz1AnSxWpI7qJ+eutGEa/9Cx6bpAYiwo38gKJJLOLPs4Ni0dv80Ty5zzEe8qzQfa2kC
         kKCk++AiV1NMwwvVyZNr4Ns4FGjXNTIj+0vi9ZtcXcTv/Ymqz8TFvEOHm2hgL+fOYnVl
         HuYZtbLLfAnQWpHu6ctvdDlbdFxLef6yUucSFzEHzvwV9wkT7ylDwxIWzjrB9koaZXRA
         FOf7F5Hze+58MvZtvCFQaXcB0uMrETAthWsykZHp98ld5QLBiBxaw8Ct/wQ9wAPGXbnG
         1mkw==
X-Forwarded-Encrypted: i=1; AJvYcCXfVkC5J/Cm5UVJpftoWBhJC7RCMOek6gUQ5cySb5bBv8DEESIyqivpqsrrAtF6STscyUi8EXNL9OBy@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKFJxwljd+ZKfHqCotIFn9l3k68dXi8C4XEH0Ya1IEENGklR4
	3PmMSaXQFHSIDrPjoRAwMzVjA1wYN4tvmT+y0WdcdqFO7knuoozHi9pzVWQrdQs=
X-Gm-Gg: ASbGncv/XIBOOyurDwtrXx24tb8RpcLgwoTvUj5wp/Y/PpFU9pHoBN9+Ive82McJ51A
	svqV6SZJ5RVDuyEYCwkjfpYWWx5GBJp7VoQsfS1grKzHrKMtuu1Q60cwpdnu1RsCv3BvQ3DkEGN
	y2r0Es/Vc9ejRPqUw2lJ6hV9CVvzlS3Mib3v/3AxTU3Sec22JQ/JVXpP/9dZw2//pAANXO1rmYm
	F3XNB9EnixaIs6lpHRNIpbOUfX3lBDSdQvIs0rnxAkhvzddeRy2jpC8+huvthDwT4NtqOJxIjKx
	49dOCynxVtUxU6Bp/73HVrb/EIIrcjl1UFCAo1wrl6zAK5PH41C8O0Me5rp/xElKPYFx97GH1o5
	PjXF8yYK7q2OW694BHEf5AKQD
X-Google-Smtp-Source: AGHT+IHhzaJt3+2DpJ6cosQXgEGrNtu4b/9zDdTqeXqunwn8Xwl8XP18LQANkuIu7ZBzb34JgHJ5QQ==
X-Received: by 2002:a05:6512:b97:b0:545:a1a:5576 with SMTP id 2adb3069b0e04-5497d336954mr1649709e87.22.1741209931157;
        Wed, 05 Mar 2025 13:25:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495d3870besm1283425e87.79.2025.03.05.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:25:29 -0800 (PST)
Date: Wed, 5 Mar 2025 23:25:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
Message-ID: <m2dz6cw6eq7ztnfdispocvt2dxtumeazbgyts5em55n67cfxlz@fwirkughbj66>
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
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c06aeec-161d-4e67-9a64-ac74991a0f73@quicinc.com>

On Wed, Mar 05, 2025 at 06:20:45PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/20/2024 8:01 AM, Dmitry Baryshkov wrote:
> > On Wed, Dec 18, 2024 at 08:55:54PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/12/2024 3:15 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 11, 2024 at 08:50:02PM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>>>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>>>>>>>> different types of cfg and layout attributes during initialization based
> >>>>>>>>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>>>>>>>> are organized into the layout structure.
> >>>>>>>>>>
> >>>>>>>>>> We didn't have an understanding / conclusion whether
> >>>>>>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>>>>>>>> or two PHYs being placed next to each other. Could you please start
> >>>>>>>>>> your commit message by explaining it? Or even better, make that a part
> >>>>>>>>>> of the cover letter for a new series touching just the USBC PHY
> >>>>>>>>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>>>>>>>> so you can split the series into two.
> >>>>>>>>>>
> >>>>>>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>>>>>>>
> >>>>>>>> What is "DP extension"?
> >>>>>>>>
> >>>>>> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>>>>>>>
> >>>>>>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>>>>>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>>>>>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>>>>>>>> It would be more efficient for a single driver to manage these controls. 
> >>>>>>>>
> >>>>>>>> The question is about the hardware, not about the driver.
> >>>>>>>>
> >>>>>>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>>>>>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>>>>>>>> we still decided to base it on the USBC extension.
> >>>>>>>>
> >>>>>>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >>>>>>>> thought that usbc-or-dp platforms support that, but they don't
> >>>>>>>> support DP+USB pin configuration. Note, the question is broader than
> >>>>>>>> just QCS615, it covers the PHY type itself.
> >>>>>>>>
> >>>>>>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >>>>>>>> set the register from OS or are we supposed to read it and thus detemine
> >>>>>>>> the PHY mode?
> >>>>>>>
> >>>>>>> Any updates on these two topics?
> >>>>>>>
> >>>>>> Still confirming detail info with HW & design team.
> >>>>>> I’ll update the information that has been confirmed so far.
> >>>>>> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> >>>>>> TCSR phy mode is read/write reg and we can read for determine phy mode.
> >>>>>
> >>>>> Ok, thanks for the explanation. From my point of view:
> >>>>>
> >>>>> - Implement the DP PHY to be a part of the same driver. Each device
> >>>>>   supported by the usbc driver should get both PHYs.
> >>>>>
> >>>>> - Make sure not to break the ABI: #phy-cells = <0> should still work and
> >>>>>   return USB PHY, keeping backwards compatibility. Newer devices or
> >>>>>   upgraded DT for old devices should return USB PHY for <... 0> and DP
> >>>>>   PHY for <... 1>.
> >>>>>
> >>>> Yes, currently we have implemented like your description,
> >>>> Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.
> >>>
> >>> Please note the backwards compatibility clause.
> >>>
> >> For the USB node, we kept the same implementation as the original function interface, and the devicetree node definition also remains unchanged.
> >> In subsequent patches, I will follow Krzysztof’s suggestion to use a separate DT-binding to describe the DP PHY configuration, 
> >> without making changes to the USB devicetree and DT-binding implementation.
> >>>>> - I'm not shure how to handle the USB and DP coexistence, especially in
> >>>>>   your case of the USB-or-DP PHY.
> >>>>>
> >>>> For coexistence process:
> >>>>
> >>>> When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
> >>>> Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.
> >>>
> >>> Thanks!
> >>>
> >>>> Anyway, even though the original SoC design supports DP or USB over Type-C，
> >>>> but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
> >>>> DP port is mappped from usb pin to the video out sub-board.
> >>>> so we are unable to verify the switching case between DP and USB devices under USB-C.
> >>>
> >>> That's also fine. We will get to that point once MSM8998 / SDM660
> >>> get USB-C support (the only current blocker is the support for the
> >>> TYPEC block of the PMI8998).
> >>>
> >> I can't access MSM8998 / SDM660 documents now, but I have confirmed detail info about USB & DP phy design for sm6150.
> >>
> >> The 'usb-ssphy-qmp-usb3-or-dp PHY' on the current platform is essentially composed of three sub-PHYs, 
> >> which can even be considered as three separate PHYs: USB3 primary PHY, USB3 secondary PHY, and USB3 DP PHY.
> > 
> > I've looked at sm6150-usb.dtsi and now I'm completely puzzled by your
> > answer. The msm-4.14 kernel lists a single USB QMP PHY at 0x88e6000,
> > used for the primary USB3 host. It it defined as
> > qcom,usb-ssphy-qmp-usb3-or-dp. Secondary USB host is listed as USB 2.0
> > only. So what do you mean by the USB3 secondary PHY? Which PHY and which
> > pins are connected to your video-out board?
> > 
> Five PHYs are integrated into Talos SoC: two USB2 PHYs, two USB3 PHYs, and one DP PHY.
> PERIPH_SS_QUSB2PHY_PRIM_QUSB2PHY_PRIM_CM_QUSB2_LQ_1EX (0x088E2000)
> PERIPH_SS_QUSB2PHY_SEC_QUSB2PHY_SEC_CM_QUSB2_LQ_1EX (0x088E3000)
> PERIPH_SS_USB0_USB3PHY_USB0_USB3PHY_CM_USB3_SW (0x088E6000)
> PERIPH_SS_USB1_USB3PHY_USB1_USB3PHY_CM_USB3_SW (0x088E8000)
> PERIPH_SS_DP_PHY_DP_PHY_CM_DP_4LN_SW (0x088E9000)
> 
> The USB3 secondary PHY(0x088E8000) is the one mutually exclusive with the DP PHY, which controlled by the TCSR switch.
> USB3 secondary PHY is not configed in qcs615 dtsi.

Okay, thanks for the explanation. I'm still puzzled by msm-4.14 defining
primary USB3 PHY as 'qcom,usb-ssphy-qmp-usb3-or-dp', but it might be
some kind of a hack or just a difference between QCS615 and SM6150.

If QCS615 follows other platforms of the same generation, I'd assume
that the correct way to handle it would be:

- Keep the primary USB3 PHY as is (it needs to be reposted though, the
  driver part didn't make it in).

- Extend the qmp-usbc driver to support USB+DP 'exclusive combo' PHYs by
  registering two PHYs for a single device. Make sure to continue
  supporting #phy-cells = 0 and region size = 0x1000. Use definitions
  from include/dt-bindings/phy/phy-qcom-qmp.h .

- Make sure that the PHY driver doesn't allow both PHYs to be powered
  on. Add TCSR programming to the power_on / power_off callbacks,
  implementing the switch between DP and USB3.

At this point all PHYs in qmp-usbc can be switched to the new USB+DP
configuration, still providing backwards compatibility with the existing
board DTs.

> In Ride, DP PHY, DP lane 0~3 and DP aux pins are connected to video-out board.
> >>
> >> On the QCS615, the USB primary PHY is currently used to handle USB 3.0 communication for the previously mentioned four USB Type-A ports, 
> >> while the USB3 secondary PHY and USB3 DP PHY are used for the output of the Type-C port,
> >> but since the Type-C port is forcibly pin-to-pin configured to the video out board, the Type-C port will always configure as DP PHY.
> >>
> >> The internal registers of these three PHYs are independent of each other, Neither their respective SWPWR_DN nor SWRST will affect the other two PHYs.
> >> Additionally, there was a misunderstanding about the orientation previously.
> >> The USB orientation setting only affects the current PHY and does not impact the DP PHY. The DP PHY is configured in the DP_PHY_CFG_1.
> >>
> >> TSCR_PHY_MODE can specify which PHY outputs to the Type-C port, and the global reset will simultaneously reset the two associated PHYs. 
> >> Therefore, the correct switching process is as follows.
> >> When switching the inserted device:
> >> 	1.Identify the PHY type.
> >> 	2.Enable the regulator.
> >> 	3.Trigger a reset.
> >> 	4.Enable the clock.
> >> 	5.Configure PHY type related orientation
> >> 	6.switch the TCSR PHY mode.
> >> 	7.Configure the registers of PHY.
> >> During release:
> >> 	1.Reset.
> >> 	2.Disable the clock.
> >> 	3.Disable the regulator.
> >>
> >> Our current design overall complies with this process, but it lacks the configuration for DP_PHY_CFG_1.
> >>
> >> Shall we continue the discussion to clarify remain comments of the USBC driver?
> >>
> >>>> However, I'm also confirming whether anything other will affect USB and DP each other.
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry

