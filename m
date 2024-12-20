Return-Path: <linux-gpio+bounces-14064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D429F921D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E5BD1897CCF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E871BCA19;
	Fri, 20 Dec 2024 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTfoOlBG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C01C4612
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697365; cv=none; b=TMq8h24OojTFYt7rkJpP1LJ2HfGEHZSVDmTUEvvrPGFw7y6DsLBW7xtr9CT2Z+Bii4Jef2C0zPa+JpoJ8R1l7RFXtdoYFhxbKOcfaiVnxxDcD7gSR0RpHIh20niSowgZe+939rGpG/wbpPJ0MomMI8Y/uTxsokzaeVoJAWST7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697365; c=relaxed/simple;
	bh=U62+/9q+OAASXkOaKHD5lSoMYWGibD3VibcFdBVUFDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzjJOXkF5rjyM1SMw6d7EAmbkfRPDa2MMfripW9bTnykTVJ/J3v+gKI+rwRBKXxLS1T50zAKFPwf3cXoq7wWNwsMJwFWrzGuX7IbvD30LygkASz99C3qH+Uf1XHMIBtxT8Z8Qwb5aWYeMu3dNOSecZ/SZYTxkkCJMjlp2lTrAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YTfoOlBG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so2439542e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734697361; x=1735302161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVphS9qNxpidSYQzn1Jwc4zym/HE78rDG8jkas55B2g=;
        b=YTfoOlBG0CegalpPLUiPGKBsreNghrnTL3WBC8MH60+hB6orSrTddLkwK8L7b4uExh
         W2LHn/8M4U8ZVHZ/jZB8dX94REQk6eT37/HjwkqJylfRU5ma046pFilrNvypp7Sv2u7o
         KBPCiE5mxNsbq5rBDWnw1fAwO1IWtlHvErbADC6+F5YBthFfRQtNQLY17mGHLn4JyhGY
         fhyR+qJVsL1h4sdNtAzizH8sD6pRhERqmuASvj191ZVvFdocqHrgZnB6C3sLIyJOj5pF
         zgzKgU+E6sYILDsqf7A8Tg5g/R1JEb7S+8yEgmrc0mgqgXFiumbBEpSh/qmDcfFDTZsH
         iG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697361; x=1735302161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVphS9qNxpidSYQzn1Jwc4zym/HE78rDG8jkas55B2g=;
        b=ljQEYK/2Z5nyhAdwT0XW7deB0nZ2Va/pVSkYqgSzUNVrA8B8iwicXAy0+0qfNlnIbD
         wRSTWDBlZrBiM+8femMHy5WG1Ezq982ZpmH5zhwloszUf7FNfFdiKXKeXauF6Bp+Dlof
         Te9toXB2PSZZPMiuYHsPnPoSfImCIHGW7AGcooJGAZkosqwrPVNPkkxAx35RxMX9qg+s
         g0yLRD3guBzxBBNHmkc0/o4ZYcKOmtpvx3ZLjfL5hohj2v4UKX/7a1ZlAoVLPcYBImrq
         7yTgh9VoNiX+8gF1CkC6JBirnox5hrUVJRRWHAvwqrRiAZZKWUXDcPHS0aKlJbKvX14Z
         eQyw==
X-Forwarded-Encrypted: i=1; AJvYcCV/QhpVfGewBJfiY0o1DqM9ctB0HXzjogzTOd5RE3/VQYc1RjiVXj001WIXrYM/eRmy+0AThefplyx0@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZNMelHpj7l4pkvjzKLefpcw/TluikzvWBxvo8nSph+cXIrUk
	cdKPHAqdSoeUxpl8724+PBkRrhucbSatI0HvQkWZ8mB6mxnsjHy36WRa+k329dhBcNbFrqDbcRw
	SKAg1TzpQtT36ka8He8pFq5L9nlZayXSEg8vHew==
X-Gm-Gg: ASbGnctgUHeqcNitM3MilIroN0azTi5X51/OfJkXj4dM6O0JAo6L/hG0bdZ01xOJZRN
	KVLkakuA7Fg4KG2jAVvDZJa8UqgaGcPyJ/loRfQ==
X-Google-Smtp-Source: AGHT+IFGhittHLLqvD2aKsLjDPS3OVz2YJXvu8/X2vARIaa1xYKmHCEy9A/wEWav1aRH6YcsgDyP5OyCYnEzC/a94+g=
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54229533e65mr864873e87.16.1734697361380; Fri, 20 Dec 2024
 04:22:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:22:30 +0100
Message-ID: <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for your patch!

On Wed, Dec 11, 2024 at 5:27=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
> Due to the hardware design, the driver shall control its pins in tandem
> with their corresponding Intel SoC GPIOs.
>
> UP boards and UP Squared boards are supported.
>
> Based on the work done by Gary Wang <garywang@aaeon.com.tw>, largely
> rewritten.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Overall this looks as a good start, some comments below.

> +config PINCTRL_UPBOARD
> +       tristate "AAeon UP board FPGA pin controller"
> +       depends on MFD_UPBOARD_FPGA
> +       select PINMUX
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS

This implements GPIO so you need:
select GPIOLIB

