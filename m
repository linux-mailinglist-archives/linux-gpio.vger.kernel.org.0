Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5EA12D82AA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407079AbgLKXWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387495AbgLKXVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 18:21:40 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1466C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:20:59 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id m13so12788375ljo.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0RoN+yPlhPZHkfa4tGbZVww5HGHgx9XOlLKoRJlydGo=;
        b=BBmJ4OSZoB/n6zH0dGbcWGcHgRQ6Exbw9qcL33a9ZZDiDBo0PAcyVfWtKQ24nmmRfh
         ov6x3jXcXkYzqPNBnJRQu1UUweT4hgbMQkz1mutjf75hnfzgH9eg9EZAcrdPE3nyHpPc
         uuL6WLwUYAM4/4P13AeCni3FqXLr1rUusP2gR2gQ6+kTirVoNr+5RuQoZx/gtHhBwPhP
         qrVE0sHlFmt8o99XtCVqy9XnIMnDxKuTWnRTBh2SvNpFkqCu3moYm/eGwmeqhxHG87jJ
         J5SQkpqfSjwGZpCZmwbJjvrxg+EqFGyjhy4SH9StbACv31AqOjTikKPJbqrCeqT7zgVj
         eE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0RoN+yPlhPZHkfa4tGbZVww5HGHgx9XOlLKoRJlydGo=;
        b=Z88bUjZMmjPr8xrjYn8PkAIY2U0fcni8W7e0tOaheNPzw3U8ruM7Ux8jw4jS9C9Yyt
         Kqk7KLjjQeg2rv4lxE4TQbTN0HJ7YkLtEYFKCb9oTnHf/7f1cNq/GLZAn6ha8Lie6X0H
         jtd5/qhMLGJ+WCa/oISqDkWAylYZ8a3gjB6gzfSZnxvbHvnRiCRj9+S3QYTN5BOzjXvG
         RUF58x5ncLKhuPhEyNAmaAO+vd9f05L4Zzzb6cxhRJSrMOIooJkrZK5uo/Cw+J0014dw
         iW//K9/214vmZ409Ap8d61QH+Lf9F1EEdmMsjYjvuFK2qk+telTCV3hMDC+zOzz3Ypn8
         CtFA==
X-Gm-Message-State: AOAM530gLPhs60U9caeOiPLKbmBouu9EU8HC6tcnfhQheZjmmZRTjADD
        JDV8vFpjt4xgaioX/ZDV7hSLUNzKIh+Ya9ePJZfdgQ==
X-Google-Smtp-Source: ABdhPJyjhY7ZXqP/BBEpRStI1Nd4KCt8z+z9ShXxt+jO33EFnGMKPBB1wHooCgru85dBB0aVniyrFm3oaq+WMvz68p8=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr1474147ljl.467.1607728858283;
 Fri, 11 Dec 2020 15:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp> <20201211094138.2863677-3-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201211094138.2863677-3-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 00:20:47 +0100
Message-ID: <CACRpkdZ-umK4troerSA6S2rvyU5XV+KsFdxuWE5Sy0PCgdfT6A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 1:43 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

This iteration is looking really good, but we are not quite there yet,
because now that the driver looks so much better I can see that it
is a hierarchical interrupt controller.

> Add the GPIO driver for Toshiba Visconti ARM SoCs.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
(...)

> +config GPIO_VISCONTI
> +       tristate "Toshiba Visconti GPIO support"
> +       depends on ARCH_VISCONTI || COMPILE_TEST
> +       depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP
> +       select GPIO_GENERIC
> +       help
> +         Say yes here to support GPIO on Tohisba Visconti.

Add
select IRQ_DOMAIN_HIERARCHY

> +struct visconti_gpio {
> +       void __iomem *base;
> +       int *irq;

Don't keep these irqs around.

> +       ret = platform_irq_count(pdev);
> +       if (ret < 0)
> +               return ret;
> +
> +       num_irq = ret;
> +
> +       priv->irq = devm_kcalloc(dev, num_irq, sizeof(priv->irq), GFP_KERNEL);
> +       if (!priv->irq)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < num_irq; i++) {
> +               priv->irq[i] = platform_get_irq(pdev, i);
> +               if (priv->irq[i] < 0) {
> +                       dev_err(dev, "invalid IRQ[%d]\n", i);
> +                       return priv->irq[i];
> +               }
> +       }

Instead of doing this, look in for example
drivers/gpio/gpio-ixp4xx.c

You need:

> +       girq = &priv->gpio_chip.irq;
> +       girq->chip = irq_chip;

girq->fwnode = fwnode;
girq->parent_domain = parent;
girq->child_to_parent_hwirq = visconti_gpio_child_to_parent_hwirq;

The mapping function will be something like this:

static int visconti_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
                                             unsigned int child,
                                             unsigned int child_type,
                                             unsigned int *parent,
                                             unsigned int *parent_type)
{
        /* Interrupts 0..15 mapped to interrupts 24..39 on the GIC */
        if (child < 16) {
            /* All these interrupts are level high in the CPU */
            *parent_type = IRQ_TYPE_LEVEL_HIGH;
            *parent = child + 24;
            return 0;
        }
        return -EINVAL;
}

> +       priv->gpio_chip.irq.init_valid_mask = visconti_init_irq_valid_mask;

This will be set up by gpiolib when using hierarchical irqs.

> +       /* This will let us handle the parent IRQ in the driver */
> +       girq->parent_handler = NULL;
> +       girq->num_parents = 0;
> +       girq->parents = NULL;

You don't need this.

> +       girq->default_type = IRQ_TYPE_NONE;
> +       girq->handler = handle_level_irq;

But this stays.

> +       for (i = 0; i < num_irq; i++) {
> +               desc = irq_to_desc(priv->irq[i]);
> +               desc->status_use_accessors |= IRQ_NOAUTOEN;
> +               if (devm_request_irq(dev, priv->irq[i],
> +                                    visconti_gpio_irq_handler, 0, name, priv)) {
> +                       dev_err(dev, "failed to request IRQ[%d]\n", i);
> +                       return -ENOENT;
> +               }
> +       }

This should not be needed either when using hiearchical IRQs,
also the irqchip maintainers will beat us up for poking around in the
descs like this.

The rest looks solid!

Yours,
Linus Walleij
