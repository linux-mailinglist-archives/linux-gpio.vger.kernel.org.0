Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEEF5AD1E8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 13:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237309AbiIELzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 07:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbiIELzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 07:55:06 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0211A81C
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tMfQDlYvzFyFrUvYU5MebTEg/joFiQu8bqTpr1XujAw=; b=04vYN5g0hl4+pGbqsYuRhl/Mp4
        HBpYa+AHyQSSe+1ZoHG7g33gNm33rMi/lJcLzNdLmz7Q6nmgP9kaTOSoGBQWvKZ0tAluvSRGskeAE
        6D5+NbBkqEj9tEqNQlocq8J7lzNuY7lLv3dRVfCqOhAaJyor2i72wEvnkFrLC5NWKYHgiX9GUKKpD
        F6cGUeg7+Zg7g2WDqu9rq8KDo2Dgu4PjeW1fhnFCVa4fmTQg8fLixzXknMTUNEmh2Xr5mun2Jswws
        PGjLGDYjXAyo3Hqa4a+ebXPgL+7OhCu24UhdCbhHmfKKdc1fIHl4FFBjVJkn0vHvsCp8hYKZ4VQja
        35sY2EGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34104)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVAgn-0002IC-5O; Mon, 05 Sep 2022 12:54:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVAgk-0007Fm-IG; Mon, 05 Sep 2022 12:54:50 +0100
Date:   Mon, 5 Sep 2022 12:54:50 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
Message-ID: <YxXjimYiR+cxasgE@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CAHp75VfW7uj=+vwGRLsUJEjF-bQLL2EdVNfAnF6iDUqryksC+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfW7uj=+vwGRLsUJEjF-bQLL2EdVNfAnF6iDUqryksC+w@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 09:03:49PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
> > From: Hector Martin <marcan@marcan.st>
> >
> > Add IRQ support to the macsmc driver. This patch has updates from Joey
> > Gouly and Russell King.
> 
> ...
> 
> > +       u16 type = event >> 16;
> > +       u8 offset = (event >> 8) & 0xff;
> 
> The ' & 0xff' part is redundant.

It's probably also more logical to call this "hwirq".

> > +static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
...
> > +       if (!test_bit(offset, smcgp->irq_supported))
> > +               return -EINVAL;
> 
> We have a valid mask for IRQs. Can it be used here instead?

Looks like we can, thanks for the suggestion.

> > +       smcgp->irq_mode_shadow[offset] = mode;
> 
> Usually we want to have handle_bad_irq() handler by default and in
> ->set_type() we lock a handler depending on the flags. Why is this not
> the case in this driver?

"lock a handler" ? I guess you mean select a handler.

I don't see a reason why we couldn't switch between handle_bad_irq()
and handle_simple_irq(). I would guess (I don't know the implementation
details of the Apple platform) that the SMC forwards a message when the
IRQ happens, but I'm guessing that this is well tested on the platform
with the simple flow handler. Changing it to something else would need
discussion with the Asahi Linux folk.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
