Return-Path: <linux-gpio+bounces-1127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548AF80A5D9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 15:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF321C20D83
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EBF1E48B;
	Fri,  8 Dec 2023 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MLaDttHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F27E1720
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 06:47:12 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dbc1efc23f7so2189195276.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702046832; x=1702651632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/60tlL0sJYx8SdIBiTTw8wU2Z45ejr+talAnqSSdr4=;
        b=MLaDttHAVQtkUwObPvJS1qd/vOqwdSGw4dc5xLrcESVbqvfL2nnPA8Q2pqJQlaQD6c
         oOrMMcexIWxcCZqdIrZSPpovvyBVVk5xCrHtHfP2VfCJoDk/2ghIIoNVaPjgA/buxzou
         D+YvKKj48ZFyslqN2GePiHjiO7XOdFP1J+01PEVAi9ZCwOui+8e8PfWPPoC65Bq5d1nJ
         feGyaNyyVMpGSs6hlRJ1x3Fq23yVYZmSXn6vNV0andytC7S49GMSz3NutAf5kMHyYgFE
         c+PiQnFMFVaBCfb+HPbxfIvhoAsrGH3G0CVhkm14wqSozET96SPgyXiqgkH79oKW77JW
         QXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702046832; x=1702651632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/60tlL0sJYx8SdIBiTTw8wU2Z45ejr+talAnqSSdr4=;
        b=S3NJSG3aM+Fj8qS/gHwxGGEvgdMnEUe6dXQOAEz1PPcPJTzdajymBCRWjQTyqZz4UA
         7FehlO/PoP603me7WMZfjSvVlJhDIaNDstz1j930L2gYUHF85vgQXXlev4M2teXivYnS
         Evn9PJWd86MkEN01N2yvGz0EZgSBrRA5NGUWij8qSpdLNw1LStYYxqcrb5gIEEm69+VC
         QztQX95sifGI6L2mlBHeVaV29qw/oBDBVHJNhJZcUEdQsnx7wCYP+1rq1gPwuzlMTetU
         x+0MQRwnA8zwBDn3oJTLs8qDuTrA/b7aMbVnRBO3f8A8b8+g9bLZxtHDZK/scMrqxuwk
         MsXg==
X-Gm-Message-State: AOJu0Yzq7XGSUJP2hr2qEdK2o9bluiRsx693/QJEjTEPNJIomsJ4810t
	h4aJj9srjzSqbkfv0MAmaDaxfwjtOqwlCSifBnA7dg==
X-Google-Smtp-Source: AGHT+IEi5a9mkKhIEe4DuZ82Ml6zaAnbgVXU4T51mvwgiyoXcc9waX0S515GLgDdPFahy/kbGKBk2XYABMmUQowzkUM=
X-Received: by 2002:a25:42c9:0:b0:db7:dad0:76b5 with SMTP id
 p192-20020a2542c9000000b00db7dad076b5mr18289yba.81.1702046831856; Fri, 08 Dec
 2023 06:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com> <ZXMgmhTioEQ78Xeq@orome.fritz.box>
In-Reply-To: <ZXMgmhTioEQ78Xeq@orome.fritz.box>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Dec 2023 15:47:00 +0100
Message-ID: <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 2:56=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Fri, Dec 08, 2023 at 02:12:45PM +0100, Linus Walleij wrote:
> > On Thu, Dec 7, 2023 at 7:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > > The reason for that is that I'm stuck on some corner-cases related to
> > > the GPIO <-> pinctrl interaction. Specifically the fact that we have
> > > GPIOLIB API functions that may be called from atomic context which ma=
y
> > > end up calling into pinctrl where a mutex will be acquired.
> >
> > OK I see the problem.
> >
> > > An example of that is any of the GPIO chips that don't set the
> > > can_sleep field in struct gpio_chip but still use
> > > gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> > > following situation:
> > >
> > > irq_handler() // in atomic context
> > >   gpiod_direction_output() // line is open-drain
> > >     gpio_set_config()
> > >       gpiochip_generic_config()
> > >         pinctrl_gpio_set_config()
> > >           mutex_lock()
> > >
> > > Currently we don't take any locks nor synchronize in any other way
> > > (which is wrong as concurrent gpiod_direction_output() and
> > > gpiod_direction_input() will get in each other's way).
> >
> > The only thing that really make sense to protect from here is
> > concurrent access to the same register (such as if a single
> > register contains multiple bits to set a number of GPIOs at
> > output or input).
> >
> > The real usecases for gpiod_direction_* I know of are limited to:
> >
> > 1. Once when the GPIO is obtained.
> >
> > 2. In strict sequence switching back and forth as in
> >     drivers/i2c/busses/i2c-cbus-gpio.c
> >     cbus_transfer()
>
> Isn't this a very special case already? cbus_transfer() holds the spin
> lock across the entire function, so it will only work for a very small
> set of GPIO providers anyway, right? Anything that's sleepable just is
> not going to work. I suspect that direction configuration is then also
> not going to sleep, so this should be fine.
>

Maybe we could switch to using gpiod_direction_*_raw() here and then
mark regular gpiod_direction_input/output() as might_sleep() and be
done with it? Treat this one as a special-case and then not accept
anyone new calling these from atomic context?

Bart

> Thierry

