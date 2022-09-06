Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0CCF5AF005
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 18:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238571AbiIFQMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 12:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiIFQMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 12:12:19 -0400
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA5B22B30;
        Tue,  6 Sep 2022 08:38:15 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id d845d1c6;
        Tue, 6 Sep 2022 17:38:12 +0200 (CEST)
Date:   Tue, 6 Sep 2022 17:38:12 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     marcan@marcan.st, linus.walleij@linaro.org, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
In-Reply-To: <YxdfOr6WCZiR3W1c@shell.armlinux.org.uk>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
 <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
 <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
 <YxdOafCWnDUNourH@shell.armlinux.org.uk>
 <f5bef359-3abe-311c-3521-136eb5b54c4b@marcan.st>
 <d3ced0ffaec45e3c@bloch.sibelius.xs4all.nl> <YxdfOr6WCZiR3W1c@shell.armlinux.org.uk>
Message-ID: <d3ced1bb5f8fd2e7@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Date: Tue, 6 Sep 2022 15:54:50 +0100
> From: "Russell King (Oracle)" <linux@armlinux.org.uk>
> 
> On Tue, Sep 06, 2022 at 04:25:49PM +0200, Mark Kettenis wrote:
> > > Date: Tue, 6 Sep 2022 22:53:47 +0900
> > > From: Hector Martin <marcan@marcan.st>
> > > 
> > > I agree that this is something to think about (I was about to reply on
> > > the subject).
> > > 
> > > I can think of two ways: using `reg` for the key name, but that feels
> > > icky since it's ASCII and not *really* a register number/address, or
> > > something like this:
> > > 
> > > gpio@0 {
> > > 	apple,smc-key-base = "gP00";
> > > 	...
> > > }
> > > 
> > > gpio@1 {
> > > 	apple,smc-key-base = "gp00";
> > > 	...
> > > }
> > 
> > This would still require us to add a (one-cell) "reg" property and
> > would require adding the appropriate "#address-cells" and
> > "#size-cells" properties to the SMC node.
> 
> Yes, and at that point, as I suggested, it probably would be better
> to use:
> 
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	gpio@67503030 {
> 		reg = <0x67503030>;
> 	};
> 
> 	gpio@67703030 {
> 		reg = <0x67703030>;
> 	};
> 
> Then the "reg" has a meaning that is directly related to the SMC.
> 
> > > But this ties back to the device enumeration too, since right now the DT
> > > does not drive that (we'd have to add the subdevice to the mfd subdevice
> > > list somehow anyway, if we don't switch to compatibles).
> > > 
> > > I'd love to hear Rob's opinion on this one, and also whether the
> > > existing Linux and OpenBSD code would currently find gpio@0 {} instead
> > > of gpio {} for backwards compat.
> > 
> > The OpenBSD driver does a lookup by name and the "@0" is part of that
> > name.  So that would break backwards compat.
> 
> Oh, that's annoying - and is a different behaviour to Linux.
> 
> On Linux, we only look at the node name up to the @ when matching (see
> of_node_name_eq() in drivers/of/base.c, so it doesn't matter to Linux
> what follows the @ when you try to look up a node named "gpio" - you'll
> find gpio@anythingyoulike.

So maybe I should change our code to match what Linux does.  OpenBSD
7.2 is scheduled for release on November 1st, and I can probably get
that change in quickly.  If we can hold off updating the device trees
in the Asahi installer until then the transition should be smooth
enough.

> > Maybe just name the slave GPIO controller "gpio-slave"?  If we add
> > compatibles, the compatibles for the nodes should propbably be
> > different such that we can switch to do a lookup by compatible?
> 
> I don't think the DT folk would be happy with "gpio-slave" because
> node names are supposed to be generic.

I don't think that rule applies to "named" sub-nodes like this where
the name is actually significant.  

> Also, "slave" probably isn't a good choice of name in this modern
> era given past history.

Yes, we don't have to follow Apple's terminology here.

> Rather than the above, we could use "reg" to indicate which GPIO
> controller we're talking about, and lookup the reg value in a table
> to give the key. So gpio@0, reg=<0> => gP00, gpio@1, reg=<1> => gp00.
> gpio@2, reg=<2> => whatever next.
> 
> That sounds like it won't break the existing OpenBSD.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
> 
