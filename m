Return-Path: <linux-gpio+bounces-3523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352BE85BFED
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 16:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6746DB20F3F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B99C763F2;
	Tue, 20 Feb 2024 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wOgW8k+2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391A763F4
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708443025; cv=none; b=n3RtBUma2CGK5wWnPcvDThSf6vl2vn3+/Xvl/Dj7NO7G/JB5ddvMD4G3yfyJ7N4O+O1sxbhf4FgGhWfXcszMMvtpMg81HGjRAjH9SNhbN9fKF5EcYrk9aEW/noJetxzLQI8tu+UDEPrA6IcTWQblO3LLyTn+URbKtQJ3N04N7vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708443025; c=relaxed/simple;
	bh=1sj9S9jNhooUQ/JS/m+MJGrY/bY6bz7kPiE07BuNenc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhRWjlxAIufzZZ0S7+cj1ibLjwOKKUxS7mXoy786GzfGSrAfzY8g1aWTd2GwUGMlxetl5gFgw1Xm5vBjWkLujiJpGkuahqMZVQJcCS30bBduRd2AFpNOwR+GOCgyGUSnTuighV+P9pkOrv9KgkahBE92gJrNIxRkbRgjds1QrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wOgW8k+2; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4cdfcb24b79so274731e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708443023; x=1709047823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgAso/jjSQp7QM9VPQ9nrwybvQpA1gALdpKpuAZ8dWc=;
        b=wOgW8k+2nRZz/h8xwM0hTH9Rg+E2wpKtri5N55GgZ/9GeYx12sqrHvoBfnZY30NxIK
         ItoFPe0igBCLXTRsIWWBgOHX+EzXnCMBG9hW2iShEhXsYQH6Jr6LCojBWr3x9WSwkBoY
         pT/qLZKDnuP4PnT3NwdIejlN3Ixqn4iCvuWLX6xjoNGrQ9tKXpxatld/nDR2NsIOw00y
         dKnhhQTn2VGUJi2BwFwOEi+lxDDu8As45bf54X4I7U7dAswEhvb+IT1OQi0zrHkYm8Gn
         eqTyomggut+Ob06a7ufU8w9FglBkIe9B0q7DyV70TCo2WIZ7xENAfpCD+0mppMrTPRP/
         8x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708443023; x=1709047823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgAso/jjSQp7QM9VPQ9nrwybvQpA1gALdpKpuAZ8dWc=;
        b=IXS/vKw4pv+6NOIYzl4QEBzRC9EtQUm/gsJImxZexSau/PDLpT2w7VY4W3Yi0O4pDN
         CkyWxkp2bLKDRx5n5EvkqTNLKjgYQ+6PiZUuBlFV91NAC/dBMZ+lnKOM8VjA2sAjHEH5
         M8/7K7iPTJpVY5NAGo7opdxV9GkH8MfysQf+bu8lMUz7rEo9YGAMN6HKk5m0PSQt4pRB
         l0ATaktEHtdPW2QFUxAoXfyG2vBd3/k8uhIz0Spk8jY1YJUWg1ctzj1BoJkQyty/7oXO
         Vd0AGm7kH4eeYbiHXlLmxmtwwuUkkmfqmboVOMoye7vhMxn2gb4CbwJa8kG58+wrsm2V
         owXA==
X-Forwarded-Encrypted: i=1; AJvYcCXmMTsY0a+yx4mNh8CrzS+BPd3GsCoehdUXmiZzPnYVgDKLz3lwkaevl2T5flp+EZB9GyfeS+oWSLS3wYftjmUwtD50F9Oyw6MkLw==
X-Gm-Message-State: AOJu0YwaQB4MQM6xWnjbYhJI4Ysb0m/NiJZ+gAhqAmXJ90TCwcRer9Ac
	7HMZshcbLWhk/2NwPybNZ5vkV9cTHoG3uyeiiQ2gc9EmisX2rcdc+DBeRGiIPvNgmmuFkeNEGqf
	E+og3ZVpvecpXT+df9i25zcCOrjmiV7NVockjkA==
