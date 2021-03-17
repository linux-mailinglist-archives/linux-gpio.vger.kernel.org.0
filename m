Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E9033F2D6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhCQOiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbhCQOiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:13 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AA7C06174A;
        Wed, 17 Mar 2021 07:38:12 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso3508028wmi.3;
        Wed, 17 Mar 2021 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mHfGkyZQnh+hAHpzTQe7BdIqJjCYd3KZsiLOAetaJoQ=;
        b=NpNhyOW6zwOGPizdu6sZ5ZxaYw52+DqUwXiGRM4pJJCQUgKtQRbfi6MSbFv1t+dh/M
         b56E42UKWjE/iMNuevt9vjokrqOvIMkE1Wq5URk3eXcHvYWQQ8uDmXtdqv1bjJuW2dn7
         Sz0GJfbdOpXSBv1gEIZGrZ0tIzHIeC04QuutcUMyC3TqLeae4icEgJyxyFBV/pLhJm5T
         ycNTU8XCPmXR4zo5ikFt1WLqIsV5hbFAO1JNDDC78Z6tZ1m+u1Y7/9Ept6U9c1NouoNM
         TLKLyopG+VQlppvPvks6QAVGIj/ifVvIvAXoWhzYw6JBKdrpwg2P1MG6jXg261a7ndc1
         uKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mHfGkyZQnh+hAHpzTQe7BdIqJjCYd3KZsiLOAetaJoQ=;
        b=iw+9zSO7UnOpX0riFu+M62wBBoLptdbtsmtyIyShVH56QgkDXolCRBhoA4wiXdJKof
         Cdwt1oBqKQ+vWLQoe60DkX+XEPycCpi09RX8REPxokZ6zW/nwGxX5yLW8TbCp1LWicHK
         7u8lGNaJMB+Hisiwy0gYMEF9ZYI+l/YH/feWzkQKrVLfGK/IFrmkeuHdXlBCDKYvCjkL
         SJ7denxQl5f85DctGOaKMkSiSzvidkDm+MmKEQj4nOLA2EvvBn5Vm/waW9NZqjHUwaXb
         aTtnMrZp6XGdkaGG/i6nWrIldv/JNJCe8xgPOL8dIBiHTXSkbb+y/tgbvm+vY5cT1BKc
         8iAQ==
X-Gm-Message-State: AOAM532KPJn0WQwJ1XA5kC/quOSnq9pkUCH59syy9uYkYrSHsKdIeh+6
        ordSCC02yR4NrSbIVWh+HAc=
X-Google-Smtp-Source: ABdhPJzOD3GS1hfuNYfiT17wAqGpfKVUxKPBOwRCpT9+tzIxWhYZKUtXtuLzigQomExiOBj5/1tPrg==
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr4112041wmf.12.1615991891610;
        Wed, 17 Mar 2021 07:38:11 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:11 -0700 (PDT)
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
Subject: [PATCH v8 06/22] dt-bindings: add BCM6328 GPIO sysctl binding documentation
Date:   Wed, 17 Mar 2021 15:37:47 +0100
Message-Id: <20210317143803.26127-7-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6328 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
new file mode 100644
index 000000000000..33963c11ae62
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6328-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6328 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM6328 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm6328-gpio-sysctl
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
+    $ref: "../pinctrl/brcm,bcm6328-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml.
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
+      compatible = "brcm,bcm6328-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+      ranges = <0 0x10000080 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm6328-gpio";
+        reg-names = "dirout", "dat";
+        reg = <0x0 0x8>, <0x8 0x8>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 32>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@18 {
+        compatible = "brcm,bcm6328-pinctrl";
+        reg = <0x18 0x10>;
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
+          pins = "gpio11";
+        };
+
+        pinctrl_pcie_clkreq: pcie_clkreq-pins {
+          function = "pcie_clkreq";
+          pins = "gpio16";
+        };
+
+        pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
+          function = "led";
+          pins = "gpio17";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
+          function = "led";
+          pins = "gpio18";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
+          function = "led";
+          pins = "gpio19";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
+          function = "led";
+          pins = "gpio20";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led-pins {
+          function = "ephy0_act_led";
+          pins = "gpio25";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led-pins {
+          function = "ephy1_act_led";
+          pins = "gpio26";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led-pins {
+          function = "ephy2_act_led";
+          pins = "gpio27";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led-pins {
+          function = "ephy3_act_led";
+          pins = "gpio28";
+        };
+
+        pinctrl_hsspi_cs1: hsspi_cs1-pins {
+          function = "hsspi_cs1";
+          pins = "hsspi_cs1";
+        };
+
+        pinctrl_usb_port1_device: usb_port1_device-pins {
+          function = "usb_device_port";
+          pins = "usb_port1";
+        };
+
+        pinctrl_usb_port1_host: usb_port1_host-pins {
+          function = "usb_host_port";
+          pins = "usb_port1";
+        };
+      };
+    };
-- 
2.20.1

