Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835612DBD5D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 10:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgLPJOT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 04:14:19 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:51676 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgLPJOT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 04:14:19 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0BG9BpDw006013; Wed, 16 Dec 2020 18:11:51 +0900
X-Iguazu-Qid: 34tKHiA2wsjNFghN46
X-Iguazu-QSIG: v=2; s=0; t=1608109911; q=34tKHiA2wsjNFghN46; m=MgklT305Ge9UZBU3EMVQtZH0PwxZoJlej00Mkpkh988=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 0BG9Bos2002451;
        Wed, 16 Dec 2020 18:11:50 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0BG9BodP016995;
        Wed, 16 Dec 2020 18:11:50 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0BG9Bo9n002730;
        Wed, 16 Dec 2020 18:11:50 +0900
Date:   Wed, 16 Dec 2020 18:11:48 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
X-TSB-HOP: ON
Message-ID: <20201216091148.vmriqt3vsg34pqhj@toshiba.co.jp>
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201211094138.2863677-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CACRpkdZ-umK4troerSA6S2rvyU5XV+KsFdxuWE5Sy0PCgdfT6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ-umK4troerSA6S2rvyU5XV+KsFdxuWE5Sy0PCgdfT6A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review.

On Sat, Dec 12, 2020 at 12:20:47AM +0100, Linus Walleij wrote:
> On Fri, Dec 11, 2020 at 1:43 AM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> 
> This iteration is looking really good, but we are not quite there yet,
> because now that the driver looks so much better I can see that it
> is a hierarchical interrupt controller.

As you pointed out, this GPIO interrupt is directly linked to the GIC
interrupt.
As a function of the GPIO driver, there is a function (IRQ_DOMAIN_HIERARCHY)
that can handle these as one-to-one, so it is pointed out that it is better
to use this. Is this correct?

> 
> > Add the GPIO driver for Toshiba Visconti ARM SoCs.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> (...)
> 
> > +config GPIO_VISCONTI
> > +       tristate "Toshiba Visconti GPIO support"
> > +       depends on ARCH_VISCONTI || COMPILE_TEST
> > +       depends on OF_GPIO
> > +       select GPIOLIB_IRQCHIP
> > +       select GPIO_GENERIC
> > +       help
> > +         Say yes here to support GPIO on Tohisba Visconti.
> 
> Add
> select IRQ_DOMAIN_HIERARCHY

OK, I will add this.

> 
> > +struct visconti_gpio {
> > +       void __iomem *base;
> > +       int *irq;
> 
> Don't keep these irqs around.
>

OK, I will remove this
.
> > +       ret = platform_irq_count(pdev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       num_irq = ret;
> > +
> > +       priv->irq = devm_kcalloc(dev, num_irq, sizeof(priv->irq), GFP_KERNEL);
> > +       if (!priv->irq)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < num_irq; i++) {
> > +               priv->irq[i] = platform_get_irq(pdev, i);
> > +               if (priv->irq[i] < 0) {
> > +                       dev_err(dev, "invalid IRQ[%d]\n", i);
> > +                       return priv->irq[i];
> > +               }
> > +       }
> 
> Instead of doing this, look in for example
> drivers/gpio/gpio-ixp4xx.c
> 
> You need:
> 
> > +       girq = &priv->gpio_chip.irq;
> > +       girq->chip = irq_chip;
> 
> girq->fwnode = fwnode;
> girq->parent_domain = parent;
> girq->child_to_parent_hwirq = visconti_gpio_child_to_parent_hwirq;
> 


I understood that the irq_domain specified by girq->parent_domain will be the
GIC. Is this correct?


> The mapping function will be something like this:
> 
> static int visconti_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>                                              unsigned int child,
>                                              unsigned int child_type,
>                                              unsigned int *parent,
>                                              unsigned int *parent_type)
> {
>         /* Interrupts 0..15 mapped to interrupts 24..39 on the GIC */
>         if (child < 16) {
>             /* All these interrupts are level high in the CPU */
>             *parent_type = IRQ_TYPE_LEVEL_HIGH;
>             *parent = child + 24;
>             return 0;
>         }
>         return -EINVAL;
> }
>

I see, I will add this function.

> > +       priv->gpio_chip.irq.init_valid_mask = visconti_init_irq_valid_mask;
> 
> This will be set up by gpiolib when using hierarchical irqs.
> 

OK.

> > +       /* This will let us handle the parent IRQ in the driver */
> > +       girq->parent_handler = NULL;
> > +       girq->num_parents = 0;
> > +       girq->parents = NULL;
> 
> You don't need this.
> 
> > +       girq->default_type = IRQ_TYPE_NONE;
> > +       girq->handler = handle_level_irq;
> 
> But this stays.
> 

OK, I will update to these.

> > +       for (i = 0; i < num_irq; i++) {
> > +               desc = irq_to_desc(priv->irq[i]);
> > +               desc->status_use_accessors |= IRQ_NOAUTOEN;
> > +               if (devm_request_irq(dev, priv->irq[i],
> > +                                    visconti_gpio_irq_handler, 0, name, priv)) {
> > +                       dev_err(dev, "failed to request IRQ[%d]\n", i);
> > +                       return -ENOENT;
> > +               }
> > +       }
> 
> This should not be needed either when using hiearchical IRQs,
> also the irqchip maintainers will beat us up for poking around in the
> descs like this.

I understand that the processing equivalent to request_irq() is processed
by the irqchip frame work (or GIC driver). Is this correct?


> 
> The rest looks solid!
> 

Thank you.
I will apply your point into the driver.

Best regards,
  Nobuhiro
