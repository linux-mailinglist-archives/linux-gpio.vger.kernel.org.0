Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3529E33F2CB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhCQOiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbhCQOiK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:10 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B32C06175F;
        Wed, 17 Mar 2021 07:38:09 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso3507906wmi.3;
        Wed, 17 Mar 2021 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zaqQRUtAb3uSwzWtE/yzFhrGf0VNbJCfjDysS0z5cjw=;
        b=Hl2CJMM1bjULnbrR5FRtSQbH90B7ip/PfX8LSIJ2VSE9xMgzQLuG8mtX8Zh07JC9lb
         DddLHzgNGY5yJfWrYBfPNl9QpfaGFXXxSkrY+0AA69HMBvLSphXt4/Jy6/zg1fkTwukQ
         enkWV8UPt9S1n6x89Q9WhxktmH6PY+yMGPAwbLpiyk5XDApauqeBqAmCXX5ZYkp7f42Q
         LmemU7vg8oE2fgYLfiRxgGpxszbyq+/wxQVELsjMLn8L4nT7Ct4OFBy0GA5gbdemQU13
         exs6pp4d27+nmk6haH8x85XPRLe7TliKqgNRy+J5VUZM5HVZd4FmPnWbVYZKLjRfvkn7
         +g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zaqQRUtAb3uSwzWtE/yzFhrGf0VNbJCfjDysS0z5cjw=;
        b=PajgVY/e7Hk7fXZ+bD1rOXzvfOzgwFCUgcginKB5iwx7L/b+l6kbnCmeo1yAX1uiwd
         gAIaphtxPCS+bdbmcC6wMjA4GuyvgrC+cpLC28wQeo5p4vm6CieFQ/0xmX9CGXtnrT8g
         vaTmx3p4kC3MCZRgVKmYECFN98gBVL/YbtBzy6fwc1afHjlt7m3VGeFdsGK44xMHKPSX
         FzRXXijcurWGX0v/9SR5bZ58e1n+wC8L1TonqshWjxq2lfKyrPQykXWdAkOmsKnZfWMx
         95nPzRTZ3PF0KS5+hCaGBKwIx63YFMZglnipBT3NS163VUE0p50cfIOoz4lUm1OsJvyM
         lp7w==
X-Gm-Message-State: AOAM5328H0KCJHnyMumgw6GsuTYe/MRiFElg4fDV8JMs62Gfa+e3rjFS
        WyRoA/hJjs5Ex0LkOBfkc88=
X-Google-Smtp-Source: ABdhPJz/TWDS6pYlnyAq6KPaEz/CcCu2p9saRchcEeh2KuGEUkheDgt/tVt9HMjkojQAi5eEG1Rlbg==
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr3822784wmc.89.1615991888410;
        Wed, 17 Mar 2021 07:38:08 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:08 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 03/22] dt-bindings: improve BCM6345 GPIO binding documentation
Date:   Wed, 17 Mar 2021 15:37:44 +0100
Message-Id: <20210317143803.26127-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert existing BCM6345 GPIO binding documentation to YAML and add binding
documentation for the GPIO controller found in BCM6318, BCM6328, BCM6358,
BCM6362, BCM6368 and BCM63268 SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: introduce changes suggested by Rob Herring
 v7: new patch, splitted from pinctrl documentation

 .../bindings/gpio/brcm,bcm6345-gpio.txt       | 46 -----------
 .../bindings/gpio/brcm,bcm6345-gpio.yaml      | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
deleted file mode 100644
index e7853143fa42..000000000000
--- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Bindings for the Broadcom's brcm,bcm6345-gpio memory-mapped GPIO controllers.
-
-These bindings can be used on any BCM63xx SoC. However, BCM6338 and BCM6345
-are the only ones which don't need a pinctrl driver.
-BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
-and/or written, and the direction changed from input to output.
-BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
-and/or written, and the direction changed from input to output.
-
-Required properties:
-	- compatible: should be "brcm,bcm6345-gpio"
-	- reg-names: must contain
-		"dat" - data register
-		"dirout" - direction (output) register
-	- reg: address + size pairs describing the GPIO register sets;
-		order must correspond with the order of entries in reg-names
-	- #gpio-cells: must be set to 2. The first cell is the pin number and
-			the second cell is used to specify the gpio polarity:
-			0 = active high
-			1 = active low
-	- gpio-controller: Marks the device node as a gpio controller.
-
-Optional properties:
-	- native-endian: use native endian memory.
-
-Examples:
-	- BCM6338:
-	gpio: gpio-controller@fffe0407 {
-		compatible = "brcm,bcm6345-gpio";
-		reg-names = "dirout", "dat";
-		reg = <0xfffe0407 1>, <0xfffe040f 1>;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-	};
-
-	- BCM6345:
-	gpio: gpio-controller@fffe0406 {
-		compatible = "brcm,bcm6345-gpio";
-		reg-names = "dirout", "dat";
-		reg = <0xfffe0406 2>, <0xfffe040a 2>;
-		native-endian;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
new file mode 100644
index 000000000000..d1d34a347a1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6345 GPIO controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  Bindings for Broadcom's BCM63xx memory-mapped GPIO controllers.
+
+  These bindings can be used on any BCM63xx SoC. However, BCM6338 and BCM6345
+  are the only ones which don't need a pinctrl driver.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm6318-gpio
+      - brcm,bcm6328-gpio
+      - brcm,bcm6345-gpio
+      - brcm,bcm6358-gpio
+      - brcm,bcm6362-gpio
+      - brcm,bcm6368-gpio
+      - brcm,bcm63268-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  native-endian: true
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dirout
+      - const: dat
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio-controller@fffe0406 {
+      compatible = "brcm,bcm6345-gpio";
+      reg-names = "dirout", "dat";
+      reg = <0xfffe0406 2>, <0xfffe040a 2>;
+      native-endian;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
+
+  - |
+    gpio@0 {
+      compatible = "brcm,bcm63268-gpio";
+      reg-names = "dirout", "dat";
+      reg = <0x0 0x8>, <0x8 0x8>;
+
+      gpio-controller;
+      gpio-ranges = <&pinctrl 0 0 52>;
+      #gpio-cells = <2>;
+    };
-- 
2.20.1

