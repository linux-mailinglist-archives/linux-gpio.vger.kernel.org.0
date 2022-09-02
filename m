Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE58E5AADC2
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 13:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbiIBLeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 07:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiIBLeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 07:34:02 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D8BD3E44
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Hq0LX13LwQpV6w1/cAA1LP3HNXbiwzvAT6ANsep3nts=; b=CJbiH0xvYlcm2D83VOgLMaNtJH
        X/OfH+1YthtASPbyovJkUAw+MF6bzRW5I259qQxqFDn5pEYQMZdAxdLJtxoXziCbauLDEZFhISoYd
        G+DyCIvJSD6UQ2AbEDUqhZyTSV67QjxRwnPmeahLCdMUfImC+c1HvjY55GW9TnoLyk96ZMkLKz7Lw
        jUfu8/voWV761fziifwu7f8haQI9Ie9t5gExvQj3ddcyOfAK1F9JWPfu6hXqu1pPVFyS9YSPySIo0
        +EgHUsuPGf9jzvUAiVoIwWlPMz1RauG5s7M8CoOTuNZtTiznycHB194Yq3p2yFxEQOcs4S1/nHku8
        Gqrpn3jw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34062)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oU4uy-0007OL-3s; Fri, 02 Sep 2022 12:33:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oU4uv-0004Oa-0H; Fri, 02 Sep 2022 12:32:57 +0100
Date:   Fri, 2 Sep 2022 12:32:56 +0100
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
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
 <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > +static int macsmc_gpio_nr(smc_key key)
> > > > +{
> > > > +       int low = hex_to_bin(key & 0xff);
> > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > +
> > > > +       if (low < 0 || high < 0)
> > > > +               return -1;
> > > > +
> > > > +       return low | (high << 4);
> > > > +}
> > >
> > > NIH hex2bin().
> >
> > Is using hex2bin really better?
> 
> Yes.
> 
> > static int macsmc_gpio_nr(smc_key key)
> > {
> >         char k[2];
> >         u8 result;
> >         int ret;
> >
> >         k[0] = key;
> >         k[1] = key >> 8;
> >
> >         ret = hex2bin(&result, k, 2);
> >         if (ret < 0)
> >                 return ret;
> >
> >         return result;
> > }
> >
> > This looks to me like it consumes more CPU cycles - because we have to
> > write each "character" to the stack, then call a function, only to then
> > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > because that will bring with it endian issues.
> 
> With one detail missed, why do you need all that if you can use
> byteorder helpers()? What's the stack? Just replace this entire
> function with the respectful calls to hex2bin().

Sorry, I don't understand what you're suggesting, because it doesn't
make sense to me. The byteorder helpers do not give a char array, which
is what hex2bin() wants, so we end up with something like:

	__le16 foo = cpu_to_le16(key);
	u8 result;

	ret = hex2bin(&result, (char *)&foo, 1);
	if (ret < 0)
		return ret;

	return result;

This to me looks like yucky code, It still results in "foo" having to
be on the stack, because the out-of-line hex2bin() requires a pointer
to be passed as the second argument.

Maybe you could provide an example of what you're thinking of, because
I'm at a loss to understand what you're thinking this should look like.

> > > > +       /* First try reading the explicit pin mode register */
> > > > +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
> > > > +       if (!ret)
> > > > +               return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> > > > +
> > > > +       /*
> > > > +        * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
> > > > +        * Fall back to reading IRQ mode, which will only succeed for inputs.
> > > > +        */
> > > > +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
> > > > +       return (!ret) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> > >
> > > What is the meaning of val in this case?
> >
> > Reading the comment, it seems that "val" is irrelevant. I'm not sure that
> > needs explaining given there's a comment that's already explaining what
> > is going on here.
> 
> OK.
> Just convert then (!ret) --> ret.

Already done, thanks.

> > > > +       pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");
> > >
> > > Can we use fwnode APIs instead?
> > > Or do you really need this?
> >
> > Ouch, that's not nice. I can change this to:
> 
> (Some background on why my eye caught this. We as GPIO SIG in the
> kernel want to move the library to be fwnode one without looking into
> the underneath property provider. This kind of lines makes driver look
> a bit ugly from that perspective)

I agree, I'd prefer it not to be there.

> >         fwnode = device_get_named_child_node(pdev->dev.parent, "gpio");
> >         device_set_node(&pdev->dev, fwnode);
> >
> > but even that isn't _that_ nice. I'd like to hear comments from the Asahi
> > folk about whether these sub-blocks of the SMC can have compatibles, so
> > that the MFD layer can automatically fill in the firmware nodes on the
> > struct device before the probe function gets called.
> 
> > If not, then I think it would be reasonable to have a discussion with
> > Lee about extending MFD to be able to have mfd cells name a child, so
> > that MFD can do the above instead of having it littered amongst drivers.
> 
> MFD cells can be matched by compatible strings.

Yes, that's what I meant in my preceeding paragraph above, but it needs
involvement and decisions from the Asahi maintainers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
