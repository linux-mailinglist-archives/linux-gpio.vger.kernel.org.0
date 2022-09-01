Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27B65A9B58
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbiIAPOz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbiIAPOx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:14:53 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EEF1000;
        Thu,  1 Sep 2022 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xHqXre1QGDVzhtqUaT+W1lDHw59VpATVwe7eic+GdBA=; b=yUvhqalbm6VqdZYwb4s0ZCIVNc
        eYE+EGjnLNQWSyzZGPCkw3qMDhkzJ9gzoE9NS15gamlaHaSzeWK+c4Xc4jfJmJCHhl4b/DV9sxijE
        vE/P66Q7pR37PDz4mPRSJ3TtCCp9mcuHNhBWfuh+zxPwM4nbmAK0cKFYcJSiG5B6gwaasSjGaBi/Q
        rJXjonlSIXxd9jpkWwWsxw5uqkflXPV0nQFR3JvErR4ElL49nz8DvnHMIoxoTled90PZEmxCNa7l7
        CqMa5Jtoy8A8eesmjHKNjX8lU6hi5wSdRnyQUPIC3y4ENgCLhv9jHZ6btiqOzZBFiDi7uGJpXBTbB
        MeZvXgXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34042)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oTlu0-00067c-B5; Thu, 01 Sep 2022 16:14:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oTltz-0003Yw-NU; Thu, 01 Sep 2022 16:14:43 +0100
Date:   Thu, 1 Sep 2022 16:14:43 +0100
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
Subject: Re: [PATCH 2/6] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <YxDMY1R6kgb2X2hx@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeM-003t9G-7S@rmk-PC.armlinux.org.uk>
 <5ad90366-e7ac-1cae-77ee-cc084e5a69d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ad90366-e7ac-1cae-77ee-cc084e5a69d3@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 06:11:30PM +0300, Krzysztof Kozlowski wrote:
> On 01/09/2022 16:54, Russell King (Oracle) wrote:
> > Add the DT binding for the Apple Mac System Management Controller GPIOs.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
> >  .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
> >  2 files changed, 32 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > new file mode 100644
> > index 000000000000..ee620fe50ca8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> 
> filename based on the compatible... which is missing here, so this leads
> to the question - why this is separate device/child node? It won't bind
> to anything, won't be populated, right?

The node is a child of the apple,smc mfd device, and is referenced from
that description. Should this be embedded in the DT description for the
apple,smc device?

It'll also have other nodes as well, for the RTC etc.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
