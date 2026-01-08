Return-Path: <linux-gpio+bounces-30264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1925D02661
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 12:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10AC9322DE80
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 11:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748D747DFA0;
	Thu,  8 Jan 2026 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN5W2z+M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF53148C2
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869549; cv=none; b=WfXDJGlwRWW6OTWlpIQ5skN84I4ljrPxhNoa4ODxWJmvxp0tVJTGZnVWUNEguIN+1js6JKxqfw/c1EeHquwbB+n0mx7O521HHhBkz/vOQAr4O7yQtpf9BMdnFKvJlC3jrx+0OigxbSqyCEGVWGFyy45wvTbiBurRAX22yBsmvRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869549; c=relaxed/simple;
	bh=l/gMBZqB4Wf2fZYV6YRO2Fn/DBbs1dic3QvJlRj3BYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvVwWRvNYaPGkKR/9xDiTROmPhlMQTPwf0PahmFzhfqm4jWLOKoe3Lat6lMkanAGjSxvfUSyc/ZEkd7kyZCGzllZIo5Ic/DChH4nTU3kbwXsimEkcf16uSagZ1j7RxAnPtRdArJPC70ptXe+4JAdRN8/93Yo6zWT16yQxxqYylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fN5W2z+M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB601C2BCB0
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767869548;
	bh=l/gMBZqB4Wf2fZYV6YRO2Fn/DBbs1dic3QvJlRj3BYA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fN5W2z+ML1YP6mjzwzF6K+ufyHEDs6G4tewgi9/uiDZY4cmoYY8cN2XFJJWr4dyIk
	 /2JfSKzvAn11DTUOoZEmfVcMIpC3gkWuhgzMULieirvqOPpZ96p5RJj4Mlfz5hfmoY
	 lnOJJQxylxr4pGu+83el+SbuHXgZI6U2iAqtNbO7h+x7JGw7iSEJrJW6t/ZhKqZEfw
	 fJlPYojRiBnMZQ7m6aSGJvYasPT7Hx2VieYlv1x7ozQ9CvM/FFTFqTB/vIEkiPAkbl
	 JnHKmUyqav8UnkVngHFIZZo332tW05+1CGGI2ug+KLcrPzNucXwoXU/i4TninE1Z9q
	 cy+BUAeLYJAIQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b78886454so567467e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 02:52:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/bA+njJuTBPosDGmoxCocuCRGn1LwyYk+GFtkW7bu/JtRTwvenJ1hKhBzHxsBRidy2Y/QNoeQ/zXb@vger.kernel.org
X-Gm-Message-State: AOJu0YxrOdahBJzGN2aT/1wBKmCi0HpfGytP2BZXy7MA6k6gGmGImSsz
	jsh47ehWfGGlalxYT+tULlL9vK9Ywv2t+jm+CpvJQnZHJJeblMKbz45gjYhbtZak+MkTRfUvA1C
	mNpFW6iAoN8dv5aWQTP/eEbPgHdyiAhYAmcP94oJWnA==
X-Google-Smtp-Source: AGHT+IGjqdyuY3KRfM+LiSJS8ufKP/VvtPs728gsfeqE9U3Gtw7g5zOA8ofNsJSkehAL894rZs5Rech9o1zwYYHpJvc=
X-Received: by 2002:ac2:47f2:0:b0:59b:715b:4fd8 with SMTP id
 2adb3069b0e04-59b715b529amr1216531e87.13.1767869547364; Thu, 08 Jan 2026
 02:52:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
 <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com> <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
 <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
In-Reply-To: <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 11:52:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=McNH5+hk+9h1eseUTqm_J2CZLviJ8oC_i_8mXm5nMo6_Q@mail.gmail.com>
X-Gm-Features: AQt7F2rCIGfQHNZuZZNdIyWGD51XMxF3XQisHmrfPog50rXiS2PIMdJwP8hGXEc
Message-ID: <CAMRc=McNH5+hk+9h1eseUTqm_J2CZLviJ8oC_i_8mXm5nMo6_Q@mail.gmail.com>
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

On Thu, Jan 8, 2026 at 10:44=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 1/8/2026 2:15 PM, Bartosz Golaszewski wrote:
> > On Thu, Jan 8, 2026 at 7:49=E2=80=AFAM Pankaj Patil
> > <pankaj.patil@oss.qualcomm.com> wrote:
> >>
> >> On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
> >>> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
> >>> <pankaj.patil@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> >>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>
> >>>>> Some qualcomm platforms use shared GPIOs. Enable support for them b=
y
> >>>>> selecting the Kconfig switch provided by GPIOLIB.
> >>>>>
> >>>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>> ---
> >>>>>  arch/arm64/Kconfig.platforms | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.plat=
forms
> >>>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d=
8cb3fd0f29e277af94f20 100644
> >>>>> --- a/arch/arm64/Kconfig.platforms
> >>>>> +++ b/arch/arm64/Kconfig.platforms
> >>>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
> >>>>>       select GPIOLIB
> >>>>>       select PINCTRL
> >>>>>       select HAVE_PWRCTRL if PCI
> >>>>> +     select HAVE_SHARED_GPIOS
> >>>>>       help
> >>>>>         This enables support for the ARMv8 based Qualcomm chipsets.
> >>>>>
> >>>>>
> >>>> Enabling shared gpios is breaking hamoa and glymur boot on next-2026=
0106
> >>>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
> >>>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/j=
ob/24722#L3514
> >>>>
> >>>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.9109=
82] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_loo=
kup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <4>=
[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.9110=
30]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnode_gpio=
d_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70/0x150 <=
4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  platform_p=
robe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.spmi:pmic@9:ph=
y@fd00: supply vdd18 not found, using dummy regulator <4>[    2.911043]  re=
ally_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_device+0x78/0x12c <=
4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[    2.911049]  __devic=
e_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_each_drv+0x84/0xe0 <4=
>[    2.911052]  __device_attach_async_helper+0xac/0xd0 <4>[    2.911053]  =
async_run_entry_fn+0x34/0xe0
> >>>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  w=
orker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.9=
11060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not fo=
und, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <4>[ =
   2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] qcom-pc=
ie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[    2.9110=
69] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
> >>>> Reverting this commit fixes the boot on both platforms
> >>>>
> >>>
> >>> Hi!
> >>>
> >>> This is not really the offending commit, it's a recent one in the
> >>> implementation. The issue should be fixed by the following series[1]
> >>> that will be in the next next tag. Can you give it a try?
> >>>
> >>> Bart
> >>>
> >>> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091=
d2f7581@oss.qualcomm.com/
> >>
> >> With the linked patchset applied I still see the same issue
> >>
> >> Pankaj
> >>
> >
> > Is the gpio-shared-proxy module available? If not, can you change the
> > config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?
> >
> > Bartosz
>
> With CONFIG_GPIO_SHARED_PROXY=3Dy the issue remains the same

Ok, I believe there must be an issue with environment differences
because I'm not seeing this.

Can you enable CONFIG_DEBUG_GPIO in config and post the entire kernel
log to some pastebin? Can you also post the output of gpiodetect and
gpioinfo?

Thanks
Bartosz

