Return-Path: <linux-gpio+bounces-25935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA9B52AF1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 09:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F17A1C81DEF
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 08:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0A12C21EC;
	Thu, 11 Sep 2025 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SqKonPDQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C852D2480
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577496; cv=none; b=hS0LuxGGTY3IdPLOQszs3eMCaNhiVMBvTr0JjlJwm7g/TesOSvXEGEUIIKA/TSRpHfLHcS3N4OB8JhD6MhklHWgmjNURwvuRv918t6G/4njZ4D8oFhpULmRWvLuW67xf9A8SbtmAXjkQf0i6BUePVQ1WQ/F43vWHHz6ep6tjMfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577496; c=relaxed/simple;
	bh=k5ahMUqdMdJulQ7MusieR6bipeU47j/JtPXFNQDqs2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGPOAY/yJ53Z5h5H6RlIETTpKWY3LxEiVnvmFLRfFoTMEkoujN00zOCQiZyaFUh1sIOJgxSy3UmUXO2PDz4oUovGHeqgxgEKwRnReeLxtKr2nju7vvAUswVClRgjR4jnnNdFj5juqrWaU04dAjMTdpR564s0ToErUzdHfajPdB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SqKonPDQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so438582e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577492; x=1758182292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GreFsnaaeM4F+2voh3Z9EQbdTyQ1sQF/UoQy0TFeeU=;
        b=SqKonPDQG46JIhHnqrePD4+aN44vIEkzw82kGvmsDjidhbpxALRw67xp6p/ScIUzB3
         KE33sKUR5aQmVN1kZ/STlaEnYQaauYBwwtrM8c2kVqLLijfEvPcQaJxOD8YYcleyVjpn
         j5ClQKDe+Ghd5mmqflgvPHJBCa/lymtBIop+APA2kVjImp8Jk99zTyf/nvC/sQKQbQTd
         QCDHMZQTu2jDvgA1mwDxi5BaSnAuM0i/k9YzofZr0viKlKUlzXJvMSYzXO8ZCqqNuTCG
         By0P9CEqqyJWfvZGC1+zPlFZN6+9sM7xCE2iylLW1K1vp9gNikSe9vNP7y+jOt1DcKvv
         OzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577492; x=1758182292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GreFsnaaeM4F+2voh3Z9EQbdTyQ1sQF/UoQy0TFeeU=;
        b=XGQDFc5V09Jm7lJNNz6S6CFp/fUL7RJVTVqPh98IVbiTxG0D+mLFRmYQrLYsgBvBBD
         q0rXgMu10UeSMIFPwg9dxTZvBkKsu7c23OjUP3c068oLqMTvrW89zWijNHxyrqduF2cd
         U6BYi4AFHiNZytfRl5ex7EDEvze3GqbQstO5ZEbOqyTng9AJQ+p/uf8yhtYPskrTcypr
         vUvlCodudkJQAqs5LaQiXY1078M7juD0JDnaXm9jTJXQXMmKY2+P7134RVTOhFWmxK+P
         W4R84M/5Iroj40U9xAiFxmtgUcIz//l902idBtiItFe1mgDyfVr024RMxfhxWkpMX0OH
         IwCQ==
X-Gm-Message-State: AOJu0Ywy47shmZaKJmSOy41cV9N055+Jf2NG+ji0078AuK+C7gc7f7Iw
	MU1y8COLYsWMwmOTtQE1Xb3vrIM5n4HupRv4tEsT1RyMRk4o0pdVkQJdR2CdvQwqtmjP7MRyV44
	Z1zhIMUvBLoZAsS3aDnxdDVrk+iCNobVbkgc0qX7vEg==
