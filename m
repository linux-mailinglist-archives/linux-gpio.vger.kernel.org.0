Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586A74272B5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 22:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243155AbhJHVBm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 17:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhJHVBm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 17:01:42 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1C8C061570;
        Fri,  8 Oct 2021 13:59:46 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r19so42045688lfe.10;
        Fri, 08 Oct 2021 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YG9Ar+cG6qU5gjsx0O70Gv7O+SgzCIkgLxuZkibpVvY=;
        b=OElyHJIsIrtKb6Iz3Sx7oswZi2H0JvslLpNLrL1Wa0s5lrt/GDREY5V2c4Opvv7Dde
         1eBMS67FyAzMW0P/0JD8A6o08qoJSPx1/PChIt3SCnqODF6mubEEChPV8G9uOeSGbJyi
         LaZF5Ayp7GKQJaMDOBfcGl3yBGCBcf1ReIb1A9/nbUjvJqlMMo1JRjnMI/Aj8/Eiwzig
         jc31kp++8q0Y6IqbnPnRojCClnbjikba2uXE3AUfsPrqZHv29fXKwdP77s/gBCo2l5iG
         KFam9QhQt8Pmk11/Kzaev0athOVsHI4yDT9frKzByC5tVbkbDYAefB+92vjhOWf7Rp1s
         OwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YG9Ar+cG6qU5gjsx0O70Gv7O+SgzCIkgLxuZkibpVvY=;
        b=DMoyZJ0ZCrnVwigO1Wnnz99TnuhtE/ssU8D8oREsq2/Kw4cs/NXkMwyvfdxGFz47cH
         zY863ntrUCRkTO7RlX3rIOBjM/VMoiQEATrCp10gBTr6Tcdn1ffjL9NbqSu6PN4QzthT
         38ZUU3lx8qTWH0a/8S1YGSUsaWlW/2DYskGHSGLdav89GxR/aK0Y9H+fJB7iVk/1/fx8
         qpRanCryUJNJyBcIXKheGXjjSPTAZNd76RZJ7mZQXL8oUE6dPRLG/wm27sDIDAhfOl5/
         P6MVw/4nenQfgrVEGPBe10stfMW+7jXH6gBf4XPqL7Qa+iGy7Puroa9XGn+2OMQGzF3W
         TJ1A==
X-Gm-Message-State: AOAM532c2YFTtipbO698QwV4IdMu2xL5KWi6BVyIjoNTfwMY3D0innJB
        Y67sen+j0ArXs8zNY6a8iIQ=
X-Google-Smtp-Source: ABdhPJybJouLVsN1ONXMug915a3mBrlzSSdqG2IaISSwBDZkAOo0y+5P9L+b0IOBWL7lBxMGSlU4+Q==
X-Received: by 2002:a2e:a367:: with SMTP id i7mr6160510ljn.435.1633726784866;
        Fri, 08 Oct 2021 13:59:44 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id a21sm31862lfg.194.2021.10.08.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:59:44 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 linux-pinctrl 1/3] Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework binding to use syscon"
Date:   Fri,  8 Oct 2021 22:59:36 +0200
Message-Id: <20211008205938.29925-1-zajec5@gmail.com>
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

