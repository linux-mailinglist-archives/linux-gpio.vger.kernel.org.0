Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA70A34734F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbhCXIUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbhCXITa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:30 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6221C061763;
        Wed, 24 Mar 2021 01:19:29 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id d191so12372321wmd.2;
        Wed, 24 Mar 2021 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C6DZyFkEKD7mxvfH/OtGjYQQtJBwqDsEyOszGZxsrNc=;
        b=HsO+vK//M/ioy7BNmK17H9rINuRjNJFyKJMINlxMhptl7fH1Yu9RyyOx+vdax40ajC
         0FU8nFXAJNBK1Mb+y6Brbwb1Y4kMDRHzmSRo3fKOZvHL6TA/7bI8XeqA9zmJELyPYxgE
         TGC9+eI5c0rwZja3Nswtk+Z+0VtVXugiWatJe9vk9rSI/Eh9QvJ+HGNJkqhRThGhlnxa
         GjGzaiMpOkcmedzuq/MO0MhDpgi+Zd5iVo1oKr9u4IhGjeYnhK494mopBnDqihMFylcs
         SR28rwd7n3dAcokkC2W0H752xOv9bbI6s7p7mvlymGyWWyMNim06uOKjtCtlkvXfDNKs
         LDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6DZyFkEKD7mxvfH/OtGjYQQtJBwqDsEyOszGZxsrNc=;
        b=KBOtsiizb6ywbfBQITxwNiYu38iE0gCuZHITfxCa6cwltiFT2Jy6Wdo/khKjvOPKOU
         xTI6ay1KNe1e/qSK55wgmz1V9pR21WzVDwwvgCyxwuQsfjdkm3a1eNLBae9a3FP/nQoI
         RPQMo46eHMnf0lwUSPsDtOJvTGHZqeCCp0Tpjtp6+9u3TdASwRaKDG5jCtWtNoY7SQc+
         k2uN6CbyPE+FgYyjBIF/LADhAG6+T3449eT+bYSN8u5C5ac0nN779zT43QIrG7yMbSZv
         q1cXntYhhbsFHrHcYjoYIbFHLj31I7Rco6HyGFQ1WpDnezl5y4BKcbj5T/qgkakKB4hV
         TJgQ==
X-Gm-Message-State: AOAM533IA1WfcbY7fAZ4iOjmu31RAFBYURgl6F/M+P9gCVO9gzeQyyPp
        m3ZAe3HUi9nvZJ5+1clcPlw=
X-Google-Smtp-Source: ABdhPJyCLx6j9CYgw7D1Fn0gD10/IcNz23M56Mmdy8jvTpkZ3jXY1TnDySqhPNQLIXtNCBDCM4pjgA==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr1751508wmi.153.1616573968516;
        Wed, 24 Mar 2021 01:19:28 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:28 -0700 (PDT)
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
Subject: [PATCH v9 03/22] dt-bindings: improve BCM6345 GPIO binding documentation
Date:   Wed, 24 Mar 2021 09:19:04 +0100
Message-Id: <20210324081923.20379-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
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
 v9: document 32-bit registers and replace gpio-controller with gpio.
 v8: introduce changes suggested by Rob Herring
 v7: new patch, splitted from pinctrl documentation

 .../bindings/gpio/brcm,bcm6345-gpio.txt       | 46 ----------
 .../bindings/gpio/brcm,bcm6345-gpio.yaml      | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 46 deletions(-)
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
index 000000000000..4d69f79df859
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
@@ -0,0 +1,86 @@
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
+  BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
+  and/or written, and the direction changed from input to output.
+  BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
+  and/or written, and the direction changed from input to output.
+  BCM6318, BCM6328, BCM6358, BCM6362, BCM6368 and BCM63268 have 32-bit data
+  and dirout registers, where GPIO state can be read and/or written, and the
+  direction changed from input to output.
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
+    gpio@fffe0406 {
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

