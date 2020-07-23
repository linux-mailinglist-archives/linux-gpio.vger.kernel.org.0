Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7514722B558
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 20:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgGWSDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 14:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgGWSDb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 14:03:31 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961E7C0619DC;
        Thu, 23 Jul 2020 11:03:31 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 207so3401916pfu.3;
        Thu, 23 Jul 2020 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSWqd+1t1aywwPKD6hDR7ow9jwG8TxUL+vMCO6q/A/o=;
        b=e8kA7OJ/T0glh1ZZb9YUQCZ59M/Kv9TQbXie4fLka2yZL1Aj3gFKLKRKsHFi/k3V+C
         O2wohsCNwbO6Pt8fF9xrfDpaXDmf+y5qxe5n4eaUM+gvkcu5oZlHkSashAIftRMss33w
         Von0bqZEciqiAdisSb0FrSqOcTf/NpY1ACvJGVMdJu7l78C0Fcquj6GWbZE2CvazfnGW
         Umnjyg2QE3pnsGEL03uuKUM5h3MXyRzhkH5tUTa3eaR4DO3BVQFIFk6URzgrXVd7zVXI
         /Sf4Zl9oyWAOnrKVVaWnzaC+SatU0H/Kex6tiBBC1xFpovnczDlFW3B/zErvDJIpIyRl
         f/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSWqd+1t1aywwPKD6hDR7ow9jwG8TxUL+vMCO6q/A/o=;
        b=sYxaPpkBD/pk7hsuncRiakupV/WL4i4n73fOyMyYvtXr1eCJ0A0Hbwr0gw3R4sOuWf
         /99ow9MvcNeCxDsIDxgQXvqQLcDHrMN12RZZwmARYC9kN5Ka4cmbKty/wPr+lUU8Hu1n
         DBTgSxplBykH4n8FJZqv2ipspV2N1Iv9v4CIhrqihbg8QK5IzIymzW9s0YVl+B8eNoVx
         fb7jiakQpbxIQqBR0SUXtc9BClg9KBgZskdaq8HaZIDmam1HQnnUPLlf54LT+KfUp00p
         OnPzeaHMJrSRTzyfIQvD+UAz8Ep1clNB0oC+z/kTkaT2PtxOCZs0F8S8gLm1GS+B54sJ
         JciA==
X-Gm-Message-State: AOAM531rL8on8I1eDmDwP67Ray9cBDfDY8K4nwqdLLEV8a8SL2Eq0GAW
        suxaOXlVMrXNJYCQDTzFjQB/Zld7eX5Zn5KOYJk=
X-Google-Smtp-Source: ABdhPJxDmzIjp+pEkh0cBihTwhDqEdiNr4ESCD12BttS+XhGQ8EKmjNCgCcy2gUy64aWkqBKqnMFb5XRNYv92294aSE=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr5096290pgn.4.1595527410914;
 Thu, 23 Jul 2020 11:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com> <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 23 Jul 2020 21:03:14 +0300
Message-ID: <CAHp75Vd7BU5DYqyQFGfBtKrb6jWFEQjMCu2MOa_7M8XYkt6BFA@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 5:08 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:
>
> Adds interrupt support to the Xilinx GPIO driver so that rising and
> falling edge line events can be supported. Since interrupt support is
> an optional feature in the Xilinx IP, the driver continues to support
> devices which have no interrupt provided.

...

> +#include <linux/irqchip/chained_irq.h>

Not sure I see a user of it.

...

> +/**
> + * xgpio_xlate - Translate gpio_spec to the GPIO number and flags
> + * @gc: Pointer to gpio_chip device structure.
> + * @gpiospec:  gpio specifier as found in the device tree
> + * @flags: A flags pointer based on binding
> + *
> + * Return:
> + * irq number otherwise -EINVAL
> + */
> +static int xgpio_xlate(struct gpio_chip *gc,
> +                      const struct of_phandle_args *gpiospec, u32 *flags)
> +{
> +       if (gc->of_gpio_n_cells < 2) {
> +               WARN_ON(1);
> +               return -EINVAL;
> +       }
> +
> +       if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
> +               return -EINVAL;
> +
> +       if (gpiospec->args[0] >= gc->ngpio)
> +               return -EINVAL;
> +
> +       if (flags)
> +               *flags = gpiospec->args[1];
> +
> +       return gpiospec->args[0];
> +}

This looks like a very standart xlate function for GPIO. Why do you
need to open-code it?

...

> +/**
> + * xgpio_irq_ack - Acknowledge a child GPIO interrupt.

> + * This currently does nothing, but irq_ack is unconditionally called by
> + * handle_edge_irq and therefore must be defined.

This should go after parameter description(s).

> + * @irq_data: per irq and chip data passed down to chip functions
> + */

...

>  /**
> + * xgpio_irq_mask - Write the specified signal of the GPIO device.
> + * @irq_data: per irq and chip data passed down to chip functions

In all comments irq -> IRQ.

> + */
> +static void xgpio_irq_mask(struct irq_data *irq_data)
> +{
> +       unsigned long flags;
> +       struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
> +       int irq_offset = irqd_to_hwirq(irq_data);
> +       int index = xgpio_index(chip, irq_offset);
> +       int offset = xgpio_offset(chip, irq_offset);
> +
> +       spin_lock_irqsave(&chip->gpio_lock, flags);
> +

> +       chip->irq_enable[index] &= ~BIT(offset);

If you convert your data structure to use bitmaps (and respective API) like

#define XILINX_NGPIOS  64
...
  DECLARE_BITMAP(irq_enable, XILINX_NGPIOS);
...

it will make code better to read and understand. For example, here it
will be just
__clear_bit(offset, chip->irq_enable);

> +       dev_dbg(chip->gc.parent, "Disable %d irq, irq_enable_mask 0x%x\n",
> +               irq_offset, chip->irq_enable[index]);

Under spin lock?! Hmm...

> +       if (!chip->irq_enable[index]) {
> +               /* Disable per channel interrupt */
> +               u32 temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
> +
> +               temp &= ~BIT(index);
> +               xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
> +       }
> +       spin_unlock_irqrestore(&chip->gpio_lock, flags);
> +}

...

> +       for (index = 0; index < num_channels; index++) {
> +               if ((status & BIT(index))) {

If gpio_width is the same among banks, you can use for_each_set_bit()
here as well.

...

> +                       for_each_set_bit(bit, &all_events, 32) {
> +                               generic_handle_irq(irq_find_mapping
> +                                       (chip->gc.irq.domain, offset + bit));

Strange indentation. Maybe a temporary variable helps?

...

> +       chip->irq = platform_get_irq_optional(pdev, 0);
> +       if (chip->irq <= 0) {
> +               dev_info(&pdev->dev, "GPIO IRQ not set\n");

Why do you need an optional variant if you print an error anyway?

> +       } else {


...

> +               chip->gc.irq.parents = (unsigned int *)&chip->irq;
> +               chip->gc.irq.num_parents = 1;

Current pattern is to use devm_kcalloc() for it (Linus has plans to
simplify this in the future and this will help him to find what
patterns are being used)

-- 
With Best Regards,
Andy Shevchenko
