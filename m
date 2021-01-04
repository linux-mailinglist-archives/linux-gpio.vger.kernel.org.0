Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED452E940B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 12:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbhADLXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 06:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbhADLXG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 06:23:06 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18F7C061794
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 03:22:25 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id t16so6754256ejf.13
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 03:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cjnWB/LtdlT+UGT85qWZFN60XbZuT4lCuZerawVF/Xc=;
        b=CyW+ImSVfjlMexvn3IgKs3J4TmHhwAgUcb7SuxsPv7n4NdhR1VyBTeSEUwRbandZe5
         JCxsCckwgAg7+NpCH47pepJl+esJUn6eRvRN2+WftDniWEL3axOiuMLULv7XWbseT99Q
         4inWzIUuPQhOzBhgsimV9k1kXEj8jflpsy0G+DqLxFlukIV4u8X+IgVQI888IZnU+xYo
         KTMHEUNkSDdZ8zzdV2sK/s0dbHgsZLKMa/hYLSyBXy3pmUnTGOGEqdsieM8P+lvbEHiM
         SxS1WriwZ5EuNPlAWufmNpYVu83QWVCdfk+0I2iHfjjip4Lead2YWdGwtR1fFITO/SMF
         J/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjnWB/LtdlT+UGT85qWZFN60XbZuT4lCuZerawVF/Xc=;
        b=gzSvEPVg7u235xIfHqOYMBSB1YmzzTGOBcrDzbqXtl1gn3r/HqZOIHkJPsp6Ifj0R7
         aS0blIijLDzN7qBBzA3ddMxHHeYUFXWmxmAEQFVJ54KIHRcYQel3SaN7INhAG3KeVXoe
         TY6jRWXOBtMEprxcrBDj94FjlSzSQv5mFMBc+DxztcQVAip1JHprktgia2jKm4aIDY/u
         f9bv9VGsfYQWVKwlWNuPayoS4r4eTJGxaBOtj7MrMTJ2xxsdcKwpytAJdIa3ATyDh6/a
         I+cvtKNa6Ot5S56R8LXYRLLK1h2xVkMOrOF0x73HtoRGQMFgZ0TbUHs+a4LDf8wIFfIY
         MZfQ==
X-Gm-Message-State: AOAM530Bbe5lJ7Sm6T2gGFwW9wT4/KeesAq4iENBqEjmlY9XR0fUIXsa
        WlW+ROVDTtFVW+34dgNRL7L94gfVElWgiORyPFYxiRuRQOE=
X-Google-Smtp-Source: ABdhPJzsQl9Iiwof9GaC1C0Eu7oMHdOtbj1F9oyIs15bKx0N7zJSNXpIinwhPPSLXk5wufkmla/qUDdkc5w60sgnY68=
X-Received: by 2002:a17:906:3953:: with SMTP id g19mr65406701eje.429.1609759344440;
 Mon, 04 Jan 2021 03:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20201216132657.15582-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201216132657.15582-1-zhengyongjun3@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 12:22:13 +0100
Message-ID: <CAMpxmJXhidxE+it8rFG86Y1T2TL1FkUoTKQYQHwrwzexirSjig@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 16, 2020 at 2:26 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gpio/gpio-sl28cpld.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
> index 889b8f5622c2..52404736ac86 100644
> --- a/drivers/gpio/gpio-sl28cpld.c
> +++ b/drivers/gpio/gpio-sl28cpld.c
> @@ -65,13 +65,13 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
>         if (!irq_chip)
>                 return -ENOMEM;
>
> -       irq_chip->name = "sl28cpld-gpio-irq",
> +       irq_chip->name = "sl28cpld-gpio-irq";
>         irq_chip->irqs = sl28cpld_gpio_irqs;
>         irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
>         irq_chip->num_regs = 1;
>         irq_chip->status_base = base + GPIO_REG_IP;
>         irq_chip->mask_base = base + GPIO_REG_IE;
> -       irq_chip->mask_invert = true,
> +       irq_chip->mask_invert = true;
>         irq_chip->ack_base = base + GPIO_REG_IP;
>
>         ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
> --
> 2.22.0
>

Applied with a fixed commit message.

Bartosz
