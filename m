Return-Path: <linux-gpio+bounces-16276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9596DA3D665
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76CA416B9DE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337281F0E5B;
	Thu, 20 Feb 2025 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sI8O7S0Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5291F0E37
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046942; cv=none; b=F3PFQtZH2fVuPr1JnzTaL1l8OMfqs8D1Um1jMEedEpmh/7CIiYD4YJpmBIAQMgbMdEmnu8OXEVN7Ys8eA8zvArDhozGjEuI6vZKD0Zhw2qkU4zghJtPGCw17V4GiG0dlR8wDcSwuwoABKD/pFfxj0gL3vSwKNfdXQElmEg9yQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046942; c=relaxed/simple;
	bh=jOVTKQclGET5JYRc6XUbL9hn0R2HM4yai3zEupfHd2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5hGMui3HDJbPzZXgb/RjmF0mKFSdMGOwZCmgDIwykrsQM4ZCojjWOkOwJE04E/dpXOPrG2iEnZ5KlrGW0sYPKThFrF2rwadoAT7dxTkOx/QfTgh0bE+JFus+kRC9N/pw8W2FMCTQ9KbrS1IbiqGPA4trBqPItHSjHKSwo+G8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sI8O7S0Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso931395e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740046938; x=1740651738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkSjnPvhIdGSMhTbx4xuOa7rgF3IDrn9ZbqjQjQTkQo=;
        b=sI8O7S0Y+7kDFw+A6OnhYh0Prqh+udMMJuxY5+kRemV3TRjmCEp2JcwazAbBuRDcDh
         HNuwTDDT7VipdNFdqY8AFtRTmgRWsxC6FhZQRDJgihK6Ko0EU6gS8ABkH/wUrfvkNCAX
         qofjcaXFY3XWSuxDevmpLRta/bumGsaJcQ3aB0F+UI839y5JMrMmZv6T5XLW5TxTaQY+
         /yCGfWcwzBjRIqDtazxwdTG6f66fRopI2JtuQHZEwDL6bx2CEtVsD7KxgQjb1CmIr8hg
         Zbwir77cNb9d07BBezLKcOMsKqLmZbqemiyHVtd2sZnFE7MxJLEEdmfL4nx1a/k5cxVD
         qrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046938; x=1740651738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkSjnPvhIdGSMhTbx4xuOa7rgF3IDrn9ZbqjQjQTkQo=;
        b=BZOB46PpufRk/eODLtNANMeHG28llVP2gKx/X5jmoSm6TfGDSLdamd4eKpoz7yOBnm
         l/+ZrWO7zekATlP6YRJ6SjpUIxWHHZ9Lu7MModJXZq8+J6YYKXORHZOG24OCtvGNw3a1
         XQigKOfxlXtQUFsaAuJt8zNAt15sitdBIf7R1384anzr9BAGtBoPzrCfqvoEBZ+14d27
         PHjubl5UIBT6KbAfLHbdlYEt//SsY+YDbb6NKVlubWp/zPF55y670itwm2fmeDYOi15a
         6DuGvexNwpj7wehI7/N92BqQjhxfLa2WLW7sGvsnGk4rCR3Hy1mntpbD4c6XIVpsJXok
         xUUg==
X-Forwarded-Encrypted: i=1; AJvYcCUZcm81LtK2WANYCRdtknBW+FT7uChTMTqDMnS2blSrsMrLlPKV+gClFlWTDgFGiaPamGINFkWbFyaN@vger.kernel.org
X-Gm-Message-State: AOJu0YxivMtrvk9jnyTH3AHYdX2NTFgHMhO8p+QhDx90yj16pFyg+Jgd
	StxlAizB2BOPr2hJVsRZiSMPxldHIkboZ1RolF55zKO1bEVQ0ClEx4GjnGiiNURQoevAgandMpz
	KD6Pxol3m/PY5TbWQn9pVVuvpF50oEKAF+jB7Ig==
X-Gm-Gg: ASbGncsH1VVcja//GQ8pvwDNQ9dECBpTmd9/FJLWoJsTGG5JO4/ZxlmRuuuo+gHrp3Q
	dgFHK3b+yEJNPjGzuDi2hZzpfn8v0NdKyLJ4YijxEVlEVco5TO/fNhP3CtBF/GpiEnmcfPcbrgK
	3E7WlGpHbuqZKTWc/8E/BDMji1OUo=
X-Google-Smtp-Source: AGHT+IE7ycVVt1d8Epdhqngc45O4P0xrOwOQkPZv5wp+QGx6BPbp3JM32UOKdgqnWZwOei+ObE4ZSLIyhVDxExTl7Dg=
X-Received: by 2002:ac2:4c46:0:b0:545:bf4:4bc7 with SMTP id
 2adb3069b0e04-547243c348amr871274e87.19.1740046938079; Thu, 20 Feb 2025
 02:22:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 11:22:07 +0100
X-Gm-Features: AWEUYZkU7hdFlPspPbvUdBzoHfPqDtoAsaxfbkwGu_CSQGks7Gip_UiARp6sYIc
Message-ID: <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] gpio: of: support to add custom add pin range function
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Export custom function to add gpio pin range from pinctrl
> subsystem. This would make it possible to add pins to multi
> gpio chips.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpiolib-of.c   | 5 ++++-
>  include/linux/gpio/driver.h | 7 +++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..64c8a153b823d65faebed9c4c=
d87952359b42765 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1170,7 +1170,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
>         if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
>                 return -EINVAL;
>
> -       ret =3D of_gpiochip_add_pin_range(chip);
> +       if (!chip->of_add_pin_range)
> +               chip->of_add_pin_range =3D of_gpiochip_add_pin_range;
> +
> +       ret =3D chip->of_add_pin_range(chip);
>         if (ret)
>                 return ret;
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..a7b966c78a2f62075fb7804f6=
e96028564dda161 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -528,6 +528,13 @@ struct gpio_chip {
>          */
>         int (*of_xlate)(struct gpio_chip *gc,
>                         const struct of_phandle_args *gpiospec, u32 *flag=
s);
> +
> +       /**
> +        * @of_add_pin_range:
> +        *
> +        * Callback to add pin ranges from pinctrl
> +        */

Please, make the API contract more specific: describe the return value
and check it in the call place if it can return errors.

Also: is this even OF-specific if it doesn't take any OF argument? Why
not just add_pin_range()?

Bart


> +       int (*of_add_pin_range)(struct gpio_chip *chip);
>  #endif /* CONFIG_OF_GPIO */
>  };
>
>
> --
> 2.48.1
>

