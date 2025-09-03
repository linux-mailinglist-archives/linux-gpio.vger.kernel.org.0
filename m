Return-Path: <linux-gpio+bounces-25487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B17B41CA2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E4B31BA6537
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3F92F4A04;
	Wed,  3 Sep 2025 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uxtdTPXC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947652F4A0A
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897542; cv=none; b=Zkn2FB2mYl87c9tl1+MyOayIRyix23h9IosqiIGVNqVggfqi2Abxm5PVQoqwR/fsfJ2EAeYdzv6wp3V/DlXLqZ+IQYtunP+68uyGhkXjcghgQYy1Y+S3O1aOTaj35WNe36y8yVrbO2QHipN4xvfqN6tUrvHDK0iF8y9yUm//FFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897542; c=relaxed/simple;
	bh=Hz4Ww0n5ndOPZ5lTF42At7O5rnM+5Mbm8JKoATPAMNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPgEefAZCGeAVLTX4fqSCVCg8KT6sR5f7bjWEiOxUWhsbq+dNJobDjIBBYjgz1y9kKz+bJm7NnvYu+5wVBeh1Ay/C4Cnok4vApBtWnumHDT+5wcrQl4nhVs65pq4TQnYkssVTws/XkmRgII3U+R+6vn5amZ4cWYpUBaAZEo+xJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uxtdTPXC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5607a240c75so3119534e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756897539; x=1757502339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=;
        b=uxtdTPXCeVHlw4sN35+9NbLtRyf6LzijynUIVC9RLmHMva6hJ3Ov/cM/iPM1oaZauC
         pbTliyruv/w+0QuGJHPtYr9cRyZvE/M6C8lOxnTYF2gxQcEunKpoGx18pq6vKJA8BuMV
         8xWjcgkqV2CkahyNRWXVuyFO/KmIhr6yzRqZ+8UV38LWUnLbPUdHB+rf4PUS9PyO2jlO
         Zv4Ct7/LhL/QFZm5z3qbk65iwSqxBO6yvcYHLjhRIj+5DxWQq6EnOI3bPO6YSqFVzIRi
         hZrjrCaFGrQO4RKLZ2QP3jwmqiT9BzoR2MleNvkUCA7OlmmvePPdz65p25d9PO7AiaxH
         1tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756897539; x=1757502339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=;
        b=YZqeKV+6X3+XdYHDCa1hiqfyk+gqmAryq/vncgW+liasgia55LgE3yVzIxbo+OTCZj
         K4YwtBBnl1FKTKfpp0ta959kuhJLiRm+xb8l5tlXpteufoKy75n8PnM+218/IiJ74UjO
         CEEJh4Gd1owR/4aPAvAsWUPbbZnjmZhd9lCPei4N8jEIBQ7RvSAAG1pAX4s2utHVaWz4
         escxIEAA8RTCwjeNhU7zneKupbdwZCkmgCRS/X7WYU6QlJNZpb5Wsa9vbmDm64+1DJo+
         OJOieGFSKBzZoQuC7wWCO2CubIN/pwfFuDOdJ7TKlcR5vfEblE+JcdynuPqs6NkLRypU
         3D5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUPldY3i1/K58tklxnZY3xYDhS2k2Hf1TTIOemtFMPVskrXWckngSbJHLJIwdkc/KeoQ0PSgZIs+5x@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTM/bztPkDsbI5BzFdE/KakFIQQiQKanXDPyvvZXaNm9kALJM
	1fkbUy8q2Y0Y9dKRROcFWmb76+PzrexENPXM4VIRefxSWdt2wa+DT+HpRK+LPnBHms+5lg14Oi2
	EJ+jTZxRTf3ffYqX1Z5zqUOhOLANca33sDsDZvbaYqw==
