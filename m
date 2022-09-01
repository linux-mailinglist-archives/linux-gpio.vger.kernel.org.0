Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92145A9B55
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbiIAPNK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbiIAPNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:13:09 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA8085FAE;
        Thu,  1 Sep 2022 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7/CPUX/ynohOIeOlrrCDAduWf8K/FPNJKtQygx9Ka8s=; b=juSZdZGS4bX9rnvdMqR/Hfpr3G
        arfHNxdZolfPYmWDH4tAtE6ttCm5jfJ0RVqWmsxe99WEA+OkKfVoi/xrwFRWCqnaBJz8kOeuK74Ps
        dx9gKD7nbZ80NQ7HSiH523esNkX+otgpweGSJxZJTknSs/Og6DOR1/8+kyDXDgXJeUz00uncAhPdg
        Xy/FHzV9VTZeCaEMd43pINKdupH/4yKx2PCBSr2Btp7chL2sORFGQbjSAotiIq9udFb2yh/DBsSH4
        9Xv764w9NUsUToE1vvZlv4+DQqIvVn0ObzR9OcY846L1KaOZbQAbSUZIBQjiRluLiQ7KAEk/OmFyu
        BasqDYbQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34040)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oTlsJ-00067A-CL; Thu, 01 Sep 2022 16:12:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oTlsH-0003Ym-5L; Thu, 01 Sep 2022 16:12:57 +0100
Date:   Thu, 1 Sep 2022 16:12:57 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 06:06:17PM +0300, Krzysztof Kozlowski wrote:
> On 01/09/2022 16:54, Russell King (Oracle) wrote:
> > Add a DT binding for the Apple Mac System Management Controller.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > +
> > +maintainers:
> > +  - Hector Martin <marcan@marcan.st>
> > +
> > +description:
> > +  Apple Mac System Management Controller implements various functions
> > +  such as GPIO, RTC, power, reboot.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - apple,t8103-smc
> 
> You miss two spaces of indentation on this level.

Should that be picked up by the dt checker?

> > +        - apple,t8112-smc
> > +        - apple,t6000-smc
> 
> Bring some order here - either alphabetical or by date of release (as in
> other Apple schemas). I think t6000 was before t8112, so it's none of
> that orders.

Ok.

> > +      - const: apple,smc
> > +
> > +  reg:
> > +    description: Two regions, one for the SMC area and one for the SRAM area.
> 
> You need constraints for size/order, so in this context list with
> described items.

How do I do that? I tried maxItems/minItems set to 2, but the dt checker
objected to it.

> > +  reg-names:
> > +    items:
> > +      - const: smc
> > +      - const: sram
> > +
> > +  mboxes:
> > +    description:
> > +      A phandle to the mailbox channel
> 
> Missing maxItems

Ok. Would be helpful if the dt checker identified that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
