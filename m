Return-Path: <linux-gpio+bounces-4084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A986F580
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 15:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6F0A1C20A01
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 14:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3101A5A0FA;
	Sun,  3 Mar 2024 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jodiD9x4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73A959B52
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709475576; cv=none; b=M5VxPVmRnCMXkU3RgRAaL8IrWe/j2z/5ZVdaH5srpjIxdZi9f8e2jItkHqAX2zZQ+tVGG0OxXJmdHPFb+voQ9PizWbTIS0jI/LYZFZJ4TzngMPEc/Un0pPK02X7L4rUF1EclgnQrGPvECfeE69gk/7TdTL17QLLm0FJi5fduWYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709475576; c=relaxed/simple;
	bh=PRY+uK511uqmO9RUb/VkX2Ax+vPSC9tv6zLdFcdFWPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsNuuKa6nsZpWs15StAbYk193vagdLNYd9T2xmPjl55ZW2D5xF6wKQyjQ5CsioC41WIGzmEvZzUIg6tpf7BmFC3aAfDbkz63Mkf7qBm+3oRpjRMAJGh9tOqteBHmEJoylXWMQPXBvN4/IA7FR2Oml9L2e/KxhH4YLBj+y9OHhq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jodiD9x4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B9DC43399
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709475575;
	bh=PRY+uK511uqmO9RUb/VkX2Ax+vPSC9tv6zLdFcdFWPs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=jodiD9x4q+FNeORbhezAd9VNw+wJD58b7wBXpJG7rUrWUlwTZwXsceh6u99LAWZaJ
	 RdV/dg6IU6r+6iGY6SUo0PdWhmvRwbbDWqHjpmlYlNQsB2Xh/WYNO2ojvYdtcCmn+H
	 +xE1zl9BD6TZHQ+R6Z9Fg8DVa8ozNnu2oWkXqc/hOUA6Ly7lRqKSlX8Lg7yPNsKlrC
	 bFNUsFcNL1CYAq/iXjUYcVy9xcSAumo8L7SXAJ3+jfgYRK4Tbotxgh7MkjxCPgHIvA
	 l1HtnwxbmeXpdogl1Fgy2akbKd7mGCzZ5pwQkLgLhEu9NxCs7uqtb5qM4YeEFcxHKN
	 mXqLQeh8qixqg==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-299e4b352cdso2369322a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 Mar 2024 06:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAQIqCYtb8VF9skmoFsSj9s/VGy0X6+SB0Ne9uVwgpXVi5XJCavjR1cJ3YBQZxVu4Ka+ybZG3PdyH5ZnrPRRVvIiRgdkt3j79wwg==
X-Gm-Message-State: AOJu0Yx9etSMySm1LdbzCyKkVFS3aEdWgcQX0AunbEkZaFpHuy/Y5Hh4
	cUOOvq7h+c6p45GtDBu4fx4371M9M6VtTD3mqyX4dR6nHl9XU2WbvG587qSKZHa0sEhHPhcE3nq
	m855ommFl8rWcNkTZPquk9fK+7yE=
X-Google-Smtp-Source: AGHT+IE+6F0veOMNza3Z5wBJvdbnTn9Ze39w0y2g6n+T+VBaeDWi/4TVGeZvs9C8umMjjncgzBdt6rIhjFbCAyTLxQU=
X-Received: by 2002:a17:90a:aa95:b0:29a:8ac0:9fd2 with SMTP id
 l21-20020a17090aaa9500b0029a8ac09fd2mr4496486pjq.49.1709475574952; Sun, 03
 Mar 2024 06:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
In-Reply-To: <20240303140137.157522-2-wahrenst@gmx.net>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 3 Mar 2024 22:19:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
Message-ID: <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: Stefan Wahren <wahrenst@gmx.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, Mar 3, 2024 at 10:02=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Even the driver already has implemented pin_dbg_show, it could
> be helpful to implement pin_conf_get for a more generic behavior.
> Contrary to the BCM2711, the BCM2835 SOC doesn't allow to read
> the bias config, so the implementation is limited to the basics.
>
> Keep ENOTSUPP here, because it's only used internally.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 37 +++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/=
pinctrl-bcm2835.c
> index 1489191a213f..ed768cefe5d0 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -1003,8 +1003,41 @@ static const struct pinmux_ops bcm2835_pmx_ops =3D=
 {
>  static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
>                         unsigned pin, unsigned long *config)
>  {
> -       /* No way to read back config in HW */
> -       return -ENOTSUPP;
> +       enum pin_config_param param =3D pinconf_to_config_param(*config);
> +       struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +       enum bcm2835_fsel fsel =3D bcm2835_pinctrl_fsel_get(pc, pin);
> +       u32 val;
> +
> +       /* No way to read back bias config in HW */
> +
> +       switch (param) {
> +       case PIN_CONFIG_INPUT_ENABLE:
> +               if (fsel !=3D BCM2835_FSEL_GPIO_IN)
> +                       return -EINVAL;
> +
> +               *config =3D pinconf_to_config_packed(param, 1);
> +               break;
> +
> +       case PIN_CONFIG_OUTPUT_ENABLE:
> +               if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
> +                       return -EINVAL;
> +
> +               *config =3D pinconf_to_config_packed(param, 1);
> +               break;

I'd like to take this opportunity to ask about INPUT_ENABLE and
OUTPUT_ENABLE.

AFAICT from existing comments in include/linux/pinctrl/pinconf-generic.h ,
these two options refer to input and output buffers or connections within
the general electric path, i.e. it allows the signal to pass through in
a certain direction. It does not refer to the current selected direction
of the GPIO function, which is covered by the PIN_CONFIG_OUTPUT option,
and by gpiolib, if and only if the pin has been allocated for gpiolib
use. But it seems multiple existing drivers do this.

What's the correct thing to do here?


Thanks
ChenYu

> +
> +       case PIN_CONFIG_OUTPUT:
> +               if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
> +                       return -EINVAL;
> +
> +               val =3D bcm2835_gpio_get_bit(pc, GPLEV0, pin);
> +               *config =3D pinconf_to_config_packed(param, val);
> +               break;
> +
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
>  }
>
>  static void bcm2835_pull_config_set(struct bcm2835_pinctrl *pc,
> --
> 2.34.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

