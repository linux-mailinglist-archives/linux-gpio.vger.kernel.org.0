Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7E45AE951
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240400AbiIFNTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238247AbiIFNTk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:19:40 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B9F12D3F;
        Tue,  6 Sep 2022 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Vby8juuAVsxuLw4jJID4JNcPru+I7KI07gwaNAFsVNg=; b=Iee1pdz686BPqymc4AONYI6et8
        uDWXpoYWBcNNEqhLQAkHfob+YXLMCy7zE6GFvYFGyLJKuY/WsaQ0Bv6+hEF6sej5NEZfH5v3uh73Z
        M8KFdfwWJ94K9WiAnxmezg2OpKSZD1BR1AkzRrQkpgvK8/3twgwJZdF6vUna+qlmxcRcX9nQIpONT
        jtN4Bt6FIbRok6rPMI7UVrtR80TY6qsPyhYdUhGH5gZMbvmgbH7dalOiC2clOesZtnmfbaxVKjCMr
        7gNxYOWLJIX84JL479gj3zWK37AEntYkl81bHqbr0mZxh59CtQ89QiyJLayaT1J2iXLLb8avfs8JL
        KRkk0hXg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53692 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oVYUI-0003r5-VY; Tue, 06 Sep 2022 14:19:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oVYUI-005CmB-84; Tue, 06 Sep 2022 14:19:34 +0100
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
Subject: [PATCH 2/7] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 06 Sep 2022 14:19:34 +0100
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
index 168f237c2962..47e3cd58bf19 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -37,6 +37,10 @@ title: Apple Mac System Management Controller
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

