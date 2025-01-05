Return-Path: <linux-gpio+bounces-14516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A72A018DC
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jan 2025 10:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D74997A1752
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jan 2025 09:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65AF13BACC;
	Sun,  5 Jan 2025 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2ZfgUm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31389182D0;
	Sun,  5 Jan 2025 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736069540; cv=none; b=oHMZjK3Aj2dF1Sdnmm1mwV+cUBZr83joJKtrkfh98co/3QkKPJfuc9Kos2ooc3+Sq6dpkvg31FB5LvjIpqC2QR8tqauURCo3usqVvzVZKRPY98Qwhx7rHcDunxhPE2qp18hQnZmguzORsjFvc1XDdF52pvE6+O/MYEuLVJWg2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736069540; c=relaxed/simple;
	bh=OKi9FWzxbZRKdJia6xGya43IODbm7dG3XWCrNRbI1eQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgFkPSawu9WEYgW2VEm4We/pNdul8/E+dJ+QSDJquJi0LZigy7ENhSYW89mek5xdDWVgss0tuPwvA8d7dthZqECU4WI7bDVUh/+9hACKMvdNhhIJA/msVEI3AjkX8OaMoLQVMe04kjQnCNtlQHiDf0JTFXPGvSgwka47KYvgmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2ZfgUm+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2efded08c79so15099296a91.0;
        Sun, 05 Jan 2025 01:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736069538; x=1736674338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPyjAuxu9OdnpqfGMOb0evLmjsg/kCx7+hs5rWlx0JE=;
        b=c2ZfgUm+8QvNd9xPmmRDayCbmuMEXzxv11+sp1IGwPeLOjuHyFIjBWoxJecP6yb7+c
         WWV106ehpMrVpbguWAq5PfnfGSphyn/SCfQn4ezvV3G6AsOlcAP5BettbjTzuRPYnS0G
         FnNg48C7AdLhWmVY4Bfp7LHVt4uryDuH2Zup3ursVoid5hetAe2VNHFo2aVAPaRyeXes
         9yt6iV4SudlrmHz+p0oO61BzZbLdsR7F6lUpbzL6zRfUNkp/Jko8WSbERpeSa2oNCeI3
         XVhwZkzq9jJ4w29oWVB5oQmYsVyOuWPZxvCpOf7X2/af6G9JE9CjeYCerAynBocsM209
         zA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736069538; x=1736674338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPyjAuxu9OdnpqfGMOb0evLmjsg/kCx7+hs5rWlx0JE=;
        b=ScQDn0s4T6jgAPNZV5IYxO21uojKytIMMyHqwRFoH8Oj8gew5kYS0Bc5hAycSd6qEF
         5GINJmKJQQ+QaFcr0GvADJCebYAyyCXWG4fVr+sVZo3pZz7X5huS4kRCoeyxt6BwTcyP
         gPykc+AzeApCKpe/HKW/1mpG4TXFqe87TP9g3+V9QcAPF6LORj+owbeqPrLkMk3/azN9
         EdJbZtyRf96juIkCX7h/Y2GoKdJ7IaDkoKMaGIV2X6b/ykJrgyILF0xXyUkW7DoJ+Hlg
         PkdOAQL7E05UBiWz6L/+lbAEFB3Z2ZLidN4bvm9N468K5tDG4HZXtFpUKQKc4qFmhGN6
         Ps9A==
X-Forwarded-Encrypted: i=1; AJvYcCUEyeiqIoH3uaa4f7Q/ZNkkLkmEvtIvgxtwLO8Vla9niPBVz7/iZWQa0eGjbs0XAWCHYwOtRZklhtbi@vger.kernel.org, AJvYcCW+/VkXzCapSVubcZZjkAx/SWjvt0C9+xVjwaPJHzDTFQgB0Qa9OxATE7F6vMjaYpHnSbz1kc1SBSaQQ0eV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf35xRewySV+vUiCx9IFk3aKJY0C1By2ZNF4Y2YBgqw7WhNCkK
	QLo8bXxXdUMlZ0e/7snCGL46Tr4zWTpzA5ji6dplFyvHJjkVr0moqaW08nLo7Hlh18srRlZGryZ
	kgVtkE4bcsYVr6HI0QUt3Z25dfeY=
