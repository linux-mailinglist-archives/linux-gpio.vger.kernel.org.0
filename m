Return-Path: <linux-gpio+bounces-19841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6EAB0F01
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 11:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178AE1B612BE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F1D27FD57;
	Fri,  9 May 2025 09:29:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324827A93F;
	Fri,  9 May 2025 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782975; cv=none; b=NHXF4BzNUYCNOUS/4zP/W9PxerwXikq5C9WdCq6B70g0XePt/uUKEbZyoppKRSTTLB+rNw/0I9O6eHtMkcdL1+SgECK4WZpLy3rtPxlLngNIKUrDe0d1iMbw6XY1L5sVlsGndTtTZLyISERs2RAlNp3ou69gI5liyqW9ZlY7LqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782975; c=relaxed/simple;
	bh=cvqgy5NGuSugRzqTgF55BNFhvdBlFAHNd3zF6Sg7cks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZPEC100LltirGYsnVr1nx4wFSJZAh+y1EbcdSbEGrJZen6nVjEbThAhEkR/yO4tLHuaOoTfySZBTnEOztFJV16jKs+/Qk70R/tPUwSwV+hdwRw1VKlPvCBQ58K2DJtL5BjD/kgYz+VKf7VSyX2ktArSwp706P+Qk5Q66Uimh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2da73158006so1584973fac.0;
        Fri, 09 May 2025 02:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782971; x=1747387771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6MrurKt6p8Jdz3Ys8oNQeTJe6coyy6feKWGCiny67g=;
        b=Vet6OWZGeMTinnYBHmyOfVhDxsh07SV+Lb5Du+QMpb7utHW/tnOLMfOHMI8A17mpLm
         IW87xPvC42RsR1SdDfrAzEOjdrgIt+cKzmZEy81x3fTXzjA/ZSZ+NnkVLjg9CZgGtSvm
         TUjq5RZvyZvpt6kz6r3WYcDE6h+gFAX9gcscWhobz0laCySMrTg924demuvaIu/PQZ3s
         /LGwdh12WseEt6auPv1ntNQCe+EcVH5XHNRLA9hi5CH2ABmKG1HwnmbEeIKEdYLPJnkT
         azW1cnoIPQqp/ADJrAfAuhXLRJGMasmguHKzzNOLaGvWZrvoIKMdNOWveIxhWGUNiAU3
         bdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7UElBhFOc6qo71bs0XakK/Zg/e73+eeVbgmm3Jxd7GCtREsneNP9wP7jfKXZr9IaSfSgrVVSVUsi@vger.kernel.org, AJvYcCUgxUIRB5fH+nL9zNRur7hRbxsnrGJpA2GBsiVSlrcB9bRSxJ79H6cxg+hcTZs2WHD3wkFCuP5cuxlAt0P7@vger.kernel.org, AJvYcCVt47O+31+wWA7TpZ9a4t5Dh4SomR+vPvUItseskwvmtaw5SvvYQeL+kOwEeOhDjiur6T5TzqkUgGEmYcI8kDxZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0oXvQTNDRbj/Juh8aSQpCqN3CjZPdsPJ18bS6S/AMUVaE1jdB
	5ua79oyezTqTIJvAR4dLfwY7jOk2FVewNUN7iHZQ8KbIH1K+rLDdy0edz2Aa
X-Gm-Gg: ASbGnctEAWSBkHAHLEEsZ+DSCzRztSXdMdg88R5JDEqfEke3WpDhsSS84RerBU96Pwi
	VSwEQ5MVWV6uVJpiDjX3VVok1DF8EZhejDllqdoPb4MiELrlF0f3t57wZjPbLKgbSlUpGK8gqdq
	wNdTmdiYM+Tl+WwdI0YCS7hDPvYcXIukopDhGjP1zXNa9PZkI7JSAJfIRzTnc9K+rblxqDmauSu
	N+RrPEGpbFwxODSUpQy2jJj5VGpMdeFaD1GXARm//kCGGuBaJ3WN+yHSmIz4pXQfv9P0tdxEZQh
	gS/GJkViqrU8WRaqJ/uVz+Mv8BoRWwV82jJb6eLuRpOvWunubvA8owr9pj6Hp2CDtcRPzWs+0hv
	mwNw=
