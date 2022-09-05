Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79CEC5AD341
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 14:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiIEMsj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 08:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236482AbiIEMsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 08:48:20 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215852193
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DlTKHS6G48Jvz8ZvC+nITshL7IcXItL31hrNGopjg4I=; b=NbFYiTcoJ60fdLI7enMRMpA+01
        ng+eTTQ2Vk9t+6yYcFQDdby+WTY6aYLMop8g8rMYB9y49+vqfyW6wOWgcKVa0jYizA83m3yn2auPh
        YxEiZLOUySBNd2HuInLOuNHgOr0POe7ZKep6SRt1Cd8uN6hk8I4W4SbW21XPsNxTZC+rH9qXQ3WQk
        hmTPvWd08+6vzwjeZbBxmlz2xVmRgnSRS5CYI+JuA/PWY7xcH++Cq568xAVXWNzn0/GwtFvvkvc8F
        vElz7hEPJ8HjvKjPLwliAT6vg2iyflO+ctFFIsuFh7fr6Kxm32CrJdRsMSXybYJMEo5EM1cQ1F9j1
        xQgcosbA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34108)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVBVn-0002LO-QO; Mon, 05 Sep 2022 13:47:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVBVm-0007I0-5o; Mon, 05 Sep 2022 13:47:34 +0100
Date:   Mon, 5 Sep 2022 13:47:34 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
Message-ID: <YxXv5vL6XrlkK+K0@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 03:21:31PM +0200, Linus Walleij wrote:
> On Thu, Sep 1, 2022 at 3:54 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
> > +       DECLARE_BITMAP(irq_enable_shadow, MAX_GPIO);
> 
> Please rename irq_unmasked_shadow as it is tracking
> this and not what the irqchip core calls enabled/disabled.
> 
> > +       DECLARE_BITMAP(irq_enable, MAX_GPIO);
> 
> I think this state should be possible to set/get from the irqchip
> core. !irqd_irq_masked(d) on the descriptor, correct me if I'm wrong.

I think you're getting the two mixed up. irq_enable_shadow
(irq_unmasked_shadow) is updated from the ->irq_mask and ->irq_unmask
callbacaks, and will track !irqd_irq_masked(d) state. So, I think we
can get rid of irq_enable_shadow and just use !irqd_irq_masked(d).

The irq_enable bit array tracks the state on the SMC, and is used to
indicate whether we need to update that state when we unlock the bus
(which is when the driver talks to the SMC to reconfigure it.)

So, I think killing irq_enable_shadow and replacing irq_enable with
irq_unmasked would be correct - and going a bit further,
irq_smc_unmasked to show that it's the SMC's status.

> > +static int macsmc_gpio_event(struct notifier_block *nb, unsigned long event, void *data)
> > +{
> > +       struct macsmc_gpio *smcgp = container_of(nb, struct macsmc_gpio, nb);
> > +       u16 type = event >> 16;
> > +       u8 offset = (event >> 8) & 0xff;
> > +       smc_key key = macsmc_gpio_key(offset);
> > +       unsigned long flags;
> > +        int ret;
> > +
> > +       if (type != SMC_EV_GPIO)
> > +               return NOTIFY_DONE;
> > +
> > +       if (offset > MAX_GPIO) {
> > +               dev_err(smcgp->dev, "GPIO event index %d out of range\n", offset);
> > +               return NOTIFY_BAD;
> > +       }
> > +
> > +       local_irq_save(flags);
> > +       ret = generic_handle_domain_irq(smcgp->gc.irq.domain, offset);
> > +       local_irq_restore(flags);
> 
> Isn't irq_bus_lock/unlock protecting us here already?
> (I might be getting it wrong...)

Hmm, where does irq_bus_lock get called? Given this function is called
while running a blocking notifier chain, interrupts will not be
disabled on entry to this function. I haven't found a place in the maze
of irq handling code that generic_handle_domain_irq() would end up using
the bus lock/unlock functions - and if they did, with the above IRQ
saving, the kernel would WARN() about calling mutex_lock() with IRQs
disabled. So it doesn't.

This actually entirely negates any benefit of the kernel trying to mask
or unmask an interrupt in "hardware" while running the handler - since
macsmc_gpio_irq_bus_sync_unlock() won't be called, the state on the SMC
won't get touched.

> Since this is coming from a notifier and not an IRQ or threaded
> IRQ I actually am a bit puzzled on how to handle it... you probably
> know it better than me, maybe ask Marc Z if anything is
> unclear.

It's been years since I did any real platform porting work, so deep
knowledge of the IRQ subsystem has evaporated.

> > +       if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ACK | 1) < 0)
> > +               dev_err(smcgp->dev, "GPIO IRQ ack failed for %p4ch\n", &key);
> 
> isn't this one of those cases where we should implement the
> irqchip callback .irq_ack() specifically for this?
> 
> That callback will only be used by edge triggered IRQs but
> I guess that would realistically be all we support anyway?
> (See comment below on .set_type)

