Return-Path: <linux-gpio+bounces-14048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5449F88C9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 01:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE54188CDD4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 00:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072C34C97;
	Fri, 20 Dec 2024 00:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0sln8wE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E742F41
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734652873; cv=none; b=qKUUafVMiJfE95XrWuKl7PYh2jDoRTlUWx323u0AruIbjgj8fO4/RndR8WBVm2M1pIycHrPXZoLcJ/8WkIx3rS2A7Ss5xRC8YN1b+VFiBc2rmlrpA2hnd0qH/E5imjyUf75UOaka6C3ROW6eK5SFKbQK4CRceE2D4RRzIx8uf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734652873; c=relaxed/simple;
	bh=QvSPUHtrcUEPxAoOWaSdZ6uYV9l0BR6/yvae71Rabg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnEM+OAbJnyZwjB0rvylc7T5Zae7cs1xFwzMTF0xTIJevrAtqiD8KUB6nuyYfCC5Zp9li/5f64TC3W9U/65tjwwpwiCkc6FHt4j26Njx3CUYIM6Zm/PhLRKB9CB78aOA5p8kV1/knVJ3EDhsl4LJxWQgoyAOU5iXEuBYg+lfb0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0sln8wE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so1311461e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 16:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734652870; x=1735257670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ppd25HBqmFfv+IJcOohEbU7bcq5SdHXRRHwWFqlHX4=;
        b=c0sln8wExxTdBchzrC5bdWHbJcXIUkIlgw2b2C8tn09zfwZcniT/PX9XCs5nYOuW9B
         YU91qhE0Evf4WmM/2sjQAT1S1PstHeWe6obB+1wQ/XGHOceJIHYuWnmce+2F+3azS4hL
         HBl7L54XsiaGCtsAIUgjKiiwRN2xm73Gt/abG7HujniNxSjIA34eDcP+uIbvOjLZYF2G
         zTYB84FvZuxIwzPtQrqrG1s/CyVj4ZSeRvq2+BWKXnFypxpodr3C3JmIfgWo7qflbh7b
         YOX8fgWLJw2miDuF7NhG7bG+5WshH3FHjNZr5YHtL+HTJzepwnd1RbyA2hHHc9amu3WC
         20mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734652870; x=1735257670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ppd25HBqmFfv+IJcOohEbU7bcq5SdHXRRHwWFqlHX4=;
        b=HJsi93Clu7Ab3bbA+exmzGKV8FsHe+6GBdsX5vgPoRp/9QpkaEmZVLZ7gFN4yDH+hS
         Pz3X2yUOYTO4BUjH1LAxw+TkvU7enoZOEbr7RmhQ4S7l3NtLatZHU+bxqlBciAd/xBUi
         zNcTfcHKaa1DBgLsWRP9F88ksgQPsdPeXM1s/BwDQYevKiAJY/mbiWCj/qqYB1ZM9PM6
         33syPZ+2I7EEwy3ggBK8zn0s8+fvBYPTwNgNIyuL0Xja83nSxQuKF6LDATIGijGv5Hbh
         UxKzrIAo6eHm3yO7YJe+OFDfHHEDYGpQXDhWLNGprrUURaheugGdL7HZWnxiDLAHi7Gu
         DIcA==
X-Forwarded-Encrypted: i=1; AJvYcCWpKgQgXjVDr3VudV7pzvu0PtIUN4jg4k1a9pGP2qOXpmrv5kKTJiFhxgmmrZ3XY7I99EPGfOg3mg00@vger.kernel.org
X-Gm-Message-State: AOJu0YzUK6yQugO0M3p38c/tbwE/YlDYiUGu9OnfC/i26TkOrOjo7Hzg
	xY4d/+gFCfMvFINyMUYG2oJzb05FWBCmt7iYBIMNwMNWGkwP6Ik9xDzrEg2c0qo=
