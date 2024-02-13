Return-Path: <linux-gpio+bounces-3243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6985345D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 16:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E05DB2A7CF
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D753357884;
	Tue, 13 Feb 2024 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wqDTEDyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A25FDD4
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836765; cv=none; b=ouFJZkSOSAhd2IvE0rPNV+aMbEHNhmJsRSoAlX6ZcD2ewosAKTnPAN3/hqykFZNy5NRVUTuXm4CT5t2v0NFpIpST1e/iu/uFGrfPCBrzlDIKYispjg2GuvBlPcSiDzRlFD0fSjM+9kjwAFajSDMMYEfE62FEzxiyD7iz8HcOX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836765; c=relaxed/simple;
	bh=fbF1PvlbWN3zD8U5fpR4FOV0dObiDAn6q6ytupi4qzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP/JHmWOhyRMvAfRZrUm9qeoN/BjvmFH28Y7HfKNYwSINHTwe0pE13txyVfy/pw3f5/J+Pv0+PYxm5X82ZHUBks32tzshG6hz/3Hp6Wz8M5bjOQj4PzufyPyKjxG6Nju3cAmLMN2OSAL4Jawm2iKkhW60DjeaBMtI5RWNoFycN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wqDTEDyU; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2193ccbb885so1730469fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 07:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707836763; x=1708441563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ApEu/3sIgnPz+WuXL0PiSYq9FhzP3cQXV7R+bXp+jI=;
        b=wqDTEDyUE8oCDpS6e5+TBDLrtgBN7jsZ9kFRfNkHAzBtH7xqiHe5PaenGn2rbyCU/b
         //v0HkoAESaUHEEv6a2dODbdHquEkm5CPwQSuF0qS6agB+SNMtfhcV1rsyEthHnD0gTW
         14+KoeG7zuEXpkwQCkrnuEolK5qaIYgFX1LRjSbIesVs+gTvbBDKWkizZb/qaD0ZT96z
         XjK6/roKG7/kQnnWzbrB/jSbBACBSzJ8m0iya7FL08fSSk0kdLXC7/tTPpGZeYTey2d9
         es5LAesrwWZ4cHe9znrD5Iw8XTnXIeLanGSsQ2ET1ySNPsJp63Wj6YqgCDDE9Z4VfObV
         SY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836763; x=1708441563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ApEu/3sIgnPz+WuXL0PiSYq9FhzP3cQXV7R+bXp+jI=;
        b=FBhRytOHCst+PYwA8hGJiCA/Mxw2N86RG5oVhJBUfLDMEJtew2iFDUG+0oAsX6ru8l
         H58lCIm1WB3rGmeq4HAq/sk/nPvOeNWgEiUcqj86LV//R1NUDxUMgz9up6zP9e8+DEMs
         Y3GVGfdMkA2mWlDPjLmHNnSADOiG/g1WM0j+qv6GZAkc2iaVSv2sdNXpB9i5W1jtkLKp
         fBGUiKsfZgAEIyA24aUV8qGn0zwP6ciUW5BI/MN0GsXFAC16ZKAD8oeZGjOr48Mgsglc
         tXZdSBJIdbiSPlLq+ptOYNr5/uMNSRPS2Ma6TtWLUPKGgX8slr9/q5MpUTI4TTPrIwnK
         0xsg==
X-Gm-Message-State: AOJu0YyTuXzi3gshGQBRHABXo7LxigettXlSQDfb/+v+fRi+l+/ZtdQ+
	TzIYjcZPmATrcrLCXGnWH7fbhwLk4nai9udC7FFloD2/W6vLFDKOxFhtk94Lvn/AX9px4G+FB/J
	Dqpk4eq7sWx7cFXm2YGeT06zY+qs38ljikRuyDA==
X-Google-Smtp-Source: AGHT+IH++eu0yEteTnpJEBWZLuftuwuAi2WUJWHv6bizQcozGEbb7E3tLosD5iBoAdkxx8BtnXc5qmaF7ZVKdEk+5DA=
X-Received: by 2002:a05:6871:80f:b0:218:55c9:bb20 with SMTP id
 q15-20020a056871080f00b0021855c9bb20mr11649920oap.21.1707836762423; Tue, 13
 Feb 2024 07:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213920.49796-1-brgl@bgdev.pl> <Zct_7YcJk5-sg2pT@smile.fi.intel.com>
In-Reply-To: <Zct_7YcJk5-sg2pT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Feb 2024 16:05:51 +0100
Message-ID: <CAMRc=Md40TPhTq7jwWQz8HmCJEZc4ixmjqhVjbcNzo1e6zwHNg@mail.gmail.com>
Subject: Re: [PATCH] gpio: initialize descriptor SRCU structure before adding
 OF-based chips
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 12, 2024 at 10:39:20PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In certain situations we may end up taking the GPIO descriptor SRCU rea=
d
> > lock in of_gpiochip_add() before the SRCU struct is initialized. Move
> > the initialization before the call to of_gpiochip_add().
>
> ...
>
> This is a bit unclear why you moved to that place and how it had been tes=
ted.
>

I didn't move it, I just added SRCU before it. It can be triggered by
a simple hog from DT. The link leads to a crash report.

> > @@ -991,10 +991,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *g=
c, void *data,
> >       if (ret)
> >               goto err_cleanup_gdev_srcu;
> >
> > -     ret =3D of_gpiochip_add(gc);
> > -     if (ret)
> > -             goto err_free_gpiochip_mask;
> > -
> >       for (i =3D 0; i < gc->ngpio; i++) {
> >               struct gpio_desc *desc =3D &gdev->descs[i];
> >
>
> >               if (ret) {
> >                       for (j =3D 0; j < i; j++)
> >                               cleanup_srcu_struct(&gdev->descs[j].srcu)=
;
> > -                     goto err_remove_of_chip;
> > +                     goto err_free_gpiochip_mask;
> >               }
> >
> >               if (gc->get_direction && gpiochip_line_is_valid(gc, i)) {
>
> >               }
> >       }
> >
> > -     ret =3D gpiochip_add_pin_ranges(gc);
> > +     ret =3D of_gpiochip_add(gc);
> >       if (ret)
> >               goto err_cleanup_desc_srcu;
> >
> > +     ret =3D gpiochip_add_pin_ranges(gc);
> > +     if (ret)
> > +             goto err_remove_of_chip;
> > +
> >       acpi_gpiochip_add(gc);
>
> My logic tells me that if you need to call gpiochip_add_pin_ranges() befo=
re
> calling of_gpiochip_add(). It won't collide right now, but allows to clea=
nup
> further (with the gpio-ranges parser be generalized for fwnodes and be mo=
ved
> to gpiolib.c from gpiolib-of.c).
>

But it was already called before gpiochip_add_pin_ranges() so it's
material for another patch.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

