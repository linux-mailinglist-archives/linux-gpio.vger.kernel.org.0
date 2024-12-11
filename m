Return-Path: <linux-gpio+bounces-13748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5659EC99B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 10:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D88188CB48
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D8E1C5F2E;
	Wed, 11 Dec 2024 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXK98O+b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64497236FA9
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910371; cv=none; b=FMJCFuwPv+5gImJmFqAO9USYFsIRj5ufpZckmhSDh22E3uiZd4jT4LDrHWNi+Ha05Di63UxdUSBJ04+fxo53FgjyJngE9c3/Lmnb+s8FfWh1YzLbIiCEjhzZ5TqpcztNrHlqeV+Xj9Dq+O20/ttjCYliiSKhxpabtxp/MOPwQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910371; c=relaxed/simple;
	bh=96xDb2QJ+Z2BJIZEG1wSU9Udptki77JpU9Ok634UV5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/ZMR8ZDO3LclUmvzar7YSvOAcuBSS4nEwgPnIP6PWYUfunkNgbfHxzwX92JQisRbOP6SQl53LMzApj8s+zpTwzY7qiZBNwLo1r3th+XzpIO3SJJ1eX/N2DThcAt1yr1FEG5g5wqqveQmKVSII+J1GbtdQAZFrRI7FmiF+vCX6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXK98O+b; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7545413e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 01:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733910367; x=1734515167; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tea4vIJiGPJWHixoiDd5FPFnMHQTgOFRwTGQIe3zrGg=;
        b=CXK98O+btl5yN/TDhGPuzbijVErfJ1QGdUjBjCIuZGWc0IKJ0cCcx1Atacq+kILEaU
         6++iZS43VIOC2Nj3u1CGJn6YaKjvwuXyWhmXCDhDnk+vM06fuApm6WqYzJQgcYOCv/AT
         6+h32G/E64BXt7LQxUs5eV7ijckBnFAetUk8LYORYHiZSuoBoYpp65JozAu0Li+NCqQs
         gUFqMdkXSD7Cesv1J2hJCDxFcW+SEKQnPyhZijKLpO3PBcwezcqVZg7I+t0FjUHUc2ol
         F8K6XTtumtFkrgLXPBy+R48l/4+cS/gwDAzHkxxCCmk+B7R1pNw7bjgz43e4Iyae42Jm
         i9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910367; x=1734515167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tea4vIJiGPJWHixoiDd5FPFnMHQTgOFRwTGQIe3zrGg=;
        b=n+kN0wbSOst7fu86bpatY6ZNmWUXKfPlT00bUHmKw7QwMx/oqX4H+Al4H1VR3hrf0F
         XEL9OzBXdsru3nreWTUvZ4VRVBL/jz50qQS45B9nHQb3PgwmDmMlpDbcfhr7lVJzVlrD
         N60O3fsvunV3cyXSFnoKcO19QkDX19xSXFo6k6kHp05T/ozvyK5Bky2o31ogTN5aE/mW
         eOrmgdNhj7TYCJ89vAzzRnZBCnbhPjKs5D/AsAwDq6xsSUmGiBWOC3KsdeYZSt023nSb
         MFuCg6yPPG9gLKEjywQeH2WZtpTXcy4BkTF/vn8Zo/T4uqTupx+dpmMCwkKq4BjuhZre
         /kng==
X-Forwarded-Encrypted: i=1; AJvYcCV0K5xsqjxTa7SyjsUr0HCheuyA1ydQ3IT+AonTVZYrjKnXrL126LAr8HxOvAU9DIARwmsCTAfRtr47@vger.kernel.org
X-Gm-Message-State: AOJu0YzHfowLKflySZMycfs+0muMySRzCnx6WhBxGeBmJfh2YH7e9LxJ
	eB5rKBCTNZRak7s0UjPLqcarJZDiJi1M0szUtTjn82Un6SOoHbJfTyIex3COtp0=
X-Gm-Gg: ASbGncvf9ByvHfnKQB7GzX055m7pSowmCckZDuMhRBrL/TC4gkO1xlbTiPWYHXlxRBI
	oUDT035EW0YkCOXRvrRJMNvXBuokdWN+c1yr4XTOFPrHIg/8Be375A/WypQW/ZKCbe6mJQSD9CM
	rcTEmpsk7rSM95gR8D/UUVsJnj3bwtykf4KEGX/kL2Sz5kpO1hlUB1mbfezfYrTBZUSWQ8UbxYL
	uyfrE2sy368zw1CffOpkX6npQkGQ+t+BY9ZKAUMAUJmYTgKB4hUlM6kW3n8H9YDsBD5kmQeJuk0
	WlvJfyJJLYY2jJswLfAt9zZvw06t0rTbWw==
X-Google-Smtp-Source: AGHT+IEtlbI01qtT4hElvvQMyeb/TKdaC5qWfnqkdfHb5ztyN2VBFJ9f2yMWhkC3MvVYmq106RrFMw==
X-Received: by 2002:a05:6512:3c85:b0:53e:1c3e:34 with SMTP id 2adb3069b0e04-5402a6056a1mr671998e87.38.1733910367530;
        Wed, 11 Dec 2024 01:46:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974f2bsm1973804e87.99.2024.12.11.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:46:06 -0800 (PST)
Date: Wed, 11 Dec 2024 11:46:03 +0200
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
Message-ID: <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>

On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>
> >>>
> >>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>
> >>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>> different types of cfg and layout attributes during initialization based
> >>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>> are organized into the layout structure.
> >>>>
> >>>> We didn't have an understanding / conclusion whether
> >>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>> or two PHYs being placed next to each other. Could you please start
> >>>> your commit message by explaining it? Or even better, make that a part
> >>>> of the cover letter for a new series touching just the USBC PHY
> >>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>> so you can split the series into two.
> >>>>
> >>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>
> >> What is "DP extension"?
> >>
> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>
> >>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>> It would be more efficient for a single driver to manage these controls. 
> >>
> >> The question is about the hardware, not about the driver.
> >>
> >>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>> we still decided to base it on the USBC extension.
> >>
> >> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >> thought that usbc-or-dp platforms support that, but they don't
> >> support DP+USB pin configuration. Note, the question is broader than
> >> just QCS615, it covers the PHY type itself.
> >>
> >> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >> set the register from OS or are we supposed to read it and thus detemine
> >> the PHY mode?
> > 
> > Any updates on these two topics?
> > 
> Still confirming detail info with HW & design team.
> I’ll update the information that has been confirmed so far.
> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> TCSR phy mode is read/write reg and we can read for determine phy mode.

Ok, thanks for the explanation. From my point of view:

- Implement the DP PHY to be a part of the same driver. Each device
  supported by the usbc driver should get both PHYs.

- Make sure not to break the ABI: #phy-cells = <0> should still work and
  return USB PHY, keeping backwards compatibility. Newer devices or
  upgraded DT for old devices should return USB PHY for <... 0> and DP
  PHY for <... 1>.

- I'm not shure how to handle the USB and DP coexistence, especially in
  your case of the USB-or-DP PHY.

-- 
With best wishes
Dmitry

