Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAF45AD007
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 12:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237022AbiIEKWJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 06:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237548AbiIEKVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 06:21:40 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABADE543D0
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=B2NN3F0SgNcJQB7qPmxsMNll5XZyS6PCmgX79g4KLAA=; b=sA6vVyzRHhcOZhNiv0IGi8IgLl
        o+Q21puUj5QyRZQiOoUQGZgShJE4k4cuxaCjE1rhYRBtYTjsm3XB/ES7HdgDji3lFbePnuANm8wlq
        auW67Y7PDbf4e9btsXWiNMBk5rm7FKfj4h5yiJVK4S9x5RqFo1kkNUBYqWwx0x0k7NlgUQNBHfL7U
        uWjbWUiDouhrBj+FzU1bZIOS9YVJc+iQsTlWKmWZAGGnmEd8qCqdeqDXa6sSZJhS6itwOMTY5tWxS
        0aW4fP3gCUKGdmrbVYoa6PvoMKrOE9H6ySCt1P9N04awodh13PQKB47tomM+tPng7fZk9LEtCVT9O
        bSRC/drA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34098)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oV9DP-0002BM-Dy; Mon, 05 Sep 2022 11:20:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oV9DL-0007CU-Ua; Mon, 05 Sep 2022 11:20:23 +0100
Date:   Mon, 5 Sep 2022 11:20:23 +0100
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
Message-ID: <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
References: <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
 <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 06:43:36PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 2, 2022 at 6:34 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Sep 02, 2022 at 05:53:25PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 2, 2022 at 5:46 PM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > > On Fri, Sep 02, 2022 at 04:39:16PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Sep 2, 2022 at 2:33 PM Russell King (Oracle)
