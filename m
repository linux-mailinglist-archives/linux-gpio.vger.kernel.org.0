Return-Path: <linux-gpio+bounces-15520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF431A2BE57
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654DD169DAD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBBF1B3957;
	Fri,  7 Feb 2025 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kkTkrQFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7D188907
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918007; cv=none; b=VC/un3YvCTU9pNWzbhd/0RGlci+lrrluLvFK2qU9rA/SH4G8IeBiDtEIaQIlsyE/f+uguUIMh28bmZXnjx/UJJEjG/cwSFcRYkre3/VxDJGWUgedbn8iJinE/gAzd/a20lHMUNbBYM5x+4SfVmqQVazpU4Z5Y5gMkjJSD8exygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918007; c=relaxed/simple;
	bh=/PL3F+Odm8sDQkKZjBFX/dKsMg8zyOLm688XjDETz80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlRtVSG3Cmu7hCvX7h6YL+lBgCwRRZdvkvyjx3E5sSFrI0dgxp/drzUzlSK/ME4riDQhE4bkH9ZWKu0giqN6mCZ49DjVWeXXAZTTAJkGjEZ9BVIKfeUrqOLKsskyavkMo6s19Y8F5yLKQ5/S7aMOJoMdrRQOvtZfBR/IK1EOpXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kkTkrQFC; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307de8f18d6so12353261fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738918003; x=1739522803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG4fsHlA6ZIYyL5J3zXb87BTeZ5glrN9fOoi7j2CduM=;
        b=kkTkrQFCPWYLtgout9JHRJJC8tpVXpNXy5KCgtqd2KdXOjkQCEHTEeWfy+nhl6J2vQ
         OHqF1QtsyWChcF11y3Ki5hEU9OJx5iej/alllh0QSj1i9+WwvPNUYcYt5mNiv98t6o+I
         OY8XZdJ4H/r2A9pGz2dxDuXdiPqPtW3i43eK/FN6pvqHFuOV6u84XA0tYtRfB460efRj
         ZrKDQVsPY2jccLgIjgPZf5tnwNKBvFnPjNDtP598v//vz1qYtEaucXYcdlSbchGDSugy
         Rxolyh7eAZgQfDCJntEcODrwNCwJcD2pRf7H2p1m99aSArvjXOn+1dk73CsCDT0aHid8
         pGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918003; x=1739522803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QG4fsHlA6ZIYyL5J3zXb87BTeZ5glrN9fOoi7j2CduM=;
        b=mccBjez1xR8RMM/t527TWCeKK7JYOPu0uzCVSBe87ZEPzdti3Y8xPSgv93rI4a70hL
         cxZm7IXumK97lWWNhv5N6tUQVfMrLYzDWsad1l8mGB4mvoONdlOZ29AD5LSievWBD85Y
         NagSWNNs3U/O4B17hBkKF6X3jcioHWMYWmkHOQ1wLPxQ/7Zz5gklJcPPDnbIgta51KEB
         a2DIORyy/0UyPc4mE1/iIJTg7eP9w4gJlys69FW3X0DzBTDhHCSIttNjyLWbhkG7VdjP
         t8c/0PO+tijnIYbyb5cAKkMGnuk22X8sfH+UsZAAgZXukjO2NMVTFLn5ecpFePFghsE/
         plAg==
X-Forwarded-Encrypted: i=1; AJvYcCXGdV6SVKuKtxfAspXNli5u95lr41WYUmQ6b0gt27Ba/BcY2+Ie+jvvBbX1pnhBOc6B5Npi7EGLkanw@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEIObuOFiz6O5tI6ghoOqMrfTCUspXaet78LkYvd2iR/B7xD9
	qYVHvkhZxdhpfqbsjJWnTym6Om2YHYeNd+OBHX6iBX3WTO9bLge10otCCkXR2tbIeoN+cN1+tWh
	0g6XVURZuurj0sttGpcWV7oQ5lrr+b+KZ+igAtfRAFIB+wPC+/D0=
X-Gm-Gg: ASbGncvfgfZMKPs36Nv388B0ZigttLYuslrxj4jCBddFmvu5vsMnBrIwOam0qOyE4M3
	LJutWqzqRsmCr1ak4gdrXlhtU08Z9xD7/Tw6CpHqJh0qczM75jpxHcqJQtFylNUtMWeaXaVKlBi
	+4m/nDFU7YKFCLabubOMlYx+G3Yw4=
X-Google-Smtp-Source: AGHT+IEm0faBVdVl9PjoHwoJbVHYreUiIDgEOuDYoTNcEfQYuhaKkIrH8p9HKr5Sdn3D9dm5RKdAJZ4ezE2+znUjf1c=
X-Received: by 2002:a2e:a10c:0:b0:302:3de5:b039 with SMTP id
 38308e7fff4ca-307e57bc6b9mr5403511fa.8.1738918002457; Fri, 07 Feb 2025
 00:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:46:31 +0100
X-Gm-Features: AWEUYZkmBgMCpveGQvSr0D8McJ0InmKUA3IpAMEtZrdd4WfIVBN0a-0mnZDOhBQ
Message-ID: <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Refactor for_each_requested_gpio_in_range() to deduplicate some code
> which is basically repeats the for_each_hwgpio(). In order to achieve
> this, split the latter to two, for_each_hwgpio_in_range() and
> for_each_hwgpio().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/gpio/driver.h | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index a307d8ed9c51..24890ecfa0fb 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -549,20 +549,25 @@ DEFINE_CLASS(_gpiochip_for_each_data,
>              const char **label, int *i)
>
>  /**
> - * for_each_hwgpio - Iterates over all GPIOs for given chip.
> + * for_each_hwgpio_in_range - Iterates over all GPIOs in a given range
>   * @_chip: Chip to iterate over.
>   * @_i: Loop counter.
> + * @_base: First GPIO in the ranger.
> + * @_size: Amount of GPIOs to check starting from @base.
>   * @_label: Place to store the address of the label if the GPIO is reque=
sted.
>   *          Set to NULL for unused GPIOs.
>   */
> -#define for_each_hwgpio(_chip, _i, _label) \
> +#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)       =
               \
>         for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> -            *_data.i < _chip->ngpio; \
> +            *_data.i < _size;                                           =
               \
>              (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NULL) =
\
>                 if (IS_ERR(*_data.label =3D \
> -                       gpiochip_dup_line_label(_chip, *_data.i))) {} \
> +                       gpiochip_dup_line_label(_chip, _base + *_data.i))=
) {}           \
>                 else
>

Can you add a kerneldoc here as well, please?

Bart

> +#define for_each_hwgpio(_chip, _i, _label)                              =
               \
> +       for_each_hwgpio_in_range(_chip, _i, 0, _chip->ngpio, _label)
> +
>  /**
>   * for_each_requested_gpio_in_range - iterates over requested GPIOs in a=
 given range
>   * @_chip:     the chip to query
> @@ -572,12 +577,8 @@ DEFINE_CLASS(_gpiochip_for_each_data,
>   * @_label:    label of current GPIO
>   */
>  #define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label=
)              \
> -       for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);        =
               \
> -            *_data.i < _size;                                           =
               \
> -            (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NULL) =
                 \
> -               if ((*_data.label =3D                                    =
                 \
> -                       gpiochip_dup_line_label(_chip, _base + *_data.i))=
 =3D=3D NULL) {}   \
> -               else if (IS_ERR(*_data.label)) {}                        =
               \
> +       for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)        =
               \
> +               if (*_data.label =3D=3D NULL) {}                         =
                   \
>                 else
>
>  /* Iterates over all requested GPIO of the given @chip */
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

