Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1C833B18E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhCOLnB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhCOLmj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:39 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6A0C061574;
        Mon, 15 Mar 2021 04:42:39 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g25so7914084wmh.0;
        Mon, 15 Mar 2021 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1kgfo1GlUgw87eJ9yO13TZ5KeVWM6drXfPn8SdJX9o0=;
        b=s6K+cl8tzAATQ6fvF1DmI9X4Rhm0XEZCAPFLacF0o8736rhA7E9rChz7XWqNXyEJgn
         BVtYaxlJjPu4jJ0izuMkwUlwwDy/xKROHxG0BuTaz7PXZtJ3NN07rhRnu1YMRrrWVarJ
         VUsVUorUder7nh2Z/Y0N+/w6X4k82HO18cYttL/m+zQjU6N3JkGO5YT9bemVJ3fDocra
         A6njTnvVfvwQY0QAU8HqERXm3+8yNC0puMeNVtzXVsp1ponahaa1Rs8oM3di8c+731Ag
         e1NgBvawIvr0yKlfDyI+xbGSEe/yWVjET2J8Rx/B1NvMzLd8F5bYRRDHugzOVhF2mqIU
         hB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1kgfo1GlUgw87eJ9yO13TZ5KeVWM6drXfPn8SdJX9o0=;
        b=VKoPH790G0+We+hXH+TmjBd1DdmZAs9zi/YvhL7vY0Cc3qu+PTBJ8R34RVRoiyaP51
         vaa394DZdzu/mayRQ5tvWjjoJjdCiU17zZ7NmLO6NF6vF+QhfdaFSpFM59FjdGRoDQok
         XAA5xssaa5q+CTu7TaLYl3pyR6NbwBB0YHtOZeFbNdGa7WQ4OrKX0lRHeQ5ZMtEKunmR
         K3ZPpEyrJ7sDNbrSZLRjOhOcp6BPIDVfDjfOv9R/8sjHTJ1ALXO09QoP8npIcQxOy+wh
         dLLWAf5CTfnrAfwV769fCdA/Ir3SElBmngewUfUVJLB2Mu4YirFmkj90N5TDyA+JXU01
         4LcA==
X-Gm-Message-State: AOAM532zdLx9Oung5jsjc3fGNgY2GLeo+/GnzhhRdRPsxr9BxAWxTOSq
        hl5LW+0knUHVdSU11eyAx/0=
X-Google-Smtp-Source: ABdhPJwX/6x2FscHVGGv6gVh7lOll7J+LiyirLmW+BZnJIjGc7a80jWwtOupk0TAum6qsZBT/Pe+xA==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr25327928wmj.47.1615808557895;
        Mon, 15 Mar 2021 04:42:37 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:37 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 21/22] dt-bindings: add BCM6318 GPIO sysctl binding documentation
Date:   Mon, 15 Mar 2021 12:42:13 +0100
Message-Id: <20210315114214.3096-22-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6318 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
new file mode 100644
index 000000000000..7056a490a27d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6318-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6318 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM6318 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm6318-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  ranges:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
+    description:
+      GPIO controller for the SoC GPIOs. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
+
+  "^pinctrl@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../pinctrl/brcm,bcm6318-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml.
+
+required:
+  - "#address-cells"
+  - compatible
+  - ranges
+  - reg
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@10000080 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "brcm,bcm6318-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+      ranges = <0 0x10000080 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm6318-gpio";
+        reg = <0x0 0x10>;
+
+        data = <0xc>;
+        dirout = <0x4>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 50>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@10 {
+        compatible = "brcm,bcm6318-pinctrl";
+        reg = <0x18 0x10>, <0x54 0x18>;
+
+        pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
+          function = "ephy0_spd_led";
+          pins = "gpio0";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
+          function = "ephy1_spd_led";
+          pins = "gpio1";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
+          function = "ephy2_spd_led";
+          pins = "gpio2";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
+          function = "ephy3_spd_led";
+          pins = "gpio3";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led-pins {
+          function = "ephy0_act_led";
+          pins = "gpio4";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led-pins {
+          function = "ephy1_act_led";
+          pins = "gpio5";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led-pins {
+          function = "ephy2_act_led";
+          pins = "gpio6";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led-pins {
+          function = "ephy3_act_led";
+          pins = "gpio7";
+        };
+
+        pinctrl_serial_led: serial_led-pins {
+          pinctrl_serial_led_data: serial_led_data-pins {
+            function = "serial_led_data";
+            pins = "gpio6";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk-pins {
+            function = "serial_led_clk";
+            pins = "gpio7";
+          };
+        };
+
+        pinctrl_inet_act_led: inet_act_led-pins {
+          function = "inet_act_led";
+          pins = "gpio8";
+        };
+
+        pinctrl_inet_fail_led: inet_fail_led-pins {
+          function = "inet_fail_led";
+          pins = "gpio9";
+        };
+
+        pinctrl_dsl_led: dsl_led-pins {
+          function = "dsl_led";
+          pins = "gpio10";
+        };
+
+        pinctrl_post_fail_led: post_fail_led-pins {
+          function = "post_fail_led";
+          pins = "gpio11";
+        };
+
+        pinctrl_wlan_wps_led: wlan_wps_led-pins {
+          function = "wlan_wps_led";
+          pins = "gpio12";
+        };
+
+        pinctrl_usb_pwron: usb_pwron-pins {
+          function = "usb_pwron";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_device_led: usb_device_led-pins {
+          function = "usb_device_led";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_active: usb_active-pins {
+          function = "usb_active";
+          pins = "gpio40";
+        };
+      };
+    };
-- 
2.20.1

