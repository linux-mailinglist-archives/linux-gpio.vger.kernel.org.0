Return-Path: <linux-gpio+bounces-14324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2C9FD7BA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 22:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A273A26B9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 21:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EC0154C17;
	Fri, 27 Dec 2024 21:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bPaLYuEJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CF42A93;
	Fri, 27 Dec 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735333295; cv=none; b=cB6rYSJ9QpQdgFXS/hgD9DConAbfLfxG651wIXGKFarLEddG6IwEX4AvswyHOmpBtWmxdaa/r6kB4nfa5dX8rpKltoj+i4Mr9y5TUP/PC7Uu6bkp2hUtf/tVtrXXTFXjxMEGcrIYVG/WQOPAgld4u3PNvu0Qi1GhU0V48AJn4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735333295; c=relaxed/simple;
	bh=2cWqoENyR15yFF3xyjmn3XXrcNn1L8cpvnzNzGKC2eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvLnVwNqvIAmLwmKl9sd3pw8dOUbKj/W/CG+fRTcZ48Ogq4JASGf8mME3kS7EUSOJ9LL3MwhKVZAJ0uwfsEGSY4HYOfKLwJ7ttRYp7X4fLQNQhh6/bc9PFpYHowFrKyXwNfgjs7BiiaWmqiK5joKBT7YTPBHjkDWIBkGNH6cmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=bPaLYuEJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163dc5155fso91655965ad.0;
        Fri, 27 Dec 2024 13:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735333293; x=1735938093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccPDTR1kHMs0ixCcKLLJ1/w1S1Oal78+tTjwCwFAdq8=;
        b=bPaLYuEJx59J8SNiEPlS1pBK/+iznoek6PCePV/hNToF8oo2NRV3UgmsmFGEhRK2gR
         /rA4sTmejfxMWHzqc78YXfUZGghexJn3Quh/yTPWPPIv93ti33OoKBf//6cEJH80a9LW
         umSUC0w9FJLpLfRkRP3jTH0TVWRaOMoN/AD9TQ4GyfmtZzLloDL9+9jKGNsyIkFk+1OK
         yZ2zqWOYEbPgr2TFEY9jhsSDAKPE6JZQhSoYrFcTocyFmLMrLxZDDHqq8Ji8kwza2UHJ
         mMxxIaCOOtGxIhMNJc8aJWIBCoD0LHzjyjbS6/yy4zLuCvmpafQ9br2DR+pDJ9IYF3Oc
         D+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735333293; x=1735938093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccPDTR1kHMs0ixCcKLLJ1/w1S1Oal78+tTjwCwFAdq8=;
        b=SMOoQ0AqFCvgKF43k6TBkAPh9RiT4Jr/Sx4v9S0jq+zri0KFNwHyxs1cRJDaOXK6Ft
         6ZgjwbBlrJKoxnV47cqiZtA7GL8qjUZvGbzUe+A8xz9v+RenRtNaUecviG/fiodEEKWH
         mBRZqm7L6E27iHZ5C8LEQJ54tRjAdGHTTKL5oK1/IUnkuRls7Qitkqxtt5SOQLc5I2pV
         IpbLio7rLnGY62TGT2X5NQpxsJ4VKIxtG6LC8TCx80pdx6x5UkfMarycz7i9fOJD3Cfk
         icWFV1kbnyhh745QhaBPhf5VPPEhlExlnmf8KhuxkTdKSFeK1l/NmF1LYathZbGlSyHF
         XUvg==
X-Forwarded-Encrypted: i=1; AJvYcCWjiPMD+8vqmyTKnJGG6pVCovp/bK2q4cC3VMPDZek+FIyAAQC5I5wzhX2Dv/dOWzMuLAz+apB8dzC7LQ==@vger.kernel.org, AJvYcCXHXkLSJa9xCrQxEzzkmeQLV+oKzp77lWx6yyyEVe6E2UArPAoJRF9ouzLMP731BLqvBCl/c2AAR0/PdE19@vger.kernel.org, AJvYcCXaHNVPip22oRFYmJyNUKm0i0YuC3QfU8Pc4sGvg78s9Rrz9ROPzEKNrsNKQbdxUk1/xuxE6xC4jePm@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSe7iMkhz0U9gZmVdg52OawdiUS2CnBtpmymeQBOrMDSRFN3R
	LPTcTut2MwxNYZfhgjV/dpAUgHnchU4GG5+2KXtRFHSnBSyydy1E7Frbw2/7rIibBxm56pirY6u
	uieDiNmQqF7RuMIdk4nsF0osYEGE=
X-Gm-Gg: ASbGncuZsyqPuiEcpiYf+R2keEHY6QTOHXwvdWYf+OdPeq6K3cJNWoW1CmQz6ZFZQCV
	LmDYEqy+f2argyQupfa5hqeGKJCXAW7EHONyBqsPtPlSaBJayGq5cFM3fFdkfUv4Mg1Pk9uw=
X-Google-Smtp-Source: AGHT+IFXhi2DQ7mJawkzYDVUQ79N9lFaQ4i/jdWv6y5dstNfwoHp4E/xc57Uivp1rDsBDUSLHiKLwHYiM7t/X0LXeqM=
X-Received: by 2002:a17:902:dad1:b0:216:725c:a137 with SMTP id
 d9443c01a7336-219e6ebc7dfmr327512225ad.28.1735333292761; Fri, 27 Dec 2024
 13:01:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com> <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
 <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
In-Reply-To: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2024 22:01:21 +0100
Message-ID: <CAFBinCAP_ohHiUEv_r+mEMVBz_XDNdAjw0FjeUhwPY_U1KiXuw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Huqiang Qin <huqiang.qin@amlogic.com>, 
	Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Dec 27, 2024 at 6:19=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Newcomers, latest patch set:
