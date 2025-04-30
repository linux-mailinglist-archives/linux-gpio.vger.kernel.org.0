Return-Path: <linux-gpio+bounces-19505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426DAA52E3
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 347AF7A5815
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D9B262807;
	Wed, 30 Apr 2025 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bh1QSUkf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78C8635B
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035313; cv=none; b=f4qucM/9h76B3C4XsJwWvRoMFl0JkcAbC+iQgHy2nC7NblNr/Ac0z/QiKcDPOfIzYh02cNsaxHtgM9ue+4ozUU2Wb8mwFnEssLUH4loRzKRaaTYaBB0ecgHHfrlhjvxbvf9eOX6Q9eARIGlcLqBmaOelzMgkobIPb1kvXiF73hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035313; c=relaxed/simple;
	bh=Xd//+EUjjM9fMWyNAsySAoIwP/Y9zNlTjX3ZSwAAHBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyuadAdHPnZeOLQ5N4PNrMRBnKTU+yoU37EQXrYcO6avB7aw1k0vZ022iN+dAF4zTOg0x7KP8Ygz7/DcR0HwsX+JrerMp5FCFB/USt0As16ERJiNXdQJy/wK/7T1hRcRZoSpo77Vq5v0A8JSA0CSl4kCP8r4BF2peQBvF/vlB0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bh1QSUkf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499614d3d2so158264e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746035310; x=1746640110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpJGX9+h+gTHIetaz3YRmMwjLsCGItIjG65DtWufLYY=;
        b=bh1QSUkfdnmGbKRyb73JojgTSfHRTbcAWT9Z0fd7O6M9vM9u90butYb5sTy78YT5+H
         3NHCrF8vuIKccFD03GGvOLPTdJtEyCIx06wRVjuzq4nf8/sH9TI7+YRO1tM3vbZAnFCC
         vr2TVWZEiGmTPgbfB5WXmMAmI1EEqvYpoltF1we5/4pcGedcFo/9lsYEqCP37FTJLXSS
         /Y0uTuqkGLWd4GpfwyIAklVahlYuFAdsDgBCUSYGaqsYire5dUt3wqPf7EDeD7WUOiO8
         YeSHn949lOTiDF7KOFKqpyPdbu2BSmAUW1zn5CZS9oHZVexZMfJLakd4pu01Ry1I245U
         QxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035310; x=1746640110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpJGX9+h+gTHIetaz3YRmMwjLsCGItIjG65DtWufLYY=;
        b=tQuyULibR9Pr4FPGkY3SGuqIxHHYVa0Y8nz7vMm/xuMVOmXfVohU8ZXi7uf1AMPWp/
         DWES+Yb7+otrnsUXHFVxr3Rlc6v+2j4A+pE4vPZx/ABpo1f2vq0oGul1IgWC6ba3Oj2c
         Bw/hVyCqnlILULx0Lhmp3oHv/90k9wvfmyrzhYb3ZbWRE3H7Ygm9T3M/0yayQxbcXe0o
         MQ1cWid3Pl/oz5ItRVedjwXa5RbHePthXV72lIKXeZ6TcQntcqDnegaxB11dK3M5CPgh
         nVV6NoFV0VQKaFEhfHKJY+zFMtGVZzYRDUQKkohf7M/1A1XZJEIy7lH1lYox+Akfimv8
         Kggw==
X-Forwarded-Encrypted: i=1; AJvYcCXU7mHjDJbhv8aWddSu5lRjh3pfawMBGCLMgUW5Ja+wXfJJ/Cr9twUw8qrCMZ31O9eBjdU+pn8Kr2T+@vger.kernel.org
X-Gm-Message-State: AOJu0YztJA9CwY0vS7LR2fY6S4vz9fflLzX0lXCIr8tvSdoZZYSuEDKx
	pYt7lOgDRo6gw4CT2tN4R32TVsqCjYDy0CF18WauOJlhmYyw9IP3zR8g9gVSKKOvx2I/q+gHARJ
	x9GaN77hiMUquZEk0s491RShMTm2nevHjMNQGEw==
