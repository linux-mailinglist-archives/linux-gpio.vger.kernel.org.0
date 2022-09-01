Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18C75A9B80
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbiIAPYa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiIAPY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:24:29 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C24861CE;
        Thu,  1 Sep 2022 08:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EM9unvrkq5KRXP4o9UGZIuXzbMhXAHieicgtIajlFio=; b=NVfxU3cQBDLMSI4eTEe+8zr9Xg
        o3IdDia1gfpLSkNnfZRD3V5wNNifg9d+qVmtK+9T867ltBDd0lF+GRB6IUqVKCOoaTyxVdraED8DA
        oCuT1pnvWBZlznrGb0McrrMigJJKVZQRy5IDzpGLAcWshX14Bw8uA+8u1mAls64KRsp8t+m6E8g1i
        p3tUlqAPVN2TMQF5Gf5AVCsRlwjqWxRR+bkPAmlxTouHm0g/Y8N2VObbrb8w7dyAN/eS61S430U3I
        x5JqsMJWzhGGASp9VlDe9a+zQQPubEizbaACCsTZ9bevCLvjrCHyqm8hEHkK1DnUjYkhP7niYp/Vq
        1mi6wcxw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34044)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oTm3J-00069M-9M; Thu, 01 Sep 2022 16:24:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oTm3I-0003Z9-2M; Thu, 01 Sep 2022 16:24:20 +0100
Date:   Thu, 1 Sep 2022 16:24:20 +0100
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
Message-ID: <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 06:15:46PM +0300, Krzysztof Kozlowski wrote:
> On 01/09/2022 18:12, Russell King (Oracle) wrote:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +        - apple,t8103-smc
> >>
> >> You miss two spaces of indentation on this level.
> > 
> > Should that be picked up by the dt checker?
> 
> I think yamllint complains about it. It is not a hard-dependency, so
> maybe you don't have it installed.
> 
> > 
> >>> +        - apple,t8112-smc
> >>> +        - apple,t6000-smc
> >>
> >> Bring some order here - either alphabetical or by date of release (as in
> >> other Apple schemas). I think t6000 was before t8112, so it's none of
> >> that orders.
> > 
> > Ok.
> > 
> >>> +      - const: apple,smc
> >>> +
> >>> +  reg:
> >>> +    description: Two regions, one for the SMC area and one for the SRAM area.
> >>
> >> You need constraints for size/order, so in this context list with
> >> described items.
> > 
> > How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> > objected to it.
> 
> One way:
> reg:
>   items:
>     - description: SMC area
>     - description: SRAM area
> 
> but actually this is very similar what you wrote for reg-names - kind of
> obvious, so easier way:
> 
> reg:
>   maxItems: 2

Doesn't work. With maxItems: 2, the example fails, yet it correctly lists
two regs which are 64-bit address and 64-bit size - so in total 8 32-bit
ints.

Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: reg: [[2, 1044381696], [0, 16384], [2, 1071644672], [0, 1048576]] is too long
        From schema: /home/rmk/git/linux-rmk/Documentation/devicetree/bindings/mfd/apple,smc.yaml

Hence, I originally had maxItems: 2, and ended up deleting it because of
the dt checker.

With the two descriptions, it's the same failure.

I think the problem is that the checker has no knowledge in the example
of how big each address and size element of the reg property is. So,
it's interpreting it as four entries of 32-bit address,size pairs
instead of two entries of 64-bit address,size pairs. Yep, that's it,
if I increase the number of "- description" entries to four then it's
happy.

So, what's the solution?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
