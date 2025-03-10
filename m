Return-Path: <linux-gpio+bounces-17394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC828A5A020
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 18:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76EF172119
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 17:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A50233732;
	Mon, 10 Mar 2025 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VZrBsfMH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186518FDAB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741628802; cv=none; b=iZ9FUYTgUfI3+Gxc4ZaEVAdYreFN+4WszMSxyUEWUm6Dt8liEfja1x+JxcwlqIr37Tov/D04Pr9FfN+t3EpmV0P1BK7hFi03sSglFavHG+I++ve18IjVOTKzGCT+taSK80gQj0lR7JyHVVavj47+a8tTAEg8JtKJiXkaHc5gHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741628802; c=relaxed/simple;
	bh=4uLltCACvYicVxRYPpWKm4SAqCoW23xsWjuTWnGbSuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqswFt3GnCDuAkTSR3+XOTiGXQFlVkaoe260TnMj21MIrZey7+S1NE/ocedJUjrI/4IFpdg+bi2XPPT7qVnIGQMUGM1TaLv1yeonLcydVXyS2X4F9/TL8ahzMYv6IP5Y8FJPo7e3H2kPEw68ySCS1V4HZ4RffMRw1HbJavaAy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VZrBsfMH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bee1cb370so40647271fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741628798; x=1742233598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUpU501ei/PNPOm4yAAqXvMJC86phg8k2kbGDUH1pM0=;
        b=VZrBsfMHI+7r1NE6p07nRq2ij1KlmTpuKyAG7rYKmMruww8Q9xnPl699V0Yn5SimjF
         VKNIQYs1+0nnRZdHHnZvZPTJ7a/tOFUUt0QTxP6Vc8QHZmR1Mo7p8U2oj4j6Df5dY0mL
         LdQ250Z2V+A8edCIblRfGWB4dBg5YB39hJ06nBbzQO3MgWGIlDhivjmmdMa8MMRZWuCI
         B7v+tpbEXLxfTNWM26OR6Nf5oOdfYRhUnsu0TSk+OMtWSSsZauz1usF2rapOzBi4crJ0
         wMbmZzcT7ZvVy++Ogfqm8H7bFyBkGA5CZ10XGptuLgjv8U9wQYlPvvzs15jA9Fhk3Wm/
         xwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741628798; x=1742233598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUpU501ei/PNPOm4yAAqXvMJC86phg8k2kbGDUH1pM0=;
        b=MLQSDZ+yVXnlQRetahDkSR5gD26DHOxZ32NTTALjpmxVtZuAC22p2t0pQ6vuPwjjDx
         L8n7PQamkVwfFbHz6wNyXHb5fsKS5Y2MK6Zqpqw7huMeY21nrR69GwmffnR8eepJTQh1
         Q7SEy2Bf7sV3P62hyreTd0w8xcGU3+jYSfeZCu7ASQ73zxzO4UVmN63g7IQ07gzrvNYc
         zyY64cZrJZOFVLIzx1mkI2xb1UizlLxFseQuCZPNeFHdXO5q5SrOJEkpqAsF6W+t9thb
         omHuABgYX6S4Yvm7Cnq2TVSXnNtOmMtSe/cOKlF5yEVkLo3NvgodkIUtFKvnyhQlFYXy
         pIdA==
X-Gm-Message-State: AOJu0YwIcI25o62XQRxHxSbMbm9uZ7KfqhQpVkzFBxnonGugJDbLWqyG
	JOXpnngjXPL0I9+3ZEB4CvTYZv0p8KJO3R7pN+yx0uoSNACjyZCVdu4blacbjIplKa52KDDa99W
	cZ29J1CCol/GUxRLzqLXE1p78fZaMq6oNzcLeeA==
X-Gm-Gg: ASbGncsHPL7VOsrMOl6oUsbKbGXYkIA4mUp6fGy3/csWebFN08Xdly19IVpF75LQaRq
	SV4qSFHDfwy6oBFIfBMTdBJu1wJUCIxPhIbaxdGVm+GMdNOinToOaaNX51grpZ0VBpOXhiBdrk2
	B8bpL8j+uuQSzw1GCzw/U6nLlBhmpb0Wxvv3fcSMIVV8t2IcnM3ZfvfcPt9w==
X-Google-Smtp-Source: AGHT+IFBYfM32AsdMmFXT9vtQetZdXZh1+deTDuBbcq70QsLY8zmEDuV/m0LqhHjEKW7jAdx3a4Xe0OqnTyM3+NW79M=
X-Received: by 2002:a05:6512:2391:b0:549:58d5:f899 with SMTP id
 2adb3069b0e04-54990eadc5cmr5088857e87.37.1741628798130; Mon, 10 Mar 2025
 10:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
 <CAMRc=Me9_EvVj2U-wGWjoVyH_igZBtUs1ymtE=4_r2EkSBAAcA@mail.gmail.com>
 <oedikhiegt3iqj7xg4vtfhlqxihicd7bdtaglk73q2m3c42zla@roh336fpkszm>
 <CAMRc=MeHBYngume_k-tfqEnkrkt3-axWKXKS1xkxkyH-6QFSkQ@mail.gmail.com> <n25f2iho3yn7ahx6isnm55g2cw5ox34rhqukhvgohzmtq22vzl@p5pptw6lw7ln>
