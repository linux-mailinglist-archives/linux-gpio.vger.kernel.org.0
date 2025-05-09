Return-Path: <linux-gpio+bounces-19824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBAAB0DB9
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A9C1898E8A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1B927B4EE;
	Fri,  9 May 2025 08:44:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1A27700C;
	Fri,  9 May 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780250; cv=none; b=Rl13iIda5vB5DGzEsQ8Joo+tBvvBwVToBASGOwD9MCzpZVohb14NTyvyEsqaqjJZhoQpeKPXhSFqW3Lg5ZuKpYXZ6tRUo41djYm9zi1okJf0NBQ0bvppnKcNPWbuluLg4PTQeGLhkthbbzNVzFqLiYnbzNHitjevrFe8D3vTVq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780250; c=relaxed/simple;
	bh=+Yp2wbVgA+EjZj3j/nQp643OXO4dNE0GkTBgD7mi0dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbNPylIw0NipNzanrlbU1kCfk3qdG+MbNPOWJ20Szoayx4BplftVhk05CzmPS+7aLtfhv8bwI1eATNf14/ExM+G+V6Bx6XG+aoiUp0I7YmQ37QLyeCBuxurlk/+0cJ6jBGngtjzCNwRB3ftGhlCGKduwICIK4ZmzbG83Y0AghgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so1705411137.2;
        Fri, 09 May 2025 01:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780246; x=1747385046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhmBpQomX9NG5iuAvqHopd32DqiB0flMOUXVobwYc6M=;
        b=kLzD8qFvBu/NmusCAsFQm59ebE6PczeSSl3OCtdSUr8CKFjHNdlO0nEf/YuLm54Yhh
         SgdDebNJuuwBd6NFoIW92HsMX2uHamjHoY7vHyP1lEw0RQQcyc2di6S9NiPO0+CJYUqo
         2k8MRrzPGbpAc2f4BeEoak+jaa6aNgbYsY1ZsC3c81DVeDIjZYM7JFijQLMTeUWUbAqr
         DZJGRVCZ3YU/FRnkGxKcy1HRB71LOqvpKjJfkMS1oszfojcRPB9fQwaHUNoXSXGwi8lj
         W8q7PVI7Y0teATVvbz7jRPkDBe3U9LCYYyu3dISl16CrToxsdKXKHDtvVmO4B0g7Hwy8
         cfrw==
X-Forwarded-Encrypted: i=1; AJvYcCUO1ztiMEQ1eiRdbOlbkwFT/NgijrMYwyTHPq9kYbqnnM974nQjv78VtJMgsjqUeVnJMAeQIm4HG6Zw@vger.kernel.org, AJvYcCUdVd4xPqI3u5kBWjek65Grg8DXLXRfObgtRA7+6QMu0sQMyt/eYy8vk9ouSm4mRXBdBLDm3ghAufOqHn2tMIyG@vger.kernel.org, AJvYcCV9D7e9D++sxllck3nizn5rmCpmSIPcEeFASbfULO/ObC0Bh36BvPykdnqQjCkYFTQFzlUejRZZ5MBSbcNC@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGHrTxCEq9uvrfZGu32+eA1zuA6QfWKvLE48czMQWd3x8F2ay
	wYxjFN3PjdpphdgWwTJ+EVoC4b5VoFlUt9DQ8sZrsfa5IDLoxKKj5s4rWxD7
X-Gm-Gg: ASbGncvVQp+WLhw+FN4BZ7PV8ow4xs38zDHnbisCitNLhavnosaaUhLvkmcC3MahloQ
	dhfya/X2/QjajZgy5VhVcAf5CO6jBtXXhGLm4sH3esqkgNpks1wSjIo/CIOS8fCXibVAgwo6sUZ
	v1DUgQVHgJpZIyZ/n8UMEPlpfsCxxZ3mcif9kfqhdZxwwVlHbTUqh4a5pcSkzIG3Zw5u0NxTRSU
	+P5aSeANrKT0HTwLAQYtdptrxhjHL5wRcd3u979TCCu2TZ5KuVeuBJwxkHOGf0rEJAG+0vXRBgp
	PlUDvhiuUDGIsVRXzH2h3gndI9nQIbESi9oKJfjLJB2Fobz6rjvO4RGeSEOENMGVEIW2FvLKutL
	S+cA=
