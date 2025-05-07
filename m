Return-Path: <linux-gpio+bounces-19718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5EBAAD612
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 08:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BAA517A447
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 06:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398122101BD;
	Wed,  7 May 2025 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjwL+2M3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05520F087;
	Wed,  7 May 2025 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599419; cv=none; b=fl/ht4ofGHtMHGctZEthyOEdoHIo1/3631FCJ99uJrSm6jv7M1LQZdWB8LiV7UFSqCGKHjtVwZxjS3Z2PP7c536ADXH1RB8in3GaqwxumVuL9+88xoITXXIjpvKo6eIFMkAXwzPJ2qfxrkf7A1e+ZawUBzQSjA+qmbWsb6HoyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599419; c=relaxed/simple;
	bh=N+YWqAagy2PNEYBUXppE9xNSFaI/hWRK4ibyNABsABo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xmh0rxvkQ90Z4wXxEVIk09F90qL6Sr26GxDyfZauLhdgqE8ZMzjjM03S8mPYB77ZsZ5f+MEnDnGefmXfidjUAB/hiNnFqHrzNPtcfdq3rB9Hqt6wd4zO/tYvxgVx6OioDTpV+jKUtVHxWURgZgRd5nU0U4vfchGShdeB1yTKTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjwL+2M3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac7bd86f637so114850666b.1;
        Tue, 06 May 2025 23:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746599415; x=1747204215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSeJ8GummMKurtzsjDLLI70rnghg+iLSCJEe/th3YoM=;
        b=PjwL+2M3YK54jemlh6Xw5aQBuA8P8w2EPLcqRUAdfzRdTVP++ElyWWRPNjfxztyk8z
         zmpt5V83N8ozEXDW/yy/EMfhyblgo6h8msYu7uXZtIamyxBneiEAj+VTtuf/TmDUizHi
         B/9nxxGMlCNnHA9ysnyJYurG8ksLnThjVz8e8QZEdD2DCSGXspga4FJKp87IuWD5nQ+D
         C/a9+TbAJ+xIWdXXIzgscqOn4l442JnHP9BMoOINbCY0UwHeG5Mfk5y+wQSx0VGIfaRH
         5IsoDMRepTNXYc/oSNrz4cfWYlGPbJjNBF27HRpJYhlsF6oeJIb6i9Pd9Cz7mxYHQ4tK
         yziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599415; x=1747204215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSeJ8GummMKurtzsjDLLI70rnghg+iLSCJEe/th3YoM=;
        b=kaVAbbmItcREfZLSIlWJ8Wsime0zwOtoydTDBXmp0ZpEOqXtExYix9LelKCy/2nkGr
         AZmBd/ZgYu9zuCAf4iS+w5M031oFazpS6Tx6Tg6/Cr/W6ShMbRLfP41MEDpQfGlO+aDs
         qUap46ZukqqM9c/kd3DCHTnGJ8dlC48aDZuAK3/yPY9qEWhyleF7XNJd8bAxfJV76UUp
         khIo/1QESp4V6ffYvfuv7XYOKoQnZ3CIUiiXw47H6mSUyMA8LaH4uksLJ7LcqIshibgO
         YsSqLtpdtjjFvGmi5kDMGTR+UnotIc8uSVY+pb7msL2MUYWkYsryIa7kgwYKuIeUTl8P
         YVEA==
