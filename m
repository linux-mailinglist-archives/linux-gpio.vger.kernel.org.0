Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA4C2A7AB9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKEJke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEJke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:40:34 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B56C0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:40:33 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id b1so1313942lfp.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3hWsdnqZNjQDKpL2B785A/d5X3xt4A0wwW61OXRwY/c=;
        b=vazstrmuUGxShFcPSjK99UNszN8ebLO9vYsswJWPOI0ji007BIxdt1z8ZOgCPtgL0U
         8fQ+lGVXy9yNBtPo6ecTCGNpM6ApZsTBHHdnJ8K78acvaIz7HvPnXP+fGAmNVv1/072v
         FzDEx07N1z7LiNMI50uDbiVBjR0upi+6Ch0pMOzuqWaqp5o0mZeoBaFBcJXGQ5AtgOGH
         vL2clxCTwdTJQvI79Ir21mh82m26V9sgmgn6fnvm611SmhTl/DFZiAT2XFhInpof2WZg
         VsLekC5EGBhggYbUYjBqVVL9zXyIIvOUBjU636//1r9gbQZHt6QM3GnOym2A0tBfXRFU
         25OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3hWsdnqZNjQDKpL2B785A/d5X3xt4A0wwW61OXRwY/c=;
        b=ppwaYwxe7ivydJJUC/55u2Aomk63ETqbHevqkJS9YzFspetDpoUILQr/43N0xRsyt1
         CWfbaqjhcKXySWhUv+xl2stJiV79p/Sp5tW7zEs21O7lszEwAXL1kSu9eOecfevR5aj5
         JsTUfNmUMknat9vJV3uK3S604Ou73NP3iAzneadXPZZEUw4M02a1UaFJc6CjOrXsAhKW
         /gwHdfuSpzhX98D8kzfwxqXxQOBr321InPTZ2CMh07d5uIOfupgKDnCzyjVeez1lYuOr
         kqrywPPrIlz3FmqnolXOYVabrq12GnK0BcBL9pMW+V+0LG57ZQ/1izy0KI1IPt6kRIrC
         hosQ==
X-Gm-Message-State: AOAM531tS3PlK4E/Pz7wpr5eTZ9MrzBYbSciCRnzrIa9zBtJV4m+yxVW
        LN5whRYEINZiKQQZP6Mlun9nmWj1VIQWj5Nh2+jF1g==
X-Google-Smtp-Source: ABdhPJyICsojisuhbFFVcr5m6NwN6GBYE+M1nU/kA+i4WxJTNQcL76qloXWk05dLRYrco2B48Gb7uez07HDSSCe9VMs=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr605124lfe.441.1604569232429;
 Thu, 05 Nov 2020 01:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-4-daniel@0x0f.com>
In-Reply-To: <20201019141008.871177-4-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:40:21 +0100
Message-ID: <CACRpkdZNr6sDqJhg3KcX0bCbcd8fh2gXFYbS1r2H2Sq+vGqjUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Daniel Palmer <daniel@0x0f.com>, Marc Zyngier <maz@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 4:10 PM Daniel Palmer <daniel@0x0f.com> wrote:

> This adds a driver that supports the GPIO block found in
> MStar/SigmaStar ARMv7 SoCs.
>
> The controller seems to support 128 lines but where they
> are wired up differs between chips and no currently known
> chip uses anywhere near 128 lines so there needs to be some
> per-chip data to collect together what lines actually have
> physical pins attached and map the right names to them.
>
> The core peripherals seem to use the same lines on the
> currently known chips but the lines used for the sensor
> interface, lcd controller etc pins seem to be totally
> different between the infinity and mercury chips
>
> The code tries to collect all of the re-usable names,
> offsets etc together so that it's easy to build the extra
> per-chip data for other chips in the future.
>
> So far this only supports the MSC313 and MSC313E chips.
>
> Support for the SSC8336N (mercury5) is trivial to add once
> all of the lines have been mapped out.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

This looks really nice, the generic hierarchical IRQchip does
its job very well here.

I saw you would send another version but this already looks
like merge material.

Certainly any remaining issues can be ironed out in-tree.

> +config GPIO_MSC313
> +       bool "MStar MSC313 GPIO support"
> +       default y if ARCH_MSTARV7
> +       depends on ARCH_MSTARV7
> +       select GPIOLIB_IRQCHIP

select IRQ_DOMAIN_HIERARCHY

since you are dependent on this.

(Else people will soon report problems with randconfig...)

> +/* The parent interrupt controller needs the GIC interrupt type set to GIC_SPI
> + * so we need to provide the fwspec. Essentially gpiochip_populate_parent_fwspec_twocell
> + * that puts GIC_SPI into the first cell.
> + */
> +static void *msc313_gpio_populate_parent_fwspec(struct gpio_chip *gc,
> +                                            unsigned int parent_hwirq,
> +                                            unsigned int parent_type)
> +{
> +       struct irq_fwspec *fwspec;
> +
> +       fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
> +       if (!fwspec)
> +               return NULL;
> +
> +       fwspec->fwnode = gc->irq.parent_domain->fwnode;
> +       fwspec->param_count = 3;
> +       fwspec->param[0] = GIC_SPI;
> +       fwspec->param[1] = parent_hwirq;
> +       fwspec->param[2] = parent_type;
> +
> +       return fwspec;
> +}

Clever. Looping in Marc Z so he can say if this looks allright to him.

> +static int msc313e_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
> +                                            unsigned int child,
> +                                            unsigned int child_type,
> +                                            unsigned int *parent,
> +                                            unsigned int *parent_type)
> +{
> +       struct msc313_gpio *priv = gpiochip_get_data(chip);
> +       unsigned int offset = priv->gpio_data->offsets[child];
> +       int ret = -EINVAL;
> +
> +       /* only the spi0 pins have interrupts on the parent
> +        * on all of the known chips and so far they are all
> +        * mapped to the same place
> +        */
> +       if (offset >= OFF_SPI0_CZ && offset <= OFF_SPI0_DO) {
> +               *parent_type = child_type;
> +               *parent = ((offset - OFF_SPI0_CZ) >> 2) + 28;
> +               ret = 0;
> +       }
> +
> +       return ret;
> +}

Neat!

> +static int msc313_gpio_probe(struct platform_device *pdev)
> +{
> +       const struct msc313_gpio_data *match_data;
> +       struct msc313_gpio *gpio;
> +       struct gpio_chip *gpiochip;
> +       struct gpio_irq_chip *gpioirqchip;
> +       struct resource *res;
> +       struct irq_domain *parent_domain;
> +       struct device_node *parent_node;
> +       int ret;
> +
> +       match_data = of_device_get_match_data(&pdev->dev);

There is a lot of referencing &pdev->dev.

I would add a local variable like this:

struct device *dev = &pdev->dev

and replace all &pdev->dev with that. It will make the code more
compact and easier to read.

Yours,
Linus Walleij
