Return-Path: <linux-gpio+bounces-598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D377FBF72
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B610B213D8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1525AB92;
	Tue, 28 Nov 2023 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="izBVUVjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E215D60
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 08:45:34 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-462e70f1c20so1087949137.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 08:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701189933; x=1701794733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahP72vGF/z2SVVNy+HP+Vo4YpFZClknMh1TjcUEInCw=;
        b=izBVUVjBf3tbpYQjLw1BnM6Sm4Q+C0/VLgEAgzcZn2PEwVoEmNWNvis2jUP6vEcJbC
         zdx/DwtbvMfpM9KvX3fw69dZevxMPhawFv+5PBDx74rd+uSHqIqK5PHwBGwsk4/n2wp2
         oZ7RleBkToH4kkvgyJ84sGe/zHR8Z39TLWyHgkG/6OkaQfptUoYRWls9EHSGF5VyQgFx
         BYUvv7u7YOGayd3zdULN12V6627fMrXAwVFxVvOzb0Brbp77TdP8/J0g7bYBLhaMscB5
         T6ifRLywafr7FU7uYV6mprwj88ZgN5YTQp7eRFEenD1eKS9VmApZ4KdM5Cgu9ZVID6+M
         XTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701189933; x=1701794733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahP72vGF/z2SVVNy+HP+Vo4YpFZClknMh1TjcUEInCw=;
        b=YvfJodJEzFqtrMzqILZmURQVkXGTx+C1Bbw/bm+60XMgUXoRx0kmcH8VrH+Sitsj8n
         X6swttRT21L84C59pbZHulacaZKVa6tb5uTUETYnj0Pit4H26S38WSGcX2UO+1metiIc
         TuLEKfRLav419Pl4KekO3EB7Le8JiNOpwVpf15BhGFnsaPcrEDnS7axQz7/DTAXTldx+
         JcETo0SxzWOIvyvb/r2zdsgYToIfO2f9P0QaWUDvtrx5s0ALf8ou2Evg36Pc1Ydv671r
         WITIu5ofzawSX7MfckguDTatRucA5c+HmFlwDBIPmD7z+pNz/c4DJcz1H15BpSCnDw+o
         2rbQ==
X-Gm-Message-State: AOJu0Yz9EWlr/IOaSBKb+Uz7SuyaINy5IidRvN8pMZLRfNoMA78HL0+z
	/tcAGUGWQZyuFzkkcTl54H8iiYuqBE5AL154u1tY+piGP9ugh6wX
X-Google-Smtp-Source: AGHT+IFnot74kFB1veZb9ps6KuKkZEz8SgPqmiLHRLNSHAH+Ekxr3lOm0ylmqvdn9tGDjz8lnKY7oEI9u6UKnMQla3Y=
X-Received: by 2002:a05:6102:1611:b0:462:aaf0:7c98 with SMTP id
 cu17-20020a056102161100b00462aaf07c98mr11387095vsb.19.1701189933242; Tue, 28
 Nov 2023 08:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127193716.63143-1-brgl@bgdev.pl>
In-Reply-To: <20231127193716.63143-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Nov 2023 17:45:22 +0100
Message-ID: <CAMRc=MfCh5V7TE-kq1bP92QzUmv_NU_qfqKtBusrX2p161mGtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: fix forward declaration of struct gpio_device
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 8:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The forward declaration for struct gpio_device should be provided for
> both branches of the #ifdef.
>
> Fixes: 08a149c40bdb ("gpiolib: Clean up headers")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
> index 0f213bdb4732..b794b396d6a5 100644
> --- a/drivers/gpio/gpiolib-sysfs.h
> +++ b/drivers/gpio/gpiolib-sysfs.h
> @@ -3,10 +3,10 @@
>  #ifndef GPIOLIB_SYSFS_H
>  #define GPIOLIB_SYSFS_H
>
> -#ifdef CONFIG_GPIO_SYSFS
> -
>  struct gpio_device;
>
> +#ifdef CONFIG_GPIO_SYSFS
> +
>  int gpiochip_sysfs_register(struct gpio_device *gdev);
>  void gpiochip_sysfs_unregister(struct gpio_device *gdev);
>
> --
> 2.40.1
>

I applied this. I'll make patch 2/2 part of the upcoming locking rework.

Bart

