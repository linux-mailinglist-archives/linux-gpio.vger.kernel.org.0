Return-Path: <linux-gpio+bounces-19842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6874AB0F0B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 11:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AB841BA122C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 09:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1248927A477;
	Fri,  9 May 2025 09:32:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8A2882AA;
	Fri,  9 May 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783169; cv=none; b=bH3tO4g5F3glrW+M/wnYXrjCeEukPu0g1TLieUxzRPDTguFmGW/33fmfoJQ26PXmoHfEHRErFAePsz1WQw9alZh/tdsGAwM1i5mbCPO8Zwz5uGF4KAw1KeOvDR8nSvmEloh2aSYcbEQ9NN+GwZjCeyXdSSY3QqbgOxU8oo4XHO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783169; c=relaxed/simple;
	bh=u8CP2jstY1vLjj9w7I+M1YYtHhLAwJx51Kwb35+xddA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBs4+ICkcAUD1i7VayWIjhHs5dv1RIvGYOzN7uMZVzraP5XxNUOAOb7UoOF42b3Rj4/G4jUeIqUHLKmZvo5C79H2zuoiAQ7V5zJN4BzqaG8ICJkjIxm/eke81GRHkG6JxZ06mi9EdjM4bcKEO5QH3OifA94eMZ52TotowrYdcbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523f670ca99so632248e0c.1;
        Fri, 09 May 2025 02:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783165; x=1747387965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiqZY4cxBVqG62IrO4QCpU4892TzI+loxr1Y0y5+4vk=;
        b=iRTSMgKFT0/G1B1i+7ZMX/tzaRLrs1pqVoSTTcjdoJeImJn8U7ZBtf4sUWTZk+5Ffq
         iUOTPxlech/ln1I2e5yM8G5rtKcviT6zv+FEwRyFbzQRcuzorah7o55NPc1zZxnoKRkW
         Z6A3D16SWgT6VMihrVRffJzg+bwVLQGGclbZ1n1FNPYi0pWLufPaNB+NrE0ImyvQiEdN
         Bvd/MVuxr9bMWSQNDATrEP6YVERVhKxBwW0twGPIIYNhzpAmMhUswfi17tvvdsyUFlPm
         3nJAJvSh9Sn75EGZaj/KZrCuir361bnD5af7n9yjDupNR0qSfvdu2Hl1U/tUg8+OHn/Z
         1yDw==
X-Forwarded-Encrypted: i=1; AJvYcCU+x3lonbdQPPREMSBr/0qQkOSLzgkUQb3ymdb483OABIBl1BRWDu55ovhCo4bnSzUIacZozbW9eWzChMIm@vger.kernel.org, AJvYcCWTH7RTqHiVCoRxgz7k4Koxz7IYrVJggUJaiBHUu7yoiiBo2yDBzgIthRO921MQDiC75FfipMu1QVhd@vger.kernel.org, AJvYcCXyiLrhV97UTiHQzPOQKyXLfX2EU9Q8BFYT7IGD9SFBp4vIzZjvG+ESW+Jx7Jg6I+Nxa8npCdazP0SIqVMS8G/2@vger.kernel.org
X-Gm-Message-State: AOJu0YzmfO4FYJ/JuglUHD5bSeROdJ0GQdDyA5Ivvx+F57AHFkzA+VzP
	fK5gBzW9kC04PNfzFMUqcZ1DNVSDZMAn1AFpYSOH3GKofpUpqsbOy2+8b+QT
X-Gm-Gg: ASbGncuC/Sv7Pqnhg3SgCjia+uQwTQKbW0c1am83WMtGEfFeOEOfQ/svMk0VVfB7m1L
	6f27sjCtccYImInIONb5ioNIyOi5OXyaT1QLyVDc591+9FYGkZJpJvTngmQZCThScy3PDRP83rv
	aiAzfKZA+6TNQIISsr1bvGtkQ2c55UYM2KEORK4v5aRBxcpZADrhSDxBDPvCJPC4Qs/ZnTW4GrY
	QQyeiMviVzKJm7jRAbyQHTyvS+ZeSTbjeG/mijw7TTFHa3ypEAo56ytBndqObQ7ojqAW8HtJYkj
	e8qpSfyVUjzPcpzZhDu5TRq5mbrmHgC7ymtNdtyWPOxJDJiH3e8/KHdNUz6P3llHrkhZ7yEsahM
	2V7E=
X-Google-Smtp-Source: AGHT+IGHWjt6yFi6L2E6+EpUMyuMlq2TK3LxwEqDf9eGdcU7TeeyxQxK4oqjRRg/3fAPBabdLZX2iw==
X-Received: by 2002:a05:6122:90e:b0:520:42d3:91c1 with SMTP id 71dfb90a1353d-52c53cb66f4mr1762737e0c.10.1746783165508;
        Fri, 09 May 2025 02:32:45 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c565cc6d9sm637227e0c.5.2025.05.09.02.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:32:45 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-878af63c5eeso498657241.3;
        Fri, 09 May 2025 02:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYyy6iCZUaz5zdm9wyAFZomtjs6IaBRVsfUXEbwfXnoA8NDMUFDSMtiivIE4IVmYG8KcAkp/ScJ7WxzszEzg8r@vger.kernel.org, AJvYcCVqtUAusZSsZTVzAiw2Ahi3xdypAacQRGoSzjZKNhvLVZlaZha+pRWKxaxmYlHKpnW0bNmvF48BpWKxFgMa@vger.kernel.org, AJvYcCWjQULQ+KZxHB7cQZAggO9HsTaUw6tvwCcQcdx1FL0GF2IFojUdYeTa+B9lvverajP8AMCAghzR4S6D@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4deed3ff7d2mr1976230137.22.1746783164290; Fri, 09 May 2025
 02:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-10-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-10-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 11:32:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8kxyZV9TeC9H5=RBHW3ZL84jRvEOX7HBTVfkAyrxSqQ@mail.gmail.com>
X-Gm-Features: AX0GCFv6hjVazIWnpPSbgpjruxFWmQk-XkjpotFopyD6W8-ZKiIyd5_Qr17iPWo
Message-ID: <CAMuHMdX8kxyZV9TeC9H5=RBHW3ZL84jRvEOX7HBTVfkAyrxSqQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] gpio: aggregator: add possibility to attach data
 to the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Add a data pointer to store private data in the forwarder.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c

> @@ -289,6 +290,18 @@ struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
>  }
>  EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_gpiochip, "GPIO_FORWARDER");
>
> +/**
> + * gpio_fwd_get_data - Get data for the GPIO forwarder
> + * @fwd: GPIO forwarder
> + *
> + * Returns: The data for the GPIO forwarder

driver-private data

> + */
> +void *gpio_fwd_get_data(struct gpiochip_fwd *fwd)
> +{
> +       return fwd->data;
> +}
> +EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_data, "GPIO_FORWARDER");
> +
>  /**
>   * gpio_fwd_request - Request a line of the GPIO forwarder
>   * @chip: GPIO chip in the forwarder

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

