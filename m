Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB5AD5AB202
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 15:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbiIBNrt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 09:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbiIBNrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 09:47:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8844261DBB
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 06:22:34 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id cu2so3953031ejb.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9kjykBLX/2XOZBPDkYx1NLn0xeEFvOvh/J7JeDhgExk=;
        b=QtEycjEFT3kKXeccaCJV0EQelglBaWCaK0Agc13Ll/Mwm3/7GgXSrcqm7BV4Bts38z
         YLYnfSB3UWwe6Ns3pce0JmGSgJ/zPbpAd2jea45sk/KwZn/BGEWYyFBZlsRmWetnlIuh
         DpU2xAn+3okijON0TKQs1IzQV/22ODfAxFQAB6t9aoLpBh+5aqKEVM8pBXFNOsJLsl8L
         8Pm9XMNd5C5CxYjq6GPvhE6cp8PQ31gLI5aozoc09Z0xJ1RjymHF8E29Y3Hq6Bd2CJdJ
         CWATn/aGANinKbqle2HktZq4wwX2eU10/zyHFb7uhJ0IlQ7aWQ/8ukTHU+mEOqk3x+G6
         +I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9kjykBLX/2XOZBPDkYx1NLn0xeEFvOvh/J7JeDhgExk=;
        b=0TlykWu2ah3mRUzDa2T6G/W3tPwNGQ5rDBniNPs2gOUQ8aHYk61mpHeq3J4wgbgcpy
         NP/23Juv6QKaNZ5DzzMKiAWwITCn7QOII8a09U9rwBeP1me6OgpNxdGHfn+kI7l6oQ1B
         5gvftRfvE0d+/fgI6lilIdxn97JEEh0oYc+XGdABbRQd7ApxHeVUl3QKDvhfyNvvI6ey
         SnorFXxMjo3KbUZj7behT5G/4HiXOYXOhhs84pHBw7i0xgfh32YwFq+NQ/fsLwT6Xuqt
         uuTYkteNfWpyS8H3luXDLD+dV/GGfgmme8I+3sXCqrIUV9jFD5Z/+PNnGKNDUqzMoXNI
         pfpQ==
X-Gm-Message-State: ACgBeo1s3XwmDnHvIzUL5jd7jMVZiBP7FWdIRTX8S/d3fF9kV+1qxawN
        KcyRmZoG2+XoxEj46gD2pGKGbr5Jl0buSoP/1Xeyvg==
X-Google-Smtp-Source: AA6agR4r/6CP+Iq7CHiLZ9hhf/V6Z3w5iDTDeeWViqSHhU+3njvpPWP1PCbfjr1cC7FuHD8BEjYEh9+YQJaNJZW84iA=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr21492292ejc.208.1662124903916; Fri, 02
 Sep 2022 06:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Sep 2022 15:21:31 +0200
Message-ID: <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2022 at 3:54 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:

> From: Hector Martin <marcan@marcan.st>
>
> Add IRQ support to the macsmc driver. This patch has updates from Joey
> Gouly and Russell King.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Overall looks very good, again some detailed remarks from Andy
should be addressed, apart from that you need to add:

select GPIOLIB_IRQCHIP

to the Kconfig entry for the driver, or else the compile robots are
going to hit some configuration that doesn't compile.

> +       struct mutex irq_mutex;
> +       DECLARE_BITMAP(irq_supported, MAX_GPIO);

If you can use the .init_valid_mask from struct gpio_irq_chip
instead, it will allocate this mask dynamically for the irqchip.
(Further comment below.)

> +       DECLARE_BITMAP(irq_enable_shadow, MAX_GPIO);

Please rename irq_unmasked_shadow as it is tracking
this and not what the irqchip core calls enabled/disabled.

> +       DECLARE_BITMAP(irq_enable, MAX_GPIO);

I think this state should be possible to set/get from the irqchip
core. !irqd_irq_masked(d) on the descriptor, correct me if I'm wrong.

> +       u32 irq_mode_shadow[MAX_GPIO];
> +       u32 irq_mode[MAX_GPIO];
>
>         int first_index;
>  };
> @@ -161,6 +172,7 @@ static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
>         for (i = 0; i < count; i++) {
>                 smc_key key;
>                 int gpio_nr;
> +               u32 val;
>                 int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
>
>                 if (ret < 0)
> @@ -176,11 +188,143 @@ static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
>                 }
>
>                 set_bit(gpio_nr, valid_mask);
> +
> +               /* Check for IRQ support */
> +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
> +               if (!ret)
> +                       set_bit(gpio_nr, smcgp->irq_supported);
> +       }
> +
> +       return 0;
> +}

