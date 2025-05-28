Return-Path: <linux-gpio+bounces-20684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7AAC6F9C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 19:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 210951895158
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 17:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0226028DF4A;
	Wed, 28 May 2025 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijf0fUNe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958121324D;
	Wed, 28 May 2025 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454275; cv=none; b=RubH459oh2T6nvvk6P4cXcPHgrOsbtuywAGAESuf3o9sFE2WZ8c9FieilbFBzlWg7UH4EqKW/wNXpLAGLl4udj/37FtTi7yNyyUtxkEdfJwT2wmBMMsuRTzbEuQjZ1Y9Kk2KXiHK8tLv8JP3qWA/EcOcXyL6goleFwRZYYf7KP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454275; c=relaxed/simple;
	bh=17F/0ynt7JmLupX3sX0wkNEv86c7qovkAjPWM7RVfMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8smJfNpz2Y0/voZraEA5iTfwPel/rCzjJFIsFLF3HgmJ4KrKIjcYoiNvFBLIUZpvth8wj3Hmu2SN9bogYzD22NqTL5rHHZMGFvTPMWyEXu1lykMyLorHEs2DvYFDy+hVQYD1mdhpJBIShCyXDrb1GDavXbOj5wI7FrwqOL3ctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijf0fUNe; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5532a30ac41so6241e87.0;
        Wed, 28 May 2025 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748454272; x=1749059072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0nsAcHsXwyZJkaxiGlmd2d3QQAdCYtOkAc0GDNMjfk=;
        b=ijf0fUNeaZVd17PINSUiMZ88LXXSHYXD2bSjI6nBcjcCWfVeEIBoviRqTAxjL3GySs
         MrZRX5M0DQN4RjAsVAv6Qvc719/ZIkf+Hes/e95dwbeBhrK9x/Y87sstXKaTP76G8YoO
         POhkgM8o1g8qQ+ezo1fh5bBJYyH9k97YERjjKauZmkPQ9atZuHYRmPhFa7xHlEWOPfOg
         uEYBvRUdgZERJmikvgNQtwrDAa7e/eTQVEBvHTZCIjbW6jS0gwK1NkRG12r3IdlFF2SW
         Ht1EShTMUNGz20KLpXIUw5ximCRRUxr3lo7qMYoOrjQwqzWP18cs37UhKSdl5YY+nQoi
         +PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454272; x=1749059072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0nsAcHsXwyZJkaxiGlmd2d3QQAdCYtOkAc0GDNMjfk=;
        b=hRcrTcRZWWFZOVwNtBpBN7+3vQXqmZKOJxkp922Qs3ZJXIbF2HyctTg7gXQU2tXQHr
         UoGXAeGwgZ/k3NxaGD+oWLY7hQLzP0LymGXwKMCZMEGgkzEdj8wmMPq9z6+Cn1KFRZ7a
         qpcaBe2xi0cRrtg4qCG8npdm9TjkoBHuF8+CU5zyVJOKs8zrlaeFTR6n7rNB0WMAoIfh
         bG2kUcjFAQSkqf3U4AQ3ePKsdHSZuOZ6EHsZsM3XNKuZd4UrI0ENror/nVn4ss6okDaH
         fLk6UYizNn8o2qOUWAO1vT7F1l63gty2rCPWZHLPBEUJvmIAfWyvDqF154tr3eIG11HO
         TACA==
X-Forwarded-Encrypted: i=1; AJvYcCXBV5w/6R+uK0twrN6WsHyfzrKeuddhkwb4gcP+mXPMIQQ1fiqyDRKmCukByuRyt7RfKrTFFM9O5Euxtv5P@vger.kernel.org, AJvYcCXt3Z6rHYd6aBJUd5UsgY+SbmE9mdITuuB/dtatCeXj41Tlmkhh2OMsRqLmZg+3h1sHK7xfHK2uAtrF@vger.kernel.org
X-Gm-Message-State: AOJu0YyTUJFZq7AxNZ2GSEadPVhkpkot1Y4EbhvMeMuZnN9NSEmjX8T/
	qBDDecw9MQWM5IzfJtUveM0pjfPU3IvZIeK0yHcNRTuEn09jY/oExCzuUhO9jsXSgFbrte6uK8t
	fJ7fIR7e7s73yb/sk7k64vsuXabFktoE=
