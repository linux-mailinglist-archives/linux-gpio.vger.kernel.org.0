Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B1366BB07
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjAPJ4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjAPJ4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:56:00 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C975117CF1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:55:59 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id d66so16062812vsd.9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YV09Dria7FIxirBtuz640DzPJ7MvcBb3hhq1P8PhBCk=;
        b=otc1ImiuC5VXDqpXVXs1kAjekPYq8X81GbRPy6zAOPUJOrmBOn5keDUzNA86e7TkXm
         mc6WA0/6/I68Jxj5KfDmT4QTPyjGgVyweYmVpWWGh7XhBeZ+4X2RFEKyuaPidbOxCtEi
         x2x8lTEWzxZ08MK/F35+HB42kcF7n7SKJFLWGGUHcIOjrLL/x4tmpndyEEbf31NAwADF
         FmM28EZ38wpijWwW3QiBwsJrZDzsmBHQKvksMY4Hoi0gn6ViiU91NqVy3r+6QuF0zFs1
         wVopvKWuWapTO8rosoeSo41mtCj7YL/bowZQ6LFKeIzI35l5Fhd/UPSUpzaQreQC6ZGs
         POJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV09Dria7FIxirBtuz640DzPJ7MvcBb3hhq1P8PhBCk=;
        b=LRkz4RhV0mLw33zMdD2BceH8Urx2p7hzoRxK5qAIkufPtm6pPtB8JTQ1Yzu6NbKD/o
         qyRId2tra5Ws1hycIZWln/yxE2mxWDbpXifX/CluzYLxCEX+QD1HANcCVLihirSd8aa2
         9fwdHaYttcRtAVdNkQ705l2wvv/T11+MlE1rOLYeMP6AJtiKXNI+7sKuhFyPB/eLDeEn
         CAY9aWaX7oPzZbSbczjm6R36jhsCKt0Juf+76jyvRLz8OCrmPCp7k5DOi7PRGCu/p3Gn
         XpeN9z6YV46YQgFvBKDXK385rw1NJnyLvn8mwE3FPJQ313yD1o4M2DwqO/lheUousVPk
         JLBg==
X-Gm-Message-State: AFqh2ko8spFtuUEptjz+uxWHMvRYHBc3wVkymph0F9nWy87CXEvDCNbE
        4PD4Wcqyu3dmTh5PQF1jGM8i2FpltB58o2qdQvXnrw==
X-Google-Smtp-Source: AMrXdXuYd1NnFsuPKbcn/p/an2DZE47ih3lduOwkCmN8q/PdhLXhJYORQfnzaVjyh39EzTNYALvcnJXkwIQ8bXcmyqk=
X-Received: by 2002:a05:6102:83b:b0:3d1:3753:9a3c with SMTP id
 k27-20020a056102083b00b003d137539a3cmr1451615vsb.73.1673862958887; Mon, 16
 Jan 2023 01:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20230116094957.5756-1-marex@denx.de>
In-Reply-To: <20230116094957.5756-1-marex@denx.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 10:55:47 +0100
Message-ID: <CAMRc=McBELorc-+rq1L9JcVYDJrcds2L_AGR2vwy1Vt19UgBKQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 10:50 AM Marek Vasut <marex@denx.de> wrote:
>
> The driver currently performs register read-modify-write without locking
> in its irqchip part, this could lead to a race condition when configuring
> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
> the register read-modify-write.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> ---
> V3: New patch
> V4: Include linux/spinlock.h
> V5: Use raw_spinlock per 3c938cc5cebcb ("gpio: use raw spinlock for gpio chip shadowed data")
> V6: No change
> V7: Rebase on current next-20230116
> ---
>  drivers/gpio/gpio-mxc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index d5626c572d24e..2d9d498727f10 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/of.h>
> @@ -159,6 +160,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>  {
>         struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>         struct mxc_gpio_port *port = gc->private;
> +       unsigned long flags;
>         u32 bit, val;
>         u32 gpio_idx = d->hwirq;
>         int edge;
> @@ -197,6 +199,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>                 return -EINVAL;
>         }
>
> +       raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
> +
>         if (GPIO_EDGE_SEL >= 0) {
>                 val = readl(port->base + GPIO_EDGE_SEL);
>                 if (edge == GPIO_INT_BOTH_EDGES)
> @@ -217,15 +221,20 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>         writel(1 << gpio_idx, port->base + GPIO_ISR);
>         port->pad_type[gpio_idx] = type;
>
> +       raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
> +
>         return 0;
>  }
>
>  static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>  {
>         void __iomem *reg = port->base;
> +       unsigned long flags;
>         u32 bit, val;
>         int edge;
>
> +       raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
> +
>         reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
>         bit = gpio & 0xf;
>         val = readl(reg);
> @@ -243,6 +252,8 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>                 return;
>         }
>         writel(val | (edge << (bit << 1)), reg);
> +
> +       raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
>  }
>
>  /* handle 32 interrupts in one status register */
> --
> 2.39.0
>

Both now applied, thanks and sorry again.

Bart
