Return-Path: <linux-gpio+bounces-19504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C182AA52B4
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6BA1C06332
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94935264F9D;
	Wed, 30 Apr 2025 17:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wEgiSrDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0831A3177
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034651; cv=none; b=oT1OaXhj1mWx5rUSxzdLz6aSqdo6k2vHLpBMhTsX1qz8ebQMhZ16duubg+6gG0QEUH7maevU6CD6XcAFiP0Y7CQ/s5PHO+8PgQVorXRi981yLsCfgVi7BnCHS0tJSOMdQlowEZv8sDSOvwHPxedOL/z85JC7nnFpPLXaz5bBXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034651; c=relaxed/simple;
	bh=OaA5OCQkvQnVP7nf8AXqDZtBH7PFGtrlg3Uojswc5M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdKxQNojhV2/K7w32AOesWjOYUs4dCrsAm8OK0w7z9f+yVDFeGWh+1Ov87S6iLDVuZUforFy4fk9RROQNbWJ+gn9L3TBbKoJPnVX8cW9MSrps2Re/uJlZKh+Y0wSw2MDktxcj+PhEqGDAzAt8crpRFFfO/keb3wwi0TNbAIEhJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wEgiSrDm; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30f30200b51so426311fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746034647; x=1746639447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B80QHmr+sB5OMT7DkCFdd8/2a+nIvyDwd83EjF1b7wg=;
        b=wEgiSrDm4PpSIjcw4EnkIIIArFYyjm6Q9haUgNQ/RKw3qhK51kDS61qWy497RzVCua
         80fVOm38TTTHGnJF8FCvpw3Pjc7Br3IQz30Rr0iivVfXN3ShsRdQxUM0A1e9jzp872yM
         WciFlw222dUjrrGLh/nLG3GXF5jNzh7DTD30hKTGeMABlJ6SZEwY0rB0CouP5MNEJ0vo
         a7kSoZ26W54U/U6Jt701vdd7yNzl0a0bapMZxb/chsDgKtWGi5B2NleAwwlv423wjY0N
         LhCppanyRKWo9jNiK7AWFJA2svGZ6obonekccVTObeR8Jf5Gg37Lbaek1uhu83CHepJd
         uTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034647; x=1746639447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B80QHmr+sB5OMT7DkCFdd8/2a+nIvyDwd83EjF1b7wg=;
        b=wky8TuymQFHGmkdOicRL3EwY0OY9jOqqDN1fzdM7P1HkjqJgGpNZK6FQOpaIVOjgVa
         z4Ikz64pYDmNTQlLZfvTc0Tywm7Fdxh5d9U36cTREKAtg3gjZdiVAh0Y11eKl+UNj6q9
         rDHrbVXVehLK0rOzowpUykJIJLyaNj6KRFiaDeYhqUDE0IChnimpfgj2yscneRO3Wg8+
         oOyrpWRqDAx0mhTzep4+tefBUIPf7mNPxOyzA8lpFllR7i9Hcasv7SWYNFbDFT8N5U54
         7Un6aGOoO1OYDcp2WRi5lmIdbi1/FRnVFVDRqllx8t7z4gj9Od3fzlpVvc9vv1ddOeLV
         QrPg==
X-Forwarded-Encrypted: i=1; AJvYcCXnZ9HirhgaZGIdqyo2vQ61wyklwNbb7A7+ZFPFagNpJa1jtaVDd7SLKcduTc+XNg5lMsWlPiTNFMk8@vger.kernel.org
X-Gm-Message-State: AOJu0YwbYOM3UVIxu+HNLlStSIIdBqTP8yMnzvB7yGho0UCCvLHsXUFF
	OWixh8bQDsvvso2ixsKVsm0Kr52uJsoJcIMPPDFu70KKdBmkgrrcHrAya0412GeUVFIe8kcLANM
	8voxc+4uGuCK21TSYbd9AKCydQB6zo/6IT+ElNw==
X-Gm-Gg: ASbGncv2qGCPUSpNSrigYV75JVlT11RyHSWVm0oQMxg3iUFvKEMRwCNhE0PlVHNp6ew
	7OdGZyRhnrQ2fMbdVAb8m5w9dT/OS8ETmuXpaFmpwviqe08fjxbuHT5zd4lcWk2w4HMdpy79+Gv
	BWMao4N0LE7UyzbSBB22DrqN13p7cStpSysr39JLUjICrpLdHCgGDIFg==
X-Google-Smtp-Source: AGHT+IHEUyDS2y73x5UTLVTCAeSkmZ9cGIaS0WUiShuP4klNjjtKcVRhzpqZk/qxLOTTSObt/mVmSixEfyP9TzJHf3w=
X-Received: by 2002:a05:651c:2112:b0:30b:a185:47d8 with SMTP id
 38308e7fff4ca-31e69d17438mr13186651fa.4.1746034647109; Wed, 30 Apr 2025
 10:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org> <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
In-Reply-To: <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Apr 2025 19:37:14 +0200
X-Gm-Features: ATxdqUEh34Gz1POqWO9v2IKaGBTgS6zz7pi2s7vMr2oV8EN8tMuslc97xocJ6hQ
Message-ID: <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 7:33=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/04/2025 =C3=A0 09:21, Bartosz Golaszewski a =C3=A9crit :
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powe=
rpc/platforms/83xx/mcu_mpc8349emitx.c
> > index 4d8fa9ed1a67..d4ba6dbb86b2 100644
> > --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> > +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> > @@ -92,7 +92,7 @@ static void mcu_power_off(void)
> >       mutex_unlock(&mcu->lock);
> >   }
> >
> > -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int =
val)
> > +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v=
al)
> >   {
> >       struct mcu *mcu =3D gpiochip_get_data(gc);
> >       u8 bit =3D 1 << (4 + gpio);
> > @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsi=
gned int gpio, int val)
> >
> >       i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctr=
l);
> >       mutex_unlock(&mcu->lock);
> > +
> > +     return 0;
>
> i2c_smbus_write_byte_data() can fail, why not return the value returned
> by i2c_smbus_write_byte_data() ?
>

The calls to i2c_smbus_write_byte_data() in this driver are
universally not checked. I cannot test it and wasn't sure if that's on
purpose so I decided to stay safe. Someone who has access to this
platform could potentially fix it across the file.

Bartosz

> >   }
> >
> >   static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, =
int val)
> > @@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
> >       gc->can_sleep =3D 1;
> >       gc->ngpio =3D MCU_NUM_GPIO;
> >       gc->base =3D -1;
> > -     gc->set =3D mcu_gpio_set;
> > +     gc->set_rv =3D mcu_gpio_set;
> >       gc->direction_output =3D mcu_gpio_dir_out;
> >       gc->parent =3D dev;
> >
> >
>