I would imagine it depends on how the SMC GPIO interrupt works -
whether the ACK is ACK as we know it in Linux (x86 PIC) or whether
it's ACK as in a notification to the SMC that we have finished
handling the interrupt and it can send us the next interrupt.

I suspect we don't know that level of detail of the platform, so
given that this is what the Asahi kernel does, that's the best we
have.

> > +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> > +       int offset = irqd_to_hwirq(d);
> > +       u32 mode;
> > +
> > +       if (!test_bit(offset, smcgp->irq_supported))
> > +               return -EINVAL;
> > +
> > +       switch (type & IRQ_TYPE_SENSE_MASK) {
> > +       case IRQ_TYPE_LEVEL_HIGH:
> > +               mode = IRQ_MODE_HIGH;
> > +               break;
> > +       case IRQ_TYPE_LEVEL_LOW:
> > +               mode = IRQ_MODE_LOW;
> > +               break;
> > +       case IRQ_TYPE_EDGE_RISING:
> > +               mode = IRQ_MODE_RISING;
> > +               break;
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               mode = IRQ_MODE_FALLING;
> > +               break;
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               mode = IRQ_MODE_BOTH;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> 
> I don't know how level IRQs would work on this essentially
> message-passing process context interrupt. Maybe I am getting
> it all wrong, but for level the line should be held low/high until
> the IRQ is serviced, it would be possible to test if this actually
> works by *not* servicing an IRQ and see if the SMC then sends
> another message notifier for the same IRQ.

If level IRQs are not supported, then it's strange that the Asahi
folk have been able to reverse engineer the CMD_IRQ_MODE codes for
these states.

Maybe the SMC issues another message for a level IRQ after it receives
a CMD_IRQ_ACK message if the level interrupt is still asserted?

> I strongly suspect that actually only edges are supported, but
> there might be semantics I don't understand here.
> 
> >         }
> >
> > +       smcgp->irq_mode_shadow[offset] = mode;
> 
> Hm yeah I guess this shadow mode is necessary for the sync
> to work.

Ineed.

> > +static void macsmc_gpio_irq_bus_sync_unlock(struct irq_data *d)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> > +       smc_key key = macsmc_gpio_key(irqd_to_hwirq(d));
> > +       int offset = irqd_to_hwirq(d);
> > +       bool val;
> > +
> > +       if (smcgp->irq_mode_shadow[offset] != smcgp->irq_mode[offset]) {
> > +               u32 cmd = CMD_IRQ_MODE | smcgp->irq_mode_shadow[offset];
> > +               if (apple_smc_write_u32(smcgp->smc, key, cmd) < 0)
> > +                       dev_err(smcgp->dev, "GPIO IRQ config failed for %p4ch = 0x%x\n", &key, cmd);
> > +               else
> > +                       smcgp->irq_mode_shadow[offset] = smcgp->irq_mode[offset];
> > +       }
> > +
> > +       val = test_bit(offset, smcgp->irq_enable_shadow);
> > +       if (test_bit(offset, smcgp->irq_enable) != val) {
> 
> So what you want to know for each line is (correct me if I'm wrong):
> - Is it enabled (unmasked) or not?
> - Did it get changed enabled->disabled, disabled->enabled since
>   macsmc_gpio_irq_bus_lock()?

I think you mean here "did the 'enable' state change between
macsmc_gpio_irq_bus_lock() and macsmc_gpio_irq_bus_unlock".

> Doesn't the irqchip core track the first part of this for you?
> irqd_irq_masked(d) should tell you the same thing as
> irq_enable, just inverted.
> 
> irq_enable_shadow is a bit tricker, I guess you might need that since
> the irqchip doesn't track state changes.

Yep, which is what I've said above in this reply where these bitmaps
are declared.

> >  static int macsmc_gpio_probe(struct platform_device *pdev)
> >  {
> >         struct macsmc_gpio *smcgp;
> > @@ -221,6 +365,18 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
> >         smcgp->gc.base = -1;
> >         smcgp->gc.parent = &pdev->dev;
> >
> > +       gpio_irq_chip_set_chip(&smcgp->gc.irq, &macsmc_gpio_irqchip);
> > +       smcgp->gc.irq.parent_handler = NULL;
> > +       smcgp->gc.irq.num_parents = 0;
> > +       smcgp->gc.irq.parents = NULL;
> > +       smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
> > +       smcgp->gc.irq.handler = handle_simple_irq;
> 
> I would consider setting this to handle_edge_irq() and implement
> .irq_ack(). I might be wrong.

I don't think that's suitable, because then we'll be calling irq_ack()
before the handler has run - and we won't be notifying the SMC that
the interrupt has been masked. So it could send another notification
for the same IRQ while it's still being handled. Then there's the
question about level IRQs as well.

I think, given that I don't know how the SMC works (presumably the
Asahi folk have a bit more of an idea, but that will be based on
reverse engineering effort) that I am not going to modify this driver's
behaviour drastically by changing the flow handler to the edge flow
handler from the simple flow. To me, that could well be a disaster
for this driver. That would be something for the Asahi folk to look
at.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
