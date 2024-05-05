Return-Path: <linux-gpio+bounces-6115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF488BC08C
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 15:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2B8D1C20B33
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 13:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319DA1CF8F;
	Sun,  5 May 2024 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpijnvm9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2F1BC5C
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714916109; cv=none; b=RHxd/D6IJrvIPCW1wUSwqVhYhIC+82eE5rNn3HBj/pYSbA0IeUUx1mRUQSUua6ipZZIqD8o4aXJibv56NVa1UDisB2ZXwCG9WGnvquVfJGt32ysF625pn2J3QHNwryJGTijf/YRd+0rkXiKdxlmRdzrTLHdMNEaBYzmMi/bV2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714916109; c=relaxed/simple;
	bh=IT4pco8MAZnL50CLW4X0zxFp4FEEkZqP0SFsyNpVTN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeLa3tSEYGTTZDS2KiGW6FoxsFXpDbgtK6ZO5lFE25uWWmvZvqBmEMvDSxq0ExYohdt1Mub3nNbHzq1gTTksnAovsuRLdppEYPmgOuO9nxj5PVueTC5xEy7l0NXD0YNlQjM0QGhUs7fys8PJdf+gy7eishwri/dQDVPxUHV1GOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpijnvm9; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59b81d087aso149143966b.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2024 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714916105; x=1715520905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPcqfr+g+bSXYm7pimJ3InvzS+CyypGlpNPh0xMs/rc=;
        b=Hpijnvm9xc5gZs7zBjyYBMlXRcITw2pfo16mOXfR/qd5Jqipylx6aF2VQEan5T6ElM
         T/UjXezK8g8MGOOa7EyRLAWD+eVML6gNulPufAp9Ot7QYlAImAucwzmCy/z8pHsBWGb3
         quvYH25VPGlJPD8GUN625Hh1qMnLYiHAH0LNOV5dMuAK7qtrqvmj7DsWjTTki26Lvbtf
         EAlvmxRUSDWIlDnkf9qHEL1SYCBBJDBbqoXOCcnav0iAenD3zNn3rzIEFiPQ0HwLOHjA
         Z+qoNjhcfcuhgU2idVYqpYzjqP2H3Pa074+LT2sCn0oIGiSBgLvJaurBp9IK3lBuvOnP
         +j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714916105; x=1715520905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPcqfr+g+bSXYm7pimJ3InvzS+CyypGlpNPh0xMs/rc=;
        b=YIlnE6UWI5UCikd4bK7nTyyWAu0Vlhq44GbuqUSl3hnoZ0WxYijhfnePyuzHG983OE
         KOYeWr7BZCsaB4bxs6vzrl1+8Klfsgg0bJXNTtvEiP/nSgKbjCUmC2jG9NZiyYi8jXL4
         3wCrmfTt1DfMLvDPO3lQF0OO+XhwDlj3hSBle8cdSWVTLto8pd62/f/O78p0ZcKiBAZ6
         wH2dzO8LUPvP3X3/0ZA25V1tRVdJcJYCpLuhZZwxeJaorWbqGZCyNUqIdUc5XjFFA6pu
         gJ0brAeTmMO81dKnT1n4xYYBRzM80+RD7XamTXG19VbH42Czg8gLwoyfi2viAqvi/7Pl
         owLw==
X-Forwarded-Encrypted: i=1; AJvYcCXWco8W5jKDjfqMMRJQcv/b5Wtc7AHea+4qvNd1dHyHAte+3OJsEmQyfq/7ffzY4Y7Y8JJvWOsmz59lno38kZrVd2Bz3l+JqB4akg==
X-Gm-Message-State: AOJu0YzijguJPO7ezKw202LHpjWelEg2fkBrPTGG91RHehd1W2ttmbGl
	Kwn27s5pZGflsga0mz28VTjPb2gRbJkqehwGuBLNlKli++9K3j2da2ilYajoowCZUlq0SOV/NMr
	hbFDU7aHbWollGWVnqnBxeyhV46U=
X-Google-Smtp-Source: AGHT+IGVMzODczjSb3xYifmUIjM97SrQLtGh7kNjX1SuDadTH6xGpEbH9YZyMj+ajPCbWymnZ+I+P2vRO2HVR89KP4o=
X-Received: by 2002:a17:906:608d:b0:a58:7ea5:c49b with SMTP id
 t13-20020a170906608d00b00a587ea5c49bmr6427702ejj.42.1714916104913; Sun, 05
 May 2024 06:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503082714.ow5qtqu2myi3z2ug@kandell> <ZjUyJSuGthKH0q4q@smile.fi.intel.com>
 <20240505081832.vf2267v37shu6fhe@kandell>
In-Reply-To: <20240505081832.vf2267v37shu6fhe@kandell>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 5 May 2024 16:34:28 +0300
Message-ID: <CAHp75VcDi5hbG3wzygBJ=iGteVrzJp08sKD0cJyS1vvkx8fo6Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support for
 MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 11:18=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
