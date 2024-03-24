Return-Path: <linux-gpio+bounces-4588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B50887D7B
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 16:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7981F21365
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 15:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4617418645;
	Sun, 24 Mar 2024 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWS84ImU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569062107;
	Sun, 24 Mar 2024 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711294280; cv=none; b=irHRMUcXW7xLWtkcZvNAlJGVQzydcCZ80krqLxqrmYtZ4785vIpD804Xvv1ywQjUVVdF8ausox+7/0kkXxzE0t5XGQuZSNYEunflmJPmCObCf0SQ4avnSq7NCJsQ7uyrYNu+BxSfNKJMwz00tWQk3MjlHu/JbdaUSqfRj5kvmvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711294280; c=relaxed/simple;
	bh=S+GaQjrNb/EhjPXJ+uajhzrduqSzJCgI9RRxr1vo4zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJ2pGq6qPTKKdTEVkDMoOIoCFx3n7R3UGW2H7ZHuJS/l91FQuFbrmEVnCIfiiIdFXoSaA/nAc0ZNYRoOADhEQSFaCWisFofH0ugEkGKaG93XE6yI+KayenvPxvbBs6EHR4njwAJQgqmd2AlR2LiIEcBBQsdTmIJl2tF7pBvyw98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWS84ImU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513d212f818so4100915e87.2;
        Sun, 24 Mar 2024 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711294276; x=1711899076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h9CkCjrhT3P+set+37h9vZa3QRZIGn/XuauQXUeDHQ=;
        b=BWS84ImUgkSE7b0RNhVmlqbE7vBliEw434moMSHbZPy08ge/G7MYYob0hFUO2NvVJt
         0SZMq9pQBtNOP7zYMXE+MvrohTLudkdF3XlKqREnerQLW30k1/AL62ZWg7dxXcyCi9Zq
         AsQ/h4QEo7JvIRbgAZ/0GnXALeGpsFCQkiHoPDuYRsufa2xNfByVOgGIHxcKcQ6ep0rP
         tRHxpP3QDODgHswkeo6txMthIaycXktveYcsNpr7N2nYvplLOX8fNutDPaWUYQgPt1L0
         MLFeemboT0l6R1SIsCz4J8uFLfFlRxT5yIbIK1SBZmyg0eq8CwK99Av+OmshpLqO1bmG
         Skgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711294276; x=1711899076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h9CkCjrhT3P+set+37h9vZa3QRZIGn/XuauQXUeDHQ=;
        b=LlFuGF/qvTWZdBFgJK4JRt1xCEkre9VN2a0zQaiCKXgdx+9k7h9B+NG4abaCGe8g9g
         n58xs1zIs9Nd4/meMjfQw2vpjrvkvxK8PqUqLhVVLS+jF4EeZBhEZ29mbR41SWrzlaHX
         ITU9WtuNqWfADDuJ3Nyk0cOpjCwwJyv+tfkK0YoeIliUMQ4+BtHmsHyAIeBrNPh4Hd55
         BhdXTP9ms0bOsbO5gBi2IuVpEXu9m3y/dn/Ba9UitQmfI8YzTtgy3MBy27USyjM+YoRQ
         nmBc4M9ESjz/xii0JZWQX9lwDz+oU23CDgHnrunJHe3FlZ3lUkkv9F0UGqJvF+96ceaA
         s2sw==
X-Forwarded-Encrypted: i=1; AJvYcCU6CrLFUPIeuAsldYhVPzbSGDYnHIAgO5uj+SS+ojaZ+TV8FtmQtwlX1+dtPxtsSeznZtj6XJ19ONE4pTtCEGSmGvYwljODhOWzyuQliI+3i1deENqyG9/tSicvV1BG6qTUOkM1xfF71XLAjyG+95tC/ZNiIjqjvqaNeiYv+9F9KF5ETC7i
X-Gm-Message-State: AOJu0Yxq0pWKbx5g48fIxPWjBfOZQsF3h6CMlWjK4rfh1MqDmUa7c9Cc
	CeEzePy1cpoFnVBkzKIM5h7c9vQhGA0X5+PlITlv4woGrCfvG9dJO/hRchXNYMyu/VZPWqXqnut
	G9MFW67O7AcwAowtoheYBVkAMyNo=
