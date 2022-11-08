Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285EA621F3A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 23:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiKHW02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 17:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiKHW0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 17:26:14 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5D36D4E0;
        Tue,  8 Nov 2022 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zYyanDMS7UJb84EtdS7cHxe2fuNmE7aWwwPvwZsu/WI=; b=pjnD5+xh4f64K7NOSX50/VYPBb
        MsEwM6EU2gSrunRa0vZ39fWzYD1OEFgA1vtQZZkgJeZqH9+BhvqpyhIP6PZpIequ/SDuuYs1NUTHx
        s8QT1rU4aodn1PCdRmXi+9Ri0v0Kk32Hw552gF/XZ9SCxxAeOGZeRxO7g8ViHmZoaS4jHgADkOUyZ
        ITX+Q2kXQYptZ/Mabx+aQ6U1QkHaPRD/X/RtY7NyFSPMhs1yk8UEkvl2yvIgCwAQHj/3YQMCP9XOb
        KhoFWmhw6lSWIhEIpDFuuDw2HX2Ymw8bC7IHQLIlkrDStzrn/kwDdcAL/0rXY38Rd20SsXT1EsUEt
        1GFZTp4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35182)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1osWzJ-0003oD-Io; Tue, 08 Nov 2022 22:22:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1osWzH-00056K-Lr; Tue, 08 Nov 2022 22:22:31 +0000
Date:   Tue, 8 Nov 2022 22:22:31 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac
 System Management Controller
Message-ID: <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
> On 08/11/2022 17:33, Russell King (Oracle) wrote:
> > Add a DT binding for the Apple Mac System Management Controller.
> 
> Drop the second, redundant "binding" from subject. It's already in prefix.

Yet another thing that's been there from the start... how many more
things are you going to pick up in subsequent versions of the patch?
When does this stop?

In any case, taking your comment literally,

"dt-bindings: mfd: add for Apple Mac System Management Controller"

makes no sense, so presumably you want something more than that.

In any case, I see several recent cases already merged which follow
the pattern that I've used and that you've reviewed.

> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > new file mode 100644
> > index 000000000000..014eba5a1bbc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple Mac System Management Controller
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
> > +          - apple,t6000-smc
> > +          - apple,t8103-smc
> > +          - apple,t8112-smc
> > +      - const: apple,smc
> > +
> > +  reg:
> > +    items:
> > +      - description: SMC area
> > +      - description: SRAM area
> > +
> > +  reg-names:
> > +    items:
> > +      - const: smc
> > +      - const: sram
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +
> > +  gpio:
> > +    $ref: /schemas/gpio/gpio-macsmc.yaml
> 
> So this depends on other patch, so:
> 1. You need mention the dependency in cover letter (nothing there),
> 2. Re-order patches.
> 
> The GPIO cannot go separate tree and this must be explicitly communicated.

Sigh, getting an order that is sensible is really bloody difficult.
I'm quite sure Lee is only going to want to apply the mfd bits. Then
what do we do with the other bits? GPIO stuff via the GPIO tree, then
wait a cycle before the rest can be merged. Or what?

> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - mboxes
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      smc@23e400000 {
> 
> Usually these are called system-controller, to have a generic name (as
> asked by DT spec).

I'll defer to Hector for his response on this one, but you've had
had plenty of opportunities to bring this up in the past - it's been
there since the first posting.

Frustrating is definitely the word for this drip-drip-drip review.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