X-Gm-Gg: ASbGncveTyLZM91Dk3EifoxKOalwYGqejcAIyl76ZVQDQaTy2JK+nC8in68ejmXU5m6
	23WzIw5/k/rVtUAQs5BA71zIdhtW5DzN0FGHxKhpyUTtUKCD/BEyHx1+z3QHL9UT9R88kA6EOMQ
	it4PZL+E30MMT0HcOyOmxY8C4EdDx8UX1Gbl752HejijkHepMP2JMARCOvXx7Gdh7GZQwVSszqk
	lY+CxejTwOI9lidjN387s8aey1HoqXa3Xhf/Ead5dPhOLJd56MH5VGslZwmsgSaXhPirR2u9pfT
	hR0ocNtQUFFtmn771n1nRUqCKznDUj1VnX7L
X-Google-Smtp-Source: AGHT+IFJZHpp+D2sUVziZMo4UnuT3wO/G1Gyc0+v1xRTJrpIryyxy3e70N2DN7WfTVrywrSUzo0eOg==
X-Received: by 2002:a05:6512:2356:b0:53e:df2b:df25 with SMTP id 2adb3069b0e04-542295300c0mr141127e87.16.1734652869635;
        Thu, 19 Dec 2024 16:01:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238138fbsm306948e87.159.2024.12.19.16.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 16:01:08 -0800 (PST)
Date: Fri, 20 Dec 2024 02:01:06 +0200
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
Message-ID: <jdw3xuknq2atcowl5xboimp3fol56t5nilefrxzpbdpwdoo5oc@pggif3lysjhh>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
 <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
 <d5151b82-5f05-4826-99b4-e925c20550b4@quicinc.com>
 <7vdaasc3flhpabnorjty5qjorlbp22honuscgpbteakgagg2tq@frqa6flk2mmv>
 <df1a4457-129e-452c-8089-ee1e6f9a3e12@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df1a4457-129e-452c-8089-ee1e6f9a3e12@quicinc.com>

On Wed, Dec 18, 2024 at 08:55:54PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/12/2024 3:15 AM, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 08:50:02PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/11/2024 5:46 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>>>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>>>>>> different types of cfg and layout attributes during initialization based
> >>>>>>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>>>>>> are organized into the layout structure.
> >>>>>>>>
> >>>>>>>> We didn't have an understanding / conclusion whether
> >>>>>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>>>>>> or two PHYs being placed next to each other. Could you please start
> >>>>>>>> your commit message by explaining it? Or even better, make that a part
> >>>>>>>> of the cover letter for a new series touching just the USBC PHY
> >>>>>>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>>>>>> so you can split the series into two.
> >>>>>>>>
> >>>>>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>>>>>
> >>>>>> What is "DP extension"?
> >>>>>>
> >>>> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>>>>>
> >>>>>>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>>>>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>>>>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>>>>>> It would be more efficient for a single driver to manage these controls. 
> >>>>>>
> >>>>>> The question is about the hardware, not about the driver.
> >>>>>>
> >>>>>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>>>>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>>>>>> we still decided to base it on the USBC extension.
> >>>>>>
> >>>>>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >>>>>> thought that usbc-or-dp platforms support that, but they don't
> >>>>>> support DP+USB pin configuration. Note, the question is broader than
> >>>>>> just QCS615, it covers the PHY type itself.
> >>>>>>
> >>>>>> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >>>>>> set the register from OS or are we supposed to read it and thus detemine
> >>>>>> the PHY mode?
> >>>>>
> >>>>> Any updates on these two topics?
> >>>>>
> >>>> Still confirming detail info with HW & design team.
> >>>> I’ll update the information that has been confirmed so far.
> >>>> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> >>>> TCSR phy mode is read/write reg and we can read for determine phy mode.
> >>>
> >>> Ok, thanks for the explanation. From my point of view:
> >>>
> >>> - Implement the DP PHY to be a part of the same driver. Each device
> >>>   supported by the usbc driver should get both PHYs.
> >>>
> >>> - Make sure not to break the ABI: #phy-cells = <0> should still work and
> >>>   return USB PHY, keeping backwards compatibility. Newer devices or
> >>>   upgraded DT for old devices should return USB PHY for <... 0> and DP
> >>>   PHY for <... 1>.
> >>>
> >> Yes, currently we have implemented like your description,
> >> Each deivce shoud get both PHYs, DP PHY for <... 1> and USB PHY for <... 0>.
> > 
> > Please note the backwards compatibility clause.
> > 
> For the USB node, we kept the same implementation as the original function interface, and the devicetree node definition also remains unchanged.
> In subsequent patches, I will follow Krzysztof’s suggestion to use a separate DT-binding to describe the DP PHY configuration, 
> without making changes to the USB devicetree and DT-binding implementation.
> >>> - I'm not shure how to handle the USB and DP coexistence, especially in
> >>>   your case of the USB-or-DP PHY.
> >>>
> >> For coexistence process:
> >>
> >> When we start implement DP part, usb driver team said only need config TCSR phy mode and orientation during switch in USB-C port.
> >> Based on your previous comments avout SW_PWRDN, I'm confirming with the USB team whether SW_REST/SWPWRDN/START_CTRL registers might affect DP.
> > 
> > Thanks!
> > 
> >> Anyway, even though the original SoC design supports DP or USB over Type-C，
> >> but on QCS615 ADP AIR platform, there are only four USB-A port which works with 'qcs615-qmp-usb3-phy' driver, and no USB-C port.
> >> DP port is mappped from usb pin to the video out sub-board.
> >> so we are unable to verify the switching case between DP and USB devices under USB-C.
> > 
> > That's also fine. We will get to that point once MSM8998 / SDM660
> > get USB-C support (the only current blocker is the support for the
> > TYPEC block of the PMI8998).
> > 
> I can't access MSM8998 / SDM660 documents now, but I have confirmed detail info about USB & DP phy design for sm6150.
> 
> The 'usb-ssphy-qmp-usb3-or-dp PHY' on the current platform is essentially composed of three sub-PHYs, 
> which can even be considered as three separate PHYs: USB3 primary PHY, USB3 secondary PHY, and USB3 DP PHY.