But I'm not sure because of some oddities, see below.

> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>

Questionable include, see below.

> +static int __upboard_pinctrl_gpio_request_enable(struct pinctrl_dev *pct=
ldev,
> +                                                unsigned int offset)

I'm not a fan of functions named with __inner_function() double-underscore
convention. The reason is that double underscore is also used for
compiler intrinsics. Can you just name it

committ_upboard_pinctrl_gpio_request_enable()?

> +static void __upboard_pinctrl_gpio_disable_free(struct pinctrl_dev *pctl=
dev, unsigned int offset)

Dito

> +static int __upboard_pinctrl_gpio_set_direction(struct pinctrl_dev *pctl=
dev,
> +                                               unsigned int offset, bool=
 input)

Dito

The pinmux code is very straight forward otherwise, good job!

> +static int upboard_gpio_get_direction(struct gpio_chip *gc, unsigned int=
 offset)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +       unsigned int pin =3D pctrl->pctrl_data->pin_header[offset];
> +       int mode;
> +
> +       if (pctrl->gpio[offset])
> +               return gpiod_get_direction(pctrl->gpio[offset]);

See below.

> +       /*
> +        * GPIO was not requested so SoC pin is probably not in GPIO mode=
.
> +        * When a gpio_chip is registered, the core calls get_direction()=
 for all lines.
> +        * At this time, upboard_gpio_request() was not yet called, so th=
e driver didn't
> +        * request the corresponding SoC pin. So the SoC pin is probably =
in function (not in
> +        * GPIO mode).
> +        *
> +        * To get the direction of the SoC pin, it shall be requested in =
GPIO mode.
> +        * Once a SoC pin is set in GPIO mode, there is no way to set it =
back to its
> +        * function mode.
> +        * Instead of returning the SoC pin direction, the direction of t=
he FPGA pin is
> +        * returned (only for the get_direction() called during the gpio_=
chip registration).
> +        */
> +       mode =3D upboard_pinctrl_pin_get_mode(pctrl->pctldev, pin);

Fair enough I guess it's the best we can do here.

> +static int upboard_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +
> +       return gpiod_get_value(pctrl->gpio[offset]);
> +}
> +
> +static void upboard_gpio_set(struct gpio_chip *gc, unsigned int offset, =
int value)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +
> +       gpiod_set_value(pctrl->gpio[offset], value);
> +}
> +
> +static int upboard_gpio_direction_input(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +       int ret;
> +
> +       ret =3D pinctrl_gpio_direction_input(gc, offset);
> +       if (ret)
> +               return ret;
> +
> +       return gpiod_direction_input(pctrl->gpio[offset]);
> +}
> +
> +static int upboard_gpio_direction_output(struct gpio_chip *gc, unsigned =
int offset, int value)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +       int ret;
> +
> +       ret =3D pinctrl_gpio_direction_output(gc, offset);
> +       if (ret)
> +               return ret;
> +
> +       return gpiod_direction_output(pctrl->gpio[offset], value);
> +}

This looks dangerous and I guess also the reason you are including consumer=
.h.

Explain with a comment in the code what is going on here, like if this
GPIO comes from a completely different hardware unit, it looks like
a recepie for an eternal loop if it would point back to the same GPIO.

All of these have the same "loop out to another hardware" feature
that looks weird to me, but explain what's going on so I understand
it.

To me usually pin control works like this:

linux gpio <-> gpio driver <-> pin control driver

so the pin control driver is a pure "backend" for GPIO,
typically implements in struct pinmux_ops:
.gpio_request_enable()
.gpio_disable_free()
.gpio_set_direction()

that just set up the pin in the corresponding way. If your hardware
cannot mux back a pin from GPIO mode (as a comment says)
I would say that gpio_disable_free() can just return -ENODEV
or something if the pin has been put into gpio mode, maybe
some experimentation is needed there.

The corresponding GPIO driver typically uses GPIO ranges
to access the corresponding pin. It usually call
gpiochip_add_pin_range() to map its pins to the pin control
driver (if e.g. device tree is not used for the ranges).

What you do here is confusing to me, it looks like:

linux gpio <-> this gpio shim <-> pin control <-> other gpio driver

I think it is better to try to keep things separate if you can,
the current design seems to come from an attempt to be
"complete" and protect users from themselves, but we can
never protect users from themselves.

> +static int upboard_gpio_to_irq(struct gpio_chip *gc, unsigned int offset=
)
> +{
> +       struct upboard_pinctrl *pctrl =3D container_of(gc, struct upboard=
_pinctrl, chip);
> +
> +       return gpiod_to_irq(pctrl->gpio[offset]);
> +}

If you use the GPIOLIB_IRQCHIP, you do not need to define this function
at all, it is handled by gpiolib.

> +       ret =3D gpiochip_add_pinlist_range(chip, dev_name(dev), 0, pctrl-=
>pctrl_data->pin_header,
> +                                        pctrl->pctrl_data->ngpio);

I would rather have it that the actual gpio chip (the one that write
something into hardware registers) do this without another gpio chip
inbetween if you see what I mean.

But explain what's going on! I'm curious.

Yours,
Linus Walleij

