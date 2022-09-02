Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA635AB4CA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 17:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235995AbiIBPO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 11:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235685AbiIBPOa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 11:14:30 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC54712BF69
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Vnhk6itStXchDrd7ur2XEWQrry6vGEvEtrt1TIk61yg=; b=tk089JTRyOa+oqUhdUXojRt8gL
        xezhZ87R40zjZo14rwukT86vLHr252QU0M1feUp0sMU7Ew94ScXENb3VOdty/MeHgs3ESPr9Sid4l
        chsG1n5fF4lMSIJ3NpzgPe40ERkoPnJTI5M637VwoL/tOD41sDH7hCuKZkdzNAb40ANk/Y8L2EckF
        igCZewrZDpDyuGyxpW9v2rHlEsIWlKhAell29icgK704vPuKmUxI7uGgBO2468xobeIVjsbDYBaTu
        XyUiyBqINQi6KZ3BK+IBoPoPPLp0CJRUlcj/R7vKXWRr3EVVdNHSNhlcYi7YyoKR2PfUvLf2/qR/M
        KC5IpKSQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34068)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oU7w6-0007c9-AF; Fri, 02 Sep 2022 15:46:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oU7w5-0004Vw-Hy; Fri, 02 Sep 2022 15:46:21 +0100
Date:   Fri, 2 Sep 2022 15:46:21 +0100
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
Message-ID: <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
 <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 04:39:16PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 2, 2022 at 2:33 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > > > +static int macsmc_gpio_nr(smc_key key)
> > > > > > +{
> > > > > > +       int low = hex_to_bin(key & 0xff);
> > > > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > > > +
> > > > > > +       if (low < 0 || high < 0)
> > > > > > +               return -1;
> > > > > > +
> > > > > > +       return low | (high << 4);
> > > > > > +}
> > > > >
> > > > > NIH hex2bin().
> > > >
> > > > Is using hex2bin really better?
> > >
> > > Yes.
> > >
> > > > static int macsmc_gpio_nr(smc_key key)
> > > > {
> > > >         char k[2];
> > > >         u8 result;
> > > >         int ret;
> > > >
> > > >         k[0] = key;
> > > >         k[1] = key >> 8;
> > > >
> > > >         ret = hex2bin(&result, k, 2);
> > > >         if (ret < 0)
> > > >                 return ret;
> > > >
> > > >         return result;
> > > > }
> > > >
> > > > This looks to me like it consumes more CPU cycles - because we have to
> > > > write each "character" to the stack, then call a function, only to then
> > > > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > > > because that will bring with it endian issues.
> > >
> > > With one detail missed, why do you need all that if you can use
> > > byteorder helpers()? What's the stack? Just replace this entire
> > > function with the respectful calls to hex2bin().
> >
> > Sorry, I don't understand what you're suggesting, because it doesn't
> > make sense to me. The byteorder helpers do not give a char array, which
> > is what hex2bin() wants, so we end up with something like:
> >
> >         __le16 foo = cpu_to_le16(key);
> >         u8 result;
> >
> >         ret = hex2bin(&result, (char *)&foo, 1);
> >         if (ret < 0)
> >                 return ret;
> >
> >         return result;
> >
> > This to me looks like yucky code, It still results in "foo" having to
> > be on the stack, because the out-of-line hex2bin() requires a pointer
> > to be passed as the second argument.
> >
> > Maybe you could provide an example of what you're thinking of, because
> > I'm at a loss to understand what you're thinking this should look like.
> 
> So, let's look into the real callers to see, oh wait, it's a single caller!
> Why can't you simply do
> 
>          ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);
>          if (ret < 0)
>                  return ret;
> 
> in-place there?

This is not legal C. Please can we back up this discussion, and start
over with legal C suggestions. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