X-Google-Smtp-Source: AGHT+IHgHbSp0Z/+ECASGBhOI1+VwVoeQh+pGTK7r7JGg5XT4Qi7soYBIVRbn0t4RuO6kjK1BcSbECjqI4xybj/MP+8=
X-Received: by 2002:a1f:4c84:0:b0:4c0:774b:e7b0 with SMTP id
 z126-20020a1f4c84000000b004c0774be7b0mr10166207vka.13.1708443022732; Tue, 20
 Feb 2024 07:30:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220133950.138452-1-herve.codina@bootlin.com>
 <CAMRc=MfWPEOHeNvAwra-JxHZBFMrQbP+273zbFLDZfxi7fx8Yg@mail.gmail.com> <20240220155347.693e46e1@bootlin.com>
In-Reply-To: <20240220155347.693e46e1@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 16:30:11 +0100
Message-ID: <CAMRc=MeSgCOLZvFOXF4eQOp=bTz38K5Krzuy9r569-jnDx1zFA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] leds: gpio: Add devlink between the leds-gpio
 device and the gpio used.
To: Herve Codina <herve.codina@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 3:53=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> On Tue, 20 Feb 2024 15:19:57 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Tue, Feb 20, 2024 at 2:39=E2=80=AFPM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > Hi,
> > >
> > > Note: Resent this series with Saravana added in Cc.
> > >
> > > When a gpio used by the leds-gpio device is removed, the leds-gpio
> > > device continues to use this gpio. Also, when the gpio is back, the
> > > leds-gpio still uses the old removed gpio.
> > >
> > > A consumer/supplier relationship is missing between the leds-gpio dev=
ice
> > > (consumer) and the gpio used (supplier).
> > >
> > > This series adds an addionnal devlink between this two device.
> > > With this link when the gpio is removed, the leds-gpio device is also
> > > removed.
> > >
> > > Best regards,
> > > Herv=C3=A9 Codina
> > >
> > > Herve Codina (2):
> > >   gpiolib: Introduce gpiod_device_add_link()
> > >   leds: gpio: Add devlinks between the gpio consumed and the gpio led=
s
> > >     device
> > >
> > >  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
> > >  drivers/leds/leds-gpio.c      | 15 +++++++++++++++
> > >  include/linux/gpio/consumer.h |  5 +++++
> > >  3 files changed, 52 insertions(+)
> > >
> > > --
> > > 2.43.0
> > >
> >
> > Can you add some more context here in the form of DT snippets that
> > lead to this being needed?
>
> / {
>         leds-dock {
>                 compatible =3D "gpio-leds";
>
>                 led-5 {
>                         label =3D "dock:alarm:red";
>                         gpios =3D <&tca6424_dock_2 12 GPIO_ACTIVE_HIGH>;
>                 };

Do I understand correctly that the devlink is created between "led-5"
and "tca6424_dock_2" but actually should also be created between
"leds-dock" and "tca6424_dock_2"?

Bartosz

>
>                 led-6 {
>                         label =3D "dock:alarm:yellow";
>                         gpios =3D <&tca6424_dock_2 13 GPIO_ACTIVE_HIGH>;
>                 };
>
>                 led-7 {
>                         label =3D "dock:alarm:blue";
>                         gpios =3D <&tca6424_dock_2 14 GPIO_ACTIVE_HIGH>;
>                 };
>         };
>
>         ...
>         i2c5 {
>                 ...
>                 tca6424_dock_2: gpio@23 {
>                         compatible =3D "ti,tca6424";
>                         reg =3D <0x23>;
>                         gpio-controller;
>                         #gpio-cells =3D <2>;
>                         interrupt-parent =3D <&tca6424_dock_1>;
>                         interrupts =3D <23 IRQ_TYPE_EDGE_FALLING>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
>                         vcc-supply =3D <&reg_dock_ctrl_3v3>;
>                 };
>                 tca6424_dock_1: gpio@22 {
>                         compatible =3D "ti,tca6424";
>                         reg =3D <0x22>;
>                         gpio-controller;
>                         #gpio-cells =3D <2>;
>                         interrupt-parent =3D <&gpio4>;
>                         interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
>                         vcc-supply =3D <&reg_dock_ctrl_3v3>;
>                 };
>         };
> };
>
> Also, had the exact same issue if I use a SoC gpio chip instead of an
> i2c gpio expander.
>
> Best regards,
> Herv=C3=A9

