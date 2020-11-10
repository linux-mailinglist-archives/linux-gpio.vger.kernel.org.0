Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1832AD2E3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 10:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbgKJJyz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 04:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJJyy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 04:54:54 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F956C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 01:54:52 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id a15so12016895edy.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X9uDWTdZOrL/c6ma/pF1vPxtR5z6xN7pII6X5JCa+BI=;
        b=oVKCUZ34X+b8Vmlc53bk/IFG3ItOaJatAlXIIVBsv97h3zNQ4zafGREBZFqDbhQ+bs
         4NYSulvgxTAfwDXqR1/KqAtCIy0CDJFXq/8KtyT7DXJNa+DLhECZa7vaSzXKB/qrWSbJ
         AU8We24/+LvI+KIX4cPCT2BphmuzFzhmzkITHx9sXFAnZv6zuLoTNXBkWYIlaFI//PKZ
         3HtVqPqnZegI1/DInmVP8M6uvK/3L8A5O/hJhZ6Pc1m16RCk7XkRAQelpLCErBWHPpg6
         gqkiwMTqCxo2Q1PLEtP69XTvOM43AAGUkhL27cTWmI00V5G7fc5L424pCIilMgw0GVb1
         YPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X9uDWTdZOrL/c6ma/pF1vPxtR5z6xN7pII6X5JCa+BI=;
        b=hYYcBFNjE9VWIWpu804bi6furOwjb7XPxWvsLPUieaCqoZsauL3fYdA5Ykgi3WT7NO
         O9uJLgvsqJcsaKdRQvuVqH3Inl2CnUfNRFsJ+ujDOGZUe5GnPT5uEdppTeKp6X9AbwAa
         rdj7kW4CDDObjy8yWbJ/gtH34ONT76Ai0sSzKM43d3UEuNiGEL/SAFvxAzP2PGhGvweb
         CZ62D1pj1ouIQRGNAzLMCS/X6C0O0P1WIZAPB+iknT1Hn0Ouh09nPOwhEaPtdVL99a7n
         BnQOyrXEeFvZSX5f2A+5w61e3lmLQ5BTIER2i4n+l1VXp43x/zawqE73xvKNovaowcsv
         yUEg==
X-Gm-Message-State: AOAM533Sj//D/UHWtW6Abzls5LvUerA/Ne4s/ldYY1njXsSE7TY1Vxs2
        2OW/cCoUs/T/zj3pisWCnTGwNP8KDmvt24qV+nTysg==
X-Google-Smtp-Source: ABdhPJyE43bcMhWGPbK4rkErcAG8hr3o31St165QQHyGuiorFfmTFuAjP+8F3lp4KYIDGr2TcJsnX6YJG2hvAGzShIk=
X-Received: by 2002:a50:9e0b:: with SMTP id z11mr20703060ede.341.1605002090873;
 Tue, 10 Nov 2020 01:54:50 -0800 (PST)
MIME-Version: 1.0
References: <20201109075702.21370-1-greentime.hu@sifive.com>
In-Reply-To: <20201109075702.21370-1-greentime.hu@sifive.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 10 Nov 2020 10:54:40 +0100
Message-ID: <CAMpxmJXx_qjpAxsQ4fCN9PfyZ5ANys2vGxrWKJWhNTOiEzM48g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: To get gpio irq offset from device tree data
To:     Greentime Hu <greentime.hu@sifive.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 8:57 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/gpio/gpio-sifive.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index c54dd08f2cbf..bfb915bf5d78 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -29,7 +29,6 @@
>  #define SIFIVE_GPIO_OUTPUT_XOR 0x40
>
>  #define SIFIVE_GPIO_MAX                32
> -#define SIFIVE_GPIO_IRQ_OFFSET 7
>
>  struct sifive_gpio {
>         void __iomem            *base;
> @@ -37,7 +36,7 @@ struct sifive_gpio {
>         struct regmap           *regs;
>         unsigned long           irq_state;
>         unsigned int            trigger[SIFIVE_GPIO_MAX];
> -       unsigned int            irq_parent[SIFIVE_GPIO_MAX];
> +       unsigned int            irq_number[SIFIVE_GPIO_MAX];
>  };
>
>  static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
> @@ -144,8 +143,10 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>                                              unsigned int *parent,
>                                              unsigned int *parent_type)
>  {
> +       struct sifive_gpio *chip = gpiochip_get_data(gc);
> +       struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);

Please add a newline here.

> +       *parent = irqd_to_hwirq(d);
>         *parent_type = IRQ_TYPE_NONE;
> -       *parent = child + SIFIVE_GPIO_IRQ_OFFSET;

And here while you're at it.

>         return 0;
>  }
>
> @@ -165,7 +166,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>         struct irq_domain *parent;
>         struct gpio_irq_chip *girq;
>         struct sifive_gpio *chip;
> -       int ret, ngpio;
> +       int ret, ngpio, i;
>
>         chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>         if (!chip)
> @@ -200,6 +201,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       for (i = 0; i < ngpio; i++)
> +               chip->irq_number[i] = platform_get_irq(pdev, i);
> +
>         ret = bgpio_init(&chip->gc, dev, 4,
>                          chip->base + SIFIVE_GPIO_INPUT_VAL,
>                          chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> --
> 2.29.2
>

Bartosz
