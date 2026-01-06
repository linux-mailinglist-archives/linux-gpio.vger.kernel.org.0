Return-Path: <linux-gpio+bounces-30198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD65CF84F7
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 13:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 906DF3008F34
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6E5322DD6;
	Tue,  6 Jan 2026 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJthu95e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C830FC37
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702343; cv=none; b=HbPSk9W/dEbQb/G84NWPLBwDrzi2kBCnOD6cnhjuss6vvdBFN399dkzbh+GFFjKvvRyF3FpiylOhWOkm1lUftDUiWNX9DM1An0T5YvFeuBKfmp8IWwTb0xoAJJLfe6CavXb6oSuUUnc/ghwi2xPPFg9i5OgLrifWPyTfm6el/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702343; c=relaxed/simple;
	bh=wg6p23gjDukL2cRVJ78Oc5P5KU7hnB4MDtRCIp1BtIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBy2g1fZ/syMni7sTkBFJFf5kcG1dxoWn2mDt0XGrdmRXEFnTfWorDAriZBI4NK6FtSdXoKWXJR/CAU4Ob1sScqwXccxUv+hubLjZz7jWZefWqy4NzzFQdR9cJIFEn8kM9vUBBn3PKCpIad3FRTM9qZaaLfoIMeTBZ5sAUwVPnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJthu95e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB1CC19424
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702342;
	bh=wg6p23gjDukL2cRVJ78Oc5P5KU7hnB4MDtRCIp1BtIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aJthu95es2uZpaCdxmSWIe01j3tHZj0B4FpMqAvoL3Oso+KZqJ8HNHQAsXx6D8sJc
	 0rdlAtHyGNN+yNf5AoD18s2eOabbv3dqy2HUDH32MvbfmbYdNEPILyQtAbHVfie/Cr
	 u41bhGxdXLHYZzASUM1cW6VOd3GzPEYnzKEhovwV5tOLSpBNDD2RQH88eVieQDGCXA
	 Sfg7Y/GZcSE8Wg1ZTQSzNLQupG7S4zoIloNH1Rx5+OfmDMc32zEuaGR/zqm3n/aP08
	 5IyxHT1bIru0qf3tR31f4xSVO37TNVg1HVvO7QOgiy1GqrbYzWHoIVozKwhsAQJj4W
	 cBTgMqhcUsuWQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b30275e69so572331e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 04:25:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVftIz6IJ8bCMMhzPyw607rdI///dMbvofBAWEG6Yw96CkTqnUP3ySS66gFYGygdqdNhWEX9HfEc7ra@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2VW8N1Qg1Y1EGzUb6gL/Oaaq7nBCvVv55QG6bowHhIwTjjKW
	bRgTX76OnpVkcm5UTC+v92v/U4QwOna7h9aGqyL2HDnp6Mcm8he9XVVHFG7NBGQj1cklsYC6Kv7
	GCu8L4LuUmP4TsWk23lruN/3IZ2Cq5GKuyuMAEHyE2Q==
X-Google-Smtp-Source: AGHT+IE6DFYY/3rRfXe7XSzL1OxNQpFcEuniQY70NWdKpsxhOEm1y3QR6wUF6cLmyvwNYXoUYahLVw33DzhaMW8X7tU=
X-Received: by 2002:a05:6512:2350:b0:59b:4213:75e6 with SMTP id
 2adb3069b0e04-59b6521e2f5mr1113951e87.21.1767702341395; Tue, 06 Jan 2026
 04:25:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
 <CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>
 <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com> <9948f635-b753-44cf-8977-7fee4cfb6e3d@sirena.org.uk>
In-Reply-To: <9948f635-b753-44cf-8977-7fee4cfb6e3d@sirena.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 13:25:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdVs4Lu11XuDTassdGrdM+RLSAN=9tjO2ZLHZsT3fGY-Q@mail.gmail.com>
X-Gm-Features: AQt7F2ptws5Ge5GRn0wLuORiWFu5YPp03xp3H1Zu7XyDX54f2WmFWc1qQlA9EVA
Message-ID: <CAMRc=MdVs4Lu11XuDTassdGrdM+RLSAN=9tjO2ZLHZsT3fGY-Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 1:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Jan 05, 2026 at 12:50:22PM +0100, Marek Szyprowski wrote:
> > On 22.12.2025 11:01, Bartosz Golaszewski wrote:
> > > We currently support sharing GPIOs between multiple devices whose dri=
vers
> > > use either the GPIOLIB API *OR* the reset control API but not both at
> > > the same time.
>
> > This patch landed in linux-next as commit 49416483a953 ("gpio: shared:
> > allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my
> > tests I found that it breaks booting and triggers warnings on some of m=
y
> > test boards. Reverting it on top of next-20260105 fixes those issues.
> > Let me know if I can help debugging this issue.
>
> Not sure if it's this specific patch (one of the bisects identified it,
> but I'm seeing others going to the merge commit for the gpio fixes
> branch) but I'm also seeing issues with gpios.  pwrseq is affected on
> several platforms after backtraces that look a lot like the one that
> Marek is seeing on Raspberry Pi 3B+ (which I also see).  This breaks at
> least the WiFi:
>
> [   13.475670] platform wifi-pwrseq: deferred probe pending: pwrseq_simpl=
e: reset control not ready
>
> Raspberry Pi 4:
>
>    https://lava.sirena.org.uk/scheduler/job/2335022#L1200
>
> Toradax Mallow (TI K3):
>
>    https://lava.sirena.org.uk/scheduler/job/2335415#L1457

Hi! These two should be fixed by the following series:

https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2f7581@os=
s.qualcomm.com/

Could you please give it a try and possibly add your T-b?

Bart

