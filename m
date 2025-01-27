Return-Path: <linux-gpio+bounces-15063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCAA1D1B6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 08:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D94A7A2B8F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 07:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CFD1FC0F0;
	Mon, 27 Jan 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV5HZggq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5A86340;
	Mon, 27 Jan 2025 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964076; cv=none; b=rVNrO/uJ2eCfA78YaPsis4+tiEr/7B1qu+H7WUA6E1/zv4nCwTh2DcA+ZwDHTcCr+W8c7Gm26QmGaA/lw+DiM2smwBEG6nmQ8a7q90ibnqWUdIkcmSvwNTJLkjiIzLLxGZdKhLv2pSiJRpqnRt8Dy6T5IKNcmXIhuqAGvYeWNoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964076; c=relaxed/simple;
	bh=jS5ihixtGxFxCsVjsL6uK7JUvhisJ7rmE9Qr5AA5Ui4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDI6PAMvTwEkFcI7QtsQrz3tamGQnS6qfRfL3j50lFZ/EkfYcJUBIiMWrZIEBGAGj7NFi70r22V42gd0sw4GIbe+ruN142AoNid+DwpflZTXSNqjcGAPqOKUYgRRWKSfOxGA0VhtX9I0jbmdROy5R0USalvhT+lHJpR3/vBVX4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV5HZggq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab925654d9so796222466b.2;
        Sun, 26 Jan 2025 23:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737964073; x=1738568873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNDXKI8z4DItC/2xYVmJnX3FThVPtwhz/4sgoWhbclg=;
        b=kV5HZggqgA3RAkW9yRh3P2RLWACbTIlAKUhAlG+GjMi1mPiiovpYXtSpG92SwIh9ae
         XB2W1V/tf89SrJ/5/ypI2spslggETvBovwzYOzQLfyVuMF9+14acuX4UPzqrZWQ6Qzt1
         kD5rfKQyDoS+Dzl6d3rdPImOMw5DrxeNAZLTSSBsgP4+NlzjXzdnO+ma5b5nh6k0gaKl
         78DYhUI/JGNdhQL1vham10WGl3Z/QpIRdz3btOF34Rpgb0/bB9CE7Z4lpLpq03f08FvS
         Da55VibkRs4lmJaKO53mky1OxfQ+gw0m/n7j07AZFIiUBChqnz1fC2qC77TiHUzrJhwM
         o4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737964073; x=1738568873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNDXKI8z4DItC/2xYVmJnX3FThVPtwhz/4sgoWhbclg=;
        b=gQohhY16k4Hkary+QqnmWYs51JiszzQYuzZmkiP8HZUGFxHSR7N50H5tHoM3o/TqZW
         VZY26rVVXcDI3SLOkM9roHQyRXFo/+WpIbPHnps+9QCSHzQ5/wd9akffme/OHTAL9JPE
         wuYDVHMj41h8c/HOsgEeCQxtWOZ+BQgLUwCzDImzIcqvckhsxEsPpeNJjpBG1zerCSmb
         mrPAdF/gmgbEYbc8BTs4TdQ2idTTOfLMXKCDV90zjV9HLfzvP7nX4d9uT6AitjxPjetI
         6hKnNiQRiEk6BfRdgB1c2daYCgElFx18n8BuDn9+1x53uKrFMuPShlXmfRUgkHEHIAb4
         6wUA==
X-Forwarded-Encrypted: i=1; AJvYcCX0eca3V1KmkbhOH4HYAiX0gHCSk5cANg6sLAd0ImWeYqcjwMEw0yNE5D3J9ZQVp30AwMHCZhvFtkCnaavs@vger.kernel.org, AJvYcCXalUb+lU2KnONke4lbYIMUfzXnflvShLmFqT3qGXX4qD3kcJl/J03pq/R2KXgtTiCGJRRVrDuDTkpF@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKKoxSzDPxG7LHso7ACXxaJytAft/fyRu1cYLxIX4fzXy40gQ
	ItonNd7uDFTQ3uwwXCeRTWF28oag5VzrhrUCfaXS+LIWaWDBHwQL5gItt5lM5/shGqf9Yt3m4vP
	0zateCCVx7kLnD47RDUmmUKr2ZEw=
