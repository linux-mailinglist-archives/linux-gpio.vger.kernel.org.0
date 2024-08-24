Return-Path: <linux-gpio+bounces-9109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF295DE55
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409041F22235
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713E51714B2;
	Sat, 24 Aug 2024 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9QoMepF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59160A947
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509575; cv=none; b=JTAvSgdEGlRjogy1SoCT4J2MBHXDPHXqk7uW2vR+Z+8tcL9P5MCF8nCqgY3vduQs7FVCVI2OhqR2bZWJjuMPHP+PPa/eAQhPCsO1RtsJ4OQu0WBRZjsPm/qSVMIO+6llBktLgN4hOzlYhhcCwORV0QnHegiA5pBYyjB5rbofneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509575; c=relaxed/simple;
	bh=urrTzAYfruxUQIrbfS3i8yDFnH/7N9EliV627MTAgj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/+7Hs3ZXWlSbFDiPAcFYYsymrQ8bXNl2Gv904Dc63ODETszacUGuNGehuQuXy1DplReAjSghBkhkAf4Bibd4R4Ft08p2SUtnxtAWpkaNZaDcxp6Tvl4nGxm/xgMnUGH6v20r4K2Jjp7aZxin4SnlJggO1EcYqF8mAigKkg3axk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9QoMepF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-534366c194fso2147769e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724509571; x=1725114371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQFqbZZ4zFkOul/ZKfLhywlUpLSQt2IpF0H3EwvJYjE=;
        b=o9QoMepF3DVvBRLGUPXk+N/cduOiu2MoyIo7/AOalRL764jEvjUAWckuZFL9dEKacO
         5c7l5yAssFw2ix7OGKpWG3vAH59ZOMq6ENZi6PktQKEdnuIUzryFjuiBvWZZrPKiP9z7
         GZl3+UetjkE6btK7Fl7OT/bckLXJ/o0p09RVuHCYaNfT1AqOZ9+zc1kQqoUTQhBrECu3
         ZNpqF3leaKMrYHMT2FJWsV9do0ph2FSk6jUUNJrrM5waa/DxVj4OJW/tthnL+Hp9V5VE
         EOPANnZvEZAxHUTlvVHsOOKaiwONkC0pNj4QSPQSA8/cydE4h95hmuw6bu3Jmo/0K8Eu
         MtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724509571; x=1725114371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQFqbZZ4zFkOul/ZKfLhywlUpLSQt2IpF0H3EwvJYjE=;
        b=e4G83zoHPmobLinYViUk+Ks7jL4XNj7W1poQwa4nilbpeBPC5dDPUMK7ZrrVLn7LPr
         lqJAVN1jfgw8nhPx75bH/xJMXuHqzn37mHK+JR+wktsTN1rbIYMdgl20+qieWTK42FGH
         pE7o7MLTrfMSdSJzv365im2S88DNNwFV7EK+l+vIc69PJ42w2htzvnCZAFJT4R4Ch27K
         gIhhv6xWxeSlMhDgIkBY72cUMwTK94sU44hMVOLpYNwVJY9WRYf7MdpYSMgHhKD99K7D
         WWUBTDqB3G9X82XsFjyMb4/Jk593ZoIX6xt+hyTvWfew0cfmfO1pqQLsxmp9Ey/TYP2n
         sw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3naTqPh0BUxMS2NUY5rpoS5EnA/o11yfydfzFXNo8GSoP+tTn+F20AjEZnq7U/7c7ek3PfsUDpL5K@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFPv5a2lSr9ljLoHMaLSTCK5XFql4+sEMjmXQkSPSIVtCfx8Y
	tE4ZM4tyMihpkDySRkMTKEXoIAwfQjzJh0A6istCqyQ2WQbnmxfp+qGeWJ6I2EDl2dMnt2BIrOv
	srNBNppgvY1xAaINHPy0SmJ0cg8Kxe9AHCrIigl4RDwy6e7yW
X-Google-Smtp-Source: AGHT+IE+Q2kDd2C073QS3QyxTeqTbyJnvZBcyRtCmpSWu0f8AGkqa7BfCduxhT6gHo4jRoBahFUK0hURdRfmCB8REeA=
X-Received: by 2002:a05:6512:694:b0:52e:9b15:1c60 with SMTP id
 2adb3069b0e04-534387be4e1mr3721365e87.48.1724509570800; Sat, 24 Aug 2024
 07:26:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
In-Reply-To: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:25:59 +0200
Message-ID: <CACRpkdYyo9MD6zfiPde+3vSdpH96r+ZO12bdmMAfjw5PCNJ1BQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: add support for FTDI's MPSSE as GPIO
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mary,

thanks for your patch!

On Wed, Aug 14, 2024 at 9:15=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:

> +config GPIO_MPSSE
> +       tristate "FTDI MPSSE GPIO support"
> +       help
> +         GPIO driver for FTDI's MPSSE interface. These can do input and
> +         output. Each MPSSE provides 16 IO pins.

select GPIOLIB_IRQCHIP

you are already halfway using it.

