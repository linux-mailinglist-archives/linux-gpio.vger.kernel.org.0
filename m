Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A125AD589
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 16:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237058AbiIEOx0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 10:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236851AbiIEOx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 10:53:26 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5FC4F19A
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lohxd6KoW6VP7FqXBwIx639duA5+/bjY4xwpjIPppB8=; b=JkKQj+XZzyWPMsdiTZzaKXfAww
        S/ghG8GoAym+sj6oIUn0M4TRrcHOauNjJTAZhg8jScjUFQV2Ryti32g293RciCpayETjPXKfJVVW+
        j7F8zqrOFZFUEVGzbYDnuPYse/dgqvJBA3F8zGFylqpQ5oTkVqxigxI8kswKEjpuWJskRkQrujrJi
        Xc2NhjXEoMpvkFPB1hJbrO3V6lAaIqS/2zF33hPc4jFHlHeetseNd4Kyh/do4WBCs0zIMc96VgwXa
        kWz8u3wDKPc0qR/X3lcHzeSU4+gnkV+w/ybYalN+5BZOye+RFBuKyvZEIn3yzdFCrmf+rZlsx1QDR
        RcY1cxZw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34118)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVDTR-0002V3-5Z; Mon, 05 Sep 2022 15:53:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVDTP-0007N9-Ey; Mon, 05 Sep 2022 15:53:15 +0100
Date:   Mon, 5 Sep 2022 15:53:15 +0100
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
Message-ID: <YxYNW5xITCTAO9iJ@shell.armlinux.org.uk>
References: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
 <YxYBeMz8nIIA+1P/@shell.armlinux.org.uk>
 <CAHp75VdYevopN673hqg7Tau4Fouythq7OAeDDJP4C4fh7KgYyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdYevopN673hqg7Tau4Fouythq7OAeDDJP4C4fh7KgYyw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 05, 2022 at 05:42:46PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 5:02 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Mon, Sep 05, 2022 at 03:01:09PM +0100, Russell King (Oracle) wrote:
> 
> ...
> 
> > Oh, and another thing. Your behaviour on this is making me regret
> > trying to get involved in improving the upstream support for this
> > platform.
> 
> Taking into account that technical aspects quite likely are not the
> cause, what did you expect to be different?

How about the decency to wait for the Asahi developers to respond,
which they now have - but I haven't read it yet. How about some
understanding that I might not have all the answers. How about some
understanding that the issue with the SMC Keys is bigger than just
the one driver, and that cpu_to_whatever may not be appropriate.
How about some understanding and patience on your part?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
