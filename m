Return-Path: <linux-gpio+bounces-16548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A0A43BEB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D413B17345E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11001261571;
	Tue, 25 Feb 2025 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mAUkYqqF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F0260A26
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479746; cv=none; b=B5rsFh+UWuRQbmEeUrnY1xEKSKsVDb8NfMj0MvbqX5bVa5dPJctf0TSpz0BIi0+65HmOjko8CRgdnvlOwher8gpEcGEFdU52AlUehNnOUKjAVsEllCYJm6P2qFcp91CzfV8cV5d5XnCYZ3k+08Wa0T68zT4uMlnAIMRKeV+lNmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479746; c=relaxed/simple;
	bh=mqeYPrC0Jbni8o2GPLE5Q5M3lXmezH0A/f1uj17SVkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmF00zKKX+JJXy76FJmS+ySuao/6HsNBL9pAIdwlIfSDZBZvcrhQYYY/RuQXA/0YLZjT30Rv8IQfKQHzOGvaueTCUmHN88KIxynsKwz8wUyt9fQxGujN2MQ0AwJeXjjiWjASAXvEjKk7O/hHIOWQ0D6NXdgjiGcMQIDmfNMOws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mAUkYqqF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso5072880e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 02:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740479743; x=1741084543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWkswUZMqfevVy0UXA4NMvw9eRHX0pnwJJJrYa4op+c=;
        b=mAUkYqqFDEa4bXqYNb1Z6+tjQCl95Oc1vObnHT0F6MYWSflG7eX/99ONYlMKEZWfIU
         ovhigruU5OZMhwI/m2JSPHuSDOS9ZK61bIpvS0UYQezA7BKu1YDN08ivb7/BI4xnk/gH
         R5juaQrDXR5kX5DjYTyMf7D329PeI3flBmeVKqLoDzTjxOBrSozln4E6qKeO2TeLrzjI
         HdrZ6HvgmIck0uVQKsIh9gGVie+KYyLVVNWhrpR1e6Um2cqEKyVkC+YX5myV4wyTIIv1
         Or3z1rmp7g1EHoF0FaS9X8i8IKhhN3cOP3qiGZFGzKiVDPaXU1OYvW/d6SlJoaW2U8pA
         DzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479743; x=1741084543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWkswUZMqfevVy0UXA4NMvw9eRHX0pnwJJJrYa4op+c=;
        b=i+T4J1yKY3mF0+iQYgOHsJYsBuJG1nRynbU4LWGaTRCPUkw0fgzCxR15H5o/q6KsM0
         5bqfcD/crH+/itgak4uzHkvzq/l5TlBB1gntFRyMT8KNYwqNnK/SrPr9gRTuqW4u4sDk
         wOGRSx/2X/z46sbREQFlXBZb0kSp233rym9sdH8RNwW73G5xYaO2Q91Fby960yArm4/1
         chJkCL4IztUZJKg13idpJitJOBUN2IY4MFPpzLoyqS0tsJdf4btvD2bX13HEtCDz4ktj
         0WVypKepXCEzKJP3/sNjSxovgq/TBWXXpFJkF+S7yohqvrtjdLPh7rIBZ2wQwCntOCEF
         guDg==
X-Forwarded-Encrypted: i=1; AJvYcCUsDR7zT3j3eJ2mNO1GIF7fhpo1ugBn39H9JM6aMnD4c6IQv/6OlBCRNPXDs/ZSWXzRImb/jKNjo8yE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5tUF1mbxu4gtsNLtoYCQmnV2ghaL/3XF0XftUg94M6autx4vB
	eW6H4rSwlGUdzhwnQ09gOnTlPAVc98gJWItEflS8sh1GT0RCaKjtNO7+GaEw+9nZKtV1MKWxz+K
	446uI3NFho906L7OhoTsVf6kLBGho7fd20XQVYMy/EEzVxDxidlHs1Q==
