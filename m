Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982A15A997A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbiIANyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 09:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbiIANyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 09:54:36 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73A7A188;
        Thu,  1 Sep 2022 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=a/v4fh5dvlfR33CRToBG85CI71CxvOgrSGU87eSy72Q=; b=t+BR8tI4opOX8R7R3QBDc7fK4Q
        DOIAqIn1mAs8LLmGkCjFohGjNm3Boo0XG8Nd/3TrL5BfeNfg7o66YlYx7uZ09Tu+ZUxLlG88VlcNW
        c/2UrL7PZsXxVWwAQozs3S4kJOFnGCpPwGTBCsAYmTLGC0v+41IMU/VLmGF6ME86NUx7pConEKaAx
        75of+C9DNMDbS75VGifzPO12JeKpADeVViOEOmQmhXyqQaejQejJLspTleXfX9W/JkH1tvX2w0wqM
        s5ZJ8P99ZatfA9PGhjxw0vaOPaGfavJeOmA895xj5BWp20MQyUfkPP4n7wmY030VpEBsbBWhBU/TB
        pVhOYMkg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50878 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oTkeM-0005wG-R6; Thu, 01 Sep 2022 14:54:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oTkeM-003t9G-7S; Thu, 01 Sep 2022 14:54:30 +0100
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oTkeM-003t9G-7S@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 01 Sep 2022 14:54:30 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the DT binding for the Apple Mac System Management Controller GPIOs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
 .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
new file mode 100644
index 000000000000..ee620fe50ca8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller GPIO
+
+maintainers:
+  - Hector Martin <marcan@marcan.st>
+
+description:
+  This describes the binding for the Apple Mac System Management Controller
+  GPIO block.
+
+properties:
+  gpio-controller: true
+  '#gpio-cells':
+    const: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    smc_gpio: gpio {
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 794d3a6eb04a..bb799a27638d 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -34,6 +34,10 @@ title: Apple Mac System Management Controller
     description:
       A phandle to the mailbox channel
 
+patternProperties:
+  gpio:
+    $ref: /schemas/gpio/gpio-macsmc.yaml
+
 additionalProperties: false
 
 required:
-- 
2.30.2

