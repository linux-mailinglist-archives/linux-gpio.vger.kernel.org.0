Return-Path: <linux-gpio+bounces-19738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A74AAE0A9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27ADC7B28BA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A547288C2C;
	Wed,  7 May 2025 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAESpbE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C928934C;
	Wed,  7 May 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624305; cv=none; b=FE9AOL1haemR+ceDJAnYKjIdtEwU0xs4iNZHkMBdxzJZR/6olMZZ+rZIZdM0/qTZ7u6zY9MKggl9zUdzUbdVxKEeyzzCgiA6miEYUe+AdZ4npfAfZxaTyPi2WU6U9xgufPuQP9NWDYUP9a1ocwr6EmF9678wvytuzUQ0yHeUhmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624305; c=relaxed/simple;
	bh=tmAzgqdFUhv7D3TEEOzATF1+3A7Oy4p8s+Yt4t2a+x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHXfBV97a3WdCema0VSDXeuaZHbQnA2W6x44aXcuOthcDnojpaqp9xfudrN1mqfS4jxpHr5EzY/rqkKXNb/dClmUMuwLanPjZpZh2TTAVQpt1V1UoJ2ZSA3ZAVKTOQXul2EJpq6ubvjGk1BcMehGav0wxnl+GR/FTPBAagDmPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAESpbE7; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso563282166b.0;
        Wed, 07 May 2025 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746624302; x=1747229102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNK9TXRAZQx3t8pFiOXuC7lEgpm/XQ/fl6MmaDUuV1M=;
        b=kAESpbE7Lb2WdbkjAKxGE6E1KC9SIH5rPunPnfd37krP1ed5kMjSOsOA5lpoB3CLGB
         aPvBTFwyCHFmtca49OzQIUmdbK1cBKHCsHnLovKks4XHr8sSdofNexKykEoSNzuv+TqN
         Hk5jo7/eEBXqz4yY4gpY4prplre2nh5ovw3PiaooCr/1lPraVUwBuavCL0jwbaKtyVw+
         pmbtEBhO8BVy8t4TKp5RyEBWv6NNODCi4FmNidd97T6udpFRTiPVM9AgkJ6/ewCOB1wm
         Y2R8u5HoHSW5fyk0WF2z6tjV68cIR1QYQGl7daex7sE90lPnf1E3mgxrvW5L1yOelE/b
         +0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624302; x=1747229102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNK9TXRAZQx3t8pFiOXuC7lEgpm/XQ/fl6MmaDUuV1M=;
        b=vwk73EYr7IiKBnafKxq1sz7J2nlgowcaXaE5TOkD7d5FVN6yQOmX29qHYZaXG+0gE2
         4iinykH8+rW1RGshgfDmUdh8jkJkWWaqNiKU+d88FbPKSAmyNNd3BC7mhEVc+t8LDCls
         +bnmUuYKa+k/gYwkz1XqFLWGTZPFi4wmqrfnqsHxFpGQUwStsrS2UQPpgdbS7pQEI327
         3T4m25t0FiUyyNBr9CUv8EDKiFyfazO6TTmEs2BF1iKKctt88CNl1nV1+JRtKZU9YUL1
         8yE6WVTzoxpDRmZXJL/ou5mVnfXDf9n9j/2a423Oh1SvG9smxkuXOxoHCXNEDmJmUyls
         077g==
X-Forwarded-Encrypted: i=1; AJvYcCUyUNQzJc/tCDKI/iWXIupoeb//chIGBYXx7Np9L7U5s/uJS79aN6XHYU5aFmARXJ2rVnT1GzEAK3m0@vger.kernel.org, AJvYcCVxyIPUA2xFdiyf33sC2fJ1XaSO8QmpZ7/1pPAEgtHKIgWWte3hvDfzGydDxQ/jwlTaTck3f+m9qtLA1z0h@vger.kernel.org, AJvYcCW/qYFsSQNChva4gibqIHpj8w0TNB/lcJ5xUAL9Z4lH+S4N8ys06AMChJcgOFQi9VBOKlwQ8NXeuh/z2z/mPxkw@vger.kernel.org
X-Gm-Message-State: AOJu0YwioMvlotZvSiPdtE7K/MXDd9uh60+APEDAQfmAyyy9Rioou80C
	HKaQe7igSQXRdG2L/DRzbf7aBuIHCiJbofMhN+XWhGGwDoQNdkjBPywC187CJGYMuEwYUbY/Vou
	cMu0OMXNLDb4uZh2D4hbdCK7jAkaylVsn
X-Gm-Gg: ASbGncsBtlvpRs6Z1dQKBz5ftYBew45N8MmtBZKQV310E1VxRhGepiW4+2XoXVIanQw
	p9TWn635xay4YT/521qjNE9c6jHvkqsxK7q6Sr1Soz9PM/dOkLFbBajOR5PLpHvfm74mxt1QhPl
	XNmqU47RuoeHdA4gy60vdxU1tL
X-Google-Smtp-Source: AGHT+IHy1EPVp61/xmfKkJx7M5e2sjnMM6R2+K4MN9fr5Jbv3S3oFUuFFqA76cSi8wIatUpZHrrUtGhl0K2kjxnH13k=
X-Received: by 2002:a17:907:970b:b0:abf:6a53:2cd5 with SMTP id
 a640c23a62f3a-ad1e8cd6b35mr343831166b.48.1746624291513; Wed, 07 May 2025
 06:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
 <CAHp75Vdg2LE885+qjpYLkQrdNqaahJc3=Ki7op=6jJUJfJM+sw@mail.gmail.com> <c3b9c494-599e-4d99-8645-589c1c0c106c@bootlin.com>
In-Reply-To: <c3b9c494-599e-4d99-8645-589c1c0c106c@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 16:24:14 +0300
X-Gm-Features: ATxdqUGXLJ378PIXRVvlYYFoCZ00RtoL8KPIUx0XRCLsMFPpNnN-agl8soleSGc
Message-ID: <CAHp75VcKsq5_+uwwVKeq8++H+Rw1giH-TKUErsFmdKPiu5kY+A@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 1:10=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 5/7/25 08:34, Andy Shevchenko wrote:
> > On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:

...

> >> +       /*
> >> +        * get_direction() is called during gpiochip registration, ret=
urn input
> >> +        * direction if there is no descriptor for the line.
> >> +        */
> >> +       if (!test_bit(offset, fwd->valid_mask))
> >> +               return GPIO_LINE_DIRECTION_IN;
> >
> > Can you remind me why we choose a valid return for invalid line? From
> > a pure code perspective this should return an error.
>
> I reproduced gpiolib behavior. During gpiochip registration, we get the
> direction of all lines. In the case the line is not valid, it is marked
> as input if direction_input operation exists, otherwise it is marked as
> output. [1]
>
> But in fact we could return an error and the core will mark the line as
> input. Maybe ENODEV ?

I am fine with this error code, but do we have similar cases already
in the kernel? Do they use the same or different error code(s)?

> [1]
> https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/gpio/gpiolib.c#=
L1105-L1123

--=20
With Best Regards,
Andy Shevchenko

