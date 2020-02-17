Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C11C160F77
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 11:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgBQKC6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 05:02:58 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35139 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbgBQKC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 05:02:58 -0500
Received: by mail-qt1-f195.google.com with SMTP id n17so11624328qtv.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NnhO9CffCs1DhgyICuQAM0amLIfqHSzaeHPPdqxzrYw=;
        b=AcwbbPaKc9t1rFJqFohBANH7B2oAffHbgZqQyLE9Yk2jnvoKEnFQlM5HZyF26csWVJ
         8PGcMOtv2yXjZ0GUYY0yNkW8RsRFtNvk8ei+PoJMau0YSCqkrJ+2i4kBNzFa2wnOK/+Y
         AnPL5uHFhLuNq/5MVh5Z8NkdZUmJwPw10nmi5ASfCsGLrLrt7XPNb8Tn+VojAI7/3Xp1
         JlSnsquOVbJt9RBRcn2bk0zRH6lXP6Ogdemq/BOrgi8CUxnbcy/7wCDPQKzSQXkK7BVh
         hsXmBwG3KrlJwnHzi+yMiWSG+KvU3FF+7fAWY/inzu+pxq5+WchO4hjfryMHr8LOUsNF
         NfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NnhO9CffCs1DhgyICuQAM0amLIfqHSzaeHPPdqxzrYw=;
        b=RLDKvN1ukpeBj7yDc508+MwpCaqrcpaiMxufvom0FDevcEuQ4ve+fo/jc09EKQbdM8
         TlTAELmEt3K8Xh7VQkqXPiAgtR4EGzvBSNeWaQBOeDTYz/bMgAriYC3Roc4r1gbEpIg7
         5jZi5BbRsZAj+9ta7nm91SPMYMUdtWtN4ocpEiO4NjGCkWfQ3q4cOCOo/3LCs3WVHq3C
         DS0D3aN3tfwXUVq7k+FEL5KSGGBZVLH8i9IrbAWp5LbJxO5CyVcc49B3RKAjbBWtvtxo
         aK3bkreGbtn95XvFTBpk5IJY0nGJ/5bWxrsltzSePfA1M5+qTXlEZ69G4vuQS1/C+1RY
         Kfvw==
X-Gm-Message-State: APjAAAXtMkzuivE+F3NrFbpqwZoFWeUvRtV5KrQihXblhrgLJkzqS2sW
        metPtC0cBJOIAlkbWFq5z2rFGcuwPmImdUl1M2Gxmw==
X-Google-Smtp-Source: APXvYqyBRVpmotM23x7VRYqGXh2+XqRiplq60Nuqzfl6InXa9S/AaNuloflO9Gxdk0U2Wk5cpZLs8wDqRrT1iAHacwE=
X-Received: by 2002:ac8:7657:: with SMTP id i23mr12537252qtr.197.1581933776777;
 Mon, 17 Feb 2020 02:02:56 -0800 (PST)
MIME-Version: 1.0
References: <1581690602-345-1-git-send-email-qiwuchen55@gmail.com>
In-Reply-To: <1581690602-345-1-git-send-email-qiwuchen55@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 17 Feb 2020 11:02:46 +0100
Message-ID: <CAMpxmJW1-r2iL+mJ9azyihYcp-_Km__FAanBvN4UUG6C8ZXKQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: use devm_platform_ioremap_resource_byname()
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

pt., 14 lut 2020 o 15:30 <qiwuchen55@gmail.com> napisa=C5=82(a):
>
> From: chenqiwu <chenqiwu@xiaomi.com>
>
> Use devm_platform_ioremap_resource_byname() instead of calling
> platform_get_resource_byname() and devm_ioremap_resource() separately.
>
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
>  drivers/gpio/gpio-mmio.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index f729e3e..5cfef3c 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -655,21 +655,9 @@ int bgpio_init(struct gpio_chip *gc, struct device *=
dev,
>  #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
>
>  static void __iomem *bgpio_map(struct platform_device *pdev,
> -                              const char *name,
> -                              resource_size_t sane_sz)
> +                              const char *name)
>  {
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
> -
> -       return devm_ioremap_resource(&pdev->dev, r);
> +       return devm_platform_ioremap_resource_byname(pdev, name);
>  }
>
>  #ifdef CONFIG_OF
> @@ -742,23 +730,23 @@ static int bgpio_pdev_probe(struct platform_device =
*pdev)
>
>         sz =3D resource_size(r);
>
> -       dat =3D bgpio_map(pdev, "dat", sz);
> +       dat =3D bgpio_map(pdev, "dat");
>         if (IS_ERR(dat))
>                 return PTR_ERR(dat);
>
> -       set =3D bgpio_map(pdev, "set", sz);
> +       set =3D bgpio_map(pdev, "set");
>         if (IS_ERR(set))
>                 return PTR_ERR(set);
>
> -       clr =3D bgpio_map(pdev, "clr", sz);
> +       clr =3D bgpio_map(pdev, "clr");
>         if (IS_ERR(clr))
>                 return PTR_ERR(clr);
>
> -       dirout =3D bgpio_map(pdev, "dirout", sz);
> +       dirout =3D bgpio_map(pdev, "dirout");
>         if (IS_ERR(dirout))
>                 return PTR_ERR(dirout);
>
> -       dirin =3D bgpio_map(pdev, "dirin", sz);
> +       dirin =3D bgpio_map(pdev, "dirin");
>         if (IS_ERR(dirin))
>                 return PTR_ERR(dirin);
>
> --
> 1.9.1
>

Why not remove bgpio_map() entirely then?

Bart
