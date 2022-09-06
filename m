Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE2C5AE949
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbiIFNTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238247AbiIFNTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:19:37 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA93FD7D;
        Tue,  6 Sep 2022 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=T1S3/9UFK00ha3QS4OGQc2EyGn+7+61azh0f2+Jfllk=; b=NfD9PjijNLWDtAlNqYFhRXgcwg
        DUFv7XIHtTLXVMGW2MeWMY7R9iuuYldBAeWF0tkQNSQaY6nPURJ/btUdJOxxsm3O4y3TIAzhcmuBh
        RRhVVzEW412tZHBOzXkGOp0uzOIEz3IM8o+sQ6vQtQ/RR4bkhaD2C5NbskT00falFJZrw543QISBS
        8Dcg8ujOqSBKcNIke1SPF233K2zJ9VfaX7oVK0CMItfBeqE+U3894gYhJkdAzOeDez6Dt69RM0bNn
        hEme1Wo1SzLmpcMUd25M2d//mCA8l910Xe2x8ja4Qev1C9Pid+V/W5GGJOEapzlLswO+jINftobac
        k0H2kfOQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34460 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oVYUD-0003qu-OS; Tue, 06 Sep 2022 14:19:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oVYUD-005Cm5-3Z; Tue, 06 Sep 2022 14:19:29 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 1/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 06 Sep 2022 14:19:29 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

