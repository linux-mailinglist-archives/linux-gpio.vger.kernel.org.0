Return-Path: <linux-gpio+bounces-13759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AF9ECF76
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03992851FD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 15:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE1C1A7AE3;
	Wed, 11 Dec 2024 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zqtzsvdv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFBE24634C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733930053; cv=none; b=trQGF47pdUlxEwcqRK8Kbc8nafWZqUXG74ivuioV6Ts+uWN2fEgI1ZIfja1gDME35DSb18wjzrK218iXoBKNEkRJIAxYtx9TAz4+nqoH9rLpfrwFg5ky3a/BlIFrdNl14asvm2K+P5pjJctDZQI8oWHiQQNsXbHJucd452YQwe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733930053; c=relaxed/simple;
	bh=SC7ZUXHgWqe55nk/L5utb8fF0Bkqw4qK2if2BIOYTfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ltqf8qI006SWnQluxpbPZDwDF51jB3SPEJ1uu74jmw18uX2J4dk6/UydWIu3IvR9Ww4l2R1wp3MRZKoqO2g8bEhueDuB1WYAImXedXDshZC+858NN6dBzxbx+34SzDmcnIjUCtAPQ1ut3gMddvDjsvsX92vA8DFMcLcIhyBFXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zqtzsvdv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3003c82c95cso37514021fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 07:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733930049; x=1734534849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqYCufpGeozk/w2ql0wNvJYxgviWjA6oY81ZOAMNyKw=;
        b=Zqtzsvdvd69fV+nE9uToFCX51s3L0rLGsoJEsQLEN0kCeQu41n4zqq+Bur+zsaysEg
         Rj8kPozKN6QtIZzDgjuPSCahNtq08cRSw4BszEvZgzyL5SON2dQjkjWWjAHjhdr3SshW
         DhEwCh9x5M3UkDuo/UmHIzM3RBIWaKDG1yfrzfDKOCwnp+H35LRpPIK0DMWAGEN258/x
         6bkVxk4RW3yfSufUoAFTfiB+pd9+avt4g0H0zoIs8KFH9mceiRYRvc7XqvVlelVfnmPU
         N3jflKjSBHhU5v9EoeKArbDF/0chah2vOdrsJTtep5f1LsTm59DDEIH862H9sLgX4Mhd
         I0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733930049; x=1734534849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqYCufpGeozk/w2ql0wNvJYxgviWjA6oY81ZOAMNyKw=;
        b=gxmt+VEItdthUeP7J/hJ84ZQT6TYYeqjAFHo02nE9W+k8ZK+MC59DfbHLqtc9sCpaN
         cimyjY5YDi773Ml44LvTzu7QRmiN6Csmd7k5iWUXnKDEpapMhinMe1SLM5NibNS0ReoC
         xeVubJoUyKT0TVdckD8vyLs8CmW6FINKWBtO2ZEqFvhevvHAsgc301nskULUUDjcIP4f
         PtyCmTBXMi+JJvx2FjA38kytMMgfNRueLrIjFT1bMZZT7VFCPatbDmgfdXn9ogtGptPr
         MT+w3E6SbfCOxdVT+WZF/eNhEbWZ4a8GvB/eqkAtrqUe4CyW1b6HJRD81YqfvhSiHTSV
         x2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3c8/Wbcpo0JYtohh5+7pBIGXcQ2OG7OTnJjugVGwxlHwYeNCteghQAxaE8MOC/jJC90WI3B57PEtS@vger.kernel.org
X-Gm-Message-State: AOJu0YzvH/I85zSigCoWXBy/DIaOlfkkY4TrsgLy+f9lTU9VqQXxgzOX
	xI+7/2s2IygXBmpphM2Gn5nKNiXaU8AP1PmXcYG8eVI9CfNuh1JAO4NzfsdGJrlMVywvXG27cK2
	YPVh/xnMK9B8i6/YJz+DZrdiG5sd1S1lDn04m/w==
X-Gm-Gg: ASbGnctgZqkIvpdxjLKM+eqopkjalqggZ05aLVRf9B68pXMdkQ28nPcCfSAGTeVZ8Sx
	med1VuHlmRLwxQxYfuRqabSS0htnxL95itaxNyYGXo3fQJG7A57y/34qGcemG+yT8CNc=