X-Gm-Gg: ASbGncuBVN2nB/wYTdGQTKsTZIscBw1WkwwkJX3WihRV0DxphvA//0XMqNVYvh+92sW
	y482OealsW5RfXbHD+nyb8ultK4F4IeDt/Dafg3+IT/eQZ5LKZIbc0iEl/JbjwNiw
X-Google-Smtp-Source: AGHT+IGvTOZRAERUOTTMWa6IwI5EQdoux3etZgYeaL4aybMz6y0gPkB7dT2G9D7zbg3xz+lXpE/bS8K5ZNgU3Y+9wPM=
X-Received: by 2002:a17:906:7953:b0:aa6:6885:e2fa with SMTP id
 a640c23a62f3a-ab38b26f4acmr3307031266b.14.1737964072989; Sun, 26 Jan 2025
 23:47:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com> <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
 <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com> <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com>
In-Reply-To: <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jan 2025 09:47:17 +0200
X-Gm-Features: AWEUYZm80hegQFee6-4_6DPgwqeuYuAt4qHFh2_spK0APjsxLYXzRxvFXydF8Gw
Message-ID: <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
To: lakabd <lakabd.work@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 12:12=E2=80=AFPM lakabd <lakabd.work@gmail.com> wro=
te:
> Le mar. 14 janv. 2025 =C3=A0 16:44, work work <lakabd.work@gmail.com> a =
=C3=A9crit :
> > Le mar. 14 janv. 2025 =C3=A0 10:37, Andy Shevchenko
> > <andy.shevchenko@gmail.com> a =C3=A9crit :
> > > On Tue, Jan 14, 2025 at 12:03=E2=80=AFAM lakabd <lakabd.work@gmail.co=
m> wrote:

....

> > > > +                             /* Store irq_mask for later use when =
checking pending IRQs */
> > > > +                             bitmap_or(chip->unmasked_interrupts, =
chip->unmasked_interrupts, chip->irq_mask, gc->ngpio);
> > >
> > > This solution has a flaw. Where is any code that clears this new
> > > bitmap? The code starts with 0 (obviously) and step by step it gets
> > > saturated to all-1s.
> >
> > Yes indeed, and actually the new bitmap is not necessary at all
> > because what we need does already exist which is chip->irq_mask (I
> > noticed it just now!).
> > chip->irq_mask is updated whenever a pin is masked or unmasked via
> > pca953x_irq_mask() and pca953x_irq_unmask().
> >
> > The solution should look like this:
> >
> > diff --git a/gpio-pca953x.c b/gpio-pca953x.c
> > index 272febc..29e8c20 100644
> > --- a/gpio-pca953x.c
> > +++ b/gpio-pca953x.c
> > @@ -842,11 +842,6 @@ static bool pca953x_irq_pending(struct
> > pca953x_chip *chip, unsigned long *pendin
> >   int ret;
> >
> >   if (chip->driver_data & PCA_PCAL) {
> > - /* Read the current interrupt status from the device */
> > - ret =3D pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
> > - if (ret)
> > - return false;
> > -
> >   /* Check latched inputs and clear interrupt status */
> >   ret =3D pca953x_read_regs(chip, chip->regs->input, cur_stat);
> >   if (ret)
> > @@ -855,7 +850,7 @@ static bool pca953x_irq_pending(struct
> > pca953x_chip *chip, unsigned long *pendin
> >   /* Apply filter for rising/falling edge selection */
> >   bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise,
> > cur_stat, gc->ngpio);
> >
> > - bitmap_and(pending, new_stat, trigger, gc->ngpio);
> > + bitmap_and(pending, new_stat, chip->irq_mask, gc->ngpio);
> >
> >   return !bitmap_empty(pending, gc->ngpio);>

> >   }
>
> Hi Andy, do you have any other suggestions regarding the proposed fix ?

Currently I'm reading the datasheet to understand how the chip
actually works. I'll come back to you soon.

Nevertheless, I would like to hear from Mark if your patch fixes the
issue. Preliminary I can say that it looks like we need slightly
different and more complex logic there.

P.S. Sorry for the delays.

--=20
With Best Regards,
Andy Shevchenko

