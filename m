Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCFB5B23D7
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 18:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiIHQrB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 12:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIHQrA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 12:47:00 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235A9B4E9B;
        Thu,  8 Sep 2022 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qtQp5tdiILv0tGhvoMFeR9PrV87mSTbmJDKlZd+2Xwo=; b=HtKhJIlDKAJ/7ZH7a225FlpstI
        pLSoQwRGmhUTbEa9FpxQXUgJ8KKyQnjZSl2+gbWF163qf4Kp+/TBap7U+CpunKE/9z1RhKN+MJqCP
        x7mNm5EUPwoLf9yh/ILb/bp9T7s6WCO74zW9J4enwNCDdQ2jM40ofiq0th8YG6v17yHYf0o+9MUcG
        7rCkXOcIvvXmwIqTtz79cwHCarB8Qm8W7iDAATF/jy1o5tEWjXk0ugQ1fR9IJzlb0OjGDVqO07xU4
        u1rr9gaYFjNALrBWMs3VOfLFYWGDRM3Tae/Hpg4BxdvZMjZrSmBotW/dGxOclBz0bYf5IacabWd9G
        3XmNmVmQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34206)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oWKfv-0006nM-Gm; Thu, 08 Sep 2022 17:46:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oWKfq-0002DO-Ck; Thu, 08 Sep 2022 17:46:42 +0100
Date:   Thu, 8 Sep 2022 17:46:42 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 7/7] arm64: dts: apple: Add SMC node to t8103/t6001
 devicetrees
Message-ID: <Yxoccowow9avoZ/i@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUi-005Cmk-0R@rmk-PC.armlinux.org.uk>
 <8a94f2e6-f537-4e29-8375-e79b84524582@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a94f2e6-f537-4e29-8375-e79b84524582@www.fastmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 03:42:47PM +0200, Sven Peter wrote:
> 
> 
> On Tue, Sep 6, 2022, at 15:20, Russell King wrote:
> > From: Hector Martin <marcan@marcan.st>
> >
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  arch/arm64/boot/dts/apple/t8103.dtsi | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi 
> > b/arch/arm64/boot/dts/apple/t8103.dtsi
> > index 51a63b29d404..15c6023cf612 100644
> > --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> > +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> > @@ -336,6 +336,32 @@ wdt: watchdog@23d2b0000 {
> >  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
> >  		};
> > 
> > +		smc_mbox: mbox@23e408000 {
> > +			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
> > +			reg = <0x2 0x3e408000 0x0 0x4000>;
> > +			interrupt-parent = <&aic>;
> > +			interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
> > +				<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
> > +				<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
> > +				<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "send-empty", "send-not-empty",
> > +				"recv-empty", "recv-not-empty";
> > +			#mbox-cells = <0>;
> > +		};
> > +
> > +		smc: smc@23e400000 {
> 
> Usually we sort these nodes by their address to prevent merge conflicts.
> I guess it doesn't really matter here though since nothing will be between
> these two nodes.
> Either way,

If that's how the nodes should be sorted, let's do it now so we don't
end up with another patch that re-ordering this - I've made the change.

> Reviewed-by: Sven Peter <sven@svenpeter.dev>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
