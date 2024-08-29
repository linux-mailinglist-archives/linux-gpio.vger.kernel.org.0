Return-Path: <linux-gpio+bounces-9357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A79963F19
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 10:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E01461F22ECA
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4B518CC09;
	Thu, 29 Aug 2024 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpMeQm1Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228218C336;
	Thu, 29 Aug 2024 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921541; cv=none; b=YjEPQUSx3mZf18z0C2b62eB18TrtMNKt3b+094dAYBmXKETPBQG6oeW5ujCS32cDkcgVnxBR3wTWZwgDlhgy0cWGw0WUAtJkERK3V00XP/UdKJXEGE1Q5rymbKlxj0+cXB6pR/A7LQDi36sEf2BmLbYuL51akC3fjaCLQDwJ/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921541; c=relaxed/simple;
	bh=JoNKXsP+ELF+WzkuxADTmn91rPBN1LBTYC9JtQzS+mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BO5kyvTWaWnP7KVdu58kpLbINR+f329dZ1Uh5c7MT3wV/zU00c2mED8kaDVJbDPE0MzqEHrb/6vPFMPsSfNA/64+P2ZAiuNFORwfaKzxBLOO5h/Ob76F+hGD1KUFmTSysad26tkrCiiGGbaJxLgkaQaczlX4hbi2Ugc3UA4IqL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpMeQm1Q; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7bb75419123so222994a12.3;
        Thu, 29 Aug 2024 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724921539; x=1725526339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ibpBHf4LnLFaAl2Dofr/5pacDToGSrHsOi9i7R4u18=;
        b=XpMeQm1QvYfmKgBDNoibj215XixdJbSeuCiyvfbM7b0eLIOAAs+lkMWLafH/VktgSr
         qaPi0/CVypIWywxUiWR+KM/Z4GYV6zFnFHDCJQ88u8dtLwBuxFyADUu+vDflCKSly9dM
         zn9TX+H2R6JHt+gekwyEDOJPHW7e4Sk8f8L091P9+plJrkpkV5GZRjacxKDuOdl+vVve
         jDkfNcQKw85c2+bzO4N1iYc1wEtPkkfb0AgybghohQjb0c9z390AW4ydikXZ1Q3f6FQt
         rdUzSgNUDQEfbG7/FynWPsUnWxZKrJ90AGhH4dbtLPf8OZdUQ0xpG6oTA6nOn7VH8fGc
         DqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921539; x=1725526339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ibpBHf4LnLFaAl2Dofr/5pacDToGSrHsOi9i7R4u18=;
        b=tki9j/MuWW2yFmNKc56LJ3e1ujLjRONS8ULuisdgt6osXpkWJttOOjXS6hMXNxBInn
         5MZ3XxpDFhiqOVEu1cPryext/Ge99eatBR87+YYgC/X5KqhoRLSPMwV0rZ2GeJRMpS6X
         ydneI7+W3H3ij222UNQM+PISlhHopNDS6DulbwzaWPi3LI0+9evBS8JGsaLc9a4Lfc4L
         hzNuG9Xszeg2AVxy1jNq94l3AVXYlNoVkw6Cx8acnrcwY7F9SSgLI8LQOrwYPUkifH43
         sxTSAivbjHhU4DiG+U7akskwfyYxV+dZF2+QgwVpfJ2+laJrG60bvNn47JoF7P/UQCnk
         MItw==
X-Forwarded-Encrypted: i=1; AJvYcCVRcHA2DOHj7ekfsTW75EygEApCaiSwsf7s3FcLfrjBdN7LGogQySyyiVJOIhj2BGnvEjHTozEa7EfcZyKf@vger.kernel.org, AJvYcCVl8utuQv0/PsRpXD2VL7qhX0NRfZyeyNdwolZu/BgfU/3Kz6I8FF7YvzQytjF80lwA2A6r//npsj3lPA==@vger.kernel.org, AJvYcCX914sPPrLwT9ogGxlrhjzVbzsGM2RcE9080JWncS1RHvZa0N6PO/vxQi8KU2uU2w4T2odJ0zpUxow6@vger.kernel.org
X-Gm-Message-State: AOJu0YzpRsSguRFq9gdHUkwN1/AwIIhnrwK8pwEk30E+Zr75pAJ/GTVJ
	0BcURG7lUyYu+R9pkhmdLXmQSsFZkueYerkAwD7ewGsLIX986Q4mVZoNSuHSQpRivJXUxG+rrWR
	WjFtVNwr6ricD8oS/38GZCb35hiU=
