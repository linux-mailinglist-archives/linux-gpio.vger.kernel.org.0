Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA8849E262
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jan 2022 13:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbiA0Maf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jan 2022 07:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiA0Maf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jan 2022 07:30:35 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FFCC061714
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jan 2022 04:30:34 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h21so4443081wrb.8
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jan 2022 04:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVPgxajGF4waywkWo/vav6IL6pUCtJW7csqf25Rx8wo=;
        b=guqg2Dm+MTry8RVm33iQwmCWL6WzA11G0pk+3UXZJw1BSkUkJTnOZ5D56KIXGfTdoL
         JHvkjFtxtTiN9xsKmpQPHVukrgv8pWCkD0vZdwbgY5heCqAOMcLBTRex+tneKL9T770k
         LMBfQtFM6uTBsNn16fRMg4atIjPUU2a4IcaXTtGULYGPuUHUKOcoi1WxhK5FHFvzqxs8
         hiBRGj3kBFy6vGX0ebuufG5QlpDQXxKQbaTp+vSpSGoruKKfjq/MGxS2OULoLnNcZh1v
         OPvxSD2lKOrY58v9Gau86gyvGODUHz7ylkge8xalIPsW1iWjynNTrDZEG6s6nTacn+2u
         kz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVPgxajGF4waywkWo/vav6IL6pUCtJW7csqf25Rx8wo=;
        b=x8zI2b2vs8NW3Rr+uqAGyfPUJzgk7LeFlI9ayUQtyrzkEfjX/Uh04odVK82hXlKmD+
         U8qG3hS1cRpzZNScvpD2HOPUw5mvLv9Lo9aoGZwphclFfVn75fgB6bBpl8wCRkMWvaFp
         1DtZ6AijxQDrgZtdxWLLSDMfttic8XiwEP1zqRe2s9WSR2SrLdIYuBzyQPX2AYfBGLWS
         EqvU6c2VszlISvKolIn8/xQjAd2KixcEHBxD4bPp1EQxpSih2i7wXeQhErLmGKbNN4ON
         viLZNWvY/8XOkD/XsssMa7KfxJYrvj01xchTTiSNJEiGY0ELbkXEGZW9YQS8vE5AUdHs
         oRUA==
X-Gm-Message-State: AOAM532ZVZiqXhsivEZVmKpLByH5QVUqE3rnDfx2buYnfTYva/wsVZmZ
        ExFtb8tDTvmTkL1PSwv9uGr9YQ==
X-Google-Smtp-Source: ABdhPJw319hOxmiDmeKhekMneZC/UTdIOVw/OmH8bI41qcKcBVULM69zUgKAG8PYvdTIBEV5RA0Luw==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr2976864wrn.498.1643286633466;
        Thu, 27 Jan 2022 04:30:33 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h127sm12914619wmh.2.2022.01.27.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 04:30:32 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     brgl@bgdev.pl, conleylee@foxmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: gpio: convert faraday,ftgpio01 to yaml
Date:   Thu, 27 Jan 2022 12:30:28 +0000
Message-Id: <20220127123028.3992288-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Converts gpio/faraday,ftgpio010.txt to yaml.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---

This commit will cause arch/arm/boot/dts/moxart-uc7112lx.dts to fail DT validation,
but the GPIO driver need an interrupt so the current moxart DT is incomplete and the error is appropriate.

 .../bindings/gpio/faraday,ftgpio010.txt       | 27 ---------
 .../bindings/gpio/faraday,ftgpio010.yaml      | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/faraday,ftgpio010.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml

diff --git a/Documentation/devicetree/bindings/gpio/faraday,ftgpio010.txt b/Documentation/devicetree/bindings/gpio/faraday,ftgpio010.txt
deleted file mode 100644
index d04236558619..000000000000
--- a/Documentation/devicetree/bindings/gpio/faraday,ftgpio010.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Faraday Technology FTGPIO010 GPIO Controller
-
-Required properties:
-
-- compatible : Should be one of
-  "cortina,gemini-gpio", "faraday,ftgpio010"
-  "moxa,moxart-gpio", "faraday,ftgpio010"
-  "faraday,ftgpio010"
-- reg : Should contain registers location and length
-- interrupts : Should contain the interrupt line for the GPIO block
-- gpio-controller : marks this as a GPIO controller
-- #gpio-cells : Should be 2, see gpio/gpio.txt
-- interrupt-controller : marks this as an interrupt controller
-- #interrupt-cells : a standard two-cell interrupt flag, see
-  interrupt-controller/interrupts.txt
-
-Example:
-
-gpio@4d000000 {
-	compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
-	reg = <0x4d000000 0x100>;
-	interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml b/Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml
new file mode 100644
index 000000000000..dfd10b76c9d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/faraday,ftgpio010.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/faraday,ftgpio010.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday Technology FTGPIO010 GPIO Controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: "cortina,gemini-gpio"
+          - const: "faraday,ftgpio010"
+      - items:
+          - const: "moxa,moxart-gpio"
+          - const: "faraday,ftgpio010"
+      - const: "faraday,ftgpio010"
+  reg:
+    maxItems: 1
+  resets:
+    maxItems: 1
+  clocks:
+    maxItems: 1
+  interrupts:
+    maxItems: 1
+    description: Should contain the interrupt line for the GPIO block
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+  interrupt-controller: true
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio@4d000000 {
+      compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
+      reg = <0x4d000000 0x100>;
+      interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+    };
-- 
2.34.1

