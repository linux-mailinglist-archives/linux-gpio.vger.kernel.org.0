Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E74AAC0D8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 21:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbfIFTsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 15:48:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38637 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbfIFTsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 15:48:07 -0400
Received: by mail-qt1-f196.google.com with SMTP id b2so8489615qtq.5;
        Fri, 06 Sep 2019 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iUo+RAfa/ck7sxO/vrTAcMV5/EPMZ8UlL+MvZ/FXZXo=;
        b=LgST1CJV9YA7mttan8L01i3+eoJrRdysbvUiwWvM6KWQbaxEK29uzeyzZSLlkcS3eG
         S5ulY+M3I8TszhtbLSQJdkTbrOw55QatC87Sv1oIpwbI9UkD3ug+eUiNiJ9JXOOU+SSJ
         ELK+5ZbKl3TP1suF2E4ZsSA1YzriQ2mZgfw7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iUo+RAfa/ck7sxO/vrTAcMV5/EPMZ8UlL+MvZ/FXZXo=;
        b=qGz/2BM/jPYIezUzGZn8iJLHHPgcYl6spIc9V+YixrB4UX70rOgYCvNb/jRDYGG2Nt
         55BHXyTFDwjH85loGz3cZMsymKeomWgaDls73XBjCd9zP0CYm+YkuqGLLxp7UA1kGKAd
         fwhQTMcvKS4IMPeyJIFTeUzH7YxOoiZHj4gq+ksJVTupdBVK0lswgjzvCg90jBV3hMYB
         kAEkqmVD/wirTNmmm7U5LYY19Kes+2NOhVPQArWAuGBkLdoR79mpKpO5+S/anEtGn95x
         5X+BYw4j3+dj6bfUpRw1uJy21vHtTyFBkMp3FmlJ+JLIczK+zgpm81hcl1sHSS0WY4pY
         KGYA==
X-Gm-Message-State: APjAAAVlj4mN9+vRvBc5mHAUqOpDej8RMZTbq0rf3HjlLUGQtjUSJMLL
        A2KMNXEbpvVirGFh2GdxBiLC929DwMi9le0N2mw=
X-Google-Smtp-Source: APXvYqzFyczhuU4vELy3FEnLbpNgDv8ZSb9uoaP+A83ZFTCAHt0aG0j50/6DoriEh8Y6hPfF9qnzGXcUaTg6VlJXffI=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr6351886qvl.38.1567799286186;
 Fri, 06 Sep 2019 12:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062727.13521-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062727.13521-1-rashmica.g@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 6 Sep 2019 19:47:55 +0000
Message-ID: <CACPK8XfjGY4A1g0eJAUC7SmiguBa6fLhBBz_FzTRa3hQ1kWDSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpios: Use ngpio property from device tree if available
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 6 Sep 2019 at 06:27, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> Use the ngpio property from the device tree if it exists. If it doesn't
> then fallback to the hardcoded value in the config.
>
> This is in preparation for adding ast2600 support. The ast2600 SoC has
> two GPIO controllers and so requires two instances of the GPIO driver.
> We use the ngpio property to different between them as they have
> different numbers of GPIOs.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 16c6eaf70857..c3d5ecba343b 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -694,7 +694,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>                 for_each_clear_bit(offset, &input, 32) {
>                         unsigned int i = props->bank * 32 + offset;
>
> -                       if (i >= gpio->config->nr_gpios)
> +                       if (i >= gpio->chip.ngpio)
>                                 break;
>
>                         clear_bit(i, gpio->chip.irq.valid_mask);
> @@ -1007,10 +1007,10 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
>         unsigned long flags;
>
>         if (!gpio->cf_copro_bankmap)
> -               gpio->cf_copro_bankmap = kzalloc(gpio->config->nr_gpios >> 3, GFP_KERNEL);
> +               gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
>         if (!gpio->cf_copro_bankmap)
>                 return -ENOMEM;
> -       if (offset < 0 || offset > gpio->config->nr_gpios)
> +       if (offset < 0 || offset > gpio->chip.ngpio)
>                 return -EINVAL;
>         bindex = offset >> 3;
>
> @@ -1055,7 +1055,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
>         if (!gpio->cf_copro_bankmap)
>                 return -ENXIO;
>
> -       if (offset < 0 || offset > gpio->config->nr_gpios)
> +       if (offset < 0 || offset > gpio->chip.ngpio)
>                 return -EINVAL;
>         bindex = offset >> 3;
>
> @@ -1119,7 +1119,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *gpio_id;
>         struct aspeed_gpio *gpio;
> -       int rc, i, banks;
> +       int rc, i, banks, err;
> +       u32 ngpio;
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -1145,7 +1146,10 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->config = gpio_id->data;
>
>         gpio->chip.parent = &pdev->dev;
> -       gpio->chip.ngpio = gpio->config->nr_gpios;
> +       err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
> +       gpio->chip.ngpio = (u16) ngpio;
> +       if (err)
> +               gpio->chip.ngpio = gpio->config->nr_gpios;
>         gpio->chip.direction_input = aspeed_gpio_dir_in;
>         gpio->chip.direction_output = aspeed_gpio_dir_out;
>         gpio->chip.get_direction = aspeed_gpio_get_direction;
> @@ -1158,7 +1162,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->chip.base = -1;
>
>         /* Allocate a cache of the output registers */
> -       banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
> +       banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
>         gpio->dcache = devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);
>         if (!gpio->dcache)
> --
> 2.20.1
>