X-Google-Smtp-Source: AGHT+IGC0WWXz60mdNeAfsNVylUF33gyqeauxgwGy0LDu5yfxIUsuLGsKHFRgu7c9nlC5/RpC/2DLHlksvx6ZIk1E30=
X-Received: by 2002:a2e:878f:0:b0:302:4115:ac5 with SMTP id
 38308e7fff4ca-30241150b12mr9789641fa.19.1733930048883; Wed, 11 Dec 2024
 07:14:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com> <0fd4b472b1ed6d67d8d1fe2f20d3bedd7eda210f.1733739697.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <0fd4b472b1ed6d67d8d1fe2f20d3bedd7eda210f.1733739697.git.matthias.schiffer@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 16:13:58 +0100
Message-ID: <CAMRc=McKcRbXsmKq-qBfK62PCzR3sgRp6592c2pGAztVo5omCA@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: tqmx86: add support for changing GPIO directions
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux@ew.tq-group.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> Only GPIOs 4..7 have IRQ support on the TQMx86 variants currently handled
> by the driver, but apart from that, changing directions works fine. The
> default directions are left unchanged (0..3 output, 4..7 input) to match
> the COM Express specification.
>
> A tqmx86_gpio_set() variant without locking is introduced as a new
> helper.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/gpio/gpio-tqmx86.c | 46 ++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 54e7e193bb209..4c7e7b5950426 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -84,6 +84,14 @@ static int tqmx86_gpio_get(struct gpio_chip *chip, uns=
igned int offset)
>         return !!(tqmx86_gpio_read(gpio, TQMX86_GPIOD) & BIT(offset));
>  }
>
> +static void _tqmx86_gpio_set(struct tqmx86_gpio_data *gpio, unsigned int=
 offset,
> +                            int value)
> +       __must_hold(&gpio->spinlock)
> +{
> +       __assign_bit(offset, gpio->output, value);
> +       tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX8=
6_GPIOD);
> +}
> +
>  static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
>                             int value)
>  {
> @@ -91,40 +99,50 @@ static void tqmx86_gpio_set(struct gpio_chip *chip, u=
nsigned int offset,
>         unsigned long flags;
>
>         raw_spin_lock_irqsave(&gpio->spinlock, flags);
> -       __assign_bit(offset, gpio->output, value);
> -       tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX8=
6_GPIOD);
> +       _tqmx86_gpio_set(gpio, offset, value);
>         raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
>  }
>
>  static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
>                                        unsigned int offset)
>  {
> -       /* Direction cannot be changed. Validate is an input. */
> -       if (BIT(offset) & TQMX86_DIR_INPUT_MASK)
> -               return 0;
> -       else
> -               return -EINVAL;
> +       struct tqmx86_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&gpio->spinlock, flags);
> +       tqmx86_gpio_clrsetbits(gpio, BIT(offset), 0, TQMX86_GPIODD);
> +       raw_spin_unlock_irqrestore(&gpio->spinlock, flags);

Maybe switch to using lock guards if you're changing the code anyway?

Bart

> +
> +       return 0;
>  }
>
>  static int tqmx86_gpio_direction_output(struct gpio_chip *chip,
>                                         unsigned int offset,
>                                         int value)
>  {
> -       /* Direction cannot be changed, validate is an output */
> -       if (BIT(offset) & TQMX86_DIR_INPUT_MASK)
> -               return -EINVAL;
> +       struct tqmx86_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&gpio->spinlock, flags);
> +       _tqmx86_gpio_set(gpio, offset, value);
> +       tqmx86_gpio_clrsetbits(gpio, 0, BIT(offset), TQMX86_GPIODD);
> +       raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
>
> -       tqmx86_gpio_set(chip, offset, value);
>         return 0;
>  }
>
>  static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
>                                      unsigned int offset)
>  {
> -       if (TQMX86_DIR_INPUT_MASK & BIT(offset))
> -               return GPIO_LINE_DIRECTION_IN;
> +       struct tqmx86_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       u8 val;
> +
> +       val =3D tqmx86_gpio_read(gpio, TQMX86_GPIODD);
> +
> +       if (val & BIT(offset))
> +               return GPIO_LINE_DIRECTION_OUT;
>
> -       return GPIO_LINE_DIRECTION_OUT;
> +       return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static void tqmx86_gpio_irq_config(struct tqmx86_gpio_data *gpio, int hw=
irq)
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>

