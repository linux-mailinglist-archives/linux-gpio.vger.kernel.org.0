Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F3E6044BE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 14:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbiJSMOd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 08:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbiJSMOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 08:14:00 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13331A2086;
        Wed, 19 Oct 2022 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Hr6GqhiNot3Wp0AyCg0faopd7+PRJ3WvXflOrKZONA4=; b=YFxyjHqd72qFv1ZmqquSjQj3Ni
        D3wXXvK6M3WA1rk7s4+NX15Uz6XwiHA8v4FNuggbDx5WYXp54ANzsSwSuOZMgMQbrJixNWjYc5M9Y
        UIFKPUj4d16f7o4LNoZ2EyKDedNZAK/z6bu5xJpI2vvu2zpyFRVWjrxOjAarxcMzPsvpJ9NDMmblH
        P7L50yGZjjEqvCOICBap4c2fxBzrest7PZ4oh7k0nYwLCa6lw67T1MJkkxDCIsLXE9o+djXQEx5DX
        BmUCmODre+YPvgPq0s67x3crjTk2KRr4w0v9FlaReFO11py7jYHZ2DTuIRNfB0VHsgoZlYL3FXxL4
        zVAJ4jjw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34794)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ol7ZF-0005bK-1u; Wed, 19 Oct 2022 12:49:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ol7Z9-00027o-Rf; Wed, 19 Oct 2022 12:48:55 +0100
Date:   Wed, 19 Oct 2022 12:48:55 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Hector Martin <marcan@marcan.st>, Petr Mladek <pmladek@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y0/kJwpbvbeul8n3@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
 <Y0/Kt9CW5vYcxHhK@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0/Kt9CW5vYcxHhK@alley>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 12:00:23PM +0200, Petr Mladek wrote:
> On Tue 2022-09-06 14:19:44, Russell King wrote:
> > From: Hector Martin <marcan@marcan.st>
> > 
... 
> > +Generic FourCC code
> > +-------------------
> > +
> > +::
> > +	%p4c[hnbl]	gP00 (0x67503030)
> > +
> > +Print a generic FourCC code, as both ASCII characters and its numerical
> > +value as hexadecimal.
> > +
> > +The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to specify
> > +host, reversed, big or little endian order data respectively. Host endian
> > +order means the data is interpreted as a 32-bit integer and the most
> > +significant byte is printed first; that is, the character code as printed
> > +matches the byte order stored in memory on big-endian systems, and is reversed
> > +on little-endian systems.
> > +
> > +Passed by reference.
> > +
> > +Examples for a little-endian machine, given &(u32)0x67503030::
> > +
> > +	%p4ch	gP00 (0x67503030)
> > +	%p4cl	gP00 (0x67503030)
> > +	%p4cb	00Pg (0x30305067)
> > +	%p4cr	00Pg (0x30305067)
> 
> Nit: I would prefer to keep the same order (h,r,b,l) everywhere.
> 
>      I guess that you wanted to show exactly the same results next
>      to each other. But it is not the case on big-endian anyway.

This is straight from the Asahi kernel tree, and is unmodified. I'm
guessing you're use of "you" here refers to Hector rather than me.

So, Hector, any opinions on Petr's comments please?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