> > > > > <linux@armlinux.org.uk> wrote:
> > > > > > On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> > > > > > > On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> > > > > > > <linux@armlinux.org.uk> wrote:
> > > > > > > > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > > > > > > > +static int macsmc_gpio_nr(smc_key key)
> > > > > > > > > > +{
> > > > > > > > > > +       int low = hex_to_bin(key & 0xff);
> > > > > > > > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > > > > > > > +
> > > > > > > > > > +       if (low < 0 || high < 0)
> > > > > > > > > > +               return -1;
> > > > > > > > > > +
> > > > > > > > > > +       return low | (high << 4);
> > > > > > > > > > +}
> > > > > > > > >
> > > > > > > > > NIH hex2bin().
> > > > > > > >
> > > > > > > > Is using hex2bin really better?
> > > > > > >
> > > > > > > Yes.
> > > > > > >
> > > > > > > > static int macsmc_gpio_nr(smc_key key)
> > > > > > > > {
> > > > > > > >         char k[2];
> > > > > > > >         u8 result;
> > > > > > > >         int ret;
> > > > > > > >
> > > > > > > >         k[0] = key;
> > > > > > > >         k[1] = key >> 8;
> > > > > > > >
> > > > > > > >         ret = hex2bin(&result, k, 2);
> > > > > > > >         if (ret < 0)
> > > > > > > >                 return ret;
> > > > > > > >
> > > > > > > >         return result;
> > > > > > > > }
> > > > > > > >
> > > > > > > > This looks to me like it consumes more CPU cycles - because we have to
> > > > > > > > write each "character" to the stack, then call a function, only to then
> > > > > > > > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > > > > > > > because that will bring with it endian issues.
> > > > > > >
> > > > > > > With one detail missed, why do you need all that if you can use
> > > > > > > byteorder helpers()? What's the stack? Just replace this entire
> > > > > > > function with the respectful calls to hex2bin().
> > > > > >
> > > > > > Sorry, I don't understand what you're suggesting, because it doesn't
> > > > > > make sense to me. The byteorder helpers do not give a char array, which
> > > > > > is what hex2bin() wants, so we end up with something like:
> > > > > >
> > > > > >         __le16 foo = cpu_to_le16(key);
> > > > > >         u8 result;
> > > > > >
> > > > > >         ret = hex2bin(&result, (char *)&foo, 1);
> > > > > >         if (ret < 0)
> > > > > >                 return ret;
> > > > > >
> > > > > >         return result;
> > > > > >
> > > > > > This to me looks like yucky code, It still results in "foo" having to
> > > > > > be on the stack, because the out-of-line hex2bin() requires a pointer
> > > > > > to be passed as the second argument.
> > > > > >
> > > > > > Maybe you could provide an example of what you're thinking of, because
> > > > > > I'm at a loss to understand what you're thinking this should look like.
> > > > >
> > > > > So, let's look into the real callers to see, oh wait, it's a single caller!
> > > > > Why can't you simply do
> > > > >
> > > > >          ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);
> > > > >          if (ret < 0)
> > > > >                  return ret;
> > > > >
> > > > > in-place there?
> > > >
> > > > This is not legal C.
> > >
> > > I acknowledged this, sorry.
> > >
> > > > Please can we back up this discussion, and start
> > > > over with legal C suggestions. Thanks.
> > >
> > > Suggestion was given as well, let's create a helper used by apple
> > > stuff and later on we will consider the separate submission for the
> > > (new) specifier. Would it work for you?
> >
> > This sub-thread isn't about the %p4ch specifier. It's about a
> > reasonable implementation of macsmc_gpio_nr().
> >
> > Extracting from the context above, the original code was:
> >
> > static int macsmc_gpio_nr(smc_key key)
> > {
> >        int low = hex_to_bin(key & 0xff);
> >        int high = hex_to_bin((key >> 8) & 0xff);
> >
> >        if (low < 0 || high < 0)
> >                return -1;
> >
> >        return low | (high << 4);
> > }
> >
> > I suggested:
> >
> > static int macsmc_gpio_nr(smc_key key)
> > {
> >          char k[2];
> >          u8 result;
> >          int ret;
> >
> >          k[0] = key;
> >          k[1] = key >> 8;
> >
> >          ret = hex2bin(&result, k, 2);
> >          if (ret < 0)
> >                  return ret;
> >
> >          return result;
> > }
> >
> > You didn't like that, so I then suggested:
> >
> > static int macsmc_gpio_nr(smc_key key)
> > {
> >          __le16 foo = cpu_to_le16(key);
> >          u8 result;
> >          int ret;
> >
> >          ret = hex2bin(&result, (char *)&foo, 1);
> >          if (ret < 0)
> >                  return ret;
> >
> >          return result;
> > }
> >
> > which you also didn't like,
> 
> ...based on the wrong suggestion below. That said, the above is fine to me.

To be honest, using the endian conversion macro there doesn't feel
right and is more prone to programming errors. I can't tell just by
looking at it that either cpu_to_le16() or cpu_to_le32() would be the
right thing here - and if it's not obvious then it's a bug waiting to
happen.

As if to prove the point, the above suggestions turn out to *all* be
buggy.

The initial suggestion gets the k[0] and k[1] assignment round the
wrong way. The second, le16() is definitely not the right conversion.
If we start using the endian conversion macros, then this is going to
screw up if someone runs a BE kernel against the SMC (since the
_SMC_KEY() macro will still be doing its conversion.)

This seems utterly counter-productive, and I've spent quite a long
time trying to work out what would be correct.

At this point, I'm not sure that changing what has already been
established in the Asahi Linux tree for something entirely different
in mainline is going to be practical - it's a recipe for repeated
mistakes converting keys from the Asahi kernel to the mainline
kernel.

It's not _just_ the GPIO driver. There are multiple other drivers
that will be impacted by changing the scheme here.

Any change to the scheme for these SMC keys  needs to happen in the
Asahi kernel tree by the Asahi Linux maintainers, not by someone
pushing the code upstream - doing so would be a recipe for repeated
trainwrecks.

So, I'm going with my first suggestion for the hex2bin() conversion
above, and adding a comment thusly:

        /*
         * The most significant nibble comes from k[0] and key bits 15..8
         * The least significant nibble comes from k[1] and key bits 7..0
         */
        k[0] = key >> 8;
        k[1] = key;

because I needed the comment to prove to myself that I wasn't breaking
this code. Maybe it's obvious to you, but it isn't obvious to everyone.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