X-Gm-Gg: ASbGncudA5yOou+YCBTAWOvNdwWEEVjbx9k74oVLZDSWeFjnnTc4WqwXvr/Vch+lw7N
	niLr9S/0CPTeHNoyuR4ZwKn5J6/ADEWwnoZe9svnC09qFhsQcdmATrCuGzTdhPG00JUVg1THzII
	9xh1l59JVLi3MqfmygJH95zkJgj4GS17DxCzLI1HAw2s5/dFmUCF5DHw==
X-Google-Smtp-Source: AGHT+IFQ67uvPfDk2IC9gMdbwUwG5ozHU8ifWNIm2kpJQe5MUQrHtoSLGWBpWg5s+akHjnbM1ZGlWV32hbFW1I86oMY=
X-Received: by 2002:ac2:4e07:0:b0:54d:68bd:2856 with SMTP id
 2adb3069b0e04-54ea3363a60mr1289824e87.24.1746035309924; Wed, 30 Apr 2025
 10:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
 <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu> <CAMRc=MesdgXAivzDnm1RW-jcxs_5goZiyKvK0-JLwqDv=9F6LQ@mail.gmail.com>
 <11e1a1e7-7bd3-4d48-804c-45b53b5e15d5@csgroup.eu>
In-Reply-To: <11e1a1e7-7bd3-4d48-804c-45b53b5e15d5@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Apr 2025 19:48:19 +0200
X-Gm-Features: ATxdqUGjB0gCz481F3EdLKjtPBE29miYqhVUozl3mGg7-bSczgf2pXdTmq-UqSY
Message-ID: <CAMRc=McOxP5j=HTm6xybdr_09X-khHcanz4chfEwa-m6y1+gZQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 7:47=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/04/2025 =C3=A0 19:37, Bartosz Golaszewski a =C3=A9crit :
> > On Wed, Apr 30, 2025 at 7:33=E2=80=AFPM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 08/04/2025 =C3=A0 09:21, Bartosz Golaszewski a =C3=A9crit :
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> struct gpio_chip now has callbacks for setting line values that retur=
n
> >>> an integer, allowing to indicate failures. Convert the driver to usin=
g
> >>> them.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
> >>>    1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/po=
werpc/platforms/83xx/mcu_mpc8349emitx.c
> >>> index 4d8fa9ed1a67..d4ba6dbb86b2 100644
> >>> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> >>> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> >>> @@ -92,7 +92,7 @@ static void mcu_power_off(void)
> >>>        mutex_unlock(&mcu->lock);
> >>>    }
> >>>
> >>> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, in=
t val)
> >>> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >>>    {
> >>>        struct mcu *mcu =3D gpiochip_get_data(gc);
> >>>        u8 bit =3D 1 << (4 + gpio);
> >>> @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, un=
signed int gpio, int val)
> >>>
> >>>        i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_=
ctrl);
> >>>        mutex_unlock(&mcu->lock);
> >>> +
> >>> +     return 0;
> >>
> >> i2c_smbus_write_byte_data() can fail, why not return the value returne=
d
> >> by i2c_smbus_write_byte_data() ?
> >>
> >
> > The calls to i2c_smbus_write_byte_data() in this driver are
> > universally not checked. I cannot test it and wasn't sure if that's on
> > purpose so I decided to stay safe. Someone who has access to this
> > platform could potentially fix it across the file.
>
> As far as I can see this function is called three times in this file.
>
> First time is in mcu_power_off(), which must return void.
> Second time is inside a forever loop in shutdown_thread_fn(), and I
> can't see what could be done with the returned value.
>
> Last time is in the function you are changing. Wouldn't it make sense to
> take the value into account here ? IIUC it is the purpose of the change,
> isn't it ?
>
> Christophe
>

Sure, I can do it. The purpose is first and foremost to convert all
drivers so that we can drop the old callbacks but I see what you mean.

Bart

