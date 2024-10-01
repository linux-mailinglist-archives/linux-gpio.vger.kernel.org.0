Return-Path: <linux-gpio+bounces-10628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4CD98BC80
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F192828827E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 12:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A411C2DD0;
	Tue,  1 Oct 2024 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLMCacNG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB01C2DA7
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786694; cv=none; b=pmR89+jaulM9sdkjnquTMXvaWJMmI9mm6DHI6gTdAiClxbEESobFGEbGINmJ6B747zBtw8ofK4MTdTc0YBF6DM7zaIg3KZjtwW4+MI7ldnD9IP2B/ZVZKfXygjpKg1gZwwUW+efg9AyJT+Yir49TOdHuvIvgm27U2JPttG+hCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786694; c=relaxed/simple;
	bh=rMWaD774gg0hu/gWCIVWwnbAb1bXuoiTiGBgOQS7Zec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNxhiElkXvu07VLzgjCtSGJqDBU3tfx1IxZKi3/3kmdyOsJbHjyTJlFZKWk8IEC7qU60Td4mc93phoVzDJ/zlup8c2k5c63JxEaYRHMrRaEGKKFw8UNSXasbMPiOiuDQ6kPEAyPYfYYANLPMg9N2sdnfo4n6sXqRoK73cWLtVtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLMCacNG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398c1bd0b8so2883875e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727786690; x=1728391490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJdk49FPom1vhJW6KLrc9xb2N9g+9cOy2pAI61oaoAo=;
        b=lLMCacNGmO60AITwTaB13ldfWdq+1sky6i7FU2wmf2qG/on1zDzzggLVvXjI/o0OQg
         tRK5IapCTws78bIjG0KxOcJ/dGR0Mb4cE2Uo36ScJ2pX9+Vd/g9zu0pUAQwerRUASB0l
         9bCo3p9+bwMDDh8K6GGhiaG9yo551TYkEdQyrWH5jFqXB7RSA2jFl3QR5ts3F/1viKWw
         s2tALVPX436idsZewMhiez3Dh/F5Fg+6ZPJg9SE3Oreij6POLZOXyZYLb2xwDGBPpM4c
         l9o2jYswicZm4yLXQyI46fVDcWoiGQrPEXhbw+ih3cg0sHroKYjDma2sGbSisePl1XNe
         Nxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786690; x=1728391490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJdk49FPom1vhJW6KLrc9xb2N9g+9cOy2pAI61oaoAo=;
        b=ur2LcewOgdmyC2UwBnyqIinPeREnV3KR3PhqLth+FCtKE/OePPBFdSpaA5bCaswibR
         aY4R6MeG7js4lhgp3WUtBWCM0Tb3LLfELPBpQI1oY1b1/7nGrWs8YOzOWFNyVPqilyk8
         bc/NIHVAgI+ZjnC3a2NxdGg70t+WcV9QpBcOgHUAF8gK7A1Wwzjo3gX+nq9nmU/cUikR
         VN7ncO6qskLv4Zk9dvmvuAxyNztYy4tShd5/K33Ovtd7pTUFJQPogHIuSC76l9dd57e3
         GwECfQUphVCbHoivDs8vWZfriaswSheq7edjIYxSf3mMq4MieSIfFtLdrfx4Hc8TZ3Ue
         W/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUEwui7cQnTHCsfN7hIRN+sutZ/GicNwCMfWFA5zbIO7Mc0LbAWMHd4U4MNyJzWyH67dcT1duvYJFC9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LyBqKNY1fjGkWNA482piXFhEZ1iymFtL/yPfQwy3WwIcNIBd
	OMKJrGJBoiAKQONB+gZhmWYrmQjR5m3/9JwxHfbSzS19iewyqxQDvy+GsADKJkmI2Ag4fbh/GZg
	eYHAelb3bXEDqlY/lFFjDgHAcJYCbrVtK5U++Zw==
X-Google-Smtp-Source: AGHT+IFpLEVSrtSEfceUFr1y/mkuGvz43bOehtQ1kSTprLlq+kFdHRQGWxpV7X7Wx0HYBHJpzMV+133mIhupsz3X9bs=
X-Received: by 2002:a05:6512:6c6:b0:52f:30d:526c with SMTP id
 2adb3069b0e04-5399a23f44cmr1103973e87.5.1727786689856; Tue, 01 Oct 2024
 05:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912-test-v1-0-458fa57c8ccf@analog.com> <20240912-test-v1-9-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-9-458fa57c8ccf@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 14:44:39 +0200
Message-ID: <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
To: arturs.artamonovs@analog.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Malysa <greg.malysa@timesys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Utsav Agarwal <Utsav.Agarwal@analog.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, adsp-linux@analog.com, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arturs,

thanks for your patch!

