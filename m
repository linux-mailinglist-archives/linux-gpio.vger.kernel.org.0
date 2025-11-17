Return-Path: <linux-gpio+bounces-28598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29241C64B1D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 15:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id E36862418E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 14:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1A43358AB;
	Mon, 17 Nov 2025 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ikxHgt8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB322A1D5
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390790; cv=none; b=gmKBnRjTsiU5l8+HIpFyzVZEl5c1AMmneoJ4LAo+xjDkJO0ssHocxR7OtiKhLbnNvVCry1oQmrtQwjvls0LI4vUFzrRcg50ItSMGSRbZda7MomAduOtjx/oJuLo8Z4f1wpuctQ5FSp/utyK2bus0+x+QH/Lc3pz0XXUsWUbo0EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390790; c=relaxed/simple;
	bh=dIEAZCn/f/uXKnc80ED+dgtffIeec60Xdvoqm0iDJE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYtiUGj9TDbxKlLyy1LHEPZLJ135GMS84Jc37JU+a37+3llob5eqjMLHh4TV7Od4Sz6yyvIz4hcR06je4PUhnMtpgbNzsBzBr7Xhc9a3nlqPvq6bd7WDmu9YWmhWxBr4u/bVFOPUAg0yRBm/iTNilm0Mz9HZOk6u1YKRaIzKfM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ikxHgt8S; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59590eef553so1258519e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 06:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763390785; x=1763995585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCcSe7R+64nbva6E6LjL1vdtPtAEecqd0S9GP3XCvKM=;
        b=ikxHgt8SgE/Zswyp7GAUO8C5kjWjFcI4AILqFIMnFK05cLw036RNmTToEk56DI7xx7
         9ugNw52wxpN5w+VVUzVE6r6P0OlNKRMLtt3VjcYj+p/2IrtWXL6PiL8PtHbDFqZrYZjr
         UE2abxXnFLBiadfWxU4BBFSSbjcQdaFa+wErH42af+wViX3K21FRXm2g9OblBzhe8bNf
         GPZ8WaAY0GLa2YkuKt23HINjfIZMT1VLNOFSZ4jcAuJDGM1qwHjs/BWzPJJ+1ERN1zjO
         zgts9DKkZlt3tOm/p287VKbQfOip1UkxZNTmLm4KuabOGIdrUwyX+eCs6VASGf7+HVui
         pEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390785; x=1763995585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eCcSe7R+64nbva6E6LjL1vdtPtAEecqd0S9GP3XCvKM=;
        b=DkiNBx+ZVMKKpdpcemkghO63PVBYzwP3yB4BBH83gt4zcpkcnwZHSy84LF/6Nv31o6
         wsEPfpL2uXoNodCejrRwT/RkVuZVCdwK8fwTGxOumLY6gjEX/gPI+ftrZbNGPA7YSJKH
         K6l4VMsu7YPk7BRYxMIflDN3pdjHpD4ay+Tzc+YUDypk3AqYok1hDbaJ8jODuQItyZt1
         8fvVabIJMLMUkIkxf40m0y7mamEOIkxnC79QkcVX2oCAg2fkWQThKyRZ2MWE5qQr40ha
         5dGWT6CBoRlBcZ+OHFZHIFwh9mMHaugvD8RZdyuIHo9iMGzpt6Z5ijqrSK+iA3LwtsWU
         2kPg==
X-Forwarded-Encrypted: i=1; AJvYcCWgmSxTKk/p+VS6GgudjpkUOgmuxQ9/uJqTbrsHmeh4paaQxAu6kimsc9oQkAdkJ6JsLdyLm3BDIUtH@vger.kernel.org
X-Gm-Message-State: AOJu0YwtjBofuRaRJgVGTrbuRGklSLjkDkYWS98QZ8IoSsEnxwQPyJXh
	eM31SeWRInJRSosfyyoLREgx61B8erZwyUCaXIBjyUCAuBbbKKhVQGxi4DI+WWQcUJ8QgRGCQU0
	yBnPawA8c/Jo2HfzeyFhbHtcjIlo0JBgymMimdDU4pQ==