X-Google-Smtp-Source: AGHT+IHDpF/XtR7HzOnX7agd3oRRaJRuRBQbzXGpKTSu9vCM8QEV8fuA3k6SHYRN/6No+INzQEHuuCuCTbKq0uRiZ40=
X-Received: by 2002:a17:90a:d503:b0:2c9:e0d3:1100 with SMTP id
 98e67ed59e1d1-2d8561e17a0mr1885110a91.19.1724921539418; Thu, 29 Aug 2024
 01:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230113205922.2312951-1-andreas@kemnade.info> <CAMRc=Mf4-8AfTHLrvaF14tc2TJatxZJWnMOF-1G8HmDhPKSFAw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf4-8AfTHLrvaF14tc2TJatxZJWnMOF-1G8HmDhPKSFAw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 29 Aug 2024 10:52:07 +0200
Message-ID: <CAFLxGvyX1Q8qGXkWW+JiyQSfP=1dFzeZ7C4OCJHk2pFGX7zygw@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: use dynamic allocation of base
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andreas Kemnade <andreas@kemnade.info>, grygorii.strashko@ti.com, ssantosh@kernel.org, 
	khilman@kernel.org, linus.walleij@linaro.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2023 at 9:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Fri, Jan 13, 2023 at 9:59 PM Andreas Kemnade <andreas@kemnade.info> wr=
ote:
> >
> > Static allocatin is deprecated and may cause probe mess,
> > if probe order is unusual.
> >
> > like this example
> > [    2.553833] twl4030_gpio twl4030-gpio: gpio (irq 145) chaining IRQs =
161..178
> > [    2.561401] gpiochip_find_base: found new base at 160
> > [    2.564392] gpio gpiochip5: (twl4030): added GPIO chardev (254:5)
> > [    2.564544] gpio gpiochip5: registered GPIOs 160 to 177 on twl4030
> > [...]
> > [    2.692169] omap-gpmc 6e000000.gpmc: GPMC revision 5.0
> > [    2.697357] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
> > [    2.703643] gpiochip_find_base: found new base at 178
> > [    2.704376] gpio gpiochip6: (omap-gpmc): added GPIO chardev (254:6)
> > [    2.704589] gpio gpiochip6: registered GPIOs 178 to 181 on omap-gpmc
> > [...]
> > [    2.840393] gpio gpiochip7: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    2.849365] gpio gpiochip7: (gpio-160-191): GPIO integer space overl=
ap, cannot add chip
> > [    2.857513] gpiochip_add_data_with_key: GPIOs 160..191 (gpio-160-191=
) failed to register, -16
> > [    2.866149] omap_gpio 48310000.gpio: error -EBUSY: Could not registe=
r gpio chip
> >
> > So probing was done in an unusual order, causing mess
> > and chips not getting their gpio in the end.
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > maybe CC stable? not sure about good fixes tag.
> >
> >  drivers/gpio/gpio-omap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> > index 80ddc43fd875..f5f3d4b22452 100644
> > --- a/drivers/gpio/gpio-omap.c
> > +++ b/drivers/gpio/gpio-omap.c
> > @@ -1020,7 +1020,7 @@ static int omap_gpio_chip_init(struct gpio_bank *=
bank, struct irq_chip *irqc,
> >                 if (!label)
> >                         return -ENOMEM;
> >                 bank->chip.label =3D label;
> > -               bank->chip.base =3D gpio;
> > +               bank->chip.base =3D -1;
> >         }
> >         bank->chip.ngpio =3D bank->width;
> >
> > --
> > 2.30.2
> >
>
> This could potentially break some legacy user-space programs using
> sysfs but whatever, let's apply it and see if anyone complains.

FWIW, this broke users pace on my side.
Not a super big deal, I'll just revert this patch for now.
Maybe the application in question can get rewritten to find the gpio by lab=
el.

--=20
Thanks,
//richard