X-Gm-Gg: ASbGncu1fvoFB4ikzbc2ttqz28Xr0Smmvn587f1vJNCKh2ESgXmN3HOPMXEs6MzDWv5
	KpBhLBxiFoxNdrXCU1n1SBGmOKjv23ebI7bNu0BtZN1TjbnOMFUF8Y/RrRlr8U5gNAMn385CDRN
	0w5jhczubewt+hDgHYGf94JSJOtfMNLCUc4UgvOLA1+sUpfQWNeKhvfkt0PvyIHTf5XPd0IB/nK
	ACv9l3bW4Z83gIv6bTr+gd9sbKB/nkMdA8SXnexuovYAMkluA==
X-Google-Smtp-Source: AGHT+IGaO6jKgae4Bb0nnUY/KIMNPM9fcQrt4rcPCJpxbytVdpNy16Q2X9IuotKVynxw9JndtWotWpVme+DKGbgxexI=
X-Received: by 2002:a05:6512:b8a:b0:55f:62f9:cad2 with SMTP id
 2adb3069b0e04-55f7093e564mr3786208e87.26.1756897538646; Wed, 03 Sep 2025
 04:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com> <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com>
In-Reply-To: <aLgeDNLABpmkShIU@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 13:05:27 +0200
X-Gm-Features: Ac12FXyayAu5ynqkVYj2uRlegQC_XlF19483EKV3MWs-LYc9T7mcvfMXmn9zXkQ
Message-ID: <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 12:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:41:48PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 3, 2025 at 12:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > > > On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <b=
rgl@bgdev.pl> wrote:
> > > > > > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golasze=
wski wrote:
>
> ...
>
> > > > > > > > > > The strict flag in struct pinmux_ops disallows the usag=
e of the same pin
> > > > > > > > > > as a GPIO and for another function. Without it, a rouge=
 user-space
> > > > > > > > > > process with enough privileges (or even a buggy driver)=
 can request a
> > > > > > > > > > used pin as GPIO and drive it, potentially confusing de=
vices or even
> > > > > > > > > > crashing the system. Set it globally for all pinctrl-ms=
m users.
> > > > > > > > >
> > > > > > > > > How does this keep (or allow) I=C2=B2C generic recovery m=
echanism to work?
> > > > > >
> > > > > > Anyway, what is your point? I don't think it has any impact on =
this.
> > > > >
> > > > > If we have a group of pins that are marked as I=C2=B2C, and we wa=
nt to use recovery
> > > > > via GPIOs, would it be still possible to request as GPIO when con=
troller driver
> > > > > is in the strict mode?
> > > >
> > > > Yes, if you mark that function as a "GPIO" function in the pin
> > > > controller driver.
> > >
> > > How would it prevent from requesting from user space?
> >
> > It wouldn't, we don't discriminate between user-space and in-kernel
> > GPIO users. A function either is a GPIO or isn't. Can you point me to
> > the driver you're thinking about or is this a purely speculative
> > question?
>
> The recovery mechanism is in I=C2=B2C core and many drivers use that.
> I'm not aware of Qualcomm drivers in particular. But mechanism is
> in use in I=C2=B2C DesignWare which is distributed a lot among platforms,
> so using word 'purely' is incorrect, and word 'speculative' is a bit
> strong, but you can think of the issue coming later on when somebody
> does something like this.
>
> The same applies to the in-band wakeup UART mechanism.
>
> Which means that with this series we will relax it back anyway for
> the above mentioned cases.
>
> (Not sure, but SPI DesignWare requires programming SPI native chip select=
s even
>  if the GPIO is used for that, this might have also some implications, bu=
t here
>  it's for real 'purely speculative'.)
>

The high-level answer is: yes, a pin that will be used by GPIOLIB
needs the function it's muxed to, to be marked as "GPIOable" in its
parent pin controller if it's strict. That's still better than the
current situation.

I can imagine we could differentiate between in-kernel and user-space
users of GPIOs and then make it impossible for the latter to request
certain pins while they could still be requested in the kernel but
that's outside of the scope of this series.

I don't see why this would stop these patches though, as they don't
break anything unless you decide to make your pin controller strict in
which situation you'd need to verify which functions can GPIOs anyway.

Bartosz

