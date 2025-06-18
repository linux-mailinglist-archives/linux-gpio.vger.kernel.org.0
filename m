Return-Path: <linux-gpio+bounces-21766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8904AADECCF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 756C6162CB3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CD5B66E;
	Wed, 18 Jun 2025 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KeIMAZ+C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428F2DFF2C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250100; cv=none; b=TPSyQd+WYYLgf3BhGlZZVcvh2g9cjLQMS3mhPjMIt0zdq9lB44HQGMrEh36CNiGgSj6wl+rqKpZWOkjlu6tbNxqt3duJup8lIfX28sIeUpXdKOsikwcDSXb/cLQHxUKmMQUTLyyqMayLQG4DFzw3Ql7jIm4uWXc9pC1E3bj1F8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250100; c=relaxed/simple;
	bh=trzbB0BU18yv/+x//j8upiNsDilrRGudW+ydLxNsrTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwS9vFohTarP+pysD/1nP4J9xZoD0xHqrmOWQylLWJaXnUl1aOA17TpiPGaIrDuhXnQQRjR9MzZkQGskhN/lZ7XOuEB5fIEkOWRte6fv/cmLsYrizWNmihBQ0oJbcDxawUl/r7blhv4kHCP0w0t6vKprY4HzyJzuCeTCAmaVCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KeIMAZ+C; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7032794e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750250097; x=1750854897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=KeIMAZ+C07C/TSwGgI8YQ8mGTCU7FC9d3QpYJPp3j1DP53wks60vZly/ekmkMxGarG
         JJFx0XTJE+3hLrm+ZW+C90GJYz1lTjoLPNS0DmagrVcNAe4QFBF6NhzvPmfdM1JpBYGM
         mowETEP54QbrzqmzNC4mMT+2cOlhBZx3N69b0A2itY4eTngElqeZI8k5cjq3XjeDTUXs
         BSN3PjFz6/LJUGGgabBEdT10Yx5/08MBHLs47FQHQ1kHrUYtsihkCUmpOxhtzDRKAQyI
         /e+xJ474CaHnUxi8iyfEiP4NveCKyNdPHzlJdM0rFKTQ0sz3955bfWFOQvZic9Msdzme
         3uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250097; x=1750854897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=kMkmGMceG/9WuCSJPn4dJrO/tVGBCT9ecbdMDuneP27mLq9IHmFHOqGBa3ADqHK5PH
         TiNpw6y05+ta0IxdetrdYIJT67vclNxDIXZQDS11+udAce7tbEPSGfzcb2jsrq0GBiP6
         uHYwnsT8jbqjG7rIni+oXtDhi46mi1j4sP7RT6NTGkde5sbQnv1uiISldidZIeY7ZHBE
         XYGUk3jFoqSjjanB6i4l0Zs3UK0l1RIHnmhtD2G6UoL4fufRBztoJpnc1waZzXqxly/U
         ZfJjRJZnZKlDUwxRNlCu6Jh7yyG28yz2pCGq6xaEOx1PDT69zKTGoeutdVyi36qAGjwF
         fyGA==
X-Forwarded-Encrypted: i=1; AJvYcCXreZXnNEaGo7RkAWgf+XDpy7MCMUQyUHxcTlDHk5yg371McYcmROXgTdwBqVAXuQ4c3uSwxLEkKp7H@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJCmf5EvjY/pY5Egs2NFZIBODUuXZDPMUkH6WvIzk2vjInHcN
	PyQ3QvKDcMrgc9l/VjznoZE4uFVVv78OFnpVyt8CXS8fYC8O00dBg2KM3cEu3XHbHRQcBOQ/lvu
	ztq2mx5xfjukJXf1lLXBQ83GmjmylAQYZ6XybotRiNw==
X-Gm-Gg: ASbGnctAQEi1eeGlzFcYGrq1QT+Dg9S1hYjxUNGFlCUdE3TD0lN6aJDtmOVt2RZM9AC
	ILdnq+N/6Q/Tmf0s0N/LPV4V3hmupJ1QJ9j0JadFUGAAwLFGWUPgNIGY2Pyk9X+p9Y6SRj/fqZG
	l+O6MDdLTqJFJBaf8ZrfF6s1odmalEIw6NkSGEcwr/pC8Rma0rsvf4PyDD1AYTyQummxgWqeuie
	w==