This  gets initialized from the struct gpio_chip .init_valid_mask, but
struct gpio_irq_chip has its own callback with the same name, which
is preferred to be used for this, check if you can use that instead, it
makes the use more obvious.

> +static int macsmc_gpio_event(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct macsmc_gpio *smcgp = container_of(nb, struct macsmc_gpio, nb);
> +       u16 type = event >> 16;
> +       u8 offset = (event >> 8) & 0xff;
> +       smc_key key = macsmc_gpio_key(offset);
> +       unsigned long flags;
> +        int ret;
> +
> +       if (type != SMC_EV_GPIO)
> +               return NOTIFY_DONE;
> +
> +       if (offset > MAX_GPIO) {
> +               dev_err(smcgp->dev, "GPIO event index %d out of range\n", offset);
> +               return NOTIFY_BAD;
> +       }
> +
> +       local_irq_save(flags);
> +       ret = generic_handle_domain_irq(smcgp->gc.irq.domain, offset);
> +       local_irq_restore(flags);

Isn't irq_bus_lock/unlock protecting us here already?
(I might be getting it wrong...)

Since this is coming from a notifier and not an IRQ or threaded
IRQ I actually am a bit puzzled on how to handle it... you probably
know it better than me, maybe ask Marc Z if anything is
unclear.

> +       if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ACK | 1) < 0)
> +               dev_err(smcgp->dev, "GPIO IRQ ack failed for %p4ch\n", &key);

isn't this one of those cases where we should implement the
irqchip callback .irq_ack() specifically for this?

That callback will only be used by edge triggered IRQs but
I guess that would realistically be all we support anyway?
(See comment below on .set_type)

> +static void macsmc_gpio_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       gpiochip_enable_irq(gc, irqd_to_hwirq(d));
> +       set_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
> +}
> +
> +static void macsmc_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       clear_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
> +       gpiochip_disable_irq(gc, irqd_to_hwirq(d));
> +}

I would rename these unmask/mask to match the callback
hooks they are implementing, since there are irqchips
callbacks with these names I get a but confused.

> +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(d);
> +       u32 mode;
> +
> +       if (!test_bit(offset, smcgp->irq_supported))
> +               return -EINVAL;
> +
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

I don't know how level IRQs would work on this essentially
message-passing process context interrupt. Maybe I am getting
it all wrong, but for level the line should be held low/high until
the IRQ is serviced, it would be possible to test if this actually
works by *not* servicing an IRQ and see if the SMC then sends
another message notifier for the same IRQ.

I strongly suspect that actually only edges are supported, but
there might be semantics I don't understand here.

>         }
>
> +       smcgp->irq_mode_shadow[offset] = mode;

Hm yeah I guess this shadow mode is necessary for the sync
to work.

>         return 0;
>  }
>
> +static void macsmc_gpio_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +
> +       mutex_lock(&smcgp->irq_mutex);
> +}
> +
> +static void macsmc_gpio_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +       smc_key key = macsmc_gpio_key(irqd_to_hwirq(d));
> +       int offset = irqd_to_hwirq(d);
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

So what you want to know for each line is (correct me if I'm wrong):
- Is it enabled (unmasked) or not?
- Did it get changed enabled->disabled, disabled->enabled since
  macsmc_gpio_irq_bus_lock()?

Doesn't the irqchip core track the first part of this for you?
irqd_irq_masked(d) should tell you the same thing as
irq_enable, just inverted.

irq_enable_shadow is a bit tricker, I guess you might need that since
the irqchip doesn't track state changes.

>  static int macsmc_gpio_probe(struct platform_device *pdev)
>  {
>         struct macsmc_gpio *smcgp;
> @@ -221,6 +365,18 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
>         smcgp->gc.base = -1;
>         smcgp->gc.parent = &pdev->dev;
>
> +       gpio_irq_chip_set_chip(&smcgp->gc.irq, &macsmc_gpio_irqchip);
> +       smcgp->gc.irq.parent_handler = NULL;
> +       smcgp->gc.irq.num_parents = 0;
> +       smcgp->gc.irq.parents = NULL;
> +       smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
> +       smcgp->gc.irq.handler = handle_simple_irq;

I would consider setting this to handle_edge_irq() and implement
.irq_ack(). I might be wrong.

But overall since this IRQ is driven by a notifier I feel a bit lost.

Yours,
Linus Walleij
