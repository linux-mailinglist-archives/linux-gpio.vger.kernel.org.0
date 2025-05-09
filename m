Return-Path: <linux-gpio+bounces-19827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A442AB0E3F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 11:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99113B478D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C342750FD;
	Fri,  9 May 2025 09:08:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7714F98;
	Fri,  9 May 2025 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781683; cv=none; b=Mmtn181QdEbZ6l3qZk9e6RZTD2sX7HFyJ8ryIiVqhBHuasfEW2yf6b51PEh0dK3tXK7QgLXl/kYqHQQ6aR7Kygum0+a7qH1MYF1BNKQVepYz2kTlEVyEJMmTd+84pM7tYBAJPn6n27XDGZkeB8voRPCJVAyavS3eWg7H/oecwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781683; c=relaxed/simple;
	bh=nYCqdvuCwcH7UfwFR+GZ56QnI7ajUuizRTceT6Gaqdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj1lZgUMUi9dQhERwBA4jfCbm9nxcadcai+OQUEM8bDUgkBM6BEMjKAN3iTDENzVI/4ACSD0p7lq3NpG9x/+cVwEFv+/dPRt+DOWLho/RTG5USp8mR/GYfrGhsoOs62zymcuO34IpAieDKg4FtGpDWwVwEtFTwfBrxHmByi6k0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso520064241.2;
        Fri, 09 May 2025 02:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781680; x=1747386480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Apvpj+DVB6htjnL5aEPsZH8q3oREXQCWKiewHBNRw84=;
        b=kbXLbDxoYKfWe1CKTE1syb+6w3dEqjTFC4kMEfb7o5uKCTSylT0M0pEgWPmP5+EhaX
         j6HB69qewhYyIdrW4mjWSDCAHVUChJkmKnAF8GmVITBJ3mYSXkElQhFmeyOkzxGuAsAy
         8sH8pog/vNEw8qg1UHYT/XRr0f0pmOEByhGAIFAHXX1Vq411YyaeJ6vgZAi1bOgREr6/
         xeKzD/f6jJ+OETHXr0KHbfm/NIWYWop1jgucfGNIvVV5F9/+SmVrKATDCEyxC4WGp7I3
         /c1UMSkqA17cCFQ/ie6p2zqow6HhXZ4qEhQHiLEK59qPXO6TMs6efSdM5mcghCpFtvqp
         VFNg==
X-Forwarded-Encrypted: i=1; AJvYcCVoliYj3a+6WuDSVEjws6N6PwOUI+Kdja3/gxQD6LJMi2v+0XeJ1nHV6jmEXjuW9vF8fCMqFd5/VwSq@vger.kernel.org, AJvYcCXhgnd+Lubn/zIU/II6hbM0oTHS+ZUWtvbmVb0CCf4PRaLQiaxYDVg1AcAeCyRQGoPovb1sO6SsRSociYRQ@vger.kernel.org, AJvYcCXwcBP6G7f3U7TiRZKGhLkNEkcq7zTg67msPoafvpmDhtUrvwYo/Lvr9n8eTRWJZuSS2o4cun0qGM5xqQSpzxJN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqg4ARXZb2iUinD5MCT4eGTgUh4pdFretajb0pRfVPAZ4v4D+w
	siJfQvn/A+h+1mfO4nDlvzAJkpaCLGhIlG2yHFD/aKlMMR5up6yKbNQ6pMwK
X-Gm-Gg: ASbGncu9yPUyPmPJ36a5Uu3YT9YGtyYGkTv4p/bBKMmxsWKwF+13/tClEsyUSPHs6j1
	Dtixg2iJZIH3/1uEPQFgeGNphclzhfAV13dUvM39puZ05AAx0MaD5Jr4kzcrb/gG8PQTm5jApTk
	A4XUvoVb3Vqdq9VLuJJlzNHI8otsqeHYjuK/TeCkFyYUHBTSYzvlMIaOLAkEufESkEXkVONboWB
	tpbaYJFkcBlvemhDjSqNS1oof0jYvV3JCMDg0im4paNSa+ovbbedbJQG60y5fU6yBFyefMbGtb6
	bzt40tfPddLDCkzTUV+Xw0r2xY3vBy7cSS/+CZoer0rBBriI8Cs6q3WWS85VVsMlkMnwUOUTdDA
	r2TErmzRj1N0Q2Q==
X-Google-Smtp-Source: AGHT+IE6CtK+6gR2CjANM5CQ5Hjp0KV2E3EDgqs4E5Ij3PWUcLMoBFBPAPgTjDVyPAOguSjXkkhfkg==
X-Received: by 2002:a05:6102:3e20:b0:4c3:9b0:9e6b with SMTP id ada2fe7eead31-4deed33f426mr2237228137.10.1746781679693;
        Fri, 09 May 2025 02:07:59 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d9esm741353241.28.2025.05.09.02.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:07:59 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso520057241.2;
        Fri, 09 May 2025 02:07:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOCvQ/IRnezq/Bo8PX/gx0uh+Dcy4nUQxDlVOuRbWVmN49I9V1r/9OgKeYS8KcvaAnvKwkb7hIogLHXHMYzpru@vger.kernel.org, AJvYcCVRdflASqwcX1aynZ+TzzeJI/0m16aHQoU7sFeyUaQ3+WS1kC+9kow8pCFS5LaDHnIM2hnT2up9+/F/@vger.kernel.org, AJvYcCVpHZ8V7HEHMelXcoUAm11dEb93qP4HGqiKeMoL6mqzLJcrmFg79jTJKWyqQBFJ8Jt0P9MHqLreZy70v0Jk@vger.kernel.org
X-Received: by 2002:a05:6102:3fa9:b0:4c4:f128:3abb with SMTP id
 ada2fe7eead31-4deed3ea41cmr2037408137.25.1746781679037; Fri, 09 May 2025
 02:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 11:07:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
X-Gm-Features: AX0GCFv0zehjSL2ZnfrUxCA3qjPdz0jbQyUNX12OIzNFCKlNDxxmIl4SWZZ8pX0
Message-ID: <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Export all symbols and create header file for the GPIO forwarder library.
> It will be used in the next changes.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/linux/gpio/forwarder.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_GPIO_FORWARDER_H
> +#define __LINUX_GPIO_FORWARDER_H
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +
> +struct gpiochip_fwd;
> +
> +struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
> +
> +int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
> +

Please drop empty lines between functions that belong together
logically.

> +int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);
> +
> +int gpio_fwd_direction_output(struct gpio_chip *chip, unsigned int offset,
> +                             int value);
> +
> +int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset);
> +
> +int gpio_fwd_get_multiple_locked(struct gpio_chip *chip, unsigned long *mask,
> +                                unsigned long *bits);
> +
> +int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value);
> +
> +int gpio_fwd_set_multiple_locked(struct gpio_chip *chip, unsigned long *mask,
> +                                unsigned long *bits);
> +
> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> +                       unsigned long config);
> +
> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);

I would expect all of these to take gpiochip_fwd pointers instead of
gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
that does not correspond to a gpiochip_fwd object, causing a crash?

> +
> +struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
> +                                        unsigned int ngpios);
> +
> +int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
> +                     struct gpio_desc *desc, unsigned int offset);
> +
> +int gpio_fwd_register(struct gpiochip_fwd *fwd);

Please move these three to the top, as these functions are what the
user needs first, and drop the empty lines between them.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

