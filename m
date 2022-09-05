Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938815AD6A4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239039AbiIEPd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbiIEPdH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:33:07 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29BB6111E
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Pkv4WXNm7iE9vE05byre09zXOKz07p8cKrQykZtredI=; b=iFsIJjjSIt/lIDARm53CfftMma
        eLRKd3yzY0kSj9Mn2teC71wa+dCiE+wZ6l6XtUeKsdVhKMePTmuuAY+0vjJPzLi1D0uKB6gmrvBE1
        W89fZsyvBlwxsuSnhRv2TFR22hzSONJ8yc1Tih7XBolErF9kA+TUE0a8wkkeHAq1iUK0b1kI7XLYd
        KYSkjNPC4j6v2mDH3W07cXNj9ItUq3hFT12c5clkUvXI3gKQd8otKdxa4onDCiv4bbHX9mdo1Z428
        ycu+ULGq1TulWNzRPtUqECshbBEZZLmhIn7wA0pIsutCqRePJfS5U3u32LmpTkrLek0t2Z9O7yfAv
        +E1F74/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34122)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVE50-0002Yf-DN; Mon, 05 Sep 2022 16:32:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVE4y-0007OT-PL; Mon, 05 Sep 2022 16:32:04 +0100
Date:   Mon, 5 Sep 2022 16:32:04 +0100
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
Message-ID: <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
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
> 
> P.S. Do you have a platform to test all these?

Right, having addressed as many review comments as I possibly can, I've
rebuilt and booted it on the platform - and the good news is, it still
works _but_ I don't have enough support in the "mainline" kernel that
I'm testing for anything to make use of any of the interrupt support in
this patch set - so I can't actually test those changes.

I'm going to drop the interrupt patch temporarily as it's unnecessary
for what I want to do, which will be one less patch to worry about.

I still need a resolution between you and Hector over the smc_key
issue - specifically, do I pick up the patch that adds support for
%p4ch, or do we re-architect the smc_key thing and also in doing so
get rid of the need for your "endian conversion" thing.

Given that Hector has rejected some of your comments, I now need to
back out those changes that resulted from your NIH comments.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
