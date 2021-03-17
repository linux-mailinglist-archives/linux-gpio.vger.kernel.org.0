Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C9633F2DC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhCQOi1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbhCQOiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:15 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687C8C06174A;
        Wed, 17 Mar 2021 07:38:15 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z2so2068186wrl.5;
        Wed, 17 Mar 2021 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZOjFrokL6WQmsOuNhUvF/BdE/diXtvT3bQ99m3WSpEQ=;
        b=eJ3emA7P8xRh2Gl8ZL052jQpYfSbKLTZmEsOe+XNyxawmhnhO2dprKwVxW9ZvLC78C
         GQsVSXKXnSKzGlFQKzr4Lw5euNeoxdmgRiiaMVL2TeZJwk2gCBjn/y7vXkmkJ+/tbLpO
         f0KyoduA1+3iAZFabbn08ZX2If4ycrWpFKMmAQ26+1GE74ca5fwnpx33Zl91FAcqPOim
         uld8XqgjxshkPem64P2sG9Kam//NXdnOZfjjDrg67ZWInmztF0J7zvngth8HZ8FcEOgF
         82q6ANHJ/tz9N0CE1U9X5EQoZ+FEA2AxeIN+Z4SRyP+M7wBeL/5BMLEAhBp+nEfATMWo
         xyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZOjFrokL6WQmsOuNhUvF/BdE/diXtvT3bQ99m3WSpEQ=;
        b=DZN6jRfmcqH/2K7GWkbUTCFmSngDHM0nZEs6JeIy5B7oztMi+RVM55NdRAcTQatIhC
         EWnDkSBr3GYIz66935cKEKfGCmxMUQpliqHaxuqKPzfOiLWOpKoWHTGX4r1wG+O+TBLN
         6z1Yj0DNRP3GWZjVWwkc5qdlVDogQhKkPJBmVBaR4bsg+mtz+qAJliWd3XExQjK2vf6l
         XDZH15TpP0rL5LCL+a7b5yykOZ24/mjhwuGTQ/slYyRGLz85ynaw+p8bmwH5hTRJ+RpN
         PGAyquCzMmkoUv2iuV7aK/sAOHZWvrcCEXrXR1sS9qwA/oCWIRMt2hgge5HLI69/gkGk
         N0Yg==
X-Gm-Message-State: AOAM530Ys85yv7j33VdjwOhHg94UBOkftTAlWw+qoiMZGTh9HT2+YXvA
        95qoWJOjL+jHRsWF/kfMAVo=
X-Google-Smtp-Source: ABdhPJzMGgWLrTm0jor/4zJEHZQ141rzpvIIGcjSGqHVVqRg0eYfBZIhWDudyBassK2//1pRnW+ilQ==
X-Received: by 2002:adf:db4c:: with SMTP id f12mr4751010wrj.93.1615991894116;
        Wed, 17 Mar 2021 07:38:14 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:13 -0700 (PDT)
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
Subject: [PATCH v8 09/22] dt-bindings: add BCM6358 GPIO sysctl binding documentation
Date:   Wed, 17 Mar 2021 15:37:50 +0100
Message-Id: <20210317143803.26127-10-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6358 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
new file mode 100644
index 000000000000..3e44bea78b03
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6358-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6358 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM6358 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm6358-gpio-sysctl
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
+    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    description:
+      GPIO controller for the SoC GPIOs. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+
+  "^pinctrl@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../pinctrl/brcm,bcm6358-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml.
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
+    syscon@fffe0080 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "brcm,bcm6358-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0xfffe0080 0x80>;
+      ranges = <0 0xfffe0080 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm6358-gpio";
+        reg-names = "dirout", "dat";
+        reg = <0x0 0x8>, <0x8 0x8>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 40>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@18 {
+        compatible = "brcm,bcm6358-pinctrl";
+        reg = <0x18 0x4>;
+
+        pinctrl_ebi_cs: ebi_cs-pins {
+          function = "ebi_cs";
+          groups = "ebi_cs_grp";
+        };
+
+        pinctrl_uart1: uart1-pins {
+          function = "uart1";
+          groups = "uart1_grp";
+        };
+
+        pinctrl_serial_led: serial_led-pins {
+          function = "serial_led";
+          groups = "serial_led_grp";
+        };
+
+        pinctrl_legacy_led: legacy_led-pins {
+          function = "legacy_led";
+          groups = "legacy_led_grp";
+        };
+
+        pinctrl_led: led-pins {
+          function = "led";
+          groups = "led_grp";
+        };
+
+        pinctrl_spi_cs_23: spi_cs-pins {
+          function = "spi_cs";
+          groups = "spi_cs_grp";
+        };
+
+        pinctrl_utopia: utopia-pins {
+          function = "utopia";
+          groups = "utopia_grp";
+        };
+
+        pinctrl_pwm_syn_clk: pwm_syn_clk-pins {
+          function = "pwm_syn_clk";
+          groups = "pwm_syn_clk_grp";
+        };
+
+        pinctrl_sys_irq: sys_irq-pins {
+          function = "sys_irq";
+          groups = "sys_irq_grp";
+        };
+      };
+    };
-- 
2.20.1

