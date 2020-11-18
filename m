Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01C32B78A0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 09:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgKRI3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 03:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgKRI3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 03:29:20 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681F8C061A4D
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2020 00:29:18 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o9so1565771ejg.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2020 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e7/0oySTdCBUS5K5VKhLrqKbbTWozDIFYehy2a24oc4=;
        b=x6eY0PCRQQMpbRy1Q6I+uu2YRoF0r80KxAZAQf9JYuY7YfySWIG/IDmCzLYv7CaBsZ
         7SrK4geFajx4WBuJSxw3oLdNfgW0ovgegiQHt/m9n7a5Utp8dDQlE6JCWoyW6R+lOpiT
         FbHpL2YR+nhQfigvVD3YVHC5Vc24MOU5GQlUSjGPtemOT/Z5V0IJEueviYI+TWfNxaMa
         JoqLlIzxPBgZ5/upGEV7DiBW9qID+MvjIB1WTzavkjzQuKhh+pftwAib3wjvLlUWrBWk
         6lPZj68GyYlz9r5ntU4DpfTriBwHExi1ODjUuostjEtrslX9QGrQ+IcWHX124w/4nQKd
         pMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e7/0oySTdCBUS5K5VKhLrqKbbTWozDIFYehy2a24oc4=;
        b=a9JnBW00voCVeCNJQMJ40gKbm/FEIQqXPKE8Dz169hdmwpYhq1srNBut/IXvR+wGGJ
         OxHQ6+5099CjrKC7SC34lSrgXjHEO4jWynX1Hg4F4mBIqk9shEPTyu1y7wBbvdSAOA/t
         WDwpgTx0WxOeK6zNAwspLSncsYm3NMJOOcDkFA+uSxflxVZzedPmasE+aDP/HTnNKcPb
         8r9BP7k1HRg5b2pO6HgZ2ua8VdVRqqxAiq+aF/lN7Jnyp6Y+nPOAA1m5+T6FwzDbvF6L
         EAPbRJWLH0aF6VxZZgmfLPx3N9xYQ4huqRR8sxbahS3ip/W7JASfQnn136XDmruwKJRi
         uPOg==
X-Gm-Message-State: AOAM530nwXWs5xNACTJLlSG/+xlCqahn/C1wZUl83UgMDvWcuYVJ7DD4
        xWJLa0Xak/qMxv4lMpHOkQExpbOsYs3eKooqYk0btg==
X-Google-Smtp-Source: ABdhPJxkvr9erWwYTMRmncD7Ew/aYtYR/RWu/Aktlh0nMa+Hl7GHN+3niImXyMHSA/Vx6TuVW+ZUpqtd4KMriVuXyzs=
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr21905044ejd.363.1605688157047;
 Wed, 18 Nov 2020 00:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20201113023355.43406-1-greentime.hu@sifive.com>
In-Reply-To: <20201113023355.43406-1-greentime.hu@sifive.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 18 Nov 2020 09:29:06 +0100
Message-ID: <CAMpxmJXhqprF2QcYwkwFnHzv0H4_944MGUtmi4Ra5s_CU3R9+A@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree data
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

On Fri, Nov 13, 2020 at 3:34 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/gpio/gpio-sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index c54dd08f2cbf..630bddec48e5 100644
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
> @@ -144,8 +143,12 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>                                              unsigned int *parent,
>                                              unsigned int *parent_type)
>  {
> +       struct sifive_gpio *chip = gpiochip_get_data(gc);
> +       struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
> +
>         *parent_type = IRQ_TYPE_NONE;
> -       *parent = child + SIFIVE_GPIO_IRQ_OFFSET;
> +       *parent = irqd_to_hwirq(d);
> +
>         return 0;
>  }
>
> @@ -165,7 +168,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>         struct irq_domain *parent;
>         struct gpio_irq_chip *girq;
>         struct sifive_gpio *chip;
> -       int ret, ngpio;
> +       int ret, ngpio, i;
>
>         chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>         if (!chip)
> @@ -200,6 +203,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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

Applied, thanks!

Bart
