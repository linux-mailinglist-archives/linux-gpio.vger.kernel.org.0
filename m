Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992855AD46B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 16:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiIEOBY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 10:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbiIEOBW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 10:01:22 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D7811451
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qW4uWuqYty9830k7KIHKB9R/MT57mESr5dSsNRxxT84=; b=mj2QHemaB06jNqvSV4972xf50t
        /YCY815i/sPMNtawhaD5s819gmvJp8YgZqEVzoE7R9BZ9KaL/EF73dFZQNyU6z7Nj4EsegY6VutaO
        /b+7qWc4MuF5WvNbo9ibNqx9F4O18iNCn2R25wm8Aiv5DQGJR6CYmWueSpqnxPDlSNpNaeiCQRbL0
        Mrg+ou30IstehmK5PLUnJVxr3HohxMGMYpkTI1Q7bDg6duBkRYRtG9AR1C5Tm+QizipUPFELNErfp
        ACtIb2+RwnN17vgM8lYMH8kP9NW5Nyz67+h3GoO+/wWy0qF3QOERBVeYjli0Pglgpmud4N0LIjAwI
        v9BqtaxQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34114)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVCf1-0002Qw-Jb; Mon, 05 Sep 2022 15:01:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVCez-0007Kx-Tn; Mon, 05 Sep 2022 15:01:09 +0100
Date:   Mon, 5 Sep 2022 15:01:09 +0100
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
Message-ID: <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 05, 2022 at 04:16:27PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 4:10 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > Let me say again: I am not changing this. That's for Asahi people to
> > do if they wish. I am the just middle-man here.
> 
> While I agree on technical aspects, this mythical "they" is
> frustrating me. They haven't participated in this discussion (yet?) so
> they do not care, why should we (as a community of upstream)?

That's strange. I wonder. If they don't exist, then I wonder how Linus
is running Linux on aarch64 apple hardware. Maybe it's not me with a
problem here?

Hector has been promising to get involved in this discussion for a few
days now, his latest comment on IRC yesterday:

16:23 <@marcan> I'm going to allocate tuesday to playing the merge game (rmk:
                haven't forgotten about you either, IRQs today, but I'll get to
                it before tuesday):

So he is aware that he needs to respond - but like any central project
lead developer, he's probably exceedingly busy with other issues.

> P.S. Do you have a platform to test all these?

Yes, but that doesn't mean I can do testing sufficient to ensure that
the modifications are correct. As I understand things, the SMC is not
limited to just aarch64 hardware.

It doesn't mean that "if it boots it must be okay" is sufficient.

So, how about you stop insisting on changes until Hector can respond
to some of the questions raised; as I've said many times, you are
asking for stuff to be changed that is quite clearly in the realm of
decisions that the Asahi developer(s) have taken, and I have no right
to change them without reference to them - because I do not know this
platform well enough to make the decisions you're asking of me.

I'm not going to say that again; I'm going to start ignoring you if
you persist in demanding that I make these kinds of decisions, because
*you* leave me no other option but to do that... because *you* just
don't seem to be willing to accept that I need others to be involved
in these decisions.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
