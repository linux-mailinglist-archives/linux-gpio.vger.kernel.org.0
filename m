Return-Path: <linux-gpio+bounces-12814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4CB9C3B30
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620351F20F4A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2931552EB;
	Mon, 11 Nov 2024 09:45:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0E81531C0;
	Mon, 11 Nov 2024 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318331; cv=none; b=EJSiLiUUxwULD41bA1c3vLtN3+U9ohLsx1gJlyZzzQUoitG5JhiY1Tg/2ZzzyZJMf8Y2/K9K0n7FGj9f/vR9RWYiAa5ms1NH1mMxei6l69yPFQSkLF2KBFEFhWWz6PYcBGJ8BJNJfyNhAzQ8pOFKZ2b8jquDPX/uTgnF7W4FSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318331; c=relaxed/simple;
	bh=xfVdFbW/WL8OzILGgda9MRZEnND71lnebv0KQTum3ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIDpT+iNALhzR/aayIlhAHDdxvOHkA18OuytvxCas9wj18NCl4GNWiouY92iIh7HYedvvkdwQ12AyTPtofHNSiBSRYZBRcz/ousJwgTnlp1O5rxRrxQbLIk7usUzo2HLLmQe5KwL7p1EnOHze6OSAyzpxaefaHCmVB35nX1rCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso4005685276.0;
        Mon, 11 Nov 2024 01:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318328; x=1731923128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG3w6IoKtjFw3GDAzprXMtFGp5ZzUMYeN9BzuAyCT4k=;
        b=JtTzQccWKNYf+XgtTg7D9aZ4KUHgc8YXO/AghxmiqXOLUmGyYoN1pYeutSSg2nmQnK
         kYCPi0wXKwDF+Y/IHlQdsqO/7RvtCXghjqI4Calynt05nMcrWi77X/+lCYIXXLDimwms
         6cNz8iA8sVym+H2lGgwb+XkH9Sh0FxnE7wyTcGI+7nAvNDwvG8xhPxIcBfXR4EUtvrA3
         SUoZki6S/luillFLeVbmMNMgB2hfab48Hh3jPJCokALSOtzl1ve7GKyQMn0uRAku9IuK
         rYegVN4i0Ud3S4QtfYDzgl0gb26/70MHb29C+NUuN2rIlO0gF+eKfHWLjpD2zkNYj1+B
         qQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhlTJ3Tah2Hw7AiSelIF6+0XhUetZtU1jq/hiH7teSV/NR9HPzaX0TfjyzQvV0Udkv5DXsm7DPsqT4rw==@vger.kernel.org, AJvYcCVQf8BzrJYFMcXANgu7YHwm+NtuSIaJ4LWaqy4gQbhyn8DXVIoxoN9mac+xhGl0nVLk1bDYcUSLf3bB@vger.kernel.org, AJvYcCWNShEgJStVa4a2mBxkdDVUERNYvoabhQK6L3gj6UBGqdfs3IlOwVzcoCrQA16Cy0Bxq148RQJB1iNa468=@vger.kernel.org, AJvYcCWsZxk41PgQYvq57HUvSjkffq0ylNFHysOWTquZr/ZNbbyZ+UdMf19kKvQjlDwctveleDCAO8bpw6HR@vger.kernel.org, AJvYcCXAlBJsArE41Hw25uSXGb38Vg3RM0QMHh5wpa/OakRmKYAlYGzxHyG8qjUU4836yip4gRTm7N4JgUlqHffh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fygvZKXyFVbYPi3TzirseS+VNch+BKcuYW6mhNOsEWCB0bXN
	Jun7gwTsu3KK5yOhvpHGfxw7bDNpk04tT2ROzJmPwH3KTKs/zgi7QnOg43g9
X-Google-Smtp-Source: AGHT+IH1dq/CGVrcgdiw4ecuXKxh6ZWzjkd60AXGa836S/M71fmRFl6pisCL7HI0NvOMD4Z8WeScNA==
X-Received: by 2002:a05:6902:2890:b0:e30:ce97:d3bd with SMTP id 3f1490d57ef6-e337f83f903mr11279297276.5.1731318327749;
        Mon, 11 Nov 2024 01:45:27 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336ef2017bsm2175112276.21.2024.11.11.01.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:45:26 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6eb0e90b729so6937367b3.1;
        Mon, 11 Nov 2024 01:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0AFmUf8y1NerB6LurB3hPaWLihnkh8wC2m+9yMp2JS+gSjPWyK4f22PMikra/UH/nnklPp2tbK1aS@vger.kernel.org, AJvYcCUzWVKQjwyBTuNI/DlbR3rZt0XxPobXYTgufWAms8CixhFFsuW9JwzEgb8foi7bJvw4mvz3DEp1vANMSQ==@vger.kernel.org, AJvYcCVkZ6j0cRsnMP9um0g9BdOJHX5Hy/jld63GrnWKGrmGPEfLpN/6YNk11/d2jswXVaKgTo9Tq+1EFMB9@vger.kernel.org, AJvYcCX9Gv7g93PtDiNpzy85KDYxgkC/j4ucdAO5O9cFau192E3h6GNpwIdD9mo313VyqD6MPMZ8Sfi2xhAyeWf6@vger.kernel.org, AJvYcCXNUSvm19CVpla0K0XNqKL0b2ONnNQ88eFEKSh/YSwwKiI1j36HoukDkAnWpXc4rmT5wUO0jM8zz8vXW00=@vger.kernel.org
X-Received: by 2002:a05:690c:6f83:b0:6ea:c928:771 with SMTP id
 00721157ae682-6eaddf7ffabmr110486467b3.28.1731318326288; Mon, 11 Nov 2024
 01:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2024 10:45:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Message-ID: <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Nov 4, 2024 at 10:37=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch, which is now commit e6a2f0ea519fd247
("leds: gpio: Avoid using GPIOF_ACTIVE_LOW") in gpio/gpio/for-next.

> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct de=
vice *dev, int idx,
>                                             const struct gpio_led *templa=
te)
>  {
>         struct gpio_desc *gpiod;
> -       unsigned long flags =3D GPIOF_OUT_INIT_LOW;
>         int ret;
>
>         /*
> @@ -239,10 +238,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct d=
evice *dev, int idx,
>         if (!gpio_is_valid(template->gpio))
>                 return ERR_PTR(-ENOENT);
>
> -       if (template->active_low)
> -               flags |=3D GPIOF_ACTIVE_LOW;
> -
> -       ret =3D devm_gpio_request_one(dev, template->gpio, flags,
> +       ret =3D devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT=
_LOW,
>                                     template->name);

Just wondering, as I am not 100% sure: can this change change the
initial state of the GPIO?

>         if (ret < 0)
>                 return ERR_PTR(ret);
> @@ -251,6 +247,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct de=
vice *dev, int idx,
>         if (!gpiod)
>                 return ERR_PTR(-EINVAL);
>
> +       if (template->active_low ^ gpiod_is_active_low(gpiod))
> +               gpiod_toggle_active_low(gpiod);
> +
>         return gpiod;
>  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

