Return-Path: <linux-gpio+bounces-19473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F6AA1BCB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2941B67D2F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9F825FA29;
	Tue, 29 Apr 2025 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0wtL3hD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CE25A2DE;
	Tue, 29 Apr 2025 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957173; cv=none; b=eicDFrjdokioDyBm8zZ+C0wnU59aiBEsLGHTaYxQ3yKeyUnCDSR5lRBkNAk9l9BzKgMddEPCcbZRist5m4zWH/vUyKtf7eXOC3tlxW/OJUbtnQaOE/TiwT0ev3LWT0joRb0MernFoDMgqj2VI4WuiDv2sQUTwWm5Y2COncU1hWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957173; c=relaxed/simple;
	bh=ROrues9ocYSCTDxwHhiyyawG8Ax3bIuGP081rEw54HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvKep+lW1Le0WLEjZSvERQH0dtoswmjS3U6ZV+YaC0EDbQ8C53iqpQYHUcFrPVWTlccIekX8hiN+3b3YLGFKfq35lp1LsjHtSP/WOpTSwpx87F7WNOyDi7BoaeQSp32KR2b2h6MzevB/yXnes8hvcuJfZbTIwc7sTNN5UkcUIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0wtL3hD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so809632166b.1;
        Tue, 29 Apr 2025 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745957168; x=1746561968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnhlweQrbulpbYz5+ddzD9VuCBmMsdNLumZo0g6Oc68=;
        b=M0wtL3hDfy74tnGFqJtumgEzOHtgnURSZkVIXvRW7DmTLCuL1ANlVku/XLXZ5g7o4k
         rjQpL4x08/Uu1UfqiTfcPZsC1qUhJ2/SJcdCHrgLr32Ubk8IiyZhKXSpKvxt++rcPRJq
         z/K283/3R+E6FPXBersEyce+W+H/oc3MUsjSxPQLrPEij6S7MeaUKw3sSpDSrWm2i28s
         0uvOnDRU/2J1zPa0BWUx+UaKZwlZC6cDvi8+DIuMlKd8vaF1v1B3U67142XQ7UYS8myM
         8CJuYHwyooEJuVyVNUGq4so3FoGG1ZaMSJP3DWzwL7LUGQiHU/rtkyTbQrV93QJMEIMy
         eXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745957168; x=1746561968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnhlweQrbulpbYz5+ddzD9VuCBmMsdNLumZo0g6Oc68=;
        b=dtGgkGKrgMT6agmVCVJGMynUARRd8FbnWYw/LN+iNNyflXOohAiDNdKNyb9JDqSie6
         jA/3Viv/8Uldvut1eLcPYmChgN7L3O1WP9yGjQi/geq+rx6gy5Cg0MG/aWg4nI5RW+ri
         aIDLvpdLoVtmxPM1yCZejtQT+pwE5do+Eq1X4t62mCUQDRlJio05Onb8uemoL7xygpkT
         entB3t01TOGRP12+IX5k8bGJ74JfJ2FCV4HCOkZ57fjg1WsqUqwn7JzVskvcN4x3kn7e
         PymJcTm323UB6s82iaxBQ1RtX2m6h31W33abOBFTDmhg7dcn79j9Jq1dOu7Kg67Hucvx
         WY8g==
X-Forwarded-Encrypted: i=1; AJvYcCWEeXnmYIOarM07EjwQKaBnnS5ucpt0Yd9znFu5mFUInSrsswMo5JKOx2DDwl58zURD9Zkj4frQufuy@vger.kernel.org, AJvYcCWkED/XKHVb9hyvVxclqQjAu2w2dKco7/1f/5oh16a/F67OzZolmuBG9Xxkb5DYBqpF2D7kJqrdgcKWL9PTteWT@vger.kernel.org, AJvYcCXyn8J0trxmlzldVRNA7IOyDWdt06xpftDDpJPfZyNpsQK1m1jOlNxGkftNyhmteS3PnKK0zNLp09ZG9+3/@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7hvKAqKQ4mA4sj4w9IMdLQwIUc6Ogfq//wRgvoIbWUaut5z2
	XUDokxqBNBbb+toJDvCq/DZyD2tsXi9+Sbo8XXKca+WZBowP6ENMt5JP10jW0jpmkN6KWUhhyoK
	EQohLpEaDUgyy5EPnLnAWCsXgvYc=
X-Gm-Gg: ASbGncs4V5wQLolJ6kxR7IyZCCBZhUaY4ZHVVVhxpqqiyeQu2w76mWniFJwEM8TP+ce
	B3qXb8xJL15FZnVy+oJkqJOUN4XSIFQDPLpC9w5ElzQAobF3xnRoCN28G6Ffwi6C5MUUrczBMbl
	0SNlMap2HEENMY9npZjKeB2g==
X-Google-Smtp-Source: AGHT+IHzBwENZySO+iABPSOfF0pbPLTD2vHtSSYYLyk7Rh9/rw8P+me+a0xt/eolP/8YcUIxAVbgjbLl+erCtG37oR0=
X-Received: by 2002:a17:907:72c1:b0:ac2:9683:ad25 with SMTP id
 a640c23a62f3a-acedc62278fmr64758766b.34.1745957167963; Tue, 29 Apr 2025
 13:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-5-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-5-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:05:31 +0300
X-Gm-Features: ATxdqUH3j5SoOveEZ_BcoQGg8gt0PoLFQ9rwxHPs1rQsev2JxgqaatDygJT-ZVg
Message-ID: <CAHp75Vehui8wJPvX=wn78eQYVSYk3h0WqiEtczAS81qtuWsYzA@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Create a dedicated function to add a GPIO desc in the forwarder. Instead =
of
> passing an array of GPIO desc, now the GPIO desc are passed on by one to

GPIO desc:s
GPIO desc:s

> the forwarder.

...

> +static int gpiochip_fwd_gpio_add(struct gpiochip_fwd *fwd,
> +                                struct gpio_desc *desc,
> +                                unsigned int offset)
> +{
> +       struct gpio_chip *parent =3D gpiod_to_chip(desc);
> +       struct gpio_chip *chip =3D &fwd->chip;
> +
> +       if (offset > chip->ngpio)
> +               return -EINVAL;

> +       if (fwd->descs[offset])
> +               return -EEXIST;

If we still need this, it shouldn't be in this patch. This change
doesn't require the check.

> +       /*
> +        * If any of the GPIO lines are sleeping, then the entire forward=
er
> +        * will be sleeping.
> +        * If any of the chips support .set_config(), then the forwarder =
will
> +        * support setting configs.
> +        */
> +       if (gpiod_cansleep(desc))
> +               chip->can_sleep =3D true;
> +
> +       if (parent && parent->set_config)
> +               chip->set_config =3D gpio_fwd_set_config;
> +
> +       fwd->descs[offset] =3D desc;
> +
> +       dev_dbg(chip->parent, "%u =3D> gpio %d irq %d\n", offset,
> +               desc_to_gpio(desc), gpiod_to_irq(desc));
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