(...)
> +struct mpsse_priv {
> +       struct gpio_chip gpio;
> +       struct usb_device *udev;     /* USB device encompassing all MPSSE=
s */
> +       struct usb_interface *intf;  /* USB interface for this MPSSE */
> +       u8 intf_id;                  /* USB interface number for this MPS=
SE */
> +       struct irq_chip irq;

What is this irq_chip? You already have an immutable one lower in the code.

> +       struct work_struct irq_work; /* polling work thread */
> +       struct mutex irq_mutex;      /* lock over irq_data */
> +       atomic_t irq_type[16];       /* pin -> edge detection type */
> +       atomic_t irq_enabled;
> +       int id;
> +
> +       u8 gpio_outputs[2];          /* Output states for GPIOs [L, H] */
> +       u8 gpio_dir[2];              /* Directions for GPIOs [L, H] */

Caching states of lines is a bit regmap territory. Have you looked into
just using regmap?

> +static DEFINE_IDA(gpio_mpsse_ida);

Hm what is this for...

> +static int gpio_mpsse_gpio_get(struct gpio_chip *chip, unsigned int offs=
et)
> +{
> +       int err;
> +       unsigned long mask =3D 0, bits =3D 0;
> +
> +       set_bit(offset, &mask);

If this doesn't need to be atomic you should use
__set_bit() and __clear_bit().

Yeah I know it's confusing... I think you should use the __variants
everywhere.

> +static const struct irq_chip gpio_mpsse_irq_chip =3D {
> +       .name =3D "gpio-mpsse-irq",
> +       .irq_enable =3D gpio_mpsse_irq_enable,
> +       .irq_disable =3D gpio_mpsse_irq_disable,
> +       .irq_set_type =3D gpio_mpsse_set_irq_type,
> +       .flags =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

Why was there also an irq_chip in the struct above?

I'm confused.

This is how it should look though.

> +static int gpio_mpsse_irq_map(struct irq_domain *d, unsigned int irq,
> +                             irq_hw_number_t hwirq)
> +{
> +       int ret;
> +
> +       ret =3D irq_set_chip_data(irq, d->host_data);
> +       if (ret < 0)
> +               return ret;
> +       irq_set_chip_and_handler(irq, &gpio_mpsse_irq_chip, handle_simple=
_irq);
> +       irq_set_noprobe(irq);
> +
> +       return 0;
> +}
> +
> +static void gpio_mpsse_irq_unmap(struct irq_domain *d, unsigned int irq)
> +{
> +       irq_set_chip_and_handler(irq, NULL, NULL);
> +       irq_set_chip_data(irq, NULL);
> +}
> +
> +static const struct irq_domain_ops gpio_mpsse_irq_ops =3D {
> +       .map =3D gpio_mpsse_irq_map,
> +       .unmap =3D gpio_mpsse_irq_unmap,
> +       .xlate =3D irq_domain_xlate_twocell,
> +};

Is there something wrong with just using the gpiolib irqchip library

select GPIOLIB_IRQCHIP

there are several examples in other drivers of how to use this.

> +static int gpio_mpsse_probe(struct usb_interface *interface,
> +                           const struct usb_device_id *id)
> +{
> +       struct mpsse_priv *priv;
> +       struct device *dev;
> +       int err, irq, offset;
> +
> +       dev =3D &interface->dev;
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->udev =3D usb_get_dev(interface_to_usbdev(interface));
> +       priv->intf =3D interface;
> +       priv->intf_id =3D interface->cur_altsetting->desc.bInterfaceNumbe=
r;
> +
> +       priv->id =3D ida_simple_get(&gpio_mpsse_ida, 0, 0, GFP_KERNEL);
> +       if (priv->id < 0)
> +               return priv->id;
> +
> +       devm_mutex_init(dev, &priv->io_mutex);
> +       devm_mutex_init(dev, &priv->irq_mutex);
> +
> +       priv->gpio.label =3D devm_kasprintf(dev, GFP_KERNEL,
> +                                         "gpio-mpsse.%d.%d",
> +                                         priv->id, priv->intf_id);
> +       if (!priv->gpio.label) {
> +               err =3D -ENOMEM;
> +               goto err;
> +       }

So you are accomodating for several irqchips in the same device,
and handling it like we don't really know how many they will be?
Does it happen in practice that this is anything else than 0?

> +       gpio_irq_chip_set_chip(&priv->gpio.irq, &gpio_mpsse_irq_chip);
> +
> +       priv->gpio.irq.domain =3D irq_domain_create_linear(dev_fwnode(dev=
),
> +                                                        priv->gpio.ngpio=
,
> +                                                        &gpio_mpsse_irq_=
ops,
> +                                                        priv);
> +
> +       for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
> +               irq =3D irq_create_mapping(priv->gpio.irq.domain, offset)=
;
> +               if (irq < 0) {
> +                       err =3D irq;
> +                       goto err;
> +               }
> +       }

This is where you are not using GPIOLIB_IRQCHIP

> +
> +       priv->gpio.irq.parent_handler =3D NULL;
> +       priv->gpio.irq.num_parents =3D 0;
> +       priv->gpio.irq.parents =3D NULL;
> +       priv->gpio.irq.default_type =3D IRQ_TYPE_NONE;
> +       priv->gpio.irq.handler =3D handle_simple_irq;

But here you rely on GPIOLIB_IRQCHIP being selected!

Yours,
Linus Walleij