X-Gm-Gg: ASbGnctvfsRQJqF/dWCZg04gUd1qAbXWaxPWnI84W4aSq3luTBwBEfPpIWYJVOClx67
	rFo1IfdcWqI5tMeWSIcU/bkXxo2BmNig2ZAVI34Ye5TkVsIw7DdyYIxujUcD5NtD+NuygWVv/gp
	LNgoTwSjts/kKx/LN05Vj4sPy8F/LZdEOTot0kZxI=
X-Google-Smtp-Source: AGHT+IGVGBEo9wyLm1K/x9da5Fbed363zPzOoOAfJYzvu9T++3+EDILNDSJrlots2Z/U4bIECPAu75iCiDMiHdSjPWo=
X-Received: by 2002:a19:f61a:0:b0:548:de7f:b3be with SMTP id
 2adb3069b0e04-548de7fb4e5mr313788e87.21.1740479743336; Tue, 25 Feb 2025
 02:35:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <20250210-gpio-sanitize-retvals-v1-4-12ea88506cb2@linaro.org> <Z7yekJ8uRh8dphKn@black.fi.intel.com>
In-Reply-To: <Z7yekJ8uRh8dphKn@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 11:35:31 +0100
X-Gm-Features: AWEUYZnCp-KDYRM5tDKxLTZuy1OY-X2886HZx6-p_7y2wEThFHxE_ISRfreGXp4
Message-ID: <CAMRc=Mej-GHH3buisJLhRfqoWd9Bfcfy-jbHJM3Oe2Cw=Bk9Ew@mail.gmail.com>
Subject: Re: [PATCH 4/8] gpiolib: sanitize the return value of gpio_chip::get()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 5:30=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Feb 10, 2025 at 11:51:58AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As per the API contract, the get() callback is only allowed to return 0=
,
> > 1 or a negative error number. Add a wrapper around the callback calls
> > that filters out anything else.
>
> ...
>
> > +static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +     int ret;
> > +
> > +     lockdep_assert_held(&gc->gpiodev->srcu);
> > +
> > +     if (!gc->get)
> > +             return -EIO;
> > +
> > +     ret =3D gc->get(gc, offset);
> > +     if (ret > 1)
>
> Perhaps use the respective GPIO macro instead? Otherwise it's not clear w=
hat
> the meaning of 1 is.
>

We don't have one for GPIO values.


> > +             ret =3D -EBADE;
> > +
> > +     return ret;
> > +}
> > +
> >  static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio=
_desc *desc)
> >  {
> > -     return gc->get ? gc->get(gc, gpio_chip_hwgpio(desc)) : -EIO;
> > +     return gpiochip_get(gc, gpio_chip_hwgpio(desc));
> >  }
>
> ...
>
> >               for_each_set_bit(i, mask, gc->ngpio) {
> > -                     value =3D gc->get(gc, i);
> > +                     value =3D gpiochip_get(gc, i);
>
> This will delay the function for checking every time if the get() exists.=
 Which
> must be here.
>
> >                       if (value < 0)
> >                               return value;
> >                       __assign_bit(i, bits, value);
>
> What I would expect here is something like this:
>
> static int gpio_chip_get_value_nocheck(struct gpio_chip *gc, unsigned int=
 offset)
> {
>         int ret;
>
>         lockdep_assert_held(&gc->gpiodev->srcu);
>
>         ret =3D gc->get(gc, offset);
>         if (ret > GPIO_LINE_DIRECTION_IN)
>                 ret =3D -EBADE;
>
>         return ret;
> }
>
> static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_de=
sc *desc)
> {
>         return gc->get ? gpio_chip_get_value_nocheck(gc, gpio_chip_hwgpio=
(desc)) : -EIO;
> }
>
> But I see the downside of it as it might lurk without RCU lock if get is =
not
> defined. So, up to you.
>

Makes sense, gpiochip_get() is only called in gpio_chip_get_value()
and gpiochip_get_multiple() where gc->get is already checked.

Bart