X-Google-Smtp-Source: AGHT+IH2ygKIfNKkz/3tfHQpPyCb06RUJNHTW8kvlXB72RMCgIJNog2tgnkeS8EQjIInMlhaTmCrvA==
X-Received: by 2002:a05:6870:d14d:b0:2bc:9787:affe with SMTP id 586e51a60fabf-2dba42a3b74mr1561262fac.10.1746782970861;
        Fri, 09 May 2025 02:29:30 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0afde8fsm538288fac.33.2025.05.09.02.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:29:30 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2da73158006so1584931fac.0;
        Fri, 09 May 2025 02:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDkSZtOUoqdhiAYrumNR9ltcGZL/4WCNsb5X9Mh8MozaKCrmxSZXD3eI1Bl4TwOX87lZyL7ZzYCb32EMmwK+no@vger.kernel.org, AJvYcCUURjsU1iAk43CNyVWcETZnjPNneC1x5THnshi2GM+1k27T9B/8YCUQj0Wy8Lzd6ONglX272uIqp6L7@vger.kernel.org, AJvYcCXYfXvuzNGTK8tASLuxAR7KsBvSiDxWTc6+d9lJDDoVaaRMJUc1RaDzlurARAufwDUPLnoiFMJ10gEp0ZbJ@vger.kernel.org
X-Received: by 2002:a05:6102:1502:b0:4bb:c24b:b658 with SMTP id
 ada2fe7eead31-4deed3cf84emr1821937137.18.1746782958339; Fri, 09 May 2025
 02:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 11:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQm9FGt8dZ0y_916od1rep2A3QNm8iS0Pm+jr0uKPD9Q@mail.gmail.com>
X-Gm-Features: AX0GCFtyAkzk5YAh6Lsu_6rhoQgJRbc7WgiP4n_2WLUJ4s6yYIUa4Q3Q5gZOHWg
Message-ID: <CAMuHMdXQm9FGt8dZ0y_916od1rep2A3QNm8iS0Pm+jr0uKPD9Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Add request() callback to check if the GPIO descriptor was well registered
> in the gpiochip_fwd before using it. This is done to handle the case where
> GPIO descriptor is added at runtime in the forwarder.
>
> If at least one GPIO descriptor was not added before the forwarder
> registration, we assume the forwarder can sleep as if a GPIO is added at
> runtime it may sleep.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c

> @@ -288,6 +289,21 @@ struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
>  }
>  EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_gpiochip, "GPIO_FORWARDER");
>
> +/**
> + * gpio_fwd_request - Request a line of the GPIO forwarder
> + * @chip: GPIO chip in the forwarder
> + * @offset: the offset of the line to request
> + *
> + * Returns: 0 on success, or negative errno on failure.
> + */
> +int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)

This function should take a gpiochip_fwd pointer instead.

> +{
> +       struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +       return test_bit(offset, fwd->valid_mask) ? 0 : -ENODEV;
> +}

Not related to this patch, but just a random note:

     * struct gpio_chip - abstract a GPIO controller
     [...[
     * @request: optional hook for chip-specific activation, such as
     *      enabling module power and clock; may sleep; must return 0 on success
     *      or negative error number on failure
     * @free: optional hook for chip-specific deactivation, such as
     *      disabling module power and clock; may sleep

Currently all GPIOs are requested when the aggregator is created,
which means they are always powered and clocked, irrespective of a
user of the aggregator has requested them or not.
I don't see how this can be improve, except by adding suspend/resume
callbacks to gpio_chip, which could be called from the aggegator's
.free() and .request() callbacks?

> +EXPORT_SYMBOL_NS_GPL(gpio_fwd_request, "GPIO_FORWARDER");
> +
>  /**
>   * gpio_fwd_get_direction - Return the current direction of a GPIO forwarder line
>   * @chip: GPIO chip in the forwarder

> @@ -675,6 +700,18 @@ int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>  }
>  EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_add, "GPIO_FORWARDER");
>
> +/**
> + * gpio_fwd_gpio_free - Remove a GPIO from the forwarder
> + * @fwd: GPIO forwarder
> + * @offset: offset of GPIO to remove
> + */
> +void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset)
> +{
> +       if (test_and_clear_bit(offset, fwd->valid_mask))
> +               gpiod_put(fwd->descs[offset]);
> +}
> +EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_free, "GPIO_FORWARDER");

So this is _not_ the inverse of gpio_fwd_request()
(it has an extra "_gpio" in the name).

Naming is indeed tricky.
I was also wondering about gpio_fwd_get(), which does not get the
forwarder, but gets a GPIO of the forwarder...

> +
>  /**
>   * gpio_fwd_register - Register a GPIO forwarder
>   * @fwd: GPIO forwarder

> --- a/include/linux/gpio/forwarder.h
> +++ b/include/linux/gpio/forwarder.h
> @@ -9,6 +9,8 @@ struct gpiochip_fwd;
>
>  struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
>
> +int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
> +
>  int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
>
>  int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);
> @@ -37,6 +39,8 @@ struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
>  int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
>                       struct gpio_desc *desc, unsigned int offset);
>
> +void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset);
> +
>  int gpio_fwd_register(struct gpiochip_fwd *fwd);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

