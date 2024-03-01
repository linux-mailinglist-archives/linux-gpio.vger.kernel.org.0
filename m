Return-Path: <linux-gpio+bounces-4017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744286DC88
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 039D928456A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 07:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9519569972;
	Fri,  1 Mar 2024 07:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v470jyqh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1769976
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709279863; cv=none; b=kKKtr9wo68IPbc4sEIdoyXdfUH2bwI6b7tBvwkwOfzjnOH0xSL/7XlZ+T1h3AzgA0a3NQgBJDrJlPcZlBmU/lC1/S7V4oDYMPZfaHjo9ap+0BVwkKfHqKnNPik8BwMerL0XHp79EKVj071TCYshTs+N2cUTYASq9B9yMO6Ah6hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709279863; c=relaxed/simple;
	bh=EY+KjoQfFNP0k4txFcmHFPAWMfY97bzGGaKhYbfpPxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIUiv3zTNkOysSjM/GnYragt6eHSMPUcMlQEeD23c0DIn0TL/JjNXVfKKWunOz8P0bfmJrdZ6Eq7kb7NXdMzSn3XHWzvEX/2J1yWXOhqkdL7Wud86NArogvaZXL18XgZQg8hMeEblmwBGOgO65IU2y/oDNQpGl7PJEdbPgDxsSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v470jyqh; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d35123b0deso442003e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 23:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709279861; x=1709884661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkiaUF+hdMe8h/C4CJAPJ/LWbY3R6H000QKjPRyoNcU=;
        b=v470jyqhK5bm4AmG7nQ48XsD6hKCNdN1sE32K0LLkkA+B318WvGHDyMNBNOMLOALMs
         aXleDiBwyem0iHm0mQ2JkIn/AKf0J0q/DyobPm+V7EA9Hih80MPI82dRR1F83YI7HkFM
         GgLx0cZW6v+XNir798MLRZlHLMNxnReanTmHhF6MBUByHwg3HoPNtVvElGybDiPJTKku
         aF8/Tm9DVZv3yP3iSHemPa8Gcn6fhC0IyrsEKav1ukUMxCrjheXPWcAYj8AYcg2wLKxE
         MovIA1Tig0xZd5/0kewIKaMxR5M61az0qCGfpv2Hh47usSknIpawdCYoSkeIddGvrtDZ
         s0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709279861; x=1709884661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkiaUF+hdMe8h/C4CJAPJ/LWbY3R6H000QKjPRyoNcU=;
        b=imoDn03uoUm5NRRtogXYyddeg+Kuhulw95E/uUv6zalTMqjgyvM22iNs1gimpv1izv
         38LTQmeboH/7iv1FzCIKlYOGdFfmhkuCwP5m0HTBWYA6id8m1mCR74EO8gWbp2irDYPU
         Ii74G2Ws1SEXMa0fbZpDhMWMZozsvw6TY/evu1dtbTgxseuVIkhMx1kL2IXIiHvJm5e9
         blNsyoRaXYI2exoiwgAsnI7AfMMuMceAAgqmNGlpbz+z133y4qHYTshf0VlurUSV2D4e
         fOccC1ldJYFjcEjsSb4PVqrs4GjGDoljp8GUNs35wVyGnoKkyJ+Qk6VPx+/NrM1NL6hB
         dSIQ==
X-Gm-Message-State: AOJu0YywyMgQddOXox8o5g0XfiR50F3XczgJrjyiz2VDo/IIjasDXfOV
	zUuALP1PHirGtN9t+lDcqb/h+3j3PMaY7EOO2v8GvgCuqfjh0BPc6hbDWO5xxkYSXrQFZRrMQrT
	EhFzlVy1qnXHh4g/iJ5yZsPSwfxv9dve/2ooK4Q==
X-Google-Smtp-Source: AGHT+IGN2X5A0M8EfK1+uSSkjf89cvrxL24neCyB7LinGR9R07wrQdQVBwW2MYtM5nqkAGtidYo4Q18dL2PrWdKR9yw=
X-Received: by 2002:ac5:c28d:0:b0:4c0:9ed8:57b3 with SMTP id
 h13-20020ac5c28d000000b004c09ed857b3mr689031vkk.1.1709279860878; Thu, 29 Feb
 2024 23:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229172549.444227-1-brgl@bgdev.pl>
In-Reply-To: <20240229172549.444227-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 08:57:30 +0100
Message-ID: <CAMRc=Mf3cVBr-FUpT51c=w5=LwtvYrMJTA4p+=a2OaumAGeUew@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix resource unwinding order in error path
To: Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 6:25=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hogs are added *after* ACPI so should be removed *before* in error path.
>
> Fixes: 6d86750ce623 ("gpio: fix gpio leak in gpiochip_add error path")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 21edc5eafa68..7fd9c59e73c5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1025,11 +1025,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
>
>         ret =3D gpiochip_irqchip_init_valid_mask(gc);
>         if (ret)
> -               goto err_remove_acpi_chip;
> +               goto err_free_hogs;
>
>         ret =3D gpiochip_irqchip_init_hw(gc);
>         if (ret)
> -               goto err_remove_acpi_chip;
> +               goto err_remove_irqchip_mask;
>
>         ret =3D gpiochip_add_irqchip(gc, lock_key, request_key);
>         if (ret)
> @@ -1054,11 +1054,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
>         gpiochip_irqchip_remove(gc);
>  err_remove_irqchip_mask:
>         gpiochip_irqchip_free_valid_mask(gc);
> -err_remove_acpi_chip:
> +err_free_hogs:
> +       gpiochip_free_hogs(gc);
>         acpi_gpiochip_remove(gc);
>         gpiochip_remove_pin_ranges(gc);
>  err_remove_of_chip:
> -       gpiochip_free_hogs(gc);
>         of_gpiochip_remove(gc);
>  err_cleanup_desc_srcu:
>         for (i =3D 0; i < gdev->ngpio; i++)
> --
> 2.40.1
>

Queued for fixes.

Bart