X-Gm-Gg: ASbGncujqGSkoYTYIEvM7asSxppb5f/hSWSLWEiV1Td6nYANBzPi0XhQxNflvNRWlbS
	09SbBAVpiMfLk5k16yWWCYAIXH/wcKdNrdclBtXUc3xkNl0WKg6h//Ubi38VzKW8uo2H44BjAWC
	Nj5vmo3KR9Wg29hCcQB/uyHs5qMmc3a4DYcC9a7p7Os5nEBhE1KnPdJnqhj+fkh2S9Rq0211z3L
	I/YUB7NTkkVoIter7x9Bf1Aa0roBPfUTF244MKFyZ0Kirl2qOc9NS9aAEn0XgUlFXNUbNJvXBFA
	jtSWtL3YUjbwLLNapl+KI2E3C+khTdUGPe0X+A==
X-Google-Smtp-Source: AGHT+IG4Z8Ljfkw4Jp6KHwmST2wZE0056r4cCHRcfdCuGrfTDeJPgYapHY6n6hmODd7tfxLFQNi/vGZigUjBXe+3OSE=
X-Received: by 2002:a05:6512:224f:b0:595:7e96:a709 with SMTP id
 2adb3069b0e04-595841df4d7mr4385918e87.10.1763390785347; Mon, 17 Nov 2025
 06:46:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117091427.3624-1-antoniu.miclaus@analog.com> <20251117091427.3624-3-antoniu.miclaus@analog.com>
In-Reply-To: <20251117091427.3624-3-antoniu.miclaus@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Nov 2025 15:46:12 +0100
X-Gm-Features: AWmQ_blqVDqjvJieyjvOaBOEmnt4FQHFmqiiVNIdk24BThfcdnwbaxStvtdgdtE
Message-ID: <CAMRc=McdS1b+kL6869-REF2+ddrZNsZ1kvnQuNkwUQx7YWOCgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: adg1712: add driver support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:15=E2=80=AFAM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:
>
> Add driver support for the ADG1712, which contains four independent
> single-pole/single-throw (SPST) switches and operates with a
> low-voltage single supply range from +1.08V to +5.5V or a low-voltage
> dual supply range from =C2=B11.08V to =C2=B12.75V.
>
> The driver configures switches once at probe time based on device tree
> properties and does not expose any userspace interface for runtime contro=
l.
>
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> Changes in v3:
> - Remove GPIO controller interface
> - Configure switches from device tree at probe time only
> - Add 'switch-states' property parsing
> - Change from GPIOD_ASIS to GPIOD_OUT_LOW
> ---
>  drivers/gpio/Kconfig        |  9 ++++
>  drivers/gpio/Makefile       |  1 +
>  drivers/gpio/gpio-adg1712.c | 87 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 drivers/gpio/gpio-adg1712.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7ee3afbc2b05..3fac05823eae 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -157,6 +157,15 @@ config GPIO_74XX_MMIO
>             8 bits:     74244 (Input), 74273 (Output)
>             16 bits:    741624 (Input), 7416374 (Output)
>
> +config GPIO_ADG1712
> +       tristate "Analog Devices ADG1712 quad SPST switch GPIO driver"
> +       depends on GPIOLIB
> +       help
> +         GPIO driver for Analog Devices ADG1712 quad single-pole,
> +         single-throw (SPST) switch. The driver provides a GPIO controll=
er
> +         interface where each GPIO line controls one of the four indepen=
dent
> +         analog switches on the ADG1712.
> +

I'm finding it hard to understand how this is a GPIO driver. It's a
GPIO consumer but does it really belong under drivers/gpio/?

