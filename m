Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E63AB5AD3E1
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbiIEN2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237738AbiIEN2Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:28:16 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF9049B67
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:27:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x73so4394192ede.10
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o5uz0+1b+tleOdgt/bBRFfYVa92RsetSFS3/8UmSb1s=;
        b=UYWNNhxvg2FOWmWpQ4B14rCyaWA23b8L3uc/MSGed2VHlQ8oUu/4HzXk6LKbEI1hou
         RTE9y2uRJI6womglJ6OLpkm2bYBjRW+FYj6a5Dw390nQS4ugCcgwm6SQhj0togfrRY2f
         FzfHcQCI1f+KtvwEW2QwHnrvf62E2H4c7RMFF/GJo8etM6xthQi8fvutQYco7Hj73gZh
         03/J9DvJ5l5eEGvc2KMfK9qzmJzdpOV8BB59AXnBmAN59Lf3ff+rtplHq2zFhM6E7VAR
         x8sU5MX0Onx9VYe6jBiKXfrDcuLYudxo6aFw8+myt5Ze1S4dQcV/iEHn1bQotwkHB5q8
         Jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o5uz0+1b+tleOdgt/bBRFfYVa92RsetSFS3/8UmSb1s=;
        b=Okw0nUd8n8fSnnpjlWnHH6Jz1h3layrhpCtGmrgnRx6CUhxdJbWYjPV2AKSMPNxyZc
         apC5utpa7VkY5gtwDQZi1zn1rNoZ89EnjMWmehFPYTP7J2J/g4zT6SnQnm0tl3KydnLE
         qncd/+nzX5NbtV8M338L5XiAhe5F5tjCCZyOx7NYy0evFsb9RFoohOElX1+prI95Ak/Y
         PB+5b54NzI4PEslvO4Q/JriGMybn6Yr97hbl7ZuMMKCDajIS6knyi/YhBBjKmcJct37a
         6vNWsPjSA3wFIT+OBwE28vnzQ31w4V5OSrdSNZSmBqFh3KjHCn5Ef0r6fVXukwH6/F2J
         9Haw==
X-Gm-Message-State: ACgBeo0meUtZhVkPEFrDtXRkk2U3hV+8otzu2olQsjAcu0HrSjzRUoTs
        JGqo3xU67OsU/WQoZ09JS953oXrwuh+DcceXVsWfvQ==
X-Google-Smtp-Source: AA6agR6Eduh0IyGZQF+98euSNKv0laUXFWepcREMm5/ZEmrOk321e5GLw7GwtQA9c+o1mV/WxQi/wM36lDXPV4wbm7g=
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr41806434edd.158.1662384477440; Mon, 05
 Sep 2022 06:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com> <YxXv5vL6XrlkK+K0@shell.armlinux.org.uk>
In-Reply-To: <YxXv5vL6XrlkK+K0@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 15:27:45 +0200
Message-ID: <CACRpkdacRUxaGmdx4hqD4X=hJ6wv-qr_udxkdS0WYXBkM08eeA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
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

On Mon, Sep 5, 2022 at 2:47 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 03:21:31PM +0200, Linus Walleij wrote:

> > > +       local_irq_save(flags);
> > > +       ret = generic_handle_domain_irq(smcgp->gc.irq.domain, offset);
> > > +       local_irq_restore(flags);
> >
> > Isn't irq_bus_lock/unlock protecting us here already?
> > (I might be getting it wrong...)
>
> Hmm, where does irq_bus_lock get called? Given this function is called
> while running a blocking notifier chain, interrupts will not be
> disabled on entry to this function. I haven't found a place in the maze
> of irq handling code that generic_handle_domain_irq() would end up using
> the bus lock/unlock functions - and if they did, with the above IRQ
> saving, the kernel would WARN() about calling mutex_lock() with IRQs
> disabled. So it doesn't.

Ah I get it now, the notification mechanism goes entirely orthogonal
to the irqchip, that's what got me confused. You're right, keep this.

> > That callback will only be used by edge triggered IRQs but
> > I guess that would realistically be all we support anyway?
> > (See comment below on .set_type)
>
> I would imagine it depends on how the SMC GPIO interrupt works -
> whether the ACK is ACK as we know it in Linux (x86 PIC) or whether
> it's ACK as in a notification to the SMC that we have finished
> handling the interrupt and it can send us the next interrupt.
>
> I suspect we don't know that level of detail of the platform, so
> given that this is what the Asahi kernel does, that's the best we
> have.

OK

> > > +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> > > +{
> > > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > > +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> > > +       int offset = irqd_to_hwirq(d);
> > > +       u32 mode;
> > > +
> > > +       if (!test_bit(offset, smcgp->irq_supported))
> > > +               return -EINVAL;
> > > +
> > > +       switch (type & IRQ_TYPE_SENSE_MASK) {
> > > +       case IRQ_TYPE_LEVEL_HIGH:
> > > +               mode = IRQ_MODE_HIGH;
> > > +               break;
> > > +       case IRQ_TYPE_LEVEL_LOW:
> > > +               mode = IRQ_MODE_LOW;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_RISING:
> > > +               mode = IRQ_MODE_RISING;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_FALLING:
> > > +               mode = IRQ_MODE_FALLING;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_BOTH:
> > > +               mode = IRQ_MODE_BOTH;
> > > +               break;
> > > +       default:
> > > +               return -EINVAL;
> >
> > I don't know how level IRQs would work on this essentially
> > message-passing process context interrupt. Maybe I am getting
> > it all wrong, but for level the line should be held low/high until
> > the IRQ is serviced, it would be possible to test if this actually
> > works by *not* servicing an IRQ and see if the SMC then sends
> > another message notifier for the same IRQ.
>
> If level IRQs are not supported, then it's strange that the Asahi
> folk have been able to reverse engineer the CMD_IRQ_MODE codes for
> these states.
>
> Maybe the SMC issues another message for a level IRQ after it receives
> a CMD_IRQ_ACK message if the level interrupt is still asserted?
(...)
> > > +       gpio_irq_chip_set_chip(&smcgp->gc.irq, &macsmc_gpio_irqchip);
> > > +       smcgp->gc.irq.parent_handler = NULL;
> > > +       smcgp->gc.irq.num_parents = 0;
> > > +       smcgp->gc.irq.parents = NULL;
> > > +       smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
> > > +       smcgp->gc.irq.handler = handle_simple_irq;
> >
> > I would consider setting this to handle_edge_irq() and implement
> > .irq_ack(). I might be wrong.
>
> I don't think that's suitable, because then we'll be calling irq_ack()
> before the handler has run - and we won't be notifying the SMC that
> the interrupt has been masked. So it could send another notification
> for the same IRQ while it's still being handled. Then there's the
> question about level IRQs as well.
>
> I think, given that I don't know how the SMC works (presumably the
> Asahi folk have a bit more of an idea, but that will be based on
> reverse engineering effort) that I am not going to modify this driver's
> behaviour drastically by changing the flow handler to the edge flow
> handler from the simple flow. To me, that could well be a disaster
> for this driver. That would be something for the Asahi folk to look
> at.

Fair enough. From my end this will be fine to merge after you considered
the things brought up and it is certainly not necessary to have any
"perfect" solution, to me it is clear that what we need to do is enable the
target so that people can use it and then we/Asahi can comb through it
and reexamine things like this once the whole system is usable as a whole.

I've seen that Konrad has even started using the M1 infrastructure
to kickstart a few iPhone/iPad devices, so given how much hardware this
is (in absolute units) I think it's pretty important we get to usable ASAP.

Yours,
Linus Walleij
