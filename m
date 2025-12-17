Return-Path: <linux-gpio+bounces-29725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A390CC9BE5
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 23:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03EA73016ED2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 22:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB5532F74B;
	Wed, 17 Dec 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmtmEgOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3811E0B86
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012139; cv=none; b=Zd9HViAIwv/nF5ifZxbUen90+sbKInLcwlV4avWUPXpBAWxPE+s86qSF2ksYvkgOWHq+A0OIQg52ZS1EAoExH8q7RY9JafdZcZw3dIQQzB1FQKPQcNPlNTobWYbAt+69Cqwpp0Oj2Yf3d8VT4mF7VLAUqU0rjLoit7eM5ujSUXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012139; c=relaxed/simple;
	bh=ogm7L6EmNBUVRlQlxHCFbb8LVk891HIhBA0ix68vyAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASnqzJLa/G3BNMFgW4oETIHikyh8LEnWqsCHDE9HJwdgcWnllhVsRQCfXhjhM8xmjesU9MfnQJOrSnyijed9A8OXNEnKm3m7I9+2oPjVBOHhZTRpC0J8tJTkGTVKjgzBQW0kzCCzin/wbvfvKyB4YSeYZ/G5GIpMIpnYJsOq/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmtmEgOZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so1053795a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 14:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766012136; x=1766616936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OavFDtY3zKIM3eAGiz3sRvX4aADiDM2NAjNiTbwKKLI=;
        b=PmtmEgOZ29yb0rHUXxS0PBmqvgMC5Lb1erPrw4m0BqpLYfFchAEnQ/xjuUa7G2a2yd
         RjASio/eF5dGfh+IbMbuVyGu3ZHE2r+JCLTu5c8wA2VInU4ikZb5ExgrA9ihy18qC86k
         nEomITGhJow8uc/aWVVUsbz3NPIYSZA6KlMUsWUTmxfiD9GcfXtZiA3XCQJafbAZ+6jp
         CRvCKdL16ngBYhWmotPyl2fstRmFGJABal3Q7+DiRC56mPiafMewRcsv2Ju1EzzK/2SX
         FHI9DhCWo4ZRsBJbgTg80y8D+pncKO0lt3/C1oaPbWJjlg64jX6sHg673rzOX1cIr7cO
         WQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766012136; x=1766616936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OavFDtY3zKIM3eAGiz3sRvX4aADiDM2NAjNiTbwKKLI=;
        b=kJkC4fto0JpiKlyxBSbwm5LOrYD3Em1cHbyU8bZamXs4dwp/kIIR7ePAuFTGmAnly4
         UKc8ou9JTywqNczIt2VWMoKRhN5JNe8+8qQVtIg7a011aTiucY5TUJRcCB0mzF3D7lH1
         3+E8l6PbG+MjPg0W3ZKFJKUYFQzmM5Yc1ip/PPYjNNpBgty+5TbeyhrqVXhMPPFsP8mu
         QCe4B9ztfhydkL0hlzZzJYBlTldDeU9JaHRRuK0JkPKDW/4oOXfnGlpNAEt8LwB4hxej
         LwHtyY0751HUvQVATjd7UaI4PniEBCS9oHrl+7PSRUu5KJmXLFSrPqxC0u2HV5rHMOHK
         9lig==
X-Gm-Message-State: AOJu0Yy/LsoHdZtqt0guti6su5qQgs5DNEINxFphHQEJxasuGuNOoKOY
	d38O27TcV/CRNW72qUrnuBjjdAp8h2fUHE+SjiAd2MmtGxVFE7txEqOi7umdQLVApt1R4qXgb9Q
	NR4wm7kpndF1YX35qb6D5dmQdi9uRezg=
X-Gm-Gg: AY/fxX65mvXpxSpo4aPXO4vju3O0LLSQYOqkq7IfN2H45TABSPZgsohWe3EPtekFg0/
	ygk6LsJJGDHZMVB/NG7duWy9Ul71yvL/OOzrSPuJEC37SljFUEPBlPaoectwr25znS2LRyfUm+R
	/gsdX9eu+SUOEW5Lqcu2uvse2DcM8arOeWKARnFyU5Jh3rzvMB1BhbqjB2kPUOi4Dfa7pN+fOp6
	q083M8bNIHrdsUVBj4gKguf9wOIzC7cuMM14TrM42nCGApHN0UBpzRnhfdKe1fxh6r6RWQkflz/
	CIZ6dczj
X-Google-Smtp-Source: AGHT+IFHeit8hi546ssHn6C8YRgAnInaOUIXFPAkzwp7fpTTQiuBsGPVqGMubcseQ6h2QFwIFPzzbpfCealg8g8Zw4M=
X-Received: by 2002:a05:6402:358f:b0:64b:58c0:a393 with SMTP id
 4fb4d7f45d1cf-64b58c0a430mr793484a12.30.1766012136417; Wed, 17 Dec 2025
 14:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217202331.9449-1-rosenp@gmail.com> <20251217225247.5873449e@pumpkin>
In-Reply-To: <20251217225247.5873449e@pumpkin>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 17 Dec 2025 14:55:25 -0800
X-Gm-Features: AQt7F2pFmCpCUCE-smL3H_M06l25P1bFjBB_BV2550SebS3-4fASlsSe172g-5k
Message-ID: <CAKxU2N8yvfRDGLkwCvFS5qRKB1wnz24=SUwOp82SsHoFmhqyhw@mail.gmail.com>
Subject: Re: [PATCH] gpio: realtek-otto: use unsigned long
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 2:52=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 17 Dec 2025 12:23:31 -0800
> Rosen Penev <rosenp@gmail.com> wrote:
>
> > Fixes compilation on 64-bit platforms as pointers need a larger type.
>
> Not a good description...
>
> >
> > Change device_get_match_data to of variant. The data is obtained throug=
h
> > OF anyway.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-realtek-otto.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realt=
ek-otto.c
> > index e6694d5d1696..e9c89b191989 100644
> > --- a/drivers/gpio/gpio-realtek-otto.c
> > +++ b/drivers/gpio/gpio-realtek-otto.c
> > @@ -360,7 +360,7 @@ static int realtek_gpio_probe(struct platform_devic=
e *pdev)
> >       struct gpio_generic_chip_config config;
> >       struct device *dev =3D &pdev->dev;
> >       unsigned long gen_gc_flags;
> > -     unsigned int dev_flags;
> > +     unsigned long dev_flags;
>
> You don't need to change the type of the variable, just the cast.
Previous review was:

Just make dev_flags an unsigned long and cast
device_get_match_data(dev) to uintptr_t.

Bart
>
>         David
>
> >       struct gpio_irq_chip *girq;
> >       struct realtek_gpio_ctrl *ctrl;
> >       struct resource *res;
> > @@ -372,7 +372,7 @@ static int realtek_gpio_probe(struct platform_devic=
e *pdev)
> >       if (!ctrl)
> >               return -ENOMEM;
> >
> > -     dev_flags =3D (unsigned int) device_get_match_data(dev);
> > +     dev_flags =3D (unsigned long) of_device_get_match_data(dev);
> >
> >       ngpios =3D REALTEK_GPIO_MAX;
> >       of_property_read_u32(dev->of_node, "ngpios", &ngpios);
>