>  config GPIO_ALTERA
>         tristate "Altera GPIO"
>         select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ec296fa14bfd..9043d2d07a15 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)         +=3D gpio-104-idi=
-48.o
>  obj-$(CONFIG_GPIO_104_IDIO_16)         +=3D gpio-104-idio-16.o
>  obj-$(CONFIG_GPIO_74X164)              +=3D gpio-74x164.o
>  obj-$(CONFIG_GPIO_74XX_MMIO)           +=3D gpio-74xx-mmio.o
> +obj-$(CONFIG_GPIO_ADG1712)             +=3D gpio-adg1712.o
>  obj-$(CONFIG_GPIO_ADNP)                        +=3D gpio-adnp.o
>  obj-$(CONFIG_GPIO_ADP5520)             +=3D gpio-adp5520.o
>  obj-$(CONFIG_GPIO_ADP5585)             +=3D gpio-adp5585.o
> diff --git a/drivers/gpio/gpio-adg1712.c b/drivers/gpio/gpio-adg1712.c
> new file mode 100644
> index 000000000000..86f8645cf2ad
> --- /dev/null
> +++ b/drivers/gpio/gpio-adg1712.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices ADG1712 quad SPST switch driver
> + *
> + * Copyright 2025 Analog Devices Inc.
> + *
> + * Author: Antoniu Miclaus <antoniu.miclaus@analog.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#define ADG1712_NUM_SWITCHES   4
> +
> +struct adg1712 {
> +       struct gpio_descs *switch_gpios;
> +};
> +
> +static int adg1712_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct adg1712 *adg1712;
> +       u32 switch_states[ADG1712_NUM_SWITCHES] =3D {0}; /* Default all s=
witches off */
> +       int ret, i;
> +
> +       adg1712 =3D devm_kzalloc(dev, sizeof(*adg1712), GFP_KERNEL);
> +       if (!adg1712)
> +               return -ENOMEM;
> +
> +       adg1712->switch_gpios =3D devm_gpiod_get_array(dev, "switch", GPI=
OD_OUT_LOW);
> +       if (IS_ERR(adg1712->switch_gpios))
> +               return dev_err_probe(dev, PTR_ERR(adg1712->switch_gpios),
> +                                    "failed to get switch gpios\n");
> +
> +       if (adg1712->switch_gpios->ndescs !=3D ADG1712_NUM_SWITCHES)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "expected %d gpios, got %d\n",
> +                                    ADG1712_NUM_SWITCHES,
> +                                    adg1712->switch_gpios->ndescs);
> +
> +       ret =3D device_property_read_u32_array(dev, "switch-states", swit=
ch_states,
> +                                            ADG1712_NUM_SWITCHES);
> +       if (ret && ret !=3D -EINVAL)
> +               return dev_err_probe(dev, ret, "failed to read switch-sta=
tes\n");
> +
> +       for (i =3D 0; i < ADG1712_NUM_SWITCHES; i++) {
> +               if (switch_states[i] > 1) {
> +                       dev_warn(dev, "invalid switch state %u for switch=
 %d, using 0\n",
> +                                switch_states[i], i);
> +                       switch_states[i] =3D 0;
> +               }
> +
> +               ret =3D gpiod_set_value_cansleep(adg1712->switch_gpios->d=
esc[i],
> +                                              switch_states[i]);

I don't see anything here that cannot be achieved with gpio hogs in
device-tree. Do we really need a separate driver for it? If we really
really need it, you don't really need to implement a new driver, you
could literally just extend gpio-virtuser with a real compatible and
it would request the GPIOs for you.

> +               if (ret)
> +                       return dev_err_probe(dev, ret, "failed to set swi=
tch %d\n", i);
> +       }
> +
> +       platform_set_drvdata(pdev, adg1712);

Where is the corresponding platform_get_drvdata()?

> +
> +       dev_info(dev, "ADG1712 switch controller configured\n");

Please remove this, no need to be noisy.

Bart

