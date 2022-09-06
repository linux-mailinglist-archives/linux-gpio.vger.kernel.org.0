Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F9B5AEF2E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 17:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbiIFPpD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 11:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbiIFPop (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 11:44:45 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9527C7C18F;
        Tue,  6 Sep 2022 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IxHPfBCP2CpLZRT9ntq72Ese30Gg1dkwTLZfDlMlcIw=; b=bAmile2FOqrXZWl7fHvXhgVaHs
        C8U1pA4+5gO+0yuIioGju5Ac4kbxX8+Quj1lq/PnkiwI55Vz82xk7NOzk2NnS3OX0p95gPLBgJBM5
        KlgGZCyK74cUtREq06P4PNdcyRM9O3UmY3fXm28A8yr5ekMYLWCaQPzX4XluRaQtbIqV56kFGhshR
        FRJrO6DqWjCWctO+hU5jM6T/fTZ547B92OVD4y958QPbG/ykzXJsfkTm2ESiqbJFw2i+QRDfk/kre
        7hrJF1AeNufpFscy5pQDPwh4sfvZE0h9K09FuAn1kg3RIryx692gV0efECX1MwzjvVzaA7Pwo6CAP
        tz36xgJw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34150)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVZyX-00043I-MF; Tue, 06 Sep 2022 15:54:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVZyU-0008LZ-M4; Tue, 06 Sep 2022 15:54:50 +0100
Date:   Tue, 6 Sep 2022 15:54:50 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     Hector Martin <marcan@marcan.st>, linus.walleij@linaro.org,
        robh@kernel.org, krzysztof.kozlowski@linaro.org, arnd@arndb.de,
        lee@kernel.org, alyssa@rosenzweig.io, asahi@lists.linux.dev,
        brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, sven@svenpeter.dev,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <YxdfOr6WCZiR3W1c@shell.armlinux.org.uk>
References: <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
 <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
 <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
 <YxdOafCWnDUNourH@shell.armlinux.org.uk>
 <f5bef359-3abe-311c-3521-136eb5b54c4b@marcan.st>
 <d3ced0ffaec45e3c@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3ced0ffaec45e3c@bloch.sibelius.xs4all.nl>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 04:25:49PM +0200, Mark Kettenis wrote:
> > Date: Tue, 6 Sep 2022 22:53:47 +0900
> > From: Hector Martin <marcan@marcan.st>
> > 
> > I agree that this is something to think about (I was about to reply on
> > the subject).
> > 
> > I can think of two ways: using `reg` for the key name, but that feels
> > icky since it's ASCII and not *really* a register number/address, or
> > something like this:
> > 
> > gpio@0 {
> > 	apple,smc-key-base = "gP00";
> > 	...
> > }
> > 
> > gpio@1 {
> > 	apple,smc-key-base = "gp00";
> > 	...
> > }
> 
> This would still require us to add a (one-cell) "reg" property and
> would require adding the appropriate "#address-cells" and
> "#size-cells" properties to the SMC node.

Yes, and at that point, as I suggested, it probably would be better
to use:

	#address-cells = <1>;
	#size-cells = <0>;

	gpio@67503030 {
		reg = <0x67503030>;
	};

	gpio@67703030 {
		reg = <0x67703030>;
	};

Then the "reg" has a meaning that is directly related to the SMC.

> > But this ties back to the device enumeration too, since right now the DT
> > does not drive that (we'd have to add the subdevice to the mfd subdevice
> > list somehow anyway, if we don't switch to compatibles).
> > 
> > I'd love to hear Rob's opinion on this one, and also whether the
> > existing Linux and OpenBSD code would currently find gpio@0 {} instead
> > of gpio {} for backwards compat.
> 
> The OpenBSD driver does a lookup by name and the "@0" is part of that
> name.  So that would break backwards compat.

Oh, that's annoying - and is a different behaviour to Linux.

On Linux, we only look at the node name up to the @ when matching (see
of_node_name_eq() in drivers/of/base.c, so it doesn't matter to Linux
what follows the @ when you try to look up a node named "gpio" - you'll
find gpio@anythingyoulike.

> Maybe just name the slave GPIO controller "gpio-slave"?  If we add
> compatibles, the compatibles for the nodes should propbably be
> different such that we can switch to do a lookup by compatible?

I don't think the DT folk would be happy with "gpio-slave" because
node names are supposed to be generic. Also, "slave" probably isn't
a good choice of name in this modern era given past history.

Rather than the above, we could use "reg" to indicate which GPIO
controller we're talking about, and lookup the reg value in a table
to give the key. So gpio@0, reg=<0> => gP00, gpio@1, reg=<1> => gp00.
gpio@2, reg=<2> => whatever next.

That sounds like it won't break the existing OpenBSD.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
