Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551575A9E90
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 20:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbiIASE2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 14:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiIASE1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 14:04:27 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84837287B
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 11:04:26 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id x5so14075605qtv.9
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Zv8zSKFq6bzQqKXYqWy0Qx4amMNXqj8LcRMKjpftT8k=;
        b=KUOKej5nPOeGXo5nEfUAHYOLs5eyvNYlpPTgCZVwvX1z47fwyYmBooIcwdClVmNz/v
         BRlsK21Dt9FO/arMv4k1bBH9kpHYhGlhCYiHWwSs7zcTWAS1o68a1rng8ufeVyq64mCt
         p546eMwZIIcOP8bw44GqQ79ZHCkKG3OtwLGvXJ8UJulq9EvJ/SlNLAoghw4QreA9qeju
         3+z4Yxdu9AcK3lIk8lLUAEA0Ts0X4QHz8YrmEABFlwU8pmOnUzx5OVD4tlF8JlFdgDWG
         G+M+vJxEIoIdPawxcqf3xok6F/M0ttOpxReuVfdwkBWLnB/drLA8iRY22Wj87RvL3w+E
         jGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Zv8zSKFq6bzQqKXYqWy0Qx4amMNXqj8LcRMKjpftT8k=;
        b=BXWYhZbscGkjHxB4OB1CLiLurIDt7YoBhXlnnvbHgusGXVMFaZeEah8Dn3axDE5smi
         YhL+/mE8gNOG9u76he0jwfljQN/O4qLrkdQoF9ZaY7422AleAA5uZ1INGQPqyH6NL5h4
         xtaUClHf5iTdrayYNVhvmty4R+seGkzzpBT0EScEag6oJ9MWI1nPTNOMcjvj7dOZVTpV
         R+oYPZvoI8gVBCFxlviIIR9DSqbBbomHLfGM82bEu/NhUasYENaWalDFV7Uw0LTfIgcz
         xbkl2EccjTLXQwCbbDvofUXbY8BfYTfAOoA/VnX5r4KFliaKy5vHcFjzEs+UTeseM5t/
         N8sA==
X-Gm-Message-State: ACgBeo3QoJmCu5OsHJvbpkJqQLPNjEL9V38+uLzHInGS6KLRw9Lim/AB
        zR2c46leXdIEKFZPl/oOhMfH4bNd5u/x3tPAVhI=
X-Google-Smtp-Source: AA6agR62i/7z5gszNPxCHM2tUNT7IR0EnqVb391hZCNAMeUz4tSPO3zPDqa/NtagcRnkiNQJGORyj3nl76pLbZ0BL1M=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr25497299qtj.384.1662055465702; Thu, 01
 Sep 2022 11:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Sep 2022 21:03:49 +0300
Message-ID: <CAHp75VfW7uj=+vwGRLsUJEjF-bQLL2EdVNfAnF6iDUqryksC+w@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> Add IRQ support to the macsmc driver. This patch has updates from Joey
> Gouly and Russell King.

...

> +       u16 type = event >> 16;
> +       u8 offset = (event >> 8) & 0xff;

The ' & 0xff' part is redundant.

...

> +       return (ret == 0) ? NOTIFY_OK : NOTIFY_DONE;

Parentheses and ' == 0' parts are redundant. You may swap ternary operands.

...

> +static void macsmc_gpio_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       gpiochip_enable_irq(gc, irqd_to_hwirq(d));
> +       set_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);

You may use temporary variable for hwirq

  irq_hw_number_t hwirq = irdq_to_hwirq(d);

> +}
> +
> +static void macsmc_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       clear_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
> +       gpiochip_disable_irq(gc, irqd_to_hwirq(d));

Ditto.

> +}
> +
> +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);

> +       int offset = irqd_to_hwirq(d);

As above.


> +       u32 mode;

> +       if (!test_bit(offset, smcgp->irq_supported))
> +               return -EINVAL;

We have a valid mask for IRQs. Can it be used here instead?

> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               mode = IRQ_MODE_HIGH;
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               mode = IRQ_MODE_LOW;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               mode = IRQ_MODE_RISING;
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               mode = IRQ_MODE_FALLING;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               mode = IRQ_MODE_BOTH;
> +               break;
> +       default:
> +               return -EINVAL;
>         }
>
> +       smcgp->irq_mode_shadow[offset] = mode;

Usually we want to have handle_bad_irq() handler by default and in
->set_type() we lock a handler depending on the flags. Why is this not
the case in this driver?

>         return 0;
>  }

...

> +static void macsmc_gpio_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);

> +       smc_key key = macsmc_gpio_key(irqd_to_hwirq(d));
> +       int offset = irqd_to_hwirq(d);

As above.

> +       bool val;
> +
> +       if (smcgp->irq_mode_shadow[offset] != smcgp->irq_mode[offset]) {
> +               u32 cmd = CMD_IRQ_MODE | smcgp->irq_mode_shadow[offset];
> +               if (apple_smc_write_u32(smcgp->smc, key, cmd) < 0)
> +                       dev_err(smcgp->dev, "GPIO IRQ config failed for %p4ch = 0x%x\n", &key, cmd);
> +               else
> +                       smcgp->irq_mode_shadow[offset] = smcgp->irq_mode[offset];
> +       }
> +
> +       val = test_bit(offset, smcgp->irq_enable_shadow);
> +       if (test_bit(offset, smcgp->irq_enable) != val) {
> +               if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ENABLE | val) < 0)
> +                       dev_err(smcgp->dev, "GPIO IRQ en/disable failed for %p4ch\n", &key);
> +               else
> +                       change_bit(offset, smcgp->irq_enable);
> +       }
> +
> +       mutex_unlock(&smcgp->irq_mutex);
> +}

--
With Best Regards,
Andy Shevchenko