> On Fri, May 03, 2024 at 09:51:17PM +0300, Andy Shevchenko wrote:
> > On Fri, May 03, 2024 at 10:28:17AM +0200, Marek Beh=C3=BAn wrote:
> > > On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@ker=
nel.org> wrote:

...

> > > > > +static const char * const omnia_mcu_gpio_templates[64] =3D {
> > > > > +       /* GPIOs with value read from the 16-bit wide status */
> > > > > +       [4]  =3D "gpio%u.MiniPCIe0 Card Detect",
> > > > > +       [5]  =3D "gpio%u.MiniPCIe0 mSATA Indicator",
> > > > > +       [6]  =3D "gpio%u.Front USB3 port over-current",
> > > > > +       [7]  =3D "gpio%u.Rear USB3 port over-current",
> > > > > +       [8]  =3D "gpio%u.Front USB3 port power",
> > > > > +       [9]  =3D "gpio%u.Rear USB3 port power",
> > > > > +       [12] =3D "gpio%u.Front Button",
> > > > > +
> > > > > +       /* GPIOs with value read from the 32-bit wide extended st=
atus */
> > > > > +       [16] =3D "gpio%u.SFP nDET",
> > > > > +       [28] =3D "gpio%u.MiniPCIe0 LED",
> > > > > +       [29] =3D "gpio%u.MiniPCIe1 LED",
> > > > > +       [30] =3D "gpio%u.MiniPCIe2 LED",
> > > > > +       [31] =3D "gpio%u.MiniPCIe0 PAN LED",
> > > > > +       [32] =3D "gpio%u.MiniPCIe1 PAN LED",
> > > > > +       [33] =3D "gpio%u.MiniPCIe2 PAN LED",
> > > > > +       [34] =3D "gpio%u.WAN PHY LED0",
> > > > > +       [35] =3D "gpio%u.WAN PHY LED1",
> > > > > +       [36] =3D "gpio%u.LAN switch p0 LED0",
> > > > > +       [37] =3D "gpio%u.LAN switch p0 LED1",
> > > > > +       [38] =3D "gpio%u.LAN switch p1 LED0",
> > > > > +       [39] =3D "gpio%u.LAN switch p1 LED1",
> > > > > +       [40] =3D "gpio%u.LAN switch p2 LED0",
> > > > > +       [41] =3D "gpio%u.LAN switch p2 LED1",
> > > > > +       [42] =3D "gpio%u.LAN switch p3 LED0",
> > > > > +       [43] =3D "gpio%u.LAN switch p3 LED1",
> > > > > +       [44] =3D "gpio%u.LAN switch p4 LED0",
> > > > > +       [45] =3D "gpio%u.LAN switch p4 LED1",
> > > > > +       [46] =3D "gpio%u.LAN switch p5 LED0",
> > > > > +       [47] =3D "gpio%u.LAN switch p5 LED1",
> > > > > +
> > > > > +       /* GPIOs with value read from the 16-bit wide extended co=
ntrol status */
> > > > > +       [48] =3D "gpio%u.eMMC nRESET",
> > > > > +       [49] =3D "gpio%u.LAN switch nRESET",
> > > > > +       [50] =3D "gpio%u.WAN PHY nRESET",
> > > > > +       [51] =3D "gpio%u.MiniPCIe0 nPERST",
> > > > > +       [52] =3D "gpio%u.MiniPCIe1 nPERST",
> > > > > +       [53] =3D "gpio%u.MiniPCIe2 nPERST",
> > > > > +       [54] =3D "gpio%u.WAN PHY SFP mux",
> > > > > +};
> > > >
> > > > You may reduce the memory footprint of these just by doing "gpio%u.=
"
> > > > part(s) outside. Here compiler won't compress this (as in the case =
of
> > > > repetitive string literals),
> > >
> > > Are you saying that I should dynamically create another array just to
> > > pass it to the gpiochip's names pointer?
> >
> > I have looked into this again and now I'm puzzled how you tested this.
> > To me it seems that those gpio%u will go as a fixed string to the user =
space,
> > there is no %u --> number substitution happens. Moreover, this data any=
way
> > is redundant. Userspace and debugfs all have line numbers being printed=
.
> >
>
> It gets substituted in drivers/gpio/gpiolib-sysfs.c, function
> gpiod_export():
>
>   dev =3D device_create_with_groups(&gpio_class, &gdev->dev,
>                                   MKDEV(0, 0), data, gpio_groups,
>                                   ioname ? ioname : "gpio%u",
>                                   desc_to_gpio(desc));
>
> The ioname variable contains the string.
>
> This is then visible in sysfs:
>
>   $ cd /sys/class/gpio
>   $ echo 560 >export
>   $ ls
>   ...
>   gpio560.eMMC nRESET
>   ...

Interesting. But before giving my conclusion on this, what is the
output of /sys/kernel/debug/gpio and `gpioinfo` (the latter from
libgpiod)?

--=20
With Best Regards,
Andy Shevchenko