On Thu, Sep 12, 2024 at 8:20=E2=80=AFPM Arturs Artamonovs via B4 Relay
<devnull+arturs.artamonovs.analog.com@kernel.org> wrote:

> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Add ADSP-SC5xx GPIO driver.
> - Support all GPIO ports
> - Each gpio support seperate PINT interrupt controller
>
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>

(...)

> +config GPIO_ADI_ADSP_PORT
> +       bool "ADI ADSP PORT GPIO driver"
> +       depends on OF_GPIO
> +       select GPIO_GENERIC

If you select this then you need to use it in the idiomatic way.

+#include <linux/soc/adi/adsp-gpio-port.h>

Drop this, just bring the contents into this file all register defines
etc.

+#include "gpiolib.h"

No way, do this:
#include <linux/gpio/driver.h>

> +static int adsp_gpio_direction_input(struct gpio_chip *chip, unsigned in=
t offset)
> +{
> +       struct adsp_gpio_port *port =3D to_adsp_gpio_port(chip);
> +
> +       __adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DIR_CLEAR);

Ah these __adsp_gpio_writew/readw things are too idiomatic. Just
use the base and common writew() please.

> +       __adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);

Interrupt enable in the direction function? No thanks, poke the
interrupt registers in your irqchip if you make one (you currently
do not) in this case I'd say just disable all interrupts in probe()
using something like writew(base + ADSP_PORT_REG_INEN_SET, 0xffff)
and be done with it.

> +static int adsp_gpio_get_value(struct gpio_chip *chip, unsigned int offs=
et)
> +{
> +       struct adsp_gpio_port *port =3D to_adsp_gpio_port(chip);
> +
> +       return !!(__adsp_gpio_readw(port, ADSP_PORT_REG_DATA) & BIT(offse=
t));
> +}

This becomes a reimplemenation of generic GPIO.

> +static int adsp_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct adsp_gpio_port *port =3D to_adsp_gpio_port(chip);
> +       irq_hw_number_t irq =3D offset + port->irq_offset;
> +       int map =3D irq_find_mapping(port->irq_domain, irq);
> +
> +       if (map)
> +               return map;
> +
> +       return irq_create_mapping(port->irq_domain, irq);
> +}

This irqdomain in the "port" looks weird.

Implement the irqchip in the GPIO driver instead.

If the domain *has* to be external to the GPIO driver then
you need to use hierarchical irqdomains.

> +static int adsp_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct adsp_gpio_port *gpio;
> +       int ret;
> +
> +       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       gpio->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(gpio->regs))
> +               return PTR_ERR(gpio->regs);

So you have gpio->regs which is the base.

> +       gpio->dev =3D dev;
> +
> +       ret =3D adsp_attach_pint_to_gpio(gpio);
> +       if  (ret)
> +               dev_err_probe(gpio->dev, ret, "error attaching interupt t=
o gpio pin\n");
> +
> +       spin_lock_init(&gpio->lock);
> +
> +       gpio->gpio.label =3D "adsp-gpio";
> +       gpio->gpio.direction_input =3D adsp_gpio_direction_input;
> +       gpio->gpio.direction_output =3D adsp_gpio_direction_output;
> +       gpio->gpio.get =3D adsp_gpio_get_value;
> +       gpio->gpio.set =3D adsp_gpio_set_value;
> +       gpio->gpio.to_irq =3D adsp_gpio_to_irq;
> +       gpio->gpio.request =3D gpiochip_generic_request;
> +       gpio->gpio.free =3D gpiochip_generic_free;
> +       gpio->gpio.ngpio =3D ADSP_PORT_NGPIO;
> +       gpio->gpio.parent =3D dev;
> +       gpio->gpio.base =3D -1;
> +       return devm_gpiochip_add_data(dev, &gpio->gpio, gpio);

Look in e.g. drivers/gpio/gpio-ftgpio010.c for an example of
how to use generic GPIO (with an irqchip!). It will be something like:

        ret =3D bgpio_init(&g->gc, dev, 2,
                         gpio->regs + ADSP_PORT_REG_DATA,
                         gpio->regs + ADSP_PORT_REG_DATA_SET,
                         gpio->regs + ADSP_PORT_REG_DATA_CLEAR,
                         gpio->regs + ADSP_PORT_REG_DIR_SET,
                         gpio->regs + ADSP_PORT_REG_DIR_CLEAR,
                         0);
        if (ret) {
                dev_err(dev, "unable to init generic GPIO\n");
                goto dis_clk;
        }
        g->gc.label =3D dev_name(dev);
        g->gc.base =3D -1;
        g->gc.parent =3D dev;
        g->gc.owner =3D THIS_MODULE;
        /* ngpio is set by bgpio_init() */

You can augment the generic driver instance with an extra config function
to set the special open drain bits.

Yours,
Linus Walleij

