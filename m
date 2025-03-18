Return-Path: <linux-gpio+bounces-17737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB7A674D0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 14:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE511882B34
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179D820CCCD;
	Tue, 18 Mar 2025 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sfk7Ul3D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04788206F22
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742303917; cv=none; b=E76hPuy/SwMXkKxPetddaTEptTSG+v26OJWfbC8VYgg/cSjPHGMgt7Vyad0rlw5kqX6ddCp8NhHyjTDWwmrsCfex8NVwNnkKL2xNMgG0ESmPMEX9KQgq5BzD9fJUJIdh57w9tEOkjGN1PZByF8zrgGEO7KbAZbFGGhs26sY8Fl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742303917; c=relaxed/simple;
	bh=sqzk860TzGLwIqBAeSxldygCO4vMRjBINf/+azmCItQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlBib6PbxK3fzuXJao9B5rli/1WW9q1dY7MyVhVuLNbdeplau8m7edcjLkUd2xJ2018Zh8tEZEcfkk/gq9GxpPo2QRPr1hsy9n7gECzGDCEs3h3VrHW1jATid9scPvHpYPr6vXKt9XVoagQhcjqLm7X1tXUgqkBoqPcsSW5Qx6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sfk7Ul3D; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso61014831fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742303913; x=1742908713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GkJMmlJtow9MnFIgmyAm/anD0TC49/pahD7NCkZncw=;
        b=sfk7Ul3DKfhvdyebnCEiaVQDpMpNaHqTSO6bbvMrx1NbTNfluwf4WalC0fQnQOn4Xz
         x+W6meqA7GbW9fS4WU7XdEFsu6MdHn8rR7OyPv4NMyhLZQv++YXSrMfQOBLj5GwqurXm
         RfV9IubY1fraUIVPKAl9uovCKnlYhQXR1loenlYQJJHnDgVLM2uW6NcbGev9LY/TrCDw
         sFRl9p1KOOQ4IC8ctGATQJ5gUse0cT6Sx50xTpgivvJgDvFos4JNzbvog66zxRwTZVl6
         anG81qW10aiXbmb3bDOzRPZTp3tyYsZTtv+SPzC30+PYX3xKoqg6aTiYiIg/vzTaqoqx
         CgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303913; x=1742908713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GkJMmlJtow9MnFIgmyAm/anD0TC49/pahD7NCkZncw=;
        b=JSpvQlho9n6XNsP3LpHqQGc5hnjIbj/n9SNKIBjf0ZfsGGZUC8RJlbn3D9gaED7OaJ
         7fr6wBlfl9HNLtnNWvOlYNxJiCBWzKUUKVz9ZtO6Xqrt+nE3NNkNuBC9IuSZxWqpLpbG
         HJhbS9lrR9E5K04nHkecln4UNtuDcad47HM2wwWuJkzeMNzLXU6rurKtdKVH2o6QIWcR
         J8D2A6Evh5YTk7XBCjJvFONw0D/SQfaxrszHWWWEUhADfhQi5IdtpvoNvhZYh7bQL3RF
         ZiwQA0cLLiclSpD3oncGhT+D6lcrqIk4VYeYnMQe6aG/rZIeY7ByAH4B3kAnHJJwEDAu
         HqEw==
X-Forwarded-Encrypted: i=1; AJvYcCWncLTayAxJbJNMNpjPINxHz9ev8ksfRTcWApTnqAV8omZKyw6ijn/pLzfmpewPIeMtxJ3pALzz0NEp@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+zgFp6kTqvixUkf0JoL/bv1dhpNt8iDraZApWH9w2aAFBV/D
	bz2Qk7UjetcX682crMr6KaTE2hxuN3qtEDqh8ZVS+ZQKDcNy9QYp2WDJTVtdZTr5065xqBT9srs
	1lT+4+sgk6pFfkNpoHTRNSmIyFvnMDhP+vaMFhA==
X-Gm-Gg: ASbGncu/3w9JpBo+zX0GQaU3aQFeJ0cGrcVne2HlD0QOthkVs9gwiJHoJiTRdmuPxR1
	I2mjAtljxtXkqFM3CQylh5NiSJWH7ocy99k6wduECRSgYc85ZHCBz7Ik8lUiD9u4VkT+B+isiAc
	cuQo9WhecZ3NGGJ06Y0PdOPjbXVSO9kYul7/Wf52zB7S4puFRYLgfVzD4ZOA==
X-Google-Smtp-Source: AGHT+IGIpv5bULe1uU4cvo5lmBxtIwJqi9lemqqFJYwj8tz25wV0gRTtEE2ULA3kl3ruG+2IKNYXj0LmK7kc240suJE=
X-Received: by 2002:a05:6512:4029:b0:549:8b24:9892 with SMTP id
 2adb3069b0e04-549c3637866mr9791793e87.0.1742303912860; Tue, 18 Mar 2025
 06:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-5-36126e30aa62@bootlin.com>
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-5-36126e30aa62@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Mar 2025 14:18:20 +0100
X-Gm-Features: AQ5f1Jpso2z-FoYjW2nryy3p2GrEapYy3G_jZz-K_v24ydyb1K1fXKcO3Si-9Ug
Message-ID: <CAMRc=Md9HsE9nOzFGqJ2mrKx--ZbFa0na6cnz_AiHG+5Qi5NTg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/6] gpio: aggregator: add possibility to attach
 data to the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 4:38=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add a data pointer to store private data in the forwarder.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 6 ++++--
>  include/linux/gpio/gpio-fwd.h  | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index b9026ff2bfdc1..3c78c47ce40ae 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -556,7 +556,7 @@ int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *f=
wd, struct gpio_desc *desc,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_fwd_add_gpio_desc);
>
> -int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
> +int gpiochip_fwd_register(struct gpiochip_fwd *fwd, void *data)
>  {
>         struct gpio_chip *chip =3D &fwd->chip;
>         struct device *dev =3D fwd->dev;
> @@ -579,6 +579,8 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)

I see Andy already requested some renaming but can you also use a
gpio_fwd_ prefix for these exported interfaces?

Bart

>         else
>                 spin_lock_init(&fwd->slock);
>
> +       fwd->data =3D data;
> +
>         error =3D devm_gpiochip_add_data(dev, chip, fwd);
>
>         return error;
> @@ -625,7 +627,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struc=
t device *dev,
>                         return ERR_PTR(error);
>         }
>
> -       error =3D gpiochip_fwd_register(fwd);
> +       error =3D gpiochip_fwd_register(fwd, NULL);
>         if (error)
>                 return ERR_PTR(error);
>
> diff --git a/include/linux/gpio/gpio-fwd.h b/include/linux/gpio/gpio-fwd.=
h
> index 80ec34ee282fc..c242cc1888180 100644
> --- a/include/linux/gpio/gpio-fwd.h
> +++ b/include/linux/gpio/gpio-fwd.h
> @@ -10,6 +10,7 @@ struct gpiochip_fwd_timing {
>  struct gpiochip_fwd {
>         struct device *dev;
>         struct gpio_chip chip;
> +       void *data;
>         struct gpio_desc **descs;
>         union {
>                 struct mutex mlock;     /* protects tmp[] if can_sleep */
> @@ -50,6 +51,6 @@ int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd=
,
>                                struct gpio_desc *desc,
>                                unsigned int offset);
>
> -int gpiochip_fwd_register(struct gpiochip_fwd *fwd);
> +int gpiochip_fwd_register(struct gpiochip_fwd *fwd, void *data);
>
>  #endif
>
> --
> 2.39.5
>

