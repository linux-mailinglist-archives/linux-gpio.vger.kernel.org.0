Return-Path: <linux-gpio+bounces-28663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07996C69932
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 9E36D2B0EE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719E5345CB9;
	Tue, 18 Nov 2025 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ph27r6sT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C692FE06D
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472107; cv=none; b=TB60pr9KtA7TvsquamfEXCUUJXOwmqvijljfU7sKdb/j/eo2LNAb2gtA2KLmWu+kUihEqrEgzTOGSX39qnF7pqQu5eBmBdL4qNA9GsS9/K3mvSzCGMSxk2kbQXQMdYxlKCEAHjCrZOeArmbrbnM/0Sm3T0XxWRdenOQ35OZjMkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472107; c=relaxed/simple;
	bh=E5V/vfphfgkZe38UOECGMAO1aduhoV4x1WIT54usrgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bidVbahWYsjaLdTTE6hyL3NDKhzpT9+QZWHgOZmdijf9cwckR6P/S4TadcKq1+J4TOY0mAhqI93qY+qyRP666eU2NCe4UTKiq1sqPe2/vj2kUPdr+g5S+IPVgKFWjvvmSMZFi5IlvNVs9T50faQjduMUVlfysZFm73WSqp7RZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ph27r6sT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-595910c9178so1793402e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763472103; x=1764076903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=;
        b=Ph27r6sTzqLPKi+GnwrFGLObYPA4jXb5/Ex1ykBIXTlJm9iUNCPBAZ/UTdcFMRNuha
         W83jRYGNB+gQsGuJMJYB75JDj0WBx1Jiasts7mcT4lB5gjqpNQFIux7T6KrSzeUDm7Zn
         ZRqnp/Fu2bY6iwh9dYwMAoWNovab6ZlliA0rh/jRxlwDRso6OFlggy5YcoWxQikLKwax
         u77K7rPo8AiT9Regc3v4A3q8YHS7+SMdHYkCWGDvboNKRuGR1wcFcIAifAcPxHlzxME7
         sRxIvTy7SamOMQ5ge1MCMaun7cE+bMFSa0t4vNcwvvVlmOKy0IEnuNojs98Nnm7gRSOV
         kAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472103; x=1764076903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7s5vmA5/2iLhUbg7qRyJfyqshig4Q/omIvZZt8dCY8=;
        b=hGrpKmOmTsoqipCmnMNJHzrRYXi8Ryh+MQUB3JgrlZE4zuCPUfviRIRLuDAqsToOVO
         H3QrN/dwvMwNbgQhWmkNPyhA9vwlvHKhIgHxvhhyGesQ7PIEZIgMzIkqShid3++9gUIt
         F9FolhV8LnULDV1ecOz9yuA2FJNHPFt7x6Xafqpdu6xwHb8ocFFjjZjNJ7lGMDXFMDx2
         k9SC5Q6YVNPfaGuSDGzDqCgQY7Hro/d4F0VocAVweSC5ECAWVKN5X3NUGXOAv3mmLCZa
         tVYLBUay5zB9If1csCtnUa22P6tvwk+ZaBkNF2dN39hLjKfC3oxLn2V1pRMtvMwp68JL
         ZBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSw3IXS71C4aeoSvqszCJcTiM5wDWxvkBRQW1xzzU1mfAOdAGvNikzGCNGTwUd5EPUcqUWJ92ohNma@vger.kernel.org
X-Gm-Message-State: AOJu0YzBr9ldyxa9uIWHe6VKsRIIuuD8T3uCfqHViIcwhXz4cNKTlXXn
	tGqotPXztlGvIqJGubbNJNSNLL+6GDMtsaLFoWZHider8he7OKstOLeQIYPwOrdfNof0aD3hc8P
	fVVVb7tuHkELnhSD1qsqivtmN57WgKZAQOsffqtOxvg==
X-Gm-Gg: ASbGnctkehejRHQE+iTodkWNrOg6lij/rLujLIS9tBUPO61xpBA9iNnl67OAldUsLQ3
	+ZhuMacuUou7Aw5Sng9UCdmu9mU3z0Wimo4d3K5dk2Pb2/Gc0qWG7OrhqkkS8c0HyA7FxFs1oAs
	cXPQ6LHdsp9PntrGdR3f6xULv2o3D/gfCb5jm9D8w3DgAasp5d6hEm++PtpLIqGFLHQ4k2SG3sZ
	SjPDlPVysU/X5IgaB7dg+R0y0kdDGDm8lp1Vp6okQIuswmoZSTC3MIT2ecRyjXuNgMp+HDlFJsT
	svMEnscLlgQjoI+iP6XlXZh21w==
X-Google-Smtp-Source: AGHT+IFLx4rEab/wbUDo4EkSCUHDw6GWYiJjtIbCHDB1xl+ZlXv5nLLQYI54hMzgwVsRu8daEpH3NSYMy9pTQDZmbZ8=
X-Received: by 2002:a05:6512:3c9e:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-595841f842bmr5089204e87.46.1763472103404; Tue, 18 Nov 2025
 05:21:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
 <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com> <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 14:21:29 +0100
X-Gm-Features: AWmQ_bmgN3bhvSn3FjfwQqs5x52sLWvM37dbNjtnEqn6scQIfee74Ky62f9fPdU
Message-ID: <CAMRc=Mf_j8jNMrJrnGp_bVmYQPLheE55AN4gXCtRrCDkF5CXsw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 1:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> > >
> > > Thanks for your series, part of which is now present linux-next.
> > > IIUIC, this requires the direction of the GPIO to be fixed?
> > >
> > > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > > key switches.  Basically, the GPIO is connected to:
> > >   1. A key switch connecting to GND when closed, with pull-up.
> > >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> > >      high.
> > >
> > > Hence:
> > >   - In output mode, the LED can be controlled freely,
> > >   - In input mode, the LED is on, unless the key is pressed,
> > >   - Hence the switch state can only be read when the LED is turned on=
.
> > > If you have any idea how to handle this, feel free to reply ;-)
> >
> > How is this done currently? Even without this series and using the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> > direction so it's not possible for two drivers to request it as input
> > and output simultaneously. The second requester will override the
> > previous settings.
>
> We do not handle it yet:
>   - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
>     the keys (key-[a-c]),
>   - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
>     (key-1), and the others as LEDs (led[56]).
>

I see. This series cannot possibly address this. Off the top of my
head: I would create an auxiliary device binding to a dedicated driver
that would be a consumer of this pin and register a LED and an input
key. By default it would set the direction to input and if the user
decided to configure the LED, it would change direction to output.

Obviously, there would be a DR quirk to handle as we already have this
described in DT as gpio-keys on salvator.

Bartosz

