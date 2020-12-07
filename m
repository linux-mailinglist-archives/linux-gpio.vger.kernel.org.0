Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90C22D0B82
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 09:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgLGIMg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 03:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLGIMf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 03:12:35 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40025C0613D0;
        Mon,  7 Dec 2020 00:11:55 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t4so11789894wrr.12;
        Mon, 07 Dec 2020 00:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZHbnLAGZkGJP/q4iRht9CUJ5VCvUom8JIn8PMTczG/c=;
        b=o3MxU/Ldm47nVQHNiYUY86ATyYbxy0vjtcx30LBo9/c4ThbTQH3Iz4Qe6NtgLQBYd6
         qEJEqAdR7oYtuQS+C5y8gHe/ApYooKt6tTgZ7NxVt0ssOldUZqKGdrxeUAxRjdSLk1jP
         JWJ4wViTkQDm4MpZlNfa9WPbnxLMFvHh2mrqjRdbCzokxmmltUnv7wtCjUy1mFdUoj9W
         4WRQRB4KLk6o0k9NvNrwgvQccxh1T+Y62vBV+TVAs8LR0ZAJONXj/Ad4AWn5xQqJFuUV
         m3EqK/fQoAwBXprSFTMG8tgKEHM1W8RByiqhOl1tezT6+XA/UoYdHHP80tzCDSPzMA0U
         LDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZHbnLAGZkGJP/q4iRht9CUJ5VCvUom8JIn8PMTczG/c=;
        b=LEwZzf6rIfiHn9e3k742jTm0YPZfMHJyQGsA2LTl0BJDjHoaU8a23+NESNZdVkpCXm
         nqvis934n+tP/FEoFFqLa9cSGYyslSwMChvUpN+fEPAyG3K5dK0Jh4IOuSlNulImO15K
         cWGfgv+Y8H2rlCWQ/LtNfNNCY4wP14OyxmiwFTdItIEG7QqM0M3BdS6o44nTSlHn7+rt
         muaVoEhq21ZUL0VSgm+Qu39VKtZL1d2wdI4zJFdTHyYXI9TV51nyiLKGVMiJozKa4s6u
         BRMNC1NjMcINV26SAImbgrZd+n05cJRB4h4V7jiKmankGo+qxJKjbO3WJ4PJq5PJ9Y8t
         aDvQ==
X-Gm-Message-State: AOAM532ClpUPki4HGUlS99eEFsqqNJphnTipxe3DtTkM2W88cbrN1P2h
        C1fdn7b2NG4LPY0BCEqXkdY=
X-Google-Smtp-Source: ABdhPJxtYXZXiO/xabWKi+QsDPyKh5n6kdYrvHOWMo7Xyj5Ul/bwHhtJtw+JhpGg4bYpaIbABdmAtQ==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr18013569wrr.119.1607328713784;
        Mon, 07 Dec 2020 00:11:53 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id g192sm12928854wme.48.2020.12.07.00.11.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 00:11:53 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mt7621-gpio: convert bindings to YAML format
Date:   Mon,  7 Dec 2020 09:11:51 +0100
Message-Id: <20201207081151.7489-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the mt7621-gpio device tree bindings to the new YAML format.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/gpio/mediatek,mt7621-gpio.txt    | 35 ---------
 .../bindings/gpio/mediatek,mt7621-gpio.yaml   | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
deleted file mode 100644
index e1c49b660d3a..000000000000
--- a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek MT7621 SoC GPIO controller bindings
-
-The IP core used inside these SoCs has 3 banks of 32 GPIOs each.
-The registers of all the banks are interwoven inside one single IO range.
-We load one GPIO controller instance per bank. Also the GPIO controller can receive
-interrupts on any of the GPIOs, either edge or level. It then interrupts the CPU
-using GIC INT12.
-
-Required properties for the top level node:
-- #gpio-cells : Should be two. The first cell is the GPIO pin number and the
-   second cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
-   Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
-- #interrupt-cells : Specifies the number of cells needed to encode an
-   interrupt. Should be 2. The first cell defines the interrupt number,
-   the second encodes the trigger flags encoded as described in
-   Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-- compatible:
-  - "mediatek,mt7621-gpio" for Mediatek controllers
-- reg : Physical base address and length of the controller's registers
-- interrupt-parent : phandle of the parent interrupt controller.
-- interrupts : Interrupt specifier for the controllers interrupt.
-- interrupt-controller : Mark the device node as an interrupt controller.
-- gpio-controller : Marks the device node as a GPIO controller.
-
-Example:
-	gpio@600 {
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-		compatible = "mediatek,mt7621-gpio";
-		gpio-controller;
-		interrupt-controller;
-		reg = <0x600 0x100>;
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml
new file mode 100644
index 000000000000..5bbb2a31266e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT7621 SoC GPIO controller
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  The IP core used inside these SoCs has 3 banks of 32 GPIOs each.
+  The registers of all the banks are interwoven inside one single IO range.
+  We load one GPIO controller instance per bank. Also the GPIO controller can receive
+  interrupts on any of the GPIOs, either edge or level. It then interrupts the CPU
+  using GIC INT12.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: mediatek,mt7621-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+  gpio-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+  - gpio-ranges
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+
+    gpio@600 {
+      compatible = "mediatek,mt7621-gpio";
+      reg = <0x600 0x100>;
+      #gpio-cells = <2>;
+      gpio-controller;
+      gpio-ranges = <&pinctrl 0 0 95>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.25.1

