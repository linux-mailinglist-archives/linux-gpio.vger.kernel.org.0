Return-Path: <linux-gpio+bounces-1767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD381B36A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 11:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2701D1C24EDC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 10:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA964F20E;
	Thu, 21 Dec 2023 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GLCWmb80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A4551C2F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4b6c2480cccso367155e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 02:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703154007; x=1703758807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03hQ4xDH3ZdArEtlBeQWM6+JQhq7YbGI4xUxwEElpFc=;
        b=GLCWmb80ulkj1cUuoQsoImKjrKl/pUq3AfImb4zTiiU+VQW6YbCXDCpZXoewFr1EkO
         z7ItTfR2EUJdwJDMXfeuThrRc+3B1cipuMRp1vwK9ToybzEPkkjJ7hnobAKeBf6OJbl7
         pn5GShfu1BGCeYYRtLv8l+Iq93NlH8s4mfr9wPdzTJ44QexmusTt5LIkbnajPoneG6wF
         KWvXgJO17G3Qi9PylOA4UvgNMPWmIyKpgNw4VerBcDoxOmuLVV7z8PF6F5YIRKbH5hE2
         TXW5fx7ZOLKV5UciY1K5gTuFrVTnfq4xN4xKIYGUFixoVikXYmE+SBgXDTiz6iZOk1pA
         7neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703154007; x=1703758807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03hQ4xDH3ZdArEtlBeQWM6+JQhq7YbGI4xUxwEElpFc=;
        b=gQ7PbN4B4sWI492bftAhabMxsdKHNd78jkeiG6YhB2p5Maq2zDGRhPij5jbmFIR00O
         CIcrep63W17jdgKSZKpNZFxfGzbiXHXJQmN7dZmcSSIV0zOg6eTJ/GABgsfcouAPpSI4
         B5l4w1SyoJOB0Q9fjw1CvlmNx8P2nuJdd57ueL7sDSteC4LP34P2fCWpiM+XL2P6UXOb
         9Ywr/hxq1R3PCdJWTHDhV8nNc1jxl0TMHIJHYlH2SZQcL8OTuD2DCdPRmOSeltsSFziK
         z8EJPdwfVHTKFVrc7N79VLg8jS9MltX/HEs8PujAEJib+fvpWGfV14DMn60To/g1OvaE
         q91g==
X-Gm-Message-State: AOJu0YxIrxqe+ug7xLPrUWqrwJtLxbJbrm+UlCwroZjHG9GZkSFKTTGU
	jYqhWHZJCeAlvd4zEywk+b5+HEiAJkqzv1tv7fv1gOS8cmOBZw==
X-Google-Smtp-Source: AGHT+IF7JcaUe7esEAOgMsDE8x43U2N9OCJ++O3rTCKcYNxpvMih3JiYiKgj/YASzRkyb5lC7vXlxWIfVjMTcmMVpJQ=
X-Received: by 2002:a05:6122:3119:b0:4b6:dbc2:1079 with SMTP id
 cg25-20020a056122311900b004b6dbc21079mr168382vkb.0.1703154006993; Thu, 21 Dec
 2023 02:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219101620.4617-1-xiongxin@kylinos.cn> <20231220022901.29158-1-xiongxin@kylinos.cn>
In-Reply-To: <20231220022901.29158-1-xiongxin@kylinos.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Dec 2023 11:19:55 +0100
Message-ID: <CAMRc=Md7ODHUSe2fa37NazgJoV5aGXRh1Pp24LcFc49=UXgnwA@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: dwapb: mask/unmask IRQ when disable/enale it
To: xiongxin <xiongxin@kylinos.cn>
Cc: fancer.lancer@gmail.com, hoan@os.amperecomputing.com, 
	linus.walleij@linaro.org, andy@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	Riwen Lu <luriwen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 3:29=E2=80=AFAM xiongxin <xiongxin@kylinos.cn> wrot=
e:
>
> In the hardware implementation of the I2C HID driver based on DesignWare
> GPIO IRQ chip, when the user continues to use the I2C HID device in the
> suspend process, the I2C HID interrupt will be masked after the resume
> process is finished.
>
> This is because the disable_irq()/enable_irq() of the DesignWare GPIO
> driver does not synchronize the IRQ mask register state. In normal use
> of the I2C HID procedure, the GPIO IRQ irq_mask()/irq_unmask() functions
> are called in pairs. In case of an exception, i2c_hid_core_suspend()
> calls disable_irq() to disable the GPIO IRQ. With low probability, this
> causes irq_unmask() to not be called, which causes the GPIO IRQ to be
> masked and not unmasked in enable_irq(), raising an exception.
>
> Add synchronization to the masked register state in the
> dwapb_irq_enable()/dwapb_irq_disable() function. mask the GPIO IRQ
> before disabling it. After enabling the GPIO IRQ, unmask the IRQ.
>
> Fixes: 7779b3455697 ("gpio: add a driver for the Synopsys DesignWare APB =
GPIO block")
> Cc: stable@kernel.org
> Co-developed-by: Riwen Lu <luriwen@kylinos.cn>
> Signed-off-by: Riwen Lu <luriwen@kylinos.cn>
> Signed-off-by: xiongxin <xiongxin@kylinos.cn>
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---
> v5:
>         * fix typo in patch description
> v4:
>         * Add patch tag information
> v3:
>         * Modify the submitter's information
> v2:
>         * Resubmit the patch to fix this exception from the DesignWare
>           GPIO driver side
> v1:
>         * Resolve the exception from the IRQ core layer. (key point not
>           found correctly)
> ---
>  drivers/gpio/gpio-dwapb.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 4a4f61bf6c58..8c59332429c2 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -282,13 +282,15 @@ static void dwapb_irq_enable(struct irq_data *d)
>  {
>         struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio =3D to_dwapb_gpio(gc);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
>         unsigned long flags;
>         u32 val;
>
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       val =3D dwapb_read(gpio, GPIO_INTEN);
> -       val |=3D BIT(irqd_to_hwirq(d));
> +       val =3D dwapb_read(gpio, GPIO_INTEN) | BIT(hwirq);
>         dwapb_write(gpio, GPIO_INTEN, val);
> +       val =3D dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
> +       dwapb_write(gpio, GPIO_INTMASK, val);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
> @@ -296,12 +298,14 @@ static void dwapb_irq_disable(struct irq_data *d)
>  {
>         struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio =3D to_dwapb_gpio(gc);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
>         unsigned long flags;
>         u32 val;
>
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       val =3D dwapb_read(gpio, GPIO_INTEN);
> -       val &=3D ~BIT(irqd_to_hwirq(d));
> +       val =3D dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
> +       dwapb_write(gpio, GPIO_INTMASK, val);
> +       val =3D dwapb_read(gpio, GPIO_INTEN) & ~BIT(hwirq);
>         dwapb_write(gpio, GPIO_INTEN, val);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> --
> 2.34.1
>

Queued for fixes, thanks!

Bartosz

