Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F905AAC07
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbiIBKGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 06:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbiIBKF7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 06:05:59 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9317C5464D
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AH9jorqRscdJTuJaR2kWLhnyNOvRxsIijPyGrUq1awk=; b=a1xCK6n2tWQphxQp0uCMhdK3yX
        7XnpDvbVcxFBEu0djyukDCYEfY9pfpCJqVbHYPBlCKVpEm+S4E9r7MoocxVQJP9Fx7whJ1U8Nefre
        gYkMjJARvjYepo+S/ACuvcPbt3pTHysBNftBysVbo5ruZl3b7fcy9w2qXZCT01+yXtp4SduYpy12p
        zhR8JNiHA1hOBQb8fAxRVSSd/OIRPc9KUEOeWKafFhWAXRGrUIFhQjAfW73du+W+37tdUAe7BA/pS
        HyyoNwfScfQZ+MTn9F42WoFAvjp1FkFiZyY/oWttMkH0bdlWN6gOCxhwiq8JCQQXES7D/vNOy+kpu
        iexdnJWw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34060)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oU3YZ-0007HI-4I; Fri, 02 Sep 2022 11:05:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oU3YU-0004LB-TV; Fri, 02 Sep 2022 11:05:42 +0100
Date:   Fri, 2 Sep 2022 11:05:42 +0100
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
Message-ID: <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > +static int macsmc_gpio_nr(smc_key key)
> > +{
> > +       int low = hex_to_bin(key & 0xff);
> > +       int high = hex_to_bin((key >> 8) & 0xff);
> > +
> > +       if (low < 0 || high < 0)
> > +               return -1;
> > +
> > +       return low | (high << 4);
> > +}
> 
> NIH hex2bin().

Is using hex2bin really better?

static int macsmc_gpio_nr(smc_key key)
{
        char k[2];
        u8 result;
        int ret;

        k[0] = key;
        k[1] = key >> 8;

        ret = hex2bin(&result, k, 2);
        if (ret < 0)
                return ret;

        return result;
}

This looks to me like it consumes more CPU cycles - because we have to
write each "character" to the stack, then call a function, only to then
call the hex_to_bin() function. One can't just pass "key" into hex2bin
because that will bring with it endian issues.

> > +static int macsmc_gpio_key(unsigned int offset)
> > +{
> > +       return _SMC_KEY("gP\0\0") | (hex_asc_hi(offset) << 8) | hex_asc_lo(offset);
> > +}
> 
> NIH hex_byte_pack().

This would become:

	char buf[2];

	hex_byte_pack(buf, offset);

	return _SMC_KEY("gP\0\0") | buf[0] << 8 | buf[1];

to avoid the endian issues. It just seems to be a more complex way to
do the conversion. One could then argue that this is just a NIH
sprintf(), so it could then be written:

	char buf[5];

	snprintf(buf, sizeof(buf), "gP%02x", offset);

	return _SMC_KEY(buf);

which looks nicer, but involves a lot more code.

Since this is called for every GPIO operation, and you were worred above
about the layout of the macsmc_gpio structure (which is a micro-
optimisation), it seems weird to be concerned about the efficiency of
the structure layout and then suggest less efficient code in each of the
functional paths of the driver. There seems to be a contradiction.

> > +       /* First try reading the explicit pin mode register */
> > +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
> > +       if (!ret)
> > +               return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> > +
> > +       /*
> > +        * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
> > +        * Fall back to reading IRQ mode, which will only succeed for inputs.
> > +        */
> > +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
> > +       return (!ret) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> 
> What is the meaning of val in this case?

Reading the comment, it seems that "val" is irrelevant. I'm not sure that
needs explaining given there's a comment that's already explaining what
is going on here.

> > +       if (ret == GPIO_LINE_DIRECTION_OUT)
> > +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_OUTPUT, &val);
> > +       else
> > +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_INPUT, &val);
> 
> > +
> 
> Unnecessary blank line.

I think that's personal style preference, it isn't mentioned in the coding
style. However, the following is much nicer and likely produces better
code:

        if (ret == GPIO_LINE_DIRECTION_OUT)
                cmd = CMD_OUTPUT;
        else
                cmd = CMD_INPUT;

        ret = apple_smc_rw_u32(smcgp->smc, key, cmd, &val);
        if (ret < 0)
                return ret;

> > +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> > +       int count = apple_smc_get_key_count(smcgp->smc) - smcgp->first_index;
> 
> I would split this assignment and move it closer to the first user.
> 
> > +       int i;
> > +
> > +       if (count > MAX_GPIO)
> > +               count = MAX_GPIO;
> 
> Hmm... When can it be the case?

That's a question for the Asahi folk - it's not obvious whether it could
or could not be from the code. I think it depends on firmware.

> > +       bitmap_zero(valid_mask, ngpios);
> > +
> > +       for (i = 0; i < count; i++) {
> > +               smc_key key;
> > +               int gpio_nr;
> 
> > +               int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
> 
> Ditto.

What does "ditto" here mean, because I don't think you mean "Hmm...
When can it be the case?" and "I would split this assignment and move
it closer to the first user." doesn't seem to be relevant either.

> > +       pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");
> 
> Can we use fwnode APIs instead?
> Or do you really need this?

Ouch, that's not nice. I can change this to:

        fwnode = device_get_named_child_node(pdev->dev.parent, "gpio");
        device_set_node(&pdev->dev, fwnode);

but even that isn't _that_ nice. I'd like to hear comments from the Asahi
folk about whether these sub-blocks of the SMC can have compatibles, so
that the MFD layer can automatically fill in the firmware nodes on the
struct device before the probe function gets called.

If not, then I think it would be reasonable to have a discussion with
Lee about extending MFD to be able to have mfd cells name a child, so
that MFD can do the above instead of having it littered amongst drivers.

Thanks for the review.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