In-Reply-To: <n25f2iho3yn7ahx6isnm55g2cw5ox34rhqukhvgohzmtq22vzl@p5pptw6lw7ln>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 18:46:25 +0100
X-Gm-Features: AQ5f1JoXjZe310pFyU4_3kJ4B-XZJIfs-9I-yEIT3zLopRXY2AGupZ8pUJdT7IE
Message-ID: <CAMRc=MdPLpQTeebDPk0+5ovuFCjcpNdb3BN5c7ADAxStE08JBQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 5:28=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>

[snip!]

Please remove unnecessary context from responses. You attached
hundreds of lines of stack traces here. :(

>
> Thanks, I've confirmed it. It seems I overlooked it because somehow
> lockdep and kasan were not enabled for a while.
>
> Assuming the v5 patch series rebased onto the latest gpio/for-next
> 21c853ad9309 ("gpio: adnp: use new line value setter callbacks"),
> the following follow-up patch should suffice.
>
> ------------8<--------------8<---------------
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index df34d8fcb79a..56f0fde8c843 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -207,7 +207,18 @@ static void aggr_free_lines(struct gpio_aggregator *=
aggr)
>
>         list_for_each_entry_safe(line, tmp, &aggr->list_head, entry) {
>                 configfs_unregister_group(&line->group);
> -               aggr_line_del(aggr, line);
> +               /*
> +                * Normally, we acquire aggr->lock within the configfs
> +                * callback. However, in the legacy sysfs interface case,
> +                * calling configfs_(un)register_group while holding
> +                * aggr->lock could cause a deadlock. Fortunately, this i=
s
> +                * unnecessary because the new_device/delete_device path
> +                * and the module unload path are mutually exclusive,
> +                * thanks to an explicit try_module_get. That's why this
> +                * minimal scoped_guard suffices here.
> +                */
> +               scoped_guard(mutex, &aggr->lock)
> +                       aggr_line_del(aggr, line);
>                 kfree(line->key);
>                 kfree(line);
>         }
> @@ -926,8 +937,6 @@ static void gpio_aggr_device_release(struct config_it=
em *item)
>  {
>         struct gpio_aggregator *aggr =3D to_gpio_aggregator(item);
>
> -       guard(mutex)(&aggr->lock);
> -
>         /*
>          * At this point, aggr is neither active nor activating,
>          * so calling aggr_deactivate() is always unnecessary.
> @@ -1072,7 +1081,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
>                                                         &line->group);
>                         if (error)
>                                 goto err;
> -                       aggr_line_add(aggr, line);
> +                       scoped_guard(mutex, &aggr->lock)
> +                               aggr_line_add(aggr, line);
>
>                         error =3D aggr_add_gpio(aggr, key, U16_MAX, &n);
>                         if (error)
> @@ -1101,7 +1111,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
>                                                         &line->group);
>                         if (error)
>                                 goto err;
> -                       aggr_line_add(aggr, line);
> +                       scoped_guard(mutex, &aggr->lock)
> +                               aggr_line_add(aggr, line);
>
>                         error =3D aggr_add_gpio(aggr, key, i, &n);
>                         if (error)
> @@ -1205,8 +1216,10 @@ static DRIVER_ATTR_WO(new_device);
>
>  static void gpio_aggregator_free(struct gpio_aggregator *aggr)
>  {
> -       if (aggr_is_activating(aggr) || aggr_is_active(aggr))
> -               aggr_deactivate(aggr);
> +       scoped_guard(mutex, &aggr->lock) {
> +               if (aggr_is_activating(aggr) || aggr_is_active(aggr))
> +                       aggr_deactivate(aggr);
> +       }
>         aggr_free_lines(aggr);
>         configfs_unregister_group(&aggr->group);
>         kfree(aggr);
> ------------8<--------------8<---------------
>
>
> * The second hunk should be squashed into
>   [PATCH v5 4/9] gpio: aggregator: introduce basic configfs interface
>
> * The rest of the hunks should be squashed into
>   [PATCH v5 8/9] gpio: aggregator: expose aggregator created via legacy s=
ysfs to configfs
>
> If you agree with the above approach, I'll send out v6,
> while also addressing your feedback here:
> https://lore.kernel.org/all/CAMRc=3DMdoMKdqyzGMFDa3aMz3h=3DvfZ0OtwARxY7Fd=
sPKcBu9HQA@mail.gmail.com/
>
> Koichiro
>

I won't be testing in-line diff chunks. Please, just fix these issues
and send a v6. Also: please do write some sort of a script to automate
the testing of this driver if possible. Ideally: add test script to
selftests.

Bart