X-Gm-Gg: ASbGncso8O1G8r4BJ5O2ditJC0GXlAqf2dqfRE3dBY7KqN5DuWVuhRWmsHnuPT0mEN9
	uA3qKVChGRZx/FHC09gAvz5HmQovrvZNOycJy2nBhR3HE6Z7wzuG5+QA8draFSTlMPFqFMQRAoI
	dzA1SdP7uh6uE/yccd6SKBVxfCKL2NzOfysD/kfKEIwD6NGwn7/te/GnxGe3J+l+3GGkE0Nvieo
	qPCz9+u9Dhcajyp1tqQf5MQB/aPX5ML4TJSPStwTN/5VVL0AA==
X-Google-Smtp-Source: AGHT+IGgQPXJhEububGtvbDREjokdFRgGwQ7+DoVBOt9p2K1Y+stul+X10YQV8+eyAVrpHY8+Nm0/o9541URIeuNSZA=
X-Received: by 2002:a05:6512:3b23:b0:55f:7c3a:1176 with SMTP id
 2adb3069b0e04-56263007fcdmr5516725e87.55.1757577492077; Thu, 11 Sep 2025
 00:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org> <01a7cc78-fdae-4a1e-bf78-961e7ec214b2@sifive.com>
In-Reply-To: <01a7cc78-fdae-4a1e-bf78-961e7ec214b2@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:58:00 +0200
X-Gm-Features: Ac12FXyXoGE4qN9kFjk5zZjGFtdcTiIkPbg-LiY7JH2VZtvP8BTrqAJA-TJekfs
Message-ID: <CAMRc=MedZ3ub=7gacx_sW0C9f9Ra5XC94xgwLTt_7iq=Y4UFEA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] gpio: sifive: use new generic GPIO chip API
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 2:37=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Bartosz,
>
> On 2025-09-10 2:12 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++--------------=
--------
> >  1 file changed, 38 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> > index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..2ced87ffd3bbf219c118573=
91eb4ea808adc0527 100644
> > --- a/drivers/gpio/gpio-sifive.c
> > +++ b/drivers/gpio/gpio-sifive.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio/generic.h>
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > @@ -32,7 +33,7 @@
> >
> >  struct sifive_gpio {
> >       void __iomem            *base;
> > -     struct gpio_chip        gc;
> > +     struct gpio_generic_chip gen_gc;
> >       struct regmap           *regs;
> >       unsigned long           irq_state;
> >       unsigned int            trigger[SIFIVE_GPIO_MAX];
> > @@ -41,10 +42,10 @@ struct sifive_gpio {
> >
> >  static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int =
offset)
> >  {
> > -     unsigned long flags;
> >       unsigned int trigger;
> >
> > -     raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> > +     guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
> > +
> >       trigger =3D (chip->irq_state & BIT(offset)) ? chip->trigger[offse=
t] : 0;
> >       regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
> >                          (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset)=
 : 0);
> > @@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *ch=
ip, unsigned int offset)
> >                          (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) =
: 0);
> >       regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
> >                          (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) :=
 0);
> > -     raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
> >  }
> >
> >  static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int t=
rigger)
> > @@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data=
 *d, unsigned int trigger)
> >  }
> >
> >  static void sifive_gpio_irq_enable(struct irq_data *d)
> > -{
> > +     {
>
> This looks like an unintentional whitespace change.
>

Ah, thanks, checkpatch did not spot it. I'll fix it when applying.

> >       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> >       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> >       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> >       int offset =3D hwirq % SIFIVE_GPIO_MAX;
> >       u32 bit =3D BIT(offset);
> > -     unsigned long flags;
> >
> >       gpiochip_enable_irq(gc, hwirq);
> >       irq_chip_enable_parent(d);
> > @@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data =
*d)
> >       /* Switch to input */
> >       gc->direction_input(gc, offset);
> >
> > -     raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> > -     /* Clear any sticky pending interrupts */
> > -     regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > -     raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +     scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> > +             /* Clear any sticky pending interrupts */
> > +             regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > +     }
>
> This block (and the copy below) don't actually need any locking, since th=
ese are
> R/W1C bits. From the manual: "Once the interrupt is pending, it will rema=
in set
> until a 1 is written to the *_ip register at that bit." I can send this a=
s a
> follow-up improvement if you want to keep this limited to the API convers=
ion.
>

