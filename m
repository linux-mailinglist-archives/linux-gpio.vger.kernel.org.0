Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0676D306688
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 22:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbhA0Vlv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 16:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbhA0Vjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 16:39:47 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F17C061573;
        Wed, 27 Jan 2021 13:39:07 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id e15so2898623wme.0;
        Wed, 27 Jan 2021 13:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Xs2zM5iK8nJbFN6lLbj1qATGF70exsjAH2ueWzvcaM0=;
        b=Ga3rRziQveQ7mH87hzjzeJ7lxEAzhZVd2ZOAmV58VyHMeS6/vZhBYMqGAGGvrOSQjD
         mHFjXDb79RvupFTcYuHUNCqgVMpf+DDevDMpTyP3sVesLzxXfPJttszgpVIJNmTxIOCN
         s5pep/hnz1ZJJjydL/+ZiBiJE587djmw7QinaftFEa0VVsuZbL+xIWCDs3WG1OidhpVA
         VLmD8Y8pC/8A3p7elxwkhSGwlX6sHaxlvFe0ZILaomLOqKcLf6vht2STMiKta5qurvzc
         767WnSnLhs3TCrVt3gVzjY8Kzd8CQQ4ZqqafhfVInpKZFiwI9HMUBwgvJPlsDyHYVuqu
         FCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xs2zM5iK8nJbFN6lLbj1qATGF70exsjAH2ueWzvcaM0=;
        b=D/dE9pZIWxqidvDkNfbC2pREDbrTXCF51H8h5SnvYahuONDHqq6IAzY2zY2NT0bZJ0
         er3voHJGZRB9HXK8V1ugRITxFBXOig1gFIzlgb0tzybTrVgXICCW0Yb/8O+xL/gluMlU
         Di+cUOgB+G+Zj/5QhNy/e88OJgDHMWcIh2JIbJG8+l2GatoKx3e9CmtnkgnihmKiuFH6
         Ajm5T73EZAHh2WFww4fb2zGkktlg5tJwi9OwXHcF78v3M3n/jjCbrxJbgVn7m866Hfhg
         8hUXo5lk9GFe745FEqzBhg6wGFtPu4PpEm0QLKZZyRc1GhlZSVtv0IdI9Wbg5XiaHsmH
         kLOA==
X-Gm-Message-State: AOAM5310reoTWBr/KNEmNXhL3N6pLonWuXjCn4ckwEZA3v+Kgv95eZpC
        7uoMpAXoNTCg0nUXr/J/ZMc=
X-Google-Smtp-Source: ABdhPJwDef7uXw5eemASt+w97sfNhQUmtMnJlTqO80Gr9RoF6lKIfSZ59CNN/oriLApaXNUsL8n8bA==
X-Received: by 2002:a05:600c:198e:: with SMTP id t14mr5759771wmq.109.1611783546007;
        Wed, 27 Jan 2021 13:39:06 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id s4sm4475184wrt.85.2021.01.27.13.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 13:39:05 -0800 (PST)
Message-ID: <d7f1bf8f15a36c346296a70d5b534f511d4f4c84.camel@gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: ep93xx: Fix single irqchip with multi
 gpiochips
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 22:39:04 +0100
In-Reply-To: <20210127104617.1173-3-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-3-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita,

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> Fixes the following warnings which results in interrupts disabled on 
> port B/F:
> 
> gpio gpiochip1: (B): detected irqchip that is shared with multiple
> gpiochips: please fix the driver.
> gpio gpiochip5: (F): detected irqchip that is shared with multiple
> gpiochips: please fix the driver.
> 
> - added separate irqchip for each interrupt capable gpiochip
> - provided unique names for each irqchip
> - reworked ep93xx_gpio_port to make it usable before chip_add_data 
>   in ep93xx_init_irq_chips
> 
> Fixes: a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy
> disable")

I'd rather say, it fixes commit d2b091961510
("gpio: ep93xx: Pass irqchip when adding gpiochip").
But for sure, not the gpiolib code as above tag claims.

> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 45 ++++++++++++++++++++++++++++++------
> --
>  1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 0d0435c07a5a..2eea02c906e0 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -34,9 +34,12 @@
>   */
>  #define EP93XX_GPIO_F_IRQ_BASE 80
>  
> +#define EP93XX_GPIO_IRQ_CHIPS_NUM 3
> +
>  struct ep93xx_gpio {
>         void __iomem            *base;
>         struct gpio_chip        gc[8];
> +       struct irq_chip         ic[EP93XX_GPIO_IRQ_CHIPS_NUM];
>  };
>  
>  /*
> @@ -55,6 +58,11 @@ static unsigned char gpio_int_type2[3];
>  static unsigned char gpio_int_debounce[3];
>  
>  /* Port ordering is: A B F */
> +static const char * const irq_chip_names[] = {
> +       "gpio-irq-a",
> +       "gpio-irq-b",
> +       "gpio-irq-f"
> +};
>  static const u8 int_type1_register_offset[3]   = { 0x90, 0xac, 0x4c
> };
>  static const u8 int_type2_register_offset[3]   = { 0x94, 0xb0, 0x50
> };
>  static const u8 eoi_register_offset[3]         = { 0x98, 0xb4, 0x54
> };
> @@ -77,9 +85,8 @@ static void ep93xx_gpio_update_int_params(struct
> ep93xx_gpio *epg, unsigned port
>                epg->base + int_en_register_offset[port]);
>  }
>  
> -static int ep93xx_gpio_port(struct gpio_chip *gc)
> +static int ep93xx_gpio_port(struct ep93xx_gpio *epg, struct
> gpio_chip *gc)
>  {
> -       struct ep93xx_gpio *epg = gpiochip_get_data(gc);
>         int port = 0;
>  
>         while (port < ARRAY_SIZE(epg->gc) && gc != &epg->gc[port])
> @@ -101,7 +108,7 @@ static void ep93xx_gpio_int_debounce(struct
> gpio_chip *gc,
>                                      unsigned int offset, bool
> enable)
>  {
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       int port = ep93xx_gpio_port(epg, gc);
>         int port_mask = BIT(offset);
>  
>         if (enable)
> @@ -163,7 +170,7 @@ static void ep93xx_gpio_irq_ack(struct irq_data
> *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       int port = ep93xx_gpio_port(epg, gc);
>         int port_mask = BIT(d->irq & 7);
>  
>         if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH) {
> @@ -178,7 +185,7 @@ static void ep93xx_gpio_irq_mask_ack(struct
> irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       int port = ep93xx_gpio_port(epg, gc);
>         int port_mask = BIT(d->irq & 7);
>  
>         if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH)
> @@ -194,7 +201,7 @@ static void ep93xx_gpio_irq_mask(struct irq_data
> *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       int port = ep93xx_gpio_port(epg, gc);
>  
>         gpio_int_unmasked[port] &= ~BIT(d->irq & 7);
>         ep93xx_gpio_update_int_params(epg, port);
> @@ -204,7 +211,7 @@ static void ep93xx_gpio_irq_unmask(struct
> irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       int port = ep93xx_gpio_port(epg, gc);
>  
>         gpio_int_unmasked[port] |= BIT(d->irq & 7);
>         ep93xx_gpio_update_int_params(epg, port);
> @@ -219,7 +226,7 @@ static int ep93xx_gpio_irq_type(struct irq_data
> *d, unsigned int type)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       int port = ep93xx_gpio_port(epg, gc);
>         int offset = d->irq & 7;
>         int port_mask = BIT(offset);
>         irq_flow_handler_t handler;
> @@ -335,6 +342,22 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip
> *gc, unsigned offset)
>         return EP93XX_GPIO_F_IRQ_BASE + offset;
>  }
>  
> +static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
> +{
> +       int i;
> +
> +       for (i = 0; i < EP93XX_GPIO_IRQ_CHIPS_NUM; i++) {
> +               struct irq_chip *ic = &epg->ic[i];
> +
> +               ic->name = irq_chip_names[i];
> +               ic->irq_ack = ep93xx_gpio_irq_ack;
> +               ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
> +               ic->irq_mask = ep93xx_gpio_irq_mask;
> +               ic->irq_unmask = ep93xx_gpio_irq_unmask;
> +               ic->irq_set_type = ep93xx_gpio_irq_type;
> +       }
> +}
> +
>  static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
>                                 struct platform_device *pdev,
>                                 struct ep93xx_gpio *epg,
> @@ -345,6 +368,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>         struct device *dev = &pdev->dev;
>         struct gpio_irq_chip *girq;
>         int err;
> +       int port;
>  
>         err = bgpio_init(gc, dev, 1, data, NULL, NULL, dir, NULL, 0);
>         if (err)
> @@ -356,7 +380,8 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>         girq = &gc->irq;
>         if (bank->has_irq || bank->has_hierarchical_irq) {
>                 gc->set_config = ep93xx_gpio_set_config;
> -               girq->chip = &ep93xx_gpio_irq_chip;
> +               port = ep93xx_gpio_port(epg, gc);
> +               girq->chip = &epg->ic[port];
>         }
>  
>         if (bank->has_irq) {
> @@ -423,6 +448,8 @@ static int ep93xx_gpio_probe(struct
> platform_device *pdev)
>         if (IS_ERR(epg->base))
>                 return PTR_ERR(epg->base);
>  
> +       ep93xx_init_irq_chips(epg);
> +
>         for (i = 0; i < ARRAY_SIZE(ep93xx_gpio_banks); i++) {
>                 struct gpio_chip *gc = &epg->gc[i];
>                 struct ep93xx_gpio_bank *bank =
> &ep93xx_gpio_banks[i];

-- 
Alexander Sverdlin.