X-Google-Smtp-Source: AGHT+IH5qyn2vFyYQY6HagjOy0j3hcknHPUwPI37zEIeQlk0dAv7yXe68QvtigwEm3CoVSlnlCcRQQ==
X-Received: by 2002:a67:e7cc:0:b0:4dd:b037:d23d with SMTP id ada2fe7eead31-4deed36f9ddmr2287869137.12.1746780245817;
        Fri, 09 May 2025 01:44:05 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb2016d22sm753070137.19.2025.05.09.01.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:44:04 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4ddba761dc4so831972137.3;
        Fri, 09 May 2025 01:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4ts1Pi258BHb0MTgdU1i0dw0nkaCeqzwPrxku4KakQOsyM1GfxsWTQc6BVpTburM4yq07PqzbOnu6RcAXlzeN@vger.kernel.org, AJvYcCWM01eLMKPDHegQc4giCqvyxyL2BHaNwo/PSeueHND9jpFcCpJAXEC4zGFxtFfMV+0jpPBIQ7tUA+LgkrLo@vger.kernel.org, AJvYcCX8emvkLi4T8SGRAmKaOODt1WE8Xucbahak1JW60e9M/20/wQVEY4mTuM7pqUY0LcT5eYkV8iJWLRFA@vger.kernel.org
X-Received: by 2002:a05:6102:4bc5:b0:4dd:b259:ef34 with SMTP id
 ada2fe7eead31-4deed33faf6mr2382623137.10.1746780244214; Fri, 09 May 2025
 01:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-5-3906529757d2@bootlin.com> <CAMuHMdVLo2w609eFOKRkYAfEMb8XOTNB-XzzZn_89VM-YV_-kA@mail.gmail.com>
In-Reply-To: <CAMuHMdVLo2w609eFOKRkYAfEMb8XOTNB-XzzZn_89VM-YV_-kA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 10:43:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjc8hV4mvq0oOZDERajei+-sGxevq9m1wfQ=VCvod-6Q@mail.gmail.com>
X-Gm-Features: AX0GCFvMZLAP1ahBL5IRSEZHR-bVv8I7BRcCLPtgUqqOnPsoGYlpkXVRENB7NK8
Message-ID: <CAMuHMdXjc8hV4mvq0oOZDERajei+-sGxevq9m1wfQ=VCvod-6Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 10:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> > Create a dedicated function to add a GPIO desc in the forwarder. Instead of
> > passing an array of GPIO descs, now the GPIO descs are passed on by one to
>
> one by one
>
> > the forwarder.
>
> Also, the passed array is no longer stored as-is, but copied.
>
> >
> > Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

> >  /**
> >   * gpiochip_fwd_create() - Create a new GPIO forwarder
> >   * @dev: Parent device pointer

      * @ngpios: Number of GPIOs in the forwarder.
      * @descs: Array containing the GPIO descriptors to forward to.
      *         This array must contain @ngpios entries, and must not
be deallocated
      *         before the forwarder has been destroyed again.

This needs an update, as the array is copied.

> > @@ -559,26 +593,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
> >
> >         chip = &fwd->chip;
> >
> > -       /*
> > -        * If any of the GPIO lines are sleeping, then the entire forwarder
> > -        * will be sleeping.
> > -        * If any of the chips support .set_config(), then the forwarder will
> > -        * support setting configs.
> > -        */
> >         for (i = 0; i < ngpios; i++) {
> > -               struct gpio_chip *parent = gpiod_to_chip(descs[i]);
> > -
> > -               dev_dbg(dev, "%u => gpio %d irq %d\n", i,
> > -                       desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));
> > -
> > -               if (gpiod_cansleep(descs[i]))
> > -                       chip->can_sleep = true;
> > -               if (parent && parent->set_config)
> > -                       chip->set_config = gpio_fwd_set_config;
> > +               error = gpiochip_fwd_gpio_add(fwd, descs[i], i);
> > +               if (error)
> > +                       return ERR_PTR(error);
> >         }
> >
> > -       fwd->descs = descs;
>
> So the passed array is no longer stored, and thus the caller
> (gpio_aggregator_probe()) can free it after the call.
>
> > -
> >         if (chip->can_sleep)
> >                 mutex_init(&fwd->mlock);
> >         else

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

