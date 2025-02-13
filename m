Return-Path: <linux-gpio+bounces-15941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D11A34C9A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22953A6D3A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD1524290B;
	Thu, 13 Feb 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gh7HbCjo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CF241687
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469499; cv=none; b=HCWqpuONYH2eLm9qyWB4ksckvB/vMw+9BxiMpkTgnitneuCRDWFyK1AcHZBzIBxyoF1rYMGu2MED3trpHdajsIp6AK9QnP6aiymxr4bPeKfVOh6lPsL7wM4f/PuwXo2el8BCQeFqoo/jB8eicXn+c76R9mvwx7Yx3BoGvPSkghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469499; c=relaxed/simple;
	bh=T4wEjSRsVSrhRrn2h8DgpJJyTxIWuEpOmyBwmIva9Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iw1zs6b+a44rs5/7CDlXgVrBXUcnFLBQBWQumfnzru3ZggQSJ0WNgg/T87ULToUaxKPwq0gNYp2/Xm8TZqEAZ/hMrS2cCNPBKgA6IfObSZJJ4RrD8tbOtWTeEqjgX1vGj9TdCZjjvr+FXtRViBhTkk7p1KVSRBm3PelKVOnBmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gh7HbCjo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543d8badc30so1305094e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739469495; x=1740074295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hJUq2FWMpiTubsUgXvXpT/cz5xlZO2FuryQMryqjCg=;
        b=gh7HbCjoFmLKwD37kRFalbMy9C8mdaurTyq5yYYJejuNI0lKcrL/NKfzoW9VsjDPDd
         7D4oPc75wZilDRIPWymRHPlb9xApBTn7klBmHMw+4c+xfwRy/awKxTzLZT2n7T6tCRJF
         cwvRNR9rGoVyW2j0xWjD/czYlIDaE2LDNcvLLTKVMF3tYsqJ2ArpRPa2gAUUrmeMRJtM
         UGfda+74pne77pvtLM/a/ke+kgg21rAR69cmnyCBCq9TK8SZ48MMTNB5DacIBQ1xri9c
         FQX0sVHk8Yv70n6abXdyGaZ+b3iyDyNLoej9GzfaXkaKFCaPKd6sOc9Qx2qZba8BoFOs
         zo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469495; x=1740074295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hJUq2FWMpiTubsUgXvXpT/cz5xlZO2FuryQMryqjCg=;
        b=niS991WZEN371uqfYu4dap7ap9fHBFqFI18WVzZRWU4w9I0xX3HOPbvwqwcNTRAndF
         mmh7rp3eyKaC92PdSX9lM0kDiXWwbR+2s6Zf+V/SnP57NY0/aR/FNsvHDtbxg3ppsFS8
         6S6CWXUxk5kXRZMKxN3BZMydrNIFNUPgmuDoBWXtPIEm5JuLjjbGfA9Pq42AUg8j7reA
         aamJtknZUV57/rA5CvJ7AovLJEEFPsH7Y1zKRCdsdGq39UkO7mZRQn/IXtqC9oMX74ck
         rmV3uOR9imXZWiIJ960CAVurgSQ0QweFq0hvcTt1LL4xUl1MYEIc5PLX5xLfX6/1HSLH
         gfLg==
X-Forwarded-Encrypted: i=1; AJvYcCVr8oMuH6aiMWyJZ5IlXn4Lhw2BZGmF9ygwAagH7TBJEGj3UqcwKLQzq807rNRdO/JQW3Bx0wwS+tV3@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmp9/V90b2aV8gS1LMXrElN2Sc355pM/7gR0o1JrkD1Q+aOS3
	Frb3Tcht0EfOD678/zqWeGti0hFmZnwR0DVmSKlLzMOpo/Ib17gKVqifCleASeNxUWzhu/nPfWS
	Kr5eq5BoxnmQ23vUQrVdtUEVZ50pgx4ECYnK3uw==
X-Gm-Gg: ASbGncvD2Ph3sJet+29cMxTHDH6+x5nBtWvveN7DFh49Fu6jLKw2E+YHqZbuNzxysNl
	tB1WnwD4lF2eQ2LxS6BEvhNiG3oymnODmJE+TEwqv7jrGtVBNu0tluVNHSgGP2GSKjkYM2LkkeY
	N3/8os90nbyIUkMznGA/uayovsZ7e2
X-Google-Smtp-Source: AGHT+IGvl6mW9n7No7hloQAm0sjQgh6h7QTx9ok6twfTZlsAcsr3IPTDtYgCtgjq9SBpATIzjmWo0SWAoAL/h4h3bA0=
X-Received: by 2002:a05:6512:230d:b0:545:8f7:8597 with SMTP id
 2adb3069b0e04-5451dd953bdmr1828407e87.16.1739469495145; Thu, 13 Feb 2025
 09:58:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
 <173935301204.11039.10193374588878813157.b4-ty@linaro.org>
 <801b5364-129f-42e9-bf9a-a90d9eeb4629@baylibre.com> <CAMRc=MeXTvPnEPjOmPd5Vw0FYKHzndsB0SVjQErA4CY_0MGsMQ@mail.gmail.com>
 <7989a6a0-b761-416c-ad97-69bd23fdc2c4@sirena.org.uk>
In-Reply-To: <7989a6a0-b761-416c-ad97-69bd23fdc2c4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Feb 2025 18:58:04 +0100
X-Gm-Features: AWEUYZmrRaL2YjTM2r-jpirYN5EOkISNS2cmGOX2GIxOe7L0RqWQ7r8Dpd66z_c
Message-ID: <CAMRc=Mea5imComkraP=v9TKsxLDoBm4XtbLL1QxCbhJ8d4uxcA@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 00/15] gpiolib: add gpiod_multi_set_value_cansleep
To: Mark Brown <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 6:53=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Feb 13, 2025 at 06:42:19PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 13, 2025 at 6:25=E2=80=AFPM David Lechner <dlechner@baylibr=
e.com> wrote:
>
> > > Do you plan to pick up the other patches that have been acked
> > > as well? It seems like most folks were OK with everything going
> > > though the gpio tree since the changes are small.
>
> > Jonathan requested a branch so I made one and sent out a PR. I figured
> > people would just pick the relevant patches into their respective
> > trees? For patches that won't be in next by rc5 - I will take them if
> > Acked - just remind me.
>
> If people are acking things that generally means they're expecting them
> to go along with the rest of the series.  When you didn't apply the ASoC
> patch I did actually put into CI but it was a bit surprising that you
> seemed to be expecting that.

There was no clear consensus. Some patches are still not acked.

No worries, I will take the acked ones. I didn't see any b4
notifications from your side yet, so I assume the patches are still
pending?

Bart