Sure, please do.

> So with the minor whitespace fix:
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>

Thanks,
Bart

> Regards,
> Samuel
>
> >
> >       /* Enable interrupts */
> >       assign_bit(offset, &chip->irq_state, 1);
> > @@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *=
d)
> >       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> >       int offset =3D irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> >       u32 bit =3D BIT(offset);
> > -     unsigned long flags;
> >
> > -     raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> > -     /* Clear all pending interrupts */
> > -     regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > -     raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +     scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> > +             /* Clear all pending interrupts */
> > +             regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > +     }
> >
> >       irq_chip_eoi_parent(d);
> >  }
> > @@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regma=
p_config =3D {
> >
> >  static int sifive_gpio_probe(struct platform_device *pdev)
> >  {
> > +     struct gpio_generic_chip_config config;
> >       struct device *dev =3D &pdev->dev;
> >       struct irq_domain *parent;
> >       struct gpio_irq_chip *girq;
> > @@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_devi=
ce *pdev)
> >        */
> >       parent =3D irq_get_irq_data(chip->irq_number[0])->domain;
> >
> > -     ret =3D bgpio_init(&chip->gc, dev, 4,
> > -                      chip->base + SIFIVE_GPIO_INPUT_VAL,
> > -                      chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> > -                      NULL,
> > -                      chip->base + SIFIVE_GPIO_OUTPUT_EN,
> > -                      chip->base + SIFIVE_GPIO_INPUT_EN,
> > -                      BGPIOF_READ_OUTPUT_REG_SET);
> > +     config =3D (struct gpio_generic_chip_config) {
> > +             .dev =3D dev,
> > +             .sz =3D 4,
> > +             .dat =3D chip->base + SIFIVE_GPIO_INPUT_VAL,
> > +             .set =3D chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> > +             .dirout =3D chip->base + SIFIVE_GPIO_OUTPUT_EN,
> > +             .dirin =3D chip->base + SIFIVE_GPIO_INPUT_EN,
> > +             .flags =3D BGPIOF_READ_OUTPUT_REG_SET,
> > +     };
> > +
> > +     ret =3D gpio_generic_chip_init(&chip->gen_gc, &config);
> >       if (ret) {
> >               dev_err(dev, "unable to init generic GPIO\n");
> >               return ret;
> > @@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_devi=
ce *pdev)
> >       regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
> >       chip->irq_state =3D 0;
> >
> > -     chip->gc.base =3D -1;
> > -     chip->gc.ngpio =3D ngpio;
> > -     chip->gc.label =3D dev_name(dev);
> > -     chip->gc.parent =3D dev;
> > -     chip->gc.owner =3D THIS_MODULE;
> > -     girq =3D &chip->gc.irq;
> > +     chip->gen_gc.gc.base =3D -1;
> > +     chip->gen_gc.gc.ngpio =3D ngpio;
> > +     chip->gen_gc.gc.label =3D dev_name(dev);
> > +     chip->gen_gc.gc.parent =3D dev;
> > +     chip->gen_gc.gc.owner =3D THIS_MODULE;
> > +     girq =3D &chip->gen_gc.gc.irq;
> >       gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
> >       girq->fwnode =3D dev_fwnode(dev);
> >       girq->parent_domain =3D parent;
> > @@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device=
 *pdev)
> >       girq->handler =3D handle_bad_irq;
> >       girq->default_type =3D IRQ_TYPE_NONE;
> >
> > -     return gpiochip_add_data(&chip->gc, chip);
> > +     return gpiochip_add_data(&chip->gen_gc.gc, chip);
> >  }
> >
> >  static const struct of_device_id sifive_gpio_match[] =3D {
> >
>

