Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A54C5A9C4E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbiIAP4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbiIAP4W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:56:22 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF5E79A40;
        Thu,  1 Sep 2022 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=S9iP4fTRtB1X7zN4oLDTGujtcRJ/XufA0LaTZFsQlEA=; b=BuV0D5jqJCX0I+shzsbIkcxkeM
        f7dEZ7VLNSm7LxeCtxx6gtyeyVPSaRt9v5sDUzoNMk3Q5SD7W91LK8XhQtUET8kBK60rKPzKhhfzu
        aAVZ3euKSwxCx4hnRkLFc3JbH7e9hOnlH6IdjDvCKTwiP7mTj0n251RM8PqekeEX6FMdmyBzV7WAi
        RsKx8eSO2k0ZjCNTjDmpLjpJv/L1pUZ+PJ8jjWuMi/VqhirfDjMxPacYDZgEWnsZi2acxkVlX0n37
        jACH1oaJ8RyaJIvEJI5MwyeM0pVPJ28TFUwDCwcc/hq+eWk+vL9I9HmwX48/7my8VFw/7n56Gv1ID
        4XlhV5+w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34046)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oTmY9-0006Bp-5d; Thu, 01 Sep 2022 16:56:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oTmY7-0003aV-J6; Thu, 01 Sep 2022 16:56:11 +0100
Date:   Thu, 1 Sep 2022 16:56:11 +0100
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
Message-ID: <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 06:45:52PM +0300, Krzysztof Kozlowski wrote:
> On 01/09/2022 18:24, Russell King (Oracle) wrote:
> > On Thu, Sep 01, 2022 at 06:15:46PM +0300, Krzysztof Kozlowski wrote:
> >> On 01/09/2022 18:12, Russell King (Oracle) wrote:
> >>>>> +  compatible:
> >>>>> +    items:
> >>>>> +      - enum:
> >>>>> +        - apple,t8103-smc
> >>>>
> >>>> You miss two spaces of indentation on this level.
> >>>
> >>> Should that be picked up by the dt checker?
> >>
> >> I think yamllint complains about it. It is not a hard-dependency, so
> >> maybe you don't have it installed.
> >>
> >>>
> >>>>> +        - apple,t8112-smc
> >>>>> +        - apple,t6000-smc
> >>>>
> >>>> Bring some order here - either alphabetical or by date of release (as in
> >>>> other Apple schemas). I think t6000 was before t8112, so it's none of
> >>>> that orders.
> >>>
> >>> Ok.
> >>>
> >>>>> +      - const: apple,smc
> >>>>> +
> >>>>> +  reg:
> >>>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
> >>>>
> >>>> You need constraints for size/order, so in this context list with
> >>>> described items.
> >>>
> >>> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> >>> objected to it.
> >>
> >> One way:
> >> reg:
> >>   items:
> >>     - description: SMC area
> >>     - description: SRAM area
> >>
> >> but actually this is very similar what you wrote for reg-names - kind of
> >> obvious, so easier way:
> >>
> >> reg:
> >>   maxItems: 2
> > 
> > Doesn't work. With maxItems: 2, the example fails, yet it correctly lists
> > two regs which are 64-bit address and 64-bit size - so in total 8 32-bit
> > ints.
> > 
> > Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: reg: [[2, 1044381696], [0, 16384], [2, 1071644672], [0, 1048576]] is too long
> >         From schema: /home/rmk/git/linux-rmk/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > 
> > Hence, I originally had maxItems: 2, and ended up deleting it because of
> > the dt checker.
> > 
> > With the two descriptions, it's the same failure.
> 
> Yeah, they should create same result.
> 
> > 
> > I think the problem is that the checker has no knowledge in the example
> > of how big each address and size element of the reg property is. So,
> > it's interpreting it as four entries of 32-bit address,size pairs
> > instead of two entries of 64-bit address,size pairs. Yep, that's it,
> > if I increase the number of "- description" entries to four then it's
> > happy.
> > 
> > So, what's the solution?
> > 
> 
> If you open generated DTS examples (in your
> kbuild-output/Documentation/devicetree/bindings/mfd/) you will see which
> address/size cells are expected. By default it is I think address/size
> cells=1, so you need a bus node setting it to 2.

Thanks, that works. The patch with all those points addressed now looks
like:

8<===
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
 Controller

Add a DT binding for the Apple Mac System Management Controller.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
new file mode 100644
index 000000000000..168f237c2962
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+description:
+  Apple Mac System Management Controller implements various functions
+  such as GPIO, RTC, power, reboot.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t6000-smc
+          - apple,t8103-smc
+          - apple,t8112-smc
+      - const: apple,smc
+
+  reg:
+    items:
+      - description: SMC area
+      - description: SRAM area
+
+  reg-names:
+    items:
+      - const: smc
+      - const: sram
+
+  mboxes:
+    maxItems: 1
+    description:
+      A phandle to the mailbox channel
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - mboxes
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      smc@23e400000 {
+        compatible = "apple,t8103-smc", "apple,smc";
+        reg = <0x2 0x3e400000 0x0 0x4000>,
+               <0x2 0x3fe00000 0x0 0x100000>;
+        reg-names = "smc", "sram";
+        mboxes = <&smc_mbox>;
+      };
+    };
-- 
2.30.2


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