I've looked at sm6150-usb.dtsi and now I'm completely puzzled by your
answer. The msm-4.14 kernel lists a single USB QMP PHY at 0x88e6000,
used for the primary USB3 host. It it defined as
qcom,usb-ssphy-qmp-usb3-or-dp. Secondary USB host is listed as USB 2.0
only. So what do you mean by the USB3 secondary PHY? Which PHY and which
pins are connected to your video-out board?

> 
> On the QCS615, the USB primary PHY is currently used to handle USB 3.0 communication for the previously mentioned four USB Type-A ports, 
> while the USB3 secondary PHY and USB3 DP PHY are used for the output of the Type-C port,
> but since the Type-C port is forcibly pin-to-pin configured to the video out board, the Type-C port will always configure as DP PHY.
> 
> The internal registers of these three PHYs are independent of each other, Neither their respective SWPWR_DN nor SWRST will affect the other two PHYs.
> Additionally, there was a misunderstanding about the orientation previously.
> The USB orientation setting only affects the current PHY and does not impact the DP PHY. The DP PHY is configured in the DP_PHY_CFG_1.
> 
> TSCR_PHY_MODE can specify which PHY outputs to the Type-C port, and the global reset will simultaneously reset the two associated PHYs. 
> Therefore, the correct switching process is as follows.
> When switching the inserted device:
> 	1.Identify the PHY type.
> 	2.Enable the regulator.
> 	3.Trigger a reset.
> 	4.Enable the clock.
> 	5.Configure PHY type related orientation
> 	6.switch the TCSR PHY mode.
> 	7.Configure the registers of PHY.
> During release:
> 	1.Reset.
> 	2.Disable the clock.
> 	3.Disable the regulator.
> 
> Our current design overall complies with this process, but it lacks the configuration for DP_PHY_CFG_1.
> 
> Shall we continue the discussion to clarify remain comments of the USBC driver?
> 
> >> However, I'm also confirming whether anything other will affect USB and DP each other.
> > 
> 

-- 
With best wishes
Dmitry