X-Google-Smtp-Source: AGHT+IF1hgt89EHgXPEmK77BTi70jUOCk3tAdabwBOn4F1ZNKwy73xPE4h3/tpPQKJQSRKtU/HT7oaL8f7mcIJopj70=
X-Received: by 2002:ac2:4d95:0:b0:513:5bdb:10f7 with SMTP id
 g21-20020ac24d95000000b005135bdb10f7mr2979461lfe.14.1711294276178; Sun, 24
 Mar 2024 08:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323164359.21642-1-kabel@kernel.org> <20240323164359.21642-3-kabel@kernel.org>
 <ZgAII1B03bLUisWr@surfacebook.localdomain> <20240324160408.77c8574e@thinkpad>
In-Reply-To: <20240324160408.77c8574e@thinkpad>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 24 Mar 2024 17:30:39 +0200
Message-ID: <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org, 
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2024 at 5:04=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Hi Andy,
>
> thank you very much for the review. I have some notes and some
> questions, see below.

Btw, I'll look into other patches next week.

> On Sun, 24 Mar 2024 13:01:55 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > Sat, Mar 23, 2024 at 05:43:50PM +0100, Marek Beh=C3=BAn kirjoitti:

...

> > > +   err =3D omnia_cmd_read(mcu->client, bootloader ? CMD_GET_FW_VERSI=
ON_BOOT :
> > > +                                                  CMD_GET_FW_VERSION=
_APP,
> > > +                        reply, sizeof(reply));
> >
> > Wouldn't be better to have a logical split?
> >
> >       err =3D omnia_cmd_read(mcu->client,
> >                            bootloader ? CMD_GET_FW_VERSION_BOOT : CMD_G=
ET_FW_VERSION_APP,
> >                            reply, sizeof(reply));
>
> Changed for v6 to
>
> >       err =3D omnia_cmd_read(mcu->client,
> >                            bootloader ? CMD_GET_FW_VERSION_BOOT
> >                                       : CMD_GET_FW_VERSION_APP,
> >                            reply, sizeof(reply));
>
> There are still some people wanting only 80 columns, and the whole
> driver is written that way.

Hmm... Is it still a hard limit for drivers/platform/cznic for the _new_ co=
de?

> > ?

...

> > > +static ssize_t fw_features_show(struct device *dev, struct device_at=
tribute *a,
> > > +                           char *buf)
> >
> > One line?
>
> 80 columns...

Ditto.

...

> > > +static const struct attribute_group *omnia_mcu_groups[] =3D {
> > > +   &omnia_mcu_base_group,
> > > +   NULL
> > > +};
> >
> > __ATTRIBUTE_GROUPS()
>
> The next patches add more groups into this array, after the whole
> series it looks like this:
>
> static const struct attribute_group *omnia_mcu_groups[] =3D {
>         &omnia_mcu_base_group,
>         &omnia_mcu_gpio_group,
>         &omnia_mcu_poweroff_group,
>         NULL
> };
>
> There is no macro for that.

Good point.

> Should I still use __ATTRIBUTE_GROUPS() in
> the first patch and than change it in the next one?

...

> > > +static inline int omnia_cmd_read(const struct i2c_client *client, u8=
 cmd,
> > > +                            void *reply, unsigned int len)
> > > +{
> >
> > Why is this in the header?
>
> I considered it a helper function that should be defined in the header
> file, like the rest of the cmd helpers in this file. If you disagree, I
> will put it into the -base.c file.

I don't see the technical justification to hold it in the *.h rather
than *.c. To me this one is big enough in C and likely in assembly to
be copied to each user. Besides that aspect, it slows down the build a
lot (mostly due to i2c.h inclusion which otherwise is not needed).

> > > +   struct i2c_msg msgs[2];
> > > +   int ret;
> > > +
> > > +   msgs[0].addr =3D client->addr;
> > > +   msgs[0].flags =3D 0;
> > > +   msgs[0].len =3D 1;
> > > +   msgs[0].buf =3D &cmd;
> > > +   msgs[1].addr =3D client->addr;
> > > +   msgs[1].flags =3D I2C_M_RD;
> > > +   msgs[1].len =3D len;
> > > +   msgs[1].buf =3D reply;
> > > +
> > > +   ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > > +   if (ret < 0)
> > > +           return ret;
> > > +   if (ret !=3D ARRAY_SIZE(msgs))
> > > +           return -EIO;
> > > +
> > > +   return 0;
> > > +}

--=20
With Best Regards,
Andy Shevchenko