X-Gm-Gg: ASbGnctFaPOTdOKKtkIPdt+TEqXdZKCevrFXeMfBXSf1f05q+xEL30AFUnCgzE01nPU
	XDaqCy4plapsOilR9URvpBhYOHGA6ons4zc8OZ69D/1kyiLeLBCh8uulaH8jku1TCK1zb7+okIB
	zkBF81OrsHOyNBlP5yyCvtto0Z+YorSdm9
X-Google-Smtp-Source: AGHT+IFLBKbu4qDUgPw3+3oUlZ7yVTfpSNulVMxry47kevclwwqYYah7W71/HKjNfS75dHxUBmWl90nu3tPHhfxutyg=
X-Received: by 2002:a05:6512:3d9e:b0:553:2154:7bd0 with SMTP id
 2adb3069b0e04-5532f7ff0d5mr1072356e87.5.1748454271906; Wed, 28 May 2025
 10:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com>
In-Reply-To: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:44:17 -0500
X-Gm-Features: AX0GCFvtvnq2c2Kp30NyOmmQ4CWD67yTd7bpv3E_vu75kSGv8kCJi5DjRjMhtL8
Message-ID: <CALHNRZ-z4+a-h4GZepODbqcmcPKkvGXvX4wpJSinr_gcZptjrQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: palmas: Allow building as a module
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 5:22=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The driver works fine as a module, so allowing building as such. This
> drops the driver specific init in favor of the module macro which does
> the same, plus handling exit.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Drop module alias and add module device table
> - Link to v1: https://lore.kernel.org/r/20250522-gpio-palmas-gpio-v1-1-d6=
b1a3776ef5@gmail.com
> ---
>  drivers/gpio/Kconfig       |  2 +-
>  drivers/gpio/gpio-palmas.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..be5d823516d0e2bff4b4231da=
c6a82bf10887118 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1464,7 +1464,7 @@ config GPIO_MAX77650
>           These chips have a single pin that can be configured as GPIO.
>
>  config GPIO_PALMAS
> -       bool "TI PALMAS series PMICs GPIO"
> +       tristate "TI PALMAS series PMICs GPIO"
>         depends on MFD_PALMAS
>         help
>           Select this option to enable GPIO driver for the TI PALMAS
> diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
> index 28dba7048509a3ef9c7972c1be53ea30adddabb0..eaef29f59292de5281f31e196=
961d90974e65b75 100644
> --- a/drivers/gpio/gpio-palmas.c
> +++ b/drivers/gpio/gpio-palmas.c
> @@ -140,6 +140,7 @@ static const struct of_device_id of_palmas_gpio_match=
[] =3D {
>         { .compatible =3D "ti,tps80036-gpio", .data =3D &tps80036_dev_dat=
a,},
>         { },
>  };
> +MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
>
>  static int palmas_gpio_probe(struct platform_device *pdev)
>  {
> @@ -191,9 +192,8 @@ static struct platform_driver palmas_gpio_driver =3D =
{
>         .driver.of_match_table =3D of_palmas_gpio_match,
>         .probe          =3D palmas_gpio_probe,
>  };
> +module_platform_driver(palmas_gpio_driver);
>
> -static int __init palmas_gpio_init(void)
> -{
> -       return platform_driver_register(&palmas_gpio_driver);
> -}
> -subsys_initcall(palmas_gpio_init);
> +MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> +MODULE_LICENSE("GPL");
>
> ---
> base-commit: b36ddb9210e6812eb1c86ad46b66cc46aa193487
> change-id: 20250520-gpio-palmas-gpio-a99fc046dc7f
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Friendly reminder about this patch.

Sincerely,
Aaron

