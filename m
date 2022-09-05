Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3C95AD737
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 18:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbiIEQNs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 12:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiIEQNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 12:13:46 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B51853D33
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 09:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=d20l+s9+Ca9A0gE+lSS4kP0nGq3Os8mJXmbjxDpatFM=; b=TzOLwYAFjjDTSQsGdQuFPWusFL
        p4JIYc/5a3gWO59XRiC/YzYlQSyiUwiLBqIJV6ssptjwndZpsPMR4VGFtyAGBHm/g38lMQZeIUS7H
        0PmOHgHVZanw9J+qfSwyPapiP64+cd4A6VCJDlQQseicl0ZbYiUkl/RfLv24K/kCUYY/1wlJbfl0y
        gfJvM0VSV5H8BlPAUZVw6rks61xTDSano+pI4LrdksA5HOlxni9TBKqROBUNeuO1ATTdlpDoOBC7K
        pyxwYDiWc59WAqHjCxSGNR8k8PP9G9X2m7pP33ZMTMlVsOdUargVY2ylsvkOZhOkTGF7+w7F5qelE
        6gc9gifQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34126)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVEjB-0002bW-F6; Mon, 05 Sep 2022 17:13:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVEj9-0007QT-PO; Mon, 05 Sep 2022 17:13:35 +0100
Date:   Mon, 5 Sep 2022 17:13:35 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Hector Martin <marcan@marcan.st>
Cc:     Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <YxYgL+MAJ7oUmLQd@shell.armlinux.org.uk>
References: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
 <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
 <57c02bdd-4f98-40f7-22a9-4f39508159e8@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57c02bdd-4f98-40f7-22a9-4f39508159e8@marcan.st>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 12:58:48AM +0900, Hector Martin wrote:
> On 06/09/2022 00.44, Martin Povišer wrote:
> > 
> >> On 5. 9. 2022, at 17:32, Russell King (Oracle) <linux@armlinux.org.uk> wrote:
> > 
> >> I still need a resolution between you and Hector over the smc_key
> >> issue - specifically, do I pick up the patch that adds support for
> >> %p4ch, or do we re-architect the smc_key thing and also in doing so
> >> get rid of the need for your "endian conversion" thing.
> > 
> > Idea about the %p4ch thing: We will leave the keys true
> > to their nature (i.e. 32-bit integer), and at least initially
> > for the prints we will employ macros
> > 
> > #define SMC_KEYFMT “%c%c%c%c”
> > #define SMC_KEYFMT_VAL(val) (val)>>24,(val)>>16,(val)>>8,(val)
> > 
> > used like
> > 
> > printk(“blah blah” SMC_KEYFMT “ blah\n”, SMC_KEYFMT_VAL(key));
> > 
> > This has the nice property that it is pretty much like the specifier,
> > and later can be easily replaced with the real thing.
> 
> Not the prettiest, but I'll take this over trying to mess around with
> string buffer conversions or anything involving non-native endianness if
> the printk specifier patch is going to be controversial.
> 
> I'd prefer shorter macro names though, like SMC_KFMT/SMC_KVAL(), to
> avoid further lengthening already-long printk lines.

I suggest that I try resubmitting the series with IRQ support dropped,
and with the %p4ch support in it and we'll see what happens. If %p4ch
gets accepted, then changing it would be adding extra work. In any
case, these %p... format extensions are supposed to avoid yucky stuff
such as the above.

Andy's objection to %p4ch was predicated on using the illegal C of
&cpu_to_be32(key) which has been shown to have been a waste of time.

For reference for those reading this, %p4ch doesn't print only print
the key as characters, it prints the hex value as well. For example:

macsmc-rtkit 23e400000.smc: Initialized (922 keys #KEY (0x234b4559)..zETM (0x7a45544d))
                                                  ^^^^^^^^^^^^^^^^^  ^^^^^^^^^^^^^^^^^
macsmc-gpio macsmc-gpio: First GPIO key: gP01 (0x67503031)
                                         ^^^^^^^^^^^^^^^^^

The underlined strings is the output from %p4ch.

So, even if Andy's cpu_to_be32() idea was legal C, it wouldn't be
functionally the same without adding extra code to every place that
one of these keys is printed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