> https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42a6=
7b76@amlogic.com/
>
> I included some of the prior meson authors on the to line to see if
> their mail addresses still work and if they have some feedback on this.
>
> On Sun, Dec 22, 2024 at 10:08=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
>
> > > > - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
> > > >    so we keep this sorted by actual vendor, sunxi is apparently
> > > >    yours (AMlogic:s) isn't it?
> > >
> > > It isn't. Sunxi is Allwinner SoCs.
> >
> > My apologies. I mixed it up completely. :(
>
> But wait a minute. I see there is meson. And in the "meson" subdirectory
> there is stuff named "amlogic" ...
Until some point Amlogic had all of their SoCs named meson along with
a suffix which identifies the silicon die (for example: Amlogic
Meson8, Amlogic Meson GXM, ...).
The "meson" name was dropped at some point. Taking the example from
this series, the SoC name is: Amlogic A4 (which would have been called
Amlogic Meson A4 previously).

[...]
> > What do you think of the idea of a separate drivers/pinctrl/amlogic dir=
ectory
> > though? I think there are already quite a few amlogic SoCs that need
> > to be supported and more will come.
>
> So what about renaming the existing subdir "meson" to "amlogic"
> and put the driver there.
That will make it consistent with other Amlogic related directories
within the Linux kernel:
$ find {arch,drivers} -type d -name "amlogic"
arch/arm64/boot/dts/amlogic
arch/arm/boot/dts/amlogic
drivers/soc/amlogic
drivers/phy/amlogic
drivers/pmdomain/amlogic
drivers/reset/amlogic
drivers/media/platform/amlogic
drivers/crypto/amlogic
drivers/perf/amlogic

> Also I want to know if this driver and hardware shares anything with
> the existing drivers in that directory. It sometimes happen that
> developers start something from scratch despite the existence of
> prior art simply because of organizational issues, and we don't want
> that kind of situation to leak over to the kernel.
I will summarize the situation in my own words. If there are any
inconsistencies then I'm asking others (Xianwei, Rob, Neil, ...) to
point them out and correct me.

Initially Xianwei started adding support for the Amlogic A4 SoC in June: [0=
]
In this initial series he re-used all the support code from
drivers/pinctrl/meson (the new A4 SoC driver simply selected
PINCTRL_MESON_AXG_PMX).
This means that we have two gpio-cells:
- the first is a number which identifies the pin/pad (which included
the bank and pin/pad within that bank as a consecutive numbering
starting at 0)
- the GPIO flags

Up until v4 of that series [1] the driver side was pretty much the
same as it was in v1.
However, even with v1 there sparked some feedback on the dt-bindings.

With v5 of that series [2] Xianwei changed the dt-binding (based on
the input from the DT maintainers) to take the GPIO to take three
gpio-cells:
- first the GPIO bank number
- then the pin/pad within that bank
- the GPIO flags

An overview of the changes up until this point can be found in the
cover-letter of v6 of that series: [3]

With the current series Xianwei started over, with a new driver (v1:
[4] - and Linus, you have linked to v2 yourself: [5]) so it fits (to
what I understand is) the desired dt-bindings.
The main difference to the "old" dt-bindings is that driver changes
are not needed to add or fix pin muxes (old binding: .dts only had
references to pin groups and pin functions, the mapping to register
bits happened within the driver - new binding: all pin muxing
registers and bits are described in .dts).
The "old" approach is more similar to what Allwinner SoC
drivers/dt-bindings use whereas the "new" approach is more similar to
what Rockchip SoC drivers/dt-bindings use.

To put it into other words: the new driver (from this series) is a new
dt-binding to hardware translation layer. The hardware side matches
what we already have in
drivers/pinctrl/meson/{pinctrl-meson.c,pinctrl-meson-axg-pmx.c} but
the dt-binding side is completely different.

Generally I expect the new driver to be backwards compatible to all
SoCs that used the old dt-binding and the PINCTRL_MESON_AXG_PMX
sub-driver in drivers/pinctrl/meson/
Those are:
$ git grep -l '&meson_axg_pmx_ops' drivers/pinctrl/meson/
drivers/pinctrl/meson/pinctrl-amlogic-c3.c
drivers/pinctrl/meson/pinctrl-amlogic-t7.c
drivers/pinctrl/meson/pinctrl-meson-a1.c
drivers/pinctrl/meson/pinctrl-meson-axg.c
drivers/pinctrl/meson/pinctrl-meson-g12a.c
drivers/pinctrl/meson/pinctrl-meson-s4.c

(That said, I am not aware of any plans to migrate these SoCs over)

So to conclude: This whole series is not about a new pinmux controller
IP but a new dt-binding for the existing IP.
In the old series (v1 at [0] - which shows that the underlying pinmux
IP has not changed since the AXG generation) Xianwei tried to add
support for the new SoC with the dt-binding that other Amlogic SoCs
are already using - but this got rejected by the DT maintainers.


Best regards,
Martin


[0] https://lore.kernel.org/all/20240611-a4_pinctrl-v1-2-dc487b1977b3@amlog=
ic.com/
[1] https://lore.kernel.org/all/20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlog=
ic.com/
[2] https://lore.kernel.org/all/20241112-a4_pinctrl-v5-0-3460ce10c480@amlog=
ic.com/
[3] https://lore.kernel.org/all/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlog=
ic.com/
[4] https://lore.kernel.org/all/20241211-amlogic-pinctrl-v1-0-410727335119@=
amlogic.com/
[5] https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42=
a67b76@amlogic.com/

