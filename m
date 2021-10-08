Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9B7426DA2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 17:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243024AbhJHPlv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 11:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242780AbhJHPlv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 11:41:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574A7C061570;
        Fri,  8 Oct 2021 08:39:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r19so38919356lfe.10;
        Fri, 08 Oct 2021 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YG9Ar+cG6qU5gjsx0O70Gv7O+SgzCIkgLxuZkibpVvY=;
        b=Rp3jX2X5Q2u65KiRr3g/piNYKnrDJC2jZOLAUfByXB2AGTC07WXW5XePdlrQw99Aar
         zbsia3AwKyGZ8ftEu53n3kN8egySix/0sd7EcBUq075kUTS3DPWxrR9E5LEUt9fjyZNB
         CBHBDUVQiWAScCqipee54dOmmF9xcgpWVuNa++10gTRt0TlPf454p5li5/iL6EgM7vgN
         UTPpemXcwz4e4ANAqlyIwD7NPWfo8DC4MLDTWH/AlubcC4IBYS6ek9n+gnnwr13/Ut3z
         iE5uYJFqIbeV2TZ8ASTgJtSMTIYJMePoRzsuEXjAeVtdltTmy74aUCzPJ5cLbYaZArvC
         r6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YG9Ar+cG6qU5gjsx0O70Gv7O+SgzCIkgLxuZkibpVvY=;
        b=YdXwR7eD9Pogc+iBA93hDl/6M5RHGzNbaRqjF91C2cwubkL/2XhY+tiezxwYLdQsuI
         KrUrUw/MomPgCXTL9780jHTZwB2upI5IBjgsOS99mPkTObeNit/TzVY2brXcLmA1p1RS
         QFXPPd694AVHFqHKh0kOA/xDb9pDfPUf3CozpchFg4To7Ibzty8UBCVIiHuCXQf9daG1
         dp1AzJ1R8P6vk4C6f7bc9mxcKPtyZ9SLZgl4hgKG6sFO4QxEKSQVO9iHMhuiSJJ4y0K8
         Kmp3b8BQl/LCATqvp2mhbaagdS95pS0U/XluMw+NaJn+ghZuv0ehj8WppA1DvpXAUQaq
         luNA==
X-Gm-Message-State: AOAM533oQgi/eFK07qhy6r8o2eK2iuBt+zhrHbwWLYQEONQURo1V7eMw
        hCX1hTTPN+XMJqqYZ/JFoEI=
X-Google-Smtp-Source: ABdhPJyqXmlhUIDibjr4Kkw0USEAAWrWl3xzaH/JKr6l6aGts+0NJDKTXoAj9KESuBfR0MGeczeH0Q==
X-Received: by 2002:a2e:5359:: with SMTP id t25mr4286576ljd.18.1633707588461;
        Fri, 08 Oct 2021 08:39:48 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id u27sm156851lfm.275.2021.10.08.08.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:39:47 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 linux-pinctrl 1/2] Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework binding to use syscon"
Date:   Fri,  8 Oct 2021 17:39:38 +0200
Message-Id: <20211008153939.19685-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.

My rework was unneeded & wrong. It replaced a clear & correct "reg"
property usage with a custom "offset" one.

Back then I didn't understand how to properly handle CRU block binding.
I heard / read about syscon and tried to use it in a totally invalid
way. That change also missed Rob's review (obviously).

Northstar's pin controller is a simple consistent hardware block that
can be cleanly mapped using a 0x24 long reg space.

Since the rework commit there wasn't any follow up modifying in-kernel
DTS files to use the new binding. Broadcom also isn't known to use that
bugged binding. There is close to zero chance this revert may actually
cause problems / regressions.

This commit is a simple revert. Example binding may (should) be updated
/ cleaned up but that can be handled separately.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Update brcm,cru.yaml to avoid new yamllint warnings/errors
---
 .../devicetree/bindings/mfd/brcm,cru.yaml     | 11 +++++----
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
index fc1317ab3226..28ac60acf4ac 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
@@ -32,13 +32,13 @@ properties:
   "#size-cells":
     const: 1
 
-  pinctrl:
-    $ref: ../pinctrl/brcm,ns-pinmux.yaml
-
 patternProperties:
   '^clock-controller@[a-f0-9]+$':
     $ref: ../clock/brcm,iproc-clocks.yaml
 
+  '^pin-controller@[a-f0-9]+$':
+    $ref: ../pinctrl/brcm,ns-pinmux.yaml
+
   '^thermal@[a-f0-9]+$':
     $ref: ../thermal/brcm,ns-thermal.yaml
 
@@ -73,9 +73,10 @@ examples:
                                  "iprocfast", "sata1", "sata2";
         };
 
-        pinctrl {
+        pin-controller@1c0 {
             compatible = "brcm,bcm4708-pinmux";
-            offset = <0x1c0>;
+            reg = <0x1c0 0x24>;
+            reg-names = "cru_gpio_control";
         };
 
         thermal@2c0 {
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 470aff599c27..78600a8fe403 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -17,9 +17,6 @@ description:
 
   A list of pins varies across chipsets so few bindings are available.
 
-  Node of the pinmux must be nested in the CRU (Central Resource Unit) "syscon"
-  node.
-
 properties:
   compatible:
     enum:
@@ -27,10 +24,11 @@ properties:
       - brcm,bcm4709-pinmux
       - brcm,bcm53012-pinmux
 
-  offset:
-    description: offset of pin registers in the CRU block
+  reg:
     maxItems: 1
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  reg-names:
+    const: cru_gpio_control
 
 patternProperties:
   '-pins$':
@@ -72,19 +70,24 @@ allOf:
                         uart1_grp ]
 
 required:
-  - offset
+  - reg
+  - reg-names
 
 additionalProperties: false
 
 examples:
   - |
     cru@1800c100 {
-        compatible = "syscon", "simple-mfd";
+        compatible = "simple-bus";
         reg = <0x1800c100 0x1a4>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
 
-        pinctrl {
+        pin-controller@1c0 {
             compatible = "brcm,bcm4708-pinmux";
-            offset = <0xc0>;
+            reg = <0x1c0 0x24>;
+            reg-names = "cru_gpio_control";
 
             spi-pins {
                 function = "spi";
-- 
2.26.2

