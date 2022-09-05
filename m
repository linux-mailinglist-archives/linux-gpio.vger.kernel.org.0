Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40265AD6FC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiIEP43 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbiIEP42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:56:28 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BA152FD6
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kZg5uA3NvW7M7kk4PRkFU4UyLnROUP61ZJaJXsOBBEo=; b=VLyLuwA1tFcxzSz5m1owrQ9SSG
        1uFDPGLtF/3pG6dC0PmQATM6h2RAkN6S4MbQfRJYkanAkhrWbmT3CBSsxL/9x7NF6WO7RfFycCBiy
        pQHmBd11mbCyUmbTk58o2QDqO8J0plXwZcAbqFqGYNgXFI5d+eawnlHjWrBHUb2lxDUvddBp9Nixu
        t3CzEnKxDCvGCb645ZFfPYK2bKBIdFyB98mv+z++BASQfeTPi5tSt5MECRrIwljZDbDta6xOeOGJb
        xCLLB/NUmQJzl86R/+TFPXGCAnfN5LKCW18r1/zw+HP0dV3pJ7bxJRF5IUOR83b+MXJdixbiQ4TEc
        alvPtAIg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34124)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVESQ-0002aF-VR; Mon, 05 Sep 2022 16:56:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVESO-0007PT-SF; Mon, 05 Sep 2022 16:56:16 +0100
Date:   Mon, 5 Sep 2022 16:56:16 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Hector Martin <marcan@marcan.st>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <YxYcICU3JiI3lbOu@shell.armlinux.org.uk>
References: <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
 <0457bda4-8449-dede-1d85-e4e1317dff12@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0457bda4-8449-dede-1d85-e4e1317dff12@marcan.st>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 12:52:48AM +0900, Hector Martin wrote:
> On 05/09/2022 23.01, Russell King (Oracle) wrote:
> > On Mon, Sep 05, 2022 at 04:16:27PM +0300, Andy Shevchenko wrote:
> >> P.S. Do you have a platform to test all these?
> > 
> > Yes, but that doesn't mean I can do testing sufficient to ensure that
> > the modifications are correct. As I understand things, the SMC is not
> > limited to just aarch64 hardware.
> 
> FWIW, the RTKit backend is limited to aarch64 hardware, and that's also
> why I kept all the endian-munging there. T2 and legacy x86 backends
> (which don't exist yet, so whether things need changing for those
> platforms is an open question anyway) would respectively do whatever
> endian-munging is appropriate for them.
> 
> So at this point, only Apple Mx AArch64 SoCs matter, though I *tried* to
> write the code in the way that I thought was most likely to cleanly
> transfer over to other SMC platforms by just changing the backend code.

Right, and that's a good argument not to go and change the smc_key
layout... that invites one hell of a big headache (also for the
reasons you've set out in one of your previous replies.)

I'm going to back out the hex2bin conversion; you've made a good
argument why the code is the way it is. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