X-Gm-Gg: ASbGncvH25WtNXuI0fi7WoZiQuxEJq2V6J9I7Y2natDhGQ6tFhICqWBgcKLzGLF72/Q
	vsy0pX/isno7KwIlQAimkEQ51iOKbH6gyFgYZUGI=
X-Google-Smtp-Source: AGHT+IE0tY0zDsaGHrMtWBPW96CYqDfXGklPbZ12qLBpaGk2i9juJ5ZK9O225SVgPsouUZuWowkIpe4gtmE4nNRGL2g=
X-Received: by 2002:a17:90a:fc48:b0:2f4:423a:8fb2 with SMTP id
 98e67ed59e1d1-2f452e3bd24mr85540353a91.20.1736069538491; Sun, 05 Jan 2025
 01:32:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
 <20241224103645.1709996-1-noltari@gmail.com> <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
 <07a21d3f-539e-4609-bc60-ff320935db8a@gmail.com> <CAKR-sGesWUbxQY6SmeW4mGM_89=SkNMbL=TJJQtAiDKMjC6y+g@mail.gmail.com>
 <CAKR-sGeyRkJ2Mo2rObVyNRcupo3FXvCn0vbZPW0rzyCdjxK-+A@mail.gmail.com> <CAOiHx==-c=HtNQWFuJnVX15pTXqtXsbzoEGSQXDbSpYExw4K9A@mail.gmail.com>
In-Reply-To: <CAOiHx==-c=HtNQWFuJnVX15pTXqtXsbzoEGSQXDbSpYExw4K9A@mail.gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sun, 5 Jan 2025 10:31:42 +0100
Message-ID: <CAKR-sGcgx4p_+k5tC0Z-5y+AQOp6GTQn7pq-WC3xirNiuA0f9g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kyle Hendry <kylehendrydev@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b, 4 ene 2025 a las 20:32, Jonas Gorski
(<jonas.gorski@gmail.com>) escribi=C3=B3:
>
> On Sat, Jan 4, 2025 at 6:02=E2=80=AFPM =C3=81lvaro Fern=C3=A1ndez Rojas <=
noltari@gmail.com> wrote:
> >
> > El s=C3=A1b, 4 ene 2025 a las 16:44, =C3=81lvaro Fern=C3=A1ndez Rojas
> > (<noltari@gmail.com>) escribi=C3=B3:
> > >
> > > El vie, 3 ene 2025 a las 4:04, Kyle Hendry (<kylehendrydev@gmail.com>=
) escribi=C3=B3:
> > > >
> > > > On 2024-12-30 08:42, Jonas Gorski wrote:
> > > > > Hi,
> > > > >
> > > > > On Tue, Dec 24, 2024 at 11:41=E2=80=AFAM =C3=81lvaro Fern=C3=A1nd=
ez Rojas
> > > > > <noltari@gmail.com> wrote:
> > > > >> From: Kyle Hendry <kylehendrydev@gmail.com>
> > > > >>
> > > > >> There is no guarantee that the bootloader will leave the pin con=
figuration
> > > > >> in a known default state, so pinctrl needs to be explicitly set =
in some
> > > > >> cases. This patch adds a gpio function for drivers that need it,=
 i.e.
> > > > >> gpio-leds.
> > > > >>
> > > > >> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> > > > >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.c=
om>
> > > > >
> > > > > bcm63268-pinctrl implements pinmux_ops::gpio_request_enable(), wh=
ich
> > > > > should automatically set any requested GPIO pin to the GPIO funct=
ion,
> > > > > so explicitly requesting the gpio function for a pin should not b=
e
> > > > > needed. Is this not enough?
> > > > >
> > > > > Best Regards,
> > > > > Jonas
> > > > >
> > > > >
> > > > I assumed that as well, but nothing I tried worked with gpio-leds.
> > > > gpiochip_generic_request() does call gpio_request_enable(), but gpi=
o-leds
> > > > uses devm_fwnode_gpiod_get() which looks like a different code path=
. The
> > > > only place it seems to be configuring the gpio is in create_gpio_le=
d()
> > > > where it needs a pinctl node in the device tree. That's just my rea=
ding
> > > > of the code, though. I haven't set up a ftrace to verify it.
> > > >
> > > > Best Regards,
> > > > Kyle
> > >
> > > As Kyle pointed out it's not enough and gpio_request_enable() doesn't
> > > get called from gpio-leds.
> > > I will try to investigate this and report back.
> > >
> > > Best regards,
> > > =C3=81lvaro.
> >
> > I've performed some tests and so far I haven't been able to get
> > bcm63268_gpio_request_enable() called.
> >
> > Even exporting a gpio from userspace doesn't trigger that function,
> > which seems strange because in that case we won't have a "gpio"
> > function on the pinctrl for that gpio, even with this patch...
>
> On a first glance it looks like that regmap-gpio does not populate
> gpio_chip::request and gpio_chip:free, so the gpio subsystem is not
> aware that it needs to request anything. Not sure if just using
> gpiolib_generic_request() / gpiolib_generic_free() is fine. Currently
> on vacation, so no hardware to test anything at hand ;-)
>
> Best Regards,
> Jonas

