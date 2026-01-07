Return-Path: <linux-gpio+bounces-30221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B184CFDB3C
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 13:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BD183007DAE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 12:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A7432BF26;
	Wed,  7 Jan 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAiCiKsF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7A32B996
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767789494; cv=none; b=Pp6ew3iZ8Vf8+9naV7z34kh0UR1b+G1qxMAfI/YvHO8UMASc3fnVs8c29PsFQ+c8nZ1fgOKXU1vP1yTq3nZ93qRpqugFPZ5g4KFTJqCEsSaCXRSxEj19aMdq36aRpQZ7gR0t+V61uz+D1m+QgMbGYug1SQrPeEObTUbptrjcMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767789494; c=relaxed/simple;
	bh=D+1XJlIo28pgV7tUDNN+Sp6W6XAtXQ+CPXiMEXuiDyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djiTgREJJQK51n5kT9R+RWuW5+t1y4aVdsRcjWGklxqcEs3NA6exdBDpIT4F+RZQ2v0J1rnCiWy4T0YJpOm8DQooWARN4lu2LtH/4yFxIE7xi2WyCgw4tWFxm3c/7QuPP+MITpIelwyTqDrCETN4mH5Tq1lv3EO4Zu3TV/EelXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAiCiKsF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28014C4AF0B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767789494;
	bh=D+1XJlIo28pgV7tUDNN+Sp6W6XAtXQ+CPXiMEXuiDyo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UAiCiKsFkBxMj2IWBaju2RfeNJ3Iln6raBs3VgjSDcFYKxmAmOLoBPHDf1WBRAlIb
	 araoruXGhZTu/JgSvZz+qGO3tzI/6UPYLrhYmGGYM8JPJKNCx+oYNchonPiTXLOiYR
	 TY2Sb+ss4eKAOsd3NKc5wzimGKbco86SdFnz268dLB1E1rsbzxbCIZZt0rUjdeA7ba
	 Ci2Xf28EyJsrPb36GBqMJKd2zRKOJV5PEmp0pYDzWZELK7rm1OfBrgGDkHakqf/Ljx
	 siIfc6qFnQs0BD3PXDxGagu7y/ghqR0a0SElabcOMjyNUS2t7Po/Q8Yxh3prDzrBMg
	 C8/UgnwLpqlnw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-595819064cdso1322405e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 04:38:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1L1fvd3RoWHdg4I52tO6gfQW9jy0z4Sa40EBQisLsu/Sk85g4oNdve7NTXe8qc3nCcdFM4hqOmmIk@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGdoyc9KqxmUPNmCDK8snf6TPAcUT6d+6wIoDpBaW7pdpV7VB
	U9hdkZPxFBPc/2IOFnO2nesDzinqrsQXCfkX6d1Lo4gAK+G9jU5VuyxY881fM9mu+7MMU8UYihH
	EJb83KK7fKReusOQXmpHGRYmlpcKGljR+UZtfZ3yfag==
X-Google-Smtp-Source: AGHT+IET6YL/yQOWgZ/jye+5vJjHHBR0gOi/Agd3F1unhd20b9UQ7kE+T30lA0u/sDbLZsVeNsqtQhHT5hR9EPogOYs=
X-Received: by 2002:a05:6512:33cb:b0:59b:73b9:1f49 with SMTP id
 2adb3069b0e04-59b73b921e7mr211266e87.26.1767789492688; Wed, 07 Jan 2026
 04:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
In-Reply-To: <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 7 Jan 2026 13:38:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
X-Gm-Features: AQt7F2pA13_wtRLLQWUOTtMFhQv1HJ_sZB68tT-M4ZgHKbE3BedmspQkreV0U28
Message-ID: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
> >
> Enabling shared gpios is breaking hamoa and glymur boot on next-20260106
> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
> Please find the log here - https://lava-oss.qualcomm.com/scheduler/job/24=
722#L3514
>
> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.910982] W=
ARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_lookup+0=
x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <4>[    =
2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.911030]  =
gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnode_gpiod_get=
_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70/0x150 <4>[  =
  2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  platform_probe+=
0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd0=
0: supply vdd18 not found, using dummy regulator <4>[    2.911043]  really_=
probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_device+0x78/0x12c <4>[  =
  2.911047]  driver_probe_device+0x3c/0x15c <4>[    2.911049]  __device_att=
ach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_each_drv+0x84/0xe0 <4>[   =
 2.911052]  __device_attach_async_helper+0xac/0xd0 <4>[    2.911053]  async=
_run_entry_fn+0x34/0xe0
> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  worker=
_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.911060=
] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not found, =
using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <4>[    2.=
911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] qcom-pcie 1b=
40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[    2.911069] q=
com-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
> Reverting this commit fixes the boot on both platforms
>

Hi!

This is not really the offending commit, it's a recent one in the
implementation. The issue should be fixed by the following series[1]
that will be in the next next tag. Can you give it a try?

Bart

[1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2f758=
1@oss.qualcomm.com/

