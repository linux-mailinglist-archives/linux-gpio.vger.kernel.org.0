Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3649F7A8F44
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 00:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjITWYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 18:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjITWYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 18:24:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9054197
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 15:23:52 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-502fd1e1dd8so620064e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 15:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695248631; x=1695853431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hF1P02ld7wbeNQyU0l4vMbS0kxuoLz56i7vh22oekU=;
        b=pekvhvRm2nAeOEhRPpFYIyJ4uauLjaLnSl+6VyFguEG9LU73WAugob/Nwnjr9eU4mi
         Kb+4neR7ZSduQjneO+iCpmDeX+7R8kaunMq0B//SpeqkMHQ7FI/AQy9EKqY6KBZYR0Iy
         rYPsVFBUA/ncH2MGsDM2t1L1lb5G0CVhx8akiPOXD5qmZnlUA2y6lsBMVKLcNNte92Yl
         L55q+XCvFHVceM5GknuF3JuV40o34/wUqQAaK6LgrOfaH/7QeonQxNzf2WG3dChOWug6
         EX27V3H9ZdnG2KkL+Pw035cZZLufPf7f2xnIW65m3waky0JlVhxeXsgMakhyzvDslmes
         /5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695248631; x=1695853431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hF1P02ld7wbeNQyU0l4vMbS0kxuoLz56i7vh22oekU=;
        b=bwtql+mHgaD6nvm4652sDsIjgOncZrWymH1GviCixOv4Yfu1L2OTEkgswfcStMRG52
         hvE2Pa8JrRXFE4jEdSK/OQSa5FkuPW3evmHtPfuZ79cR0EjFrtahtPsUua66u01qqmrV
         Kat42z4rA7Rt9WqoZaD5oXXsjUAeG17ovm9aiz6JHuQNbnjeimTNihRTP14tYkb0UQnB
         WBbULmNtJpFQe0l+8JxTr26w7Sc4Id/47JBA9aKx3ZjwSzOKs6puzOrBwwJCrrU5GAme
         j0iG7w9Y7/zf89sj0XcEd8T+QA4gaRCzgRJsdidu/t4sgKe3+RizufzIccLx6QG4eL0D
         e2hA==
X-Gm-Message-State: AOJu0Yxdi64po/s9uju2stKzcS6NuBwL7xf06RmlnJY8RryM/A/FYLTM
        aAclAV0ftZPJHyVNP5SWNHE9bw==
X-Google-Smtp-Source: AGHT+IEZJGrEPB6Ohe0IImVhtr4rOFsci1rM/dBFgJNHI1rqUiaIuxPUVtgJp9An4uh6Dlh1g2JO4w==
X-Received: by 2002:ac2:5e65:0:b0:503:555:4000 with SMTP id a5-20020ac25e65000000b0050305554000mr3150963lfr.25.1695248631051;
        Wed, 20 Sep 2023 15:23:51 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id u14-20020ac2518e000000b004fe0fead9e2sm14557lfi.165.2023.09.20.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:23:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Sep 2023 00:23:45 +0200
Subject: [PATCH 1/2] gpio: Rewrite IXP4xx GPIO bindings in schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-ixp4xx-gpio-clocks-v1-1-574942bf944a@linaro.org>
References: <20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org>
In-Reply-To: <20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org>
To:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This rewrites the IXP4xx GPIO bindings to use YAML schema,
and adds two new properties to enable fixed clock output on
pins 14 and 15.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/gpio/intel,ixp4xx-gpio.txt | 38 ------------
 .../bindings/gpio/intel,ixp4xx-gpio.yaml           | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 71 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt b/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
deleted file mode 100644
index 8dc41ed99685..000000000000
--- a/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Intel IXP4xx XScale Networking Processors GPIO
-
-This GPIO controller is found in the Intel IXP4xx processors.
-It supports 16 GPIO lines.
-
-The interrupt portions of the GPIO controller is hierarchical:
-the synchronous edge detector is part of the GPIO block, but the
-actual enabling/disabling of the interrupt line is done in the
-main IXP4xx interrupt controller which has a 1:1 mapping for
-the first 12 GPIO lines to 12 system interrupts.
-
-The remaining 4 GPIO lines can not be used for receiving
-interrupts.
-
-The interrupt parent of this GPIO controller must be the
-IXP4xx interrupt controller.
-
-Required properties:
-
-- compatible : Should be
-  "intel,ixp4xx-gpio"
-- reg : Should contain registers location and length
-- gpio-controller : marks this as a GPIO controller
-- #gpio-cells : Should be 2, see gpio/gpio.txt
-- interrupt-controller : marks this as an interrupt controller
-- #interrupt-cells : a standard two-cell interrupt, see
-  interrupt-controller/interrupts.txt
-
-Example:
-
-gpio0: gpio@c8004000 {
-	compatible = "intel,ixp4xx-gpio";
-	reg = <0xc8004000 0x1000>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.yaml b/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.yaml
new file mode 100644
index 000000000000..bb1fc393bd8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel IXP4xx XScale Networking Processors GPIO Controller
+
+description: This GPIO controller is found in the Intel IXP4xx
+  processors. It supports 16 GPIO lines.
+  The interrupt portions of the GPIO controller is hierarchical.
+  The synchronous edge detector is part of the GPIO block, but the
+  actual enabling/disabling of the interrupt line is done in the
+  main IXP4xx interrupt controller which has a 1-to-1 mapping for
+  the first 12 GPIO lines to 12 system interrupts.
+  The remaining 4 GPIO lines can not be used for receiving
+  interrupts.
+  The interrupt parent of this GPIO controller must be the
+  IXP4xx interrupt controller.
+  GPIO 14 and 15 can be used as clock outputs rather than GPIO,
+  and this can be enabled by a special flag.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: intel,ixp4xx-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+  "#interrupt-cells":
+    const: 2
+
+  intel,ixp4xx-gpio14-clkout:
+    description: If defined, enables clock output on GPIO 14
+      instead of GPIO.
+    type: boolean
+
+  intel,ixp4xx-gpio15-clkout:
+    description: If defined, enables clock output on GPIO 15
+      instead of GPIO.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio@c8004000 {
+        compatible = "intel,ixp4xx-gpio";
+        reg = <0xc8004000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..4e216887eb76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2215,7 +2215,7 @@ M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
-F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
+F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion*
 F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml

-- 
2.41.0

