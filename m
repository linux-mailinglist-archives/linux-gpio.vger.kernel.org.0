Return-Path: <linux-gpio+bounces-30211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E8CFCAFC
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 09:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B973014A19
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 08:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B4F2E5B05;
	Wed,  7 Jan 2026 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N3QJmVtE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B352E040E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767775978; cv=none; b=ezeRJVOjiN8GX76WabfxFGMjqfr8/7rP67/hxWXsC83mJDpQ1xqnu9AMM0NdNTmYONTmWxK8bW0CRv848YmfzlSwvr51j0LRP2b1gjOYgpfFeScncKTwSGy6E2THzWCLxtlGe8LRu5KFuVG0pGmk85nnD9MQM/zhboan0ps4YXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767775978; c=relaxed/simple;
	bh=AJLa3JYQfz0DQQzpNgfhQGKPkYNQ+104HNJBWZv6MME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0RQhOsA6prI5nbfdL0iR4/HQ6x6LkqSh7s0IsJgCQHSINX/Or+e56VCyLi6v3ZyiZ0gOSqile16802z5MAVl9K5eHyN+mJ0A+F1UIFH9i4LbsZ/fRso3GR2x/8tXJXFiEmJQFOPhGPW6sqGcLhnSQDWZQ2GwwiGN40TKJrOwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N3QJmVtE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so860156e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 00:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767775975; x=1768380775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiYR95RCX1Rsmkrjr01bGS++uVqFK5QqSvIRMgYOyW8=;
        b=N3QJmVtEe/e1zL+eDBkGamB+UxlwW1QxOe1SLGFIIuFXmWv7kBkqF9Fbf1SFid4p2q
         jPJ2EfDZe94OBnz1gYVHSl8TYIgd3O9+7Bm6cLbmCuaUJwCCq8R3+bwF9KvvqdDLl1oS
         Cv37bwMCqO5eGQL7kYTqeDAEMagVCg1hrJsmENrTUW7dvQU2ICVR8JGbvE9tGACHgRCO
         gsxk0pmxVceXT3Tss8SbzJOOmQsGLvlB5LCp7J2ETHiGg340+cKemtl80X36/Gm3CkXd
         ts/y/rn+LHZL7wkdGOyUTc5HZRnK/fM12GvLMoElZaRYqXe2S/1hpwZDDKMcUncvylni
         JiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767775975; x=1768380775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TiYR95RCX1Rsmkrjr01bGS++uVqFK5QqSvIRMgYOyW8=;
        b=cPqTi3gv/HUrEyLQhdYsO45llh1B8k2vzJ0RMM9UR/LqPw/FvyMoJkfxGBWST2Bjt6
         SAA9fnNWuLGMrFVU0TOSGuqsvBD7HIZFcR/J6rXUmDiITXbeDHhRe8pL3fwiGWy/xWLj
         cRz/KahyfibUaL6nJFknRzhqd/T3XFBbTkUlm1iDCWqCgPx0rIu3uQXVGjc2Hke87Gam
         yzGlrrF0/SVNynq42MQuE5jRo/yBDcPXAGda8op8R+71ikyzOIOC5puUnbroFh4Z9HVk
         ncCTT4FAp0YSOf66Uh82Us1H4k72Fcrde7kktuCnD5+hFd7NGqo8KVjDnItPXt8EutUG
         XtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsKEROw/rRkcDycCgNo5hq97Kd8B3AovLPpgG/8n0jd2Fnu2rQjDhteqMqH9jzZjZeyh/MDBbqkvbZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6FOU9Jw0GyjsCZu2dwKkBC3+XVyxY99hkgw87y3tnRjZpeBcn
	WUwl8RQC9rAXU/aRGNVlYUJQrzsHumckKn7JeINe+GWw6aHG8KhLnLYXDxY6lzyqElZZky+P/xL
	efiLjMAvqUDlM7FesxVVTSNrgNYG3mXMZJQOxhXHquQ==
X-Gm-Gg: AY/fxX5kwhBFeYJd0LWJnE74rE7ypZ0Jr5LYgwiGtgK4hQ5YI7vBpFXf45kDXe1OCet
	GpopSGPvqjRkYiyndt4jHA1hoe85Wqw6WJIkV4aYdjbK5QAA8AQFuV/b3aPGIsjnSiw0BSie6pG
	cxqdnGFmRZfKW4uiIk7OrGzgEKSPHC54KFjc3+muNM/u2VLkUOQoDgaH3IJ6t/Sws3xoc5eve1h
	UPra02uL6GNuUBHGyAmWTdCv6yXJulI1Ath1N6tTt1Tj4CJrVsyJOGR/0jFPK4RjjJuhD//mmXy
	qglT3SNpS/BXoUN6o30iDvR4cw==
X-Google-Smtp-Source: AGHT+IE9IVx704FMY0XD6xTVrtJ1kGE4oZVgAqbPN1AOhslR6/+G3yMJ6iR/bp+3qHVsWrcNGzl0iyDagp20t0YM4bI=
X-Received: by 2002:a05:6512:1285:b0:595:83fe:6994 with SMTP id
 2adb3069b0e04-59b6f02d0ccmr596669e87.33.1767775974640; Wed, 07 Jan 2026
 00:52:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
 <20251227180134.1262138-3-jelonek.jonas@gmail.com> <aV4b6GAGz1zyf8Xy@stanley.mountain>
In-Reply-To: <aV4b6GAGz1zyf8Xy@stanley.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 7 Jan 2026 09:52:42 +0100
X-Gm-Features: AQt7F2rgT-aQYEeRjaKCZ2mkK0VP9row9BrTgcIIcAVVObF4MOOZhMaX6OJo4Eg
Message-ID: <CAMRc=Mc39GNBXFX6DOAr3mgk=FdPTUZBaxr=6jUA+zBbNizt9A@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] gpio: add gpio-line-mux driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jonas Jelonek <jelonek.jonas@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Richard <thomas.richard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 9:40=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Sat, Dec 27, 2025 at 06:01:34PM +0000, Jonas Jelonek wrote:
> > +struct gpio_lmux {
> > +     struct gpio_chip gc;
> > +     struct mux_control *mux;
> > +     struct gpio_desc *muxed_gpio;
> > +
> > +     u32 num_gpio_mux_states;
> > +     unsigned int gpio_mux_states[] __counted_by(num_gpio_mux_states);
> > +};
> > +
> > +static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offse=
t)
> > +{
> > +     struct gpio_lmux *glm =3D gpiochip_get_data(gc);
> > +     int ret;
> > +
> > +     if (offset > gc->ngpio)
>
> This is off by one.  Should be >=3D.
>

And it's not even needed, GPIO core handles it. I'll send a patch to remove=
 it.

Bart

