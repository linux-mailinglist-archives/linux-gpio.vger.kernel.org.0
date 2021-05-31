Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E429395A13
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 14:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhEaMJv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 08:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhEaMJt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 08:09:49 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA0FC061574
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:08:08 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 27so8221936pgy.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9giE7g3aTHBAeWI8diKUX6Zo2VQVs3w7fN4PhUxZkco=;
        b=IO+ET87nDkaC14cKJz5sx9p5HsHbkRWcBEfREc6D93cSLqKaXfqOd85AZ8a2LcPJmk
         qjDv0xHGlSQ7H+ZVpcgBaz/iCgb1iNioQ30yjMuorhfin2ULwOPUHoRiZv3q8hvMRccF
         gJCSaStw+8qOytvlnomWAprNjtq0VmduvYQawVPewy1uSpgybLcdpqhRebkPJEyLBt9o
         L6qE0Txe1/dR28CgAwG0iOQuZdgP5lh5AkCDkaXbi25N8IWug/KECI04PuZkqewZCpn1
         VPVGFM1OlKqUkFyhIIaVXBqyUte6hFN38H56nzfX4LYLkSFKEiBUDDVscHtOMWMwychr
         R4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9giE7g3aTHBAeWI8diKUX6Zo2VQVs3w7fN4PhUxZkco=;
        b=NV6qXF2HJ6yN+L3mV5qPLs2JM+bJ3/A77FjoK6UqvRXf2nVyjKHycdOUwF0H71xBfA
         WF76r0x7DifQl2wUnUNh30L4MItEuKGCSzqKidFjESK61mHAOVohX9HbinJpzEodPMke
         DWMxpyDwb7tj7QHz6nWLUeEG+sVOyYM5L2cQ5I1/Ei+zA/p6Vf4ctoxbWN9M0PAfCvja
         TyAXlNNyNLAqHqvvVMFZ9bNrn9IeSbyUeAEybsz5xkcdMouUxbShK6Pr8m/W4pDmOLJ9
         Yo0vjhSn6QvCfabNoGgOQF4ZyME1/w6l+6DjV34pzFJwN2jI4JmMcEyeC0JKYkz8B9qP
         xjaQ==
X-Gm-Message-State: AOAM530u7vOInzAEULg/IynRsYjo0jA8j4fbwg20zmnI20scCcS7DPRR
        IRsYAmwEtSLafM8Hzm7zZRI3
X-Google-Smtp-Source: ABdhPJxmSLxiaSi1QQtJcRjqqIJZYOT3XWF7iDtUp4AAUC30VrYstwj3UKXVVw8/joonsuLFuLGslg==
X-Received: by 2002:a65:6a05:: with SMTP id m5mr22252815pgu.319.1622462888382;
        Mon, 31 May 2021 05:08:08 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
        by smtp.gmail.com with ESMTPSA id gn4sm10925474pjb.16.2021.05.31.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 05:08:07 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Soren Brinkmann <soren.brinkmann@xilinx.com>,
        Harini Katakam <harinik@xilinx.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] dt-bindings: gpio: zynq: convert bindings to YAML
Date:   Mon, 31 May 2021 21:07:53 +0900
Message-Id: <20210531120753.719381-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert gpio for Xilinx Zynq SoC bindings documentation to YAML.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../devicetree/bindings/gpio/gpio-zynq.txt    | 36 -----------
 .../devicetree/bindings/gpio/gpio-zynq.yaml   | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
deleted file mode 100644
index f693e82b4c0f1b..00000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Xilinx Zynq GPIO controller Device Tree Bindings
--------------------------------------------
-
-Required properties:
-- #gpio-cells 		: Should be two
-			  - First cell is the GPIO line number
-			  - Second cell is used to specify optional
-			    parameters (unused)
-- compatible		: Should be "xlnx,zynq-gpio-1.0" or
-			  "xlnx,zynqmp-gpio-1.0" or "xlnx,versal-gpio-1.0
-			  or "xlnx,pmc-gpio-1.0
-- clocks		: Clock specifier (see clock bindings for details)
-- gpio-controller	: Marks the device node as a GPIO controller.
-- interrupts		: Interrupt specifier (see interrupt bindings for
-			  details)
-- interrupt-controller	: Marks the device node as an interrupt controller.
-- #interrupt-cells 	: Should be 2.  The first cell is the GPIO number.
-			  The second cell bits[3:0] is used to specify trigger type and level flags:
-			      1 = low-to-high edge triggered.
-			      2 = high-to-low edge triggered.
-			      4 = active high level-sensitive.
-			      8 = active low level-sensitive.
-- reg			: Address and length of the register set for the device
-
-Example:
-	gpio@e000a000 {
-		#gpio-cells = <2>;
-		compatible = "xlnx,zynq-gpio-1.0";
-		clocks = <&clkc 42>;
-		gpio-controller;
-		interrupt-parent = <&intc>;
-		interrupts = <0 20 4>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		reg = <0xe000a000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
new file mode 100644
index 00000000000000..378da2649e668e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-zynq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Zynq GPIO controller Device Tree Bindings
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+
+properties:
+  compatible:
+    const: xlnx,zynq-gpio-1.0
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - interrupts
+  - gpio-controller
+  - interrupt-controller
+  - "#interrupt-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@e000a000 {
+      #gpio-cells = <2>;
+      compatible = "xlnx,zynq-gpio-1.0";
+      clocks = <&clkc 42>;
+      gpio-controller;
+      interrupt-parent = <&intc>;
+      interrupts = <0 20 4>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      reg = <0xe000a000 0x1000>;
+    };
-- 
2.30.0

