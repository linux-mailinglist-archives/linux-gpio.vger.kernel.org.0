Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65320161072
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 11:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgBQKzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 05:55:54 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43596 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBQKzy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 05:55:54 -0500
Received: by mail-qk1-f195.google.com with SMTP id p7so15740535qkh.10
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 02:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yEI0WPP8gITw/1DCLTMLLMxZSsoxsBLcFadxswSxuFI=;
        b=ooVd3FhE4tTlmaGMvuJ1tzF1OtwI3/GzYO/uhnwvdpBDpzOC/fp6jBXEkLZuNM7YhZ
         aEa0T2olIolm8NdZOUzI6Kn68/9JYLFZonohGgSqKUWN069OJovP1hOF9nDbKiTOhGqF
         vxk2bY/GV39c9wGffcTQrPOgQatVhlJ41L7PyvQ10ObPY/t+pFBz2+hCZ9pGZQdD6SzU
         mXVgKkvKqw+hrTEL45Ep6R93S1yDlBrMNyMnS4yDCuCoTdABDsV25GvvQgcfjcLkPKok
         c2M4qs31xB8zUqGPT1XEbsl///c07AkBZOcJemN9/jzrbcg8Y6U+ThIG1geKE7gzxLhC
         G6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yEI0WPP8gITw/1DCLTMLLMxZSsoxsBLcFadxswSxuFI=;
        b=FIGqZD/lPBnG+I7wuwl4sTe2waHd4X66e7/Aw/8nF7atJuRuNSP4A3qVVtjl3U/de0
         fGowNaTo7yo4RFl28MtKiGmHE36I+gQD8Un2pCxSPnnLIJUwQ9BHzJYl0aHVkoZGjQ2i
         qPaKqXggisGKriltsrgkREGc9BBoL463fIMMUd77mNd8bDYY+vSpAKgntNufzCtmtBoh
         3Rqrbia5gju+LOh1c6l2OkXcM2DL9WhX3PG12mp2JlMaNfoypqysMYfeYKULlY1tESvf
         LclkwoOIuNiXYmM3MGaM4emE/eUn0iXpsllWUnQ8dXGNk3go35yw1F2XvARXFGNHI2Ae
         abzg==
X-Gm-Message-State: APjAAAVhKs85UzL0UYLfCsd8IB5Xq+w3ssBPTkEAmRrHAZJCBhWRbkOn
        yDqXqIN9bTnZW8twOuk+0h4WSXW9Myp7/3sniH6Lxq5i
X-Google-Smtp-Source: APXvYqz3OyqQUdr3yu3/bsCPwH02xWVLp+BFuDLNJaMFdxh1SyhKbhsyiC7a4fd/qIzEV6ujyF/rWygOINCCH7aweY0=
X-Received: by 2002:a37:a488:: with SMTP id n130mr12870729qke.120.1581936953243;
 Mon, 17 Feb 2020 02:55:53 -0800 (PST)
MIME-Version: 1.0
References: <1581936521-2982-1-git-send-email-qiwuchen55@gmail.com>
In-Reply-To: <1581936521-2982-1-git-send-email-qiwuchen55@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 17 Feb 2020 11:55:42 +0100
Message-ID: <CAMpxmJXrFPaoTf-4rPF6qE251bxY6kQ-xvjR593WxQRdVBOQOA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mmio: use devm_platform_ioremap_resource_byname()
To:     qiwuchen55@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        chenqiwu <chenqiwu@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 17 lut 2020 o 11:48 <qiwuchen55@gmail.com> napisa=C5=82(a):
>
> From: chenqiwu <chenqiwu@xiaomi.com>
>
> Use devm_platform_ioremap_resource_byname() instead of calling
> platform_get_resource_byname() and devm_ioremap_resource()
> separately to simplify code.
>
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
> changes in v2:
>  - remove bgpio_map() entirely.
> ---
>  drivers/gpio/gpio-mmio.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index f729e3e..b7170d6 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -654,24 +654,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *=
dev,
>
>  #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
>
> -static void __iomem *bgpio_map(struct platform_device *pdev,
> -                              const char *name,
> -                              resource_size_t sane_sz)
> -{
> -       struct resource *r;
> -       resource_size_t sz;
> -
> -       r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -       if (!r)
> -               return NULL;
> -
> -       sz =3D resource_size(r);
> -       if (sz !=3D sane_sz)
> -               return IOMEM_ERR_PTR(-EINVAL);

I missed this in v1: are you sure that this check is not needed? I'd
say it's up to users to correctly define the size of mapped regions
but I'd also assume the original author added this if for a reason.

Bart
