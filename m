Return-Path: <linux-gpio+bounces-15893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7370DA33966
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 08:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A8F1618F1
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 07:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0186B20B80D;
	Thu, 13 Feb 2025 07:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1jErXbkr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF620B1F3
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 07:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433458; cv=none; b=WY9fIDv305m1RET3xQLC6+BnTE/hPBzmUQfv/44RAwdiCq0gbfp99ZgxZopg7AgbBfmPLOlyARbMSewv8/v1KNuXukWjmlh3JMDXkli+LHL21p/SORPxgsVsOXsly4nXmiDlRrLCaJ2IZnQH8+ZeEHHfVvwbzptx7EZH6CtpMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433458; c=relaxed/simple;
	bh=lteoq2UN44nEB81Apnj5Y3cNZygk4/hUn8bmrb27Ets=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RE9kX3tcLTPLeQAkTtcVbUMRDeq9U2265G648m5r/6k72wPOTZudlH+F8l6ECpoVJS6WWPHdwGLnihR4Nso+ht5hiUhdYIDVzxcwAjjUfYUv30Vz3JT3GCiciwhFduUaFCKfsgDQFnz4UgXVl5gAFZCpTrc5+GCQtDrUcGjoDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1jErXbkr; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-308e92c3779so17583031fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 23:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739433453; x=1740038253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjeUwhmCaAkPStOzBf/5snH7deT8KsXIa9QvBKZnL9w=;
        b=1jErXbkrAHCZ5uexClIZFZ+4kEEhOFwptORxDv032WmP7u4Tej2pAsa15JMsq1iS42
         2Vyl3ECdYVyFOQg6OWb3iY/DFA4ADqFh75c0jj2mhAskmyDN7SlAPDW2bpxCpgwed6KO
         WK/2ZFjMCPLdNobYtXtASFZQOPyFjWwjlFU/rGsBQEvZv9wP3LhjFNMwL/hc/8/t+Jna
         R0VIXx7tC7akY63E7tbRJdkGzxKCBzDEVusYbQpvIP629ObeyuI4SOODHFdh+n98NhZ1
         0XFKNvvyzyoYPiTDA1+ZSkhrlWZUcy+FCfD53FNozUS+TKF6ibmnJdj0CO9pl83RAgsi
         XgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739433453; x=1740038253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjeUwhmCaAkPStOzBf/5snH7deT8KsXIa9QvBKZnL9w=;
        b=c/Ijrw0FD+cmkimD3tCfYD6abEtjCKftM7x4UDlPAOhHUMpOR/q+zygZgzKJMsUEil
         +ADEWmsMMr9yTpPDnTPNWkR9uQ5tnmfpgMIWb2Pn6tnK3i0zGMWLG6RZNcEw3ob2WkFM
         PZU5ZAhgT+KzYOYlmsmHLEECnIqAekScKodBhlDFaUQDu5g1V/jbrcAzAhdkv8jqLxQx
         Sq0BhMjl9bNTH5DbveY+F709MljV36Zws86ZjlfWXTshjID/4xK9YaNU0sL1/vpaFmdY
         ezaht+i0OL/S1a7Qmn2eAVdpdcWzz6RZfpmilzJpJ2nZimN/fp2uR6ZAdzIpqPXor4SV
         Dk6A==
X-Gm-Message-State: AOJu0YwEE1YIK+gAP3tcT8WcWMZHbCyVD8VKrKr/qmRyqx0dvG6tCjU+
	L8Nx+JkTwoNFIY5yrOFg7jK/hhC5OayZu+8wdFoa4c2mTl4V/5iTV8Hi92i/ilwjEReCB91igHi
	dJZ8HMKzcItrPXfE8sR+gQbgUhTEgPwX/I5dNaA==
X-Gm-Gg: ASbGncvFP2kkPwIVkIxR0oJHODrl1itLXIKl7uX1EugmsOe4EI9FmC/79fjUfdcz+6i
	gpAJxqM1v91u9dPnxj9R9omfEXl3NiQaOKu7r8iIt+PkzormPEdpQMdHPvw75awFjIy9NDHV1rg
	Rfc0J5g7AQMEZSjNcriDRs0n1uqCQg
X-Google-Smtp-Source: AGHT+IErM66BcergC/iExopXsA7pNGmjrt2lav0QuAss5DuNyC3oC95Mb18ii9YfZAQR2IKw6zcYnePLy1vcitOvHuo=
X-Received: by 2002:ac2:4ecb:0:b0:545:5d:a5c7 with SMTP id 2adb3069b0e04-5451e50ef49mr481570e87.21.1739433452924;
 Wed, 12 Feb 2025 23:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213073501.14420-1-johan.korsnes@remarkable.no>
In-Reply-To: <20250213073501.14420-1-johan.korsnes@remarkable.no>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Feb 2025 08:57:22 +0100
X-Gm-Features: AWEUYZlm4qhH8kXIVEFOKF-SBoSQJNZdl9_Knx9X90wR2MJFg3L2zHeyZPLkz9Y
Message-ID: <CAMRc=Me_1RSZuQm1z0YxVWH4j+4jz57XNHDQejyHM+mLrZxdcg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: vf610: add locking to gpio direction functions
To: Johan Korsnes <johan.korsnes@remarkable.no>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 8:35=E2=80=AFAM Johan Korsnes
<johan.korsnes@remarkable.no> wrote:
>
> Add locking to `vf610_gpio_direction_input|output()` functions. Without
> this locking, a race condition exists between concurrent calls to these
> functions, potentially leading to incorrect GPIO direction settings.
>
> To verify the correctness of this fix, a `trylock` patch was applied,
> where after a couple of reboots the race was confirmed. I.e., one user
> had to wait before acquiring the lock. With this patch the race has not
> been encountered. It's worth mentioning that any type of debugging
> (printing, tracing, etc.) would "resolve"/hide the issue.
>
> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>

This is a fix and should be backported. Can you add Cc: stable and Fixes: t=
ags?

> ---
>
> v2
>  - Added description on correcctness to commit text
>  - Added Reviewed-by from Walleij and Haibo
> ---
>  drivers/gpio/gpio-vf610.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index c4f34a347cb6..3527487d42c8 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -36,6 +36,7 @@ struct vf610_gpio_port {
>         struct clk *clk_port;
>         struct clk *clk_gpio;
>         int irq;
> +       spinlock_t lock; /* protect gpio direction registers */
>  };
>
>  #define GPIO_PDOR              0x00
> @@ -121,12 +122,15 @@ static int vf610_gpio_direction_input(struct gpio_c=
hip *chip, unsigned int gpio)
>  {
>         struct vf610_gpio_port *port =3D gpiochip_get_data(chip);
>         u32 mask =3D BIT(gpio);
> +       unsigned long flags;
>         u32 val;
>
>         if (port->sdata->have_paddr) {
> +               spin_lock_irqsave(&port->lock, flags);

Please use lock guards from cleanup.h in new code. It doesn't cost you
anything and results in shorter code (you won't need the flags
variable). Just do guard(spinlock_irqsave)(&port->lock) here.

Bart

>                 val =3D vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
>                 val &=3D ~mask;
>                 vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
> +               spin_unlock_irqrestore(&port->lock, flags);
>         }