You're totally right, after adding request() and free() functions to
gpio-regmap it's now working without this patch because
bcm63268_gpio_request_enable() is now properly called:
1. gpio-keys-polled
[    4.052132] gpio_button_hotplug: loading out-of-tree module taints kerne=
l.
[    4.060657] bcm63268-pinctrl 100000d0.pinctrl: request pin 34
(gpio34) for 100000d0.pinctrl:546
[    4.069704] bcm63268_gpio_request_enable: range=3D99a2e0ae offset=3D34
[    4.076158] bcm63268-pinctrl 100000d0.pinctrl: request pin 35
(gpio35) for 100000d0.pinctrl:547
[    4.085135] bcm63268_gpio_request_enable: range=3D99a2e0ae offset=3D35

2. gpio-leds
[    4.480190] bcm63268-pinctrl 100000d0.pinctrl: request pin 0
(gpio0) for 100000d0.pinctrl:512
[    4.489078] bcm63268_gpio_request_enable: range=3D99a2e0ae offset=3D0
[    4.495747] bcm63268-pinctrl 100000d0.pinctrl: request pin 1
(gpio1) for 100000d0.pinctrl:513
[    4.504600] bcm63268_gpio_request_enable: range=3D99a2e0ae offset=3D1

3. userspace gpio export
root@OpenWrt:~# cat /sys/kernel/debug/gpio
gpiochip0: GPIOs 512-563, parent: platform/100000d0.pinctrl, 100000d0.pinct=
rl:
 gpio-512 (                    |red:mobile          ) out lo
 gpio-513 (                    |green:mobile        ) out lo
 gpio-546 (                    |wps                 ) in  hi ACTIVE LOW
 gpio-547 (                    |reset               ) in  hi ACTIVE LOW
root@OpenWrt:~# echo 545 > /sys/class/gpio/export
[   33.437477] bcm63268-pinctrl 100000d0.pinctrl: request pin 33
(gpio33) for 100000d0.pinctrl:545
[   33.446503] bcm63268_gpio_request_enable: range=3D99a2e0ae offset=3D33
root@OpenWrt:~# cat /sys/kernel/debug/gpio
gpiochip0: GPIOs 512-563, parent: platform/100000d0.pinctrl, 100000d0.pinct=
rl:
 gpio-512 (                    |red:mobile          ) out lo
 gpio-513 (                    |green:mobile        ) out lo
 gpio-545 (                    |sysfs               ) in  hi
 gpio-546 (                    |wps                 ) in  hi ACTIVE LOW
 gpio-547 (                    |reset               ) in  hi ACTIVE LOW

OpenWrt test source code:
https://github.com/Noltari/openwrt/commits/bmips-gpio-tests
https://github.com/Noltari/openwrt/commit/d3bc7610c8fe8f713a3e47ed8368b6aa2=
20ae763

Linux test source code:
https://github.com/Noltari/linux/commits/gpio-regmap-pinctrl-request-free
https://github.com/Noltari/linux/commit/2d0ebb8cad8084e932f40f3f69d4e931b23=
16aa4

@Linus I assume that adding those functions may cause issues to other
drivers and maybe we need to add some logic to add them dynamically
based on a new gpio_regmap_config parameter?

Best regards,
=C3=81lvaro.