X-Google-Smtp-Source: AGHT+IEcY0ia8sTwoRAYv0yUxmwNgwPhm8wtdrftfa4ddrwo+GTxfk9hINsrO5aUlvjYzopy0PhTBONSdU1zFixC2QI=
X-Received: by 2002:a05:6512:4005:b0:553:a30b:ee0a with SMTP id
 2adb3069b0e04-553b6e8c9bamr5355914e87.24.1750250096692; Wed, 18 Jun 2025
 05:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
In-Reply-To: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:34:43 +0200
X-Gm-Features: AX0GCFtJGsl5fi6e6i6LCEjO1TuJe6n2Li_qY-Pi8nS955_BMUgd9yxByrvzkO8
Message-ID: <CAMRc=Mf==gzqXEUMd3D_-XYG7Bg7dSMLgjg3sq5-GoB1BUGchA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++----------=
--------
> >  1 file changed, 33 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> > index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494=
054b1e009f16eee7f 100644
> > --- a/drivers/gpio/gpio-mmio.c
> > +++ b/drivers/gpio/gpio-mmio.c
> > @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip=
 *gc, unsigned long *mask,
> >       return 0;
> >  }
> >
> > -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, in=
t val)
> > +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >  {
> > +     return 0;
> >  }
> >
> > -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> > +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsig=
ned int gpio, int val)
> >       gc->write_reg(gc->reg_dat, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gp=
io,
> > -                              int val)
> > +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpi=
o,
> > +                             int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >
> > @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip =
*gc, unsigned int gpio,
> >               gc->write_reg(gc->reg_set, mask);
> >       else
> >               gc->write_reg(gc->reg_clr, mask);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> > +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int =
val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, uns=
igned int gpio, int val)
> >       gc->write_reg(gc->reg_set, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> >  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> > @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct =
gpio_chip *gc,
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> >  }
> >
> > -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *ma=
sk,
> > +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mas=
k,
> >                              unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long=
 *mask,
> > -                                unsigned long *bits)
> > +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long =
*mask,
> > +                               unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > -                                       unsigned long *mask,
> > -                                       unsigned long *bits)
> > +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > +                                      unsigned long *mask,
> > +                                      unsigned long *bits)
> >  {
> >       unsigned long set_mask, clear_mask;
> >
> > @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gp=
io_chip *gc,
> >               gc->write_reg(gc->reg_set, set_mask);
> >       if (clear_mask)
> >               gc->write_reg(gc->reg_clr, clear_mask);
> > +
> > +     return 0;
> >  }
> >
> >  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, b=
ool dir_out)
> > @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
> >       if (set && clr) {
> >               gc->reg_set =3D set;
> >               gc->reg_clr =3D clr;
> > -             gc->set =3D bgpio_set_with_clear;
> > -             gc->set_multiple =3D bgpio_set_multiple_with_clear;
> > +             gc->set_rv =3D bgpio_set_with_clear;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_with_clear;
> >       } else if (set && !clr) {
> >               gc->reg_set =3D set;
> > -             gc->set =3D bgpio_set_set;
> > -             gc->set_multiple =3D bgpio_set_multiple_set;
> > +             gc->set_rv =3D bgpio_set_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_set;
> >       } else if (flags & BGPIOF_NO_OUTPUT) {
> > -             gc->set =3D bgpio_set_none;
> > -             gc->set_multiple =3D NULL;
> > +             gc->set_rv =3D bgpio_set_none;
> > +             gc->set_multiple_rv =3D NULL;
> >       } else {
> > -             gc->set =3D bgpio_set;
> > -             gc->set_multiple =3D bgpio_set_multiple;
> > +             gc->set_rv =3D bgpio_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple;
> >       }
> >
> >       if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> > @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device =
*dev,
> >       }
> >
> >       gc->bgpio_data =3D gc->read_reg(gc->reg_dat);
> > -     if (gc->set =3D=3D bgpio_set_set &&
> > +     if (gc->set_rv =3D=3D bgpio_set_set &&
> >                       !(flags & BGPIOF_UNREADABLE_REG_SET))
> >               gc->bgpio_data =3D gc->read_reg(gc->reg_set);
> >
> >
> > --
> > 2.48.1
> >
>
> Isn't this missing to convert gc->set() to gc-set_rv() in several
> places?
>
> Without the attached diff I get a null pointer reference on e.g. the
> spacemit k1 driver.
>

Ah, yes, sorry for this and thanks for the catch. I will send a follow-up.

Bartosz

