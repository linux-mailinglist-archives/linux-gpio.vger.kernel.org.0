Return-Path: <linux-gpio+bounces-348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA27F4456
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 11:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C3E1C2084F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 10:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851E91E516;
	Wed, 22 Nov 2023 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pGJH4qjN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D8018D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Nov 2023 02:53:10 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7bae0c07086so2031395241.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Nov 2023 02:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700650389; x=1701255189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY/bD1zv5fBxrgEs0eGY+QzOkiSJamFow82Mh0ii4pY=;
        b=pGJH4qjNGy8tzarESB9kqaX+JODPjVDPAwqFrhYOm1QjIThTfZtUQfhJrTRSaSypb6
         PDZIKzjHIluy+rVmq6aHmM01H3O1LC2HUK3R4H2Uy/AjM6gkHEFpyviII2h+91Ncuua7
         yE0fqt7zUcR8DM4oqIrSA0fC4Sz6DHbWwOngHEXdfxpAVmMtFi50ENW+DIZOinyaCy/o
         8iCvqvtLwMwx3pNaw+cscMOpSEGxSBSbJl5jm+yyF++ahIu4NLbF6BSR5xlop76f68cM
         C/LXdcwWj4Py6xnwP7QOsJ6HtHPamHcyLkb0AT423DEjqslpGXtXMphFooW6gcXR5QVS
         kSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700650389; x=1701255189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY/bD1zv5fBxrgEs0eGY+QzOkiSJamFow82Mh0ii4pY=;
        b=r+VN+otl+0NbVKe4sxsqfCwtoP7hp44nwRolAIHF7KjuGNmozR69MphMpZ7izo3cEL
         iSwywG+jkcrtH0+4lLa7/hZayGdf1kV2d5gXbbn5ZapnVyKo+AN3WvAkCU5fJqN5oDkV
         rTIqpnA1AWbOuHMjccscth26CAElet0+s3oKib1iEgVmpDMP9mocLG51YZDlJM/6wMEC
         tLcP99kVxfEcUJ8GRGqF+kHQOvgZY3eYuioNasuXVPd5KEkp6DvZb+4qARHLO/+4nuSp
         p1sqLiC9OVLmIiMJF0ySGnnAzIzph355YIskuRyJ4wIB0A8/5bABOr90KbZ/LCcFJOvr
         18JQ==
X-Gm-Message-State: AOJu0Yw4nheJl58F9sLRQNU43E0ZfffU59RZrQ/vwfg/3a1rRX+YBdWZ
	DJZjnNL2MGZgvzDe4Ou4Mlz/GG2aBO5qLZQO7GsTyw==
X-Google-Smtp-Source: AGHT+IFrGwDqG3W/gOl3K6hItbrKeM3qSDO4HmAniT5FrTtOn6+XNuiLQkTNPhkh9WZT/WBnFYSQqwhC2drSjGagJZQ=
X-Received: by 2002:a67:ec45:0:b0:45f:654a:f3b with SMTP id
 z5-20020a67ec45000000b0045f654a0f3bmr2028426vso.19.1700650389731; Wed, 22 Nov
 2023 02:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231118124252.14838-1-wahrenst@gmx.net> <20231118124252.14838-2-wahrenst@gmx.net>
 <ZVtHZWYl2skpn1Bg@smile.fi.intel.com> <9a9486bb-e737-4384-a581-76880b709758@gmx.net>
 <ZVtS4phUMmDD9ztz@smile.fi.intel.com>
In-Reply-To: <ZVtS4phUMmDD9ztz@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Nov 2023 11:52:58 +0100
Message-ID: <CAMRc=MdpegfNrjWkeGSh8NhT_Go+q5MxueASxrLo18XBJaBsjA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] leds: gpio: Add kernel log if devm_fwnode_gpiod_get
 fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Pavel Machek <pavel@ucw.cz>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Lee Jones <lee@kernel.org>, 
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 1:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 20, 2023 at 01:02:55PM +0100, Stefan Wahren wrote:
> > Am 20.11.23 um 12:47 schrieb Andy Shevchenko:
> > > On Sat, Nov 18, 2023 at 01:42:51PM +0100, Stefan Wahren wrote:
> > > > In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO =
is
> > > > already requested) the driver doesn't provide any helpful error log=
:
> > > >
> > > >      leds-gpio: probe of leds failed with error -16
> > > >
> > > > So add a new error log in case devm_fwnode_gpiod_get() fails.
>
> ...
>
> > > >                   led.gpiod =3D devm_fwnode_gpiod_get(dev, child, N=
ULL, GPIOD_ASIS,
> > > >                                                     NULL);
> > > >                   if (IS_ERR(led.gpiod)) {
> > > > +                 dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to=
 get gpio '%pfw'\n",
> > > > +                               child);
> > > >                           fwnode_handle_put(child);
> > > >                           return ERR_CAST(led.gpiod);
> > > >                   }
> > > Thinking more about it. GPIO library already issues bunch of messages=
.
> > >
> > >     "using DT ... for ... GPIO lookup"
> > >     "using lookup tables for GPIO lookup"
> > >     "No GPIO consumer ... found"
> > are these errors or debug messages?
>
> Indeed they are on debug level.
>
> > I cannot remember that i saw any of them on info level in my case of an
> > already allocated pin (see patch 2).
> >
> > I'm open to place the log within gpiolib, if this a better place.
>
> I'm not sure, let's hear GPIO maintainers for that.
>

Hard to tell which method is preferred among all the subsystems.
Personally I'm more inclined towards letting drivers decide whether to
emit an error message and only emit our own when an error cannot be
propagated down the stack.

Linus: Any thoughts?

Bart

> > > Isn't it enough?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

