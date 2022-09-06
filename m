Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185845AE18C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 09:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238970AbiIFHrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 03:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238813AbiIFHrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 03:47:52 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737DF12754
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Xzv1rkXF3bUyuFREK5l/vsMAZch21PDPSsW27u7YLO0=; b=cakWJzSRaQWvLaWvUnaEFyBc0y
        BeNdsnCZf4udq1k0bMl0Nkc0F2xRwrEVEFJcW5dgdpu4RVwDsQzzcBbviIIAzX62k6ez2KyqJw8HQ
        8x0H9BXBWj0acElPGmDo88g7q05pN1CO7xzbx/RnfjHHPZRm5Zw6JyK5urWNvl+PJyQIApGxz6hoD
        exW11RMtYASRGNv4LVZgfPvCOz2zy7gDRbbu2W/S4A17/Dkscy2aLyUVlbqVI91rJf49vx86qnHlO
        EhD4O6GMHLPePQCUW+NtxvapqYekczqVC29xpJcmRAg/afmGvh8xFGelw+5UflHfV/tJeGDAqeKU1
        lLGy7GtA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34138)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVTJ3-0003ZF-Jp; Tue, 06 Sep 2022 08:47:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVTJ0-00086b-AC; Tue, 06 Sep 2022 08:47:34 +0100
Date:   Tue, 6 Sep 2022 08:47:34 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Hector Martin <marcan@marcan.st>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
Message-ID: <Yxb7Fm5hm5JF9JiA@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
 <9cf54921-c6a5-b328-6941-d1cbe086bcda@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cf54921-c6a5-b328-6941-d1cbe086bcda@marcan.st>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 04:00:31PM +0900, Hector Martin wrote:
> On 02/09/2022 22.21, Linus Walleij wrote:
> >> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> >> +       case IRQ_TYPE_LEVEL_HIGH:
> >> +               mode = IRQ_MODE_HIGH;
> >> +               break;
> >> +       case IRQ_TYPE_LEVEL_LOW:
> >> +               mode = IRQ_MODE_LOW;
> >> +               break;
> >> +       case IRQ_TYPE_EDGE_RISING:
> >> +               mode = IRQ_MODE_RISING;
> >> +               break;
> >> +       case IRQ_TYPE_EDGE_FALLING:
> >> +               mode = IRQ_MODE_FALLING;
> >> +               break;
> >> +       case IRQ_TYPE_EDGE_BOTH:
> >> +               mode = IRQ_MODE_BOTH;
> >> +               break;
> >> +       default:
> >> +               return -EINVAL;
> > 
> > I don't know how level IRQs would work on this essentially
> > message-passing process context interrupt. Maybe I am getting
> > it all wrong, but for level the line should be held low/high until
> > the IRQ is serviced, it would be possible to test if this actually
> > works by *not* servicing an IRQ and see if the SMC then sends
> > another message notifier for the same IRQ.
> > 
> > I strongly suspect that actually only edges are supported, but
> > there might be semantics I don't understand here.
> 
> IIRC that is exactly what happens - the SMC will re-fire the IRQ after
> the ACK if it is set to level mode and still at the active level.
> 
> I do remember testing all the modes carefully when implementing this to
> figure out what the precise semantics are, and I *think* I agonized over
> the flow handlers quite a bit and decided this way would work properly
> for all the modes, but it's been a while so I'd have to take a look
> again to convince myself again :)

Thanks for the clarification - I think it would be useful to put some
of that as comments before the CMD_IRQ_ACK write to head off any
questions about this in the future. Something like this maybe?

        /*
         * This is not an "ack" int he i8253 PIC sense - it is used for level
         * interrupts as well. The SMC will re-fire the interrupt event after
         * this ACK if the level interrupt is still active.
         */
        if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ACK | 1) < 0)
                dev_err(smcgp->dev, "GPIO IRQ ack failed for %p4ch\n", &key);

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
