Return-Path: <linux-gpio+bounces-24330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62087B241E3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8492B168BE2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 06:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F982D373A;
	Wed, 13 Aug 2025 06:50:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCE2D0617;
	Wed, 13 Aug 2025 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067858; cv=none; b=LE3zezq6vPPISmZ8IdZ7dclCdzl46usfanlHiE/TXxUEFgCcygHL0VWZcMLunhyqTNaAgMjpKso4usY1cl6SwOj5NHWIOuOJ7bpo4UJ+ORTPbi3lYo+FOWm1g1J0nQ8HZHb+NwF4kW8wuJGtz4o+WapqkrJ+AAufxM4YmgKsJ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067858; c=relaxed/simple;
	bh=xy7Cf6sce/SJOZuFqk8gE9CKdCJEm4kCAmDrzn9gaoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2Qvsepga7Vuzuo+bnW8rtC49WihyUTxgau4505MsOvQUBrM5LGZFEhRfgj9u9/IpcazeK4/2MqUZawXUv5TWRbuFZjM4yJvhYM2Ittc1FBXRucYxdWYfy0urvduOe1YdVt2Zf6+F1pRD8Jn5iKn4A1nXXM3YxDvEQkFI234DJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-88e373c07f8so908466241.1;
        Tue, 12 Aug 2025 23:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067855; x=1755672655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8T63UKJO4oXLnVMeu5S8Bqcc+Hsdmb7ulwo/FczsGM0=;
        b=X9WN+Vt8QQRaZMrY+8h544EId450/g69rnqeZrWiDpQ73380kSPcSziXLysdJip3kz
         z3WtdIBSbcUp8ErialbPhAe1Ry8dKEg0QqyvrgRUwkF+uvpR7DCfOYb4xEN0Hhumeom7
         F4BMr4n+5LfOHLnBJtQemuM/6V607mdv03kxQgnjLcLsxVfjRsUsfEn0sS4NMj2s2lw/
         OJTeDDbaq+1/ojK0hsFn/lCZScfQLMzfO+7f1Hc2OiK/W+DdNCoSUmfcwrNG/597P+AU
         nQjsgtsymm4pfRY5zJ3xPcYk5BYwuA6ZUIEDP/RRfmJdz7dAvvEYucR/KjLM5EFlBXY+
         GKjA==
X-Forwarded-Encrypted: i=1; AJvYcCUMEk5smuPK0vPtoqMYSUzm14llMl303YcwpTxR7SKDM8sKEOjTNfvEtBnri/M92TxT1QTrZi8rMJwUDg==@vger.kernel.org, AJvYcCW6hVfdIS0UM0p3IVPmz+IwJSmFwL4aPQGVKoBpbvWoMuhdzf9AkNhPBEbKnMo49y7y12o5O3y904UoseFs@vger.kernel.org, AJvYcCX9FURPUZhyZ3IC3u30ZUX9UmGAGpXJb76N37xJ/bU6aKuEVIxN0Z3S3Bz9jzpxdqdQGhLBu/R6apqf4sC49wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1hgjRFYDHI0VApoF67ybp2Da8QATTR2tQ/GKRnxJBSPdKwVG
	TjCt0e+ybxogafblGe7I/Ew+U3TZWFIvaRtfmkeXaoNhZYCKocsexoYPL7p+EchF
X-Gm-Gg: ASbGncsDQ2TmKYhXWwaJJ0JSbYfRselCxEpYeF6i+lAfKPKSA2obKmTolGM6/xlhRIf
	zn9y8ZSH3IQrFecH9zfJUqx2G3JIEDMYl6vPO5/lKC2mfQfHPDauo4wdkd7xenDsp0e0+SFoW0X
	qK3WdrqkQMzsaPkxix3emRAQ2/ohtcw9FAgrx1iOraD1dqiCAzZK3mmu0Sr1Lo+/WPQ4IWsYLIi
	WUKB+PXPkhfYFXvWyacgYKgjXk6a4oHYr7oNWQPH907kumAqeBf3ZlpgEU/LJtU1ZFapEZ++WqL
	rpz5Z7xJNXvSJCFFWNAFw4PkR3h/8aTOhJD1I/GZu5RiCIz6A1SEWqIm3ear8cV5AfhS54bjOAa
	26jF3MPLr+BS+HzFEWgI+20SvnXfLWKhHKWc7SknXTjbwwTLy9Rr9zvdwcxAx
X-Google-Smtp-Source: AGHT+IHw60PAj2clYFmI3u3fUoDc87dr7r2E7yd7BB0F8Jh567VLYd4IIE36LNZCqAWZtbg0LZldzQ==
X-Received: by 2002:a05:6102:418f:b0:4e7:b728:e34b with SMTP id ada2fe7eead31-50e4ebbabbdmr702969137.3.1755067855065;
        Tue, 12 Aug 2025 23:50:55 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0293141asm2721136241.17.2025.08.12.23.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:50:54 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-88c61c2843aso2381933241.2;
        Tue, 12 Aug 2025 23:50:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBmGUJX9tLwXxqDCTR9fxF9ts/JHUGnkG+ELCCUHegFAjoXDLvSnPsuflTbB5rIJ5sdwFkwUsUOLYZ6Jrz@vger.kernel.org, AJvYcCUDz5x03/Pp+hy+NGqipavIoF81wrUusqJTdDf4K3/cnK4l8H/b5S5ipmWw7BQ+5rL34/3G3EzfVlP+zg==@vger.kernel.org, AJvYcCWKGS5ZEjn6TDtE3Wa/TY8bIyYr99lHTRerHgm8uEnX7tTCTKkDZmqpTTCPoiob+jr1Yln/sx3K5oIjz7Pp9K0=@vger.kernel.org
X-Received: by 2002:a05:6102:f84:b0:4fb:372d:6d70 with SMTP id
 ada2fe7eead31-50e518c6a92mr655168137.26.1755067854201; Tue, 12 Aug 2025
 23:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aJwk0yBSCccGCjX3@stanley.mountain>
In-Reply-To: <aJwk0yBSCccGCjX3@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Aug 2025 08:50:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+uYLDzQB9QerXApi+ZqT-a4L_moCdphpCbK7wdhHkUQ@mail.gmail.com>
X-Gm-Features: Ac12FXwwCiuvrq-uf9ENAk-IGjGOG7sjLGw_73QRhJq_3fPRx8yM1fm2JI7wL2Y
Message-ID: <CAMuHMdX+uYLDzQB9QerXApi+ZqT-a4L_moCdphpCbK7wdhHkUQ@mail.gmail.com>
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 at 07:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> The "> chip->ngpio" comparison here needs to be ">= chip->ngpio",
> otherwise it leads to an out of bounds access.  The fwd->valid_mask
> bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> same number of elements.  These values are set in
> devm_gpiochip_fwd_alloc().
>
> Fixes: c44ce91b8ada ("gpio: aggregator: refactor the code to add GPIO desc in the forwarder")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -744,7 +744,7 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>  {
>         struct gpio_chip *chip = &fwd->chip;
>
> -       if (offset > chip->ngpio)
> +       if (offset >= chip->ngpio)
>                 return -EINVAL;
>
>         if (test_and_set_bit(offset, fwd->valid_mask))

Looks like my similar comment in
https://lore.kernel.org/all/CAMuHMdVLo2w609eFOKRkYAfEMb8XOTNB-XzzZn_89VM-YV_-kA@mail.gmail.com/
was lost in the noise. I'll try to remember to make ">=" stand out more
among all quoted code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

