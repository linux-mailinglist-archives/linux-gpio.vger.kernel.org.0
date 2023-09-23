Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5877AC36E
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 18:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjIWQCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 12:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjIWQCl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 12:02:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC4C1A5
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 09:02:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5042f391153so4571106e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695484952; x=1696089752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/S5F/94lzE+JzXRkckvi7oOP9RR2RmQ+CAb+mf1D9Y=;
        b=NmP0uI1Uw42BbXR85GPpLR1BWyVxB8zgPoaGFGQI+zn/wcIc/F7unduiPVIsarFIz5
         ViaEhF4GCiJOoZnwzjDfwwQM0wPB1uAjxWcf/ZKYQ3DEIYEfnL2Rxrpyw/lCcAtkpXgO
         zmVEiaEnK9y6lPxUJkXJ3XDk3cSoB8Az04pGzk1WNt94z+zF2NwtI4hYqotMvrvo3blb
         lE1L/9f1wCvu4K7h63QcYCvo/F4sK64CqUNBTT/7/uUUEB+1MTjbzj5L7sD5VE5mUNt2
         nQl8EhZuBl84lLcC6L261F/syzjbstyTTUumzxMy5DRnFOd+hWW7bEVlmpvNDfNIJcDf
         S1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695484952; x=1696089752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/S5F/94lzE+JzXRkckvi7oOP9RR2RmQ+CAb+mf1D9Y=;
        b=DI8oUsJv5pIpzjmG1i0umVFCBBpIAC4mtvObPe53x3lLvr2oLGcU7GSmLnNHpBFowW
         1v3oxtGxHP2+UlaY2ydo70I/HU5tG4EVnbPZoWuS3T3SZ8FbhfmSenRolu9NsXMbjD4g
         r3yEAwM7lekgSQp4ubrQl3JvK4rWBBoEU6/gEgAm6jtFi9kyVL0Q7kXtoIMtRqu/dvCg
         RJmqm780OuQN+0TACjp7iz41W4vbudXyhuBlncPN1jd5gJkjxhTPIknOiEjv4BprUAv8
         FVGZGW7B30BDq1zxvGIPVIQRjhEDeTCh8t9vKHqQlab/9EgImiWRHJFlj7GBGRM5Ktgs
         Z+Gw==
X-Gm-Message-State: AOJu0Yzs6hLaTcxyNsQagIMMCJHdn9iLtdnjnALAIxr9Dk8GzlTXlWl2
        jSVztE1SyPwKR6vl4GdiSw6q6w==
X-Google-Smtp-Source: AGHT+IHz6zuqxUx2A42d7VY0KwoBvL6EpqxBR+yLkCltJIMjcWgRHY1UZ1qMsb4KvCjl6TcaPnwNbg==
X-Received: by 2002:a05:6512:4019:b0:501:be4d:6dc5 with SMTP id br25-20020a056512401900b00501be4d6dc5mr2207584lfb.8.1695484952406;
        Sat, 23 Sep 2023 09:02:32 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v30-20020a056512049e00b004fdde1db756sm1132835lfq.26.2023.09.23.09.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 09:02:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Sep 2023 18:02:28 +0200
Subject: [PATCH v3 1/2] gpio: Rewrite IXP4xx GPIO bindings in schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230923-ixp4xx-gpio-clocks-v3-1-66f8fe4e7f15@linaro.org>
References: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org>
In-Reply-To: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org>
To:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This rewrites the IXP4xx GPIO bindings to use YAML schema,
and adds two new properties to enable fixed clock output on
pins 14 and 15.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/gpio/intel,ixp4xx-gpio.txt | 38 -----------
 .../bindings/gpio/intel,ixp4xx-gpio.yaml           | 73 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 74 insertions(+), 39 deletions(-)

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
index 000000000000..bfcb1f364c3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel IXP4xx XScale Networking Processors GPIO Controller
+
+description: |
+  This GPIO controller is found in the Intel IXP4xx
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
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
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