X-Forwarded-Encrypted: i=1; AJvYcCWUmFgQhyiL4rTb38aoQk9PPq/+QHc8gQP9y9fSs54WN6Zsw+DSrlWOwdJAiCkOLbWGQJOf/PX2QwFi3q/MBSvJ@vger.kernel.org, AJvYcCWsveb4GumffXyoL6wAPyo9i3stCGc9MQqxA4BCdkseDagttEV0D+T7CuIggivx24CTAEb90pPItbveIkDL@vger.kernel.org, AJvYcCX1DPthhR9H2j4Cts7G2tKBfm4ZlAECVSAi0d+F2ql4LdaeML19D31BI9I3FzTFPW+qdf9GvVJZMdAP@vger.kernel.org
X-Gm-Message-State: AOJu0YzUMUqn020uGNUFg6qGAGkaM5jO4W75W8/FvsXTicR081CkuTUH
	S+c9TBj8p9EJFJ8/7dfsmD0cHGNyknXL/sZ8SJPFiOaBQtYetrjI0VKQhe/nNNm2g9H1ZPFljoA
	RP4R/24sHu5Il2o4kAITkqSJdvJg=
X-Gm-Gg: ASbGncsLgsMPDNPo5S5gVcCuR6phW25GBQ3iaAkc8kZOG16+tPL/bKv+bHit8cRQPq/
	2/2mGGtbKqgLNhq2oCpNchvePpYu4nHS9Y6Rw9uXwmqnbegczzM76aM3DmSF3g28BrXhlY6BWrc
	/i0gqqhoGZQAb9MksTN3VWTA==
X-Google-Smtp-Source: AGHT+IGqkl0IuDJeY54EbiKZOROW287of8VT2hi8N7bhyY4NWf51b1Ep4jdyE9HeuDOx+3xvco3gwlGwot3mPT+p5t4=
X-Received: by 2002:a17:907:d50a:b0:ac7:81b0:62c9 with SMTP id
 a640c23a62f3a-ad1eb183b98mr170480966b.20.1746599415368; Tue, 06 May 2025
 23:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:29:39 +0300
X-Gm-Features: ATxdqUH1O8-wn-pTn2DLhKviZyXveFJTms9HkgmuTddY7fjWS_0mrPzychvcbF4
Message-ID: <CAHp75VdRp7RG-YCAL2Jx4uXsT2RVQNeu-MxPB5pWRq8TqtsSXw@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Export all symbols and create header file for the GPIO forwarder library.
> It will be used in the next changes.

...

> +/**
> + * gpio_fwd_to_irq - Return the IRQ corresponding to a GPIO forwarder li=
ne
> + * @chip: GPIO chip in the forwarder
> + * @offset: the offset of the line
> + *
> + * Returns: The IRQ corresponding to the passed line, or an error code i=
n case

"The Linux IRQ..." since it's a logical number and 0 can't be ever returned=
.

> + * of error.
> + */

...

> +/**
> + * gpio_fwd_gpio_add - Add a GPIO in the forwarder

forwarder

> + * @fwd: GPIO forwarder
> + * @desc: GPIO decriptor to register

descriptor

> + * @offset: offset for the GPIO in the forwarder
> + *
> + * Returns: 0 on success, or negative errno on failure.
> + */

Please, spellcheck all of the comments.

...

> +#ifndef __LINUX_GPIO_FORWARDER_H
> +#define __LINUX_GPIO_FORWARDER_H

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>

These are not used (at least as of this patch).

+ struct gpio_chip;

> +struct gpiochip_fwd;

> +struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
> +
> +int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
> +
> +int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset=
);
> +
> +int gpio_fwd_direction_output(struct gpio_chip *chip, unsigned int offse=
t,
> +                             int value);
> +
> +int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset);
> +
> +int gpio_fwd_get_multiple_locked(struct gpio_chip *chip, unsigned long *=
mask,
> +                                unsigned long *bits);
> +
> +int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)=
;
> +
> +int gpio_fwd_set_multiple_locked(struct gpio_chip *chip, unsigned long *=
mask,
> +                                unsigned long *bits);
> +
> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> +                       unsigned long config);
> +
> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
> +
> +struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
> +                                        unsigned int ngpios);
> +
> +int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
> +                     struct gpio_desc *desc, unsigned int offset);
> +
> +int gpio_fwd_register(struct gpiochip_fwd *fwd);
> +
> +#endif

--=20
With Best Regards,
Andy Shevchenko

