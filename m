Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035C862197F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 17:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbiKHQdh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 11:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234591AbiKHQdg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 11:33:36 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0340E15FED;
        Tue,  8 Nov 2022 08:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mExaZ36oozi88OGEG708lRijvNWdEsKq2WMyJ28U0ys=; b=TMJ8emuJw1b1xbyIPPfOjPQiAD
        qSgsUPKyNkY7i6c3+dxcsGYWnJZjlVHt6IWuAr36Gj2ktsYqjOYV2PNh2C+SWVOhP6rFk7F6yHPsw
        LuQcmMdCu9VjBCts8U8SsXtTTsIE6gr4UoQJpLdS6PmqzXDoPC55dePbMiyTDsMHngHAf4pETp8Uy
        fJXA0LO+8ZynNBT6QVo/y8QshcgHUIsliWgi2unNqRwShfrVud68hjegd3BQvYAjm3JQ7/mCfJVcZ
        gUb9i6rbVwu51B+d/NZv4a102R6PlwA+Swy8eXFfHEuAeUKvXAzEUk5BJi6UE/3Liv1aApVXt8tJJ
        MPm3fV5Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37276 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1osRXU-0003S6-BQ; Tue, 08 Nov 2022 16:33:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1osRXT-002mw3-JR; Tue, 08 Nov 2022 16:33:27 +0000
In-Reply-To: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
Subject: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 08 Nov 2022 16:33:27 +0000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a DT binding for the Apple Mac System Management Controller.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
new file mode 100644
index 000000000000..014eba5a1bbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -0,0 +1,67 @@
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
+
+  gpio:
+    $ref: /schemas/gpio/gpio-macsmc.yaml
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
+
+        smc_gpio: gpio {
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+      };
+    };
-- 
2.30.2

