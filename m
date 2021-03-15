Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744CA33B17E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbhCOLm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhCOLmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:33 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5D0C061574;
        Mon, 15 Mar 2021 04:42:33 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so2145473wmq.1;
        Mon, 15 Mar 2021 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fDEDG70CzMg1775todcadPP+F1cQTKgY3bFc03l6sRg=;
        b=uCkpnjevIefhDMN76XJZJInIn4D88lgqTrjAGJgV2qyCN7L7SxtCOBo5FW19yFzZWV
         xa7wX6qdnW4NI5OdIC8ro4SzaEMY9FyG704jaUv5FvjDeFqASDwNNdRPquTzIR3ugHb6
         uYGnIGlbZQJM+hdFu/HNw3+gUvtWw/vgQdw4mMOpxnai9M5CLtlnXGVmOk0J5SMaxGGQ
         rchOVBYmnVY7gmbBrqKDfYsbVmWxIQS4jVOdZu2jchypga0WyKjNNWmiFK+JbB/0QIkM
         gVa+nwuooKWZvo3FmTscYFJ2cTFKZyHYdCMmMRfM5/M0I7aJirDnX/aMCqPyeo5sEdL0
         N+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDEDG70CzMg1775todcadPP+F1cQTKgY3bFc03l6sRg=;
        b=LsCe02dlTkRrzHIyCDTjfIjdm7s7Mcn4jCMRnRah50RVMiun9nhozU7S5dnc2CYxdy
         +lt5po/ra2JS1RRGEDu/7z5ral5OkXEq6JdQyxoh+VI+a112DJL1yc148TyRO5K/niEA
         On+DuVX2kgqkm+IXDB+gskfOWTIPfdzaVuweDJdcrI93i33LgQ5XQEiOCAK7WoTgJ3R3
         R7yajsvJhX8iBDYy0tX/L356ZLV8yZDU4LEOuVnX5M4GYfKt/TxrFZ8i/w98WDGlvCam
         FxdJrhloWftGDJtCWhn38qjc81idXJ83XYITvgtVyJRxmCT6c1740MYvS+qxIbrw4v1o
         rdNw==
X-Gm-Message-State: AOAM530L73r1VRWeGlgbCZYVwL90EW2ES5qgaPuL0O5SSQGyVuL7jDL4
        vk16adjXF1aR0omEWSU7KaU=
X-Google-Smtp-Source: ABdhPJwojn0cp4UHVofO3zByuBrQww2rlSho2fO0TOTDcg7QItND7igPZ0F5RXcz3JDUMtZI1J9arw==
X-Received: by 2002:a1c:2017:: with SMTP id g23mr25272317wmg.126.1615808552010;
        Mon, 15 Mar 2021 04:42:32 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:31 -0700 (PDT)
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
Subject: [PATCH v7 15/22] dt-bindings: add BCM6368 GPIO sysctl binding documentation
Date:   Mon, 15 Mar 2021 12:42:07 +0100
Message-Id: <20210315114214.3096-16-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6368 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         | 248 ++++++++++++++++++
 1 file changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
new file mode 100644
index 000000000000..8120552fb2a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
@@ -0,0 +1,248 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6368-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6368 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM6368 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm6368-gpio-sysctl
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
+    $ref: "../pinctrl/brcm,bcm6368-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml.
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
+      compatible = "brcm,bcm6368-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+      ranges = <0 0x10000080 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm6368-gpio";
+        reg = <0x0 0x10>;
+
+        data = <0xc>;
+        dirout = <0x4>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 38>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@18 {
+        compatible = "brcm,bcm6368-pinctrl";
+        reg = <0x18 0x4>, <0x38 0x4>;
+
+        pinctrl_analog_afe_0: analog_afe_0-pins {
+          function = "analog_afe_0";
+          pins = "gpio0";
+        };
+
+        pinctrl_analog_afe_1: analog_afe_1-pins {
+          function = "analog_afe_1";
+          pins = "gpio1";
+        };
+
+        pinctrl_sys_irq: sys_irq-pins {
+          function = "sys_irq";
+          pins = "gpio2";
+        };
+
+        pinctrl_serial_led: serial_led-pins {
+          pinctrl_serial_led_data: serial_led_data-pins {
+            function = "serial_led_data";
+            pins = "gpio3";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk-pins {
+            function = "serial_led_clk";
+            pins = "gpio4";
+          };
+        };
+
+        pinctrl_inet_led: inet_led-pins {
+          function = "inet_led";
+          pins = "gpio5";
+        };
+
+        pinctrl_ephy0_led: ephy0_led-pins {
+          function = "ephy0_led";
+          pins = "gpio6";
+        };
+
+        pinctrl_ephy1_led: ephy1_led-pins {
+          function = "ephy1_led";
+          pins = "gpio7";
+        };
+
+        pinctrl_ephy2_led: ephy2_led-pins {
+          function = "ephy2_led";
+          pins = "gpio8";
+        };
+
+        pinctrl_ephy3_led: ephy3_led-pins {
+          function = "ephy3_led";
+          pins = "gpio9";
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data-pins {
+          function = "robosw_led_data";
+          pins = "gpio10";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk-pins {
+          function = "robosw_led_clk";
+          pins = "gpio11";
+        };
+
+        pinctrl_robosw_led0: robosw_led0-pins {
+          function = "robosw_led0";
+          pins = "gpio12";
+        };
+
+        pinctrl_robosw_led1: robosw_led1-pins {
+          function = "robosw_led1";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_device_led: usb_device_led-pins {
+          function = "usb_device_led";
+          pins = "gpio14";
+        };
+
+        pinctrl_pci: pci-pins {
+          pinctrl_pci_req1: pci_req1-pins {
+            function = "pci_req1";
+            pins = "gpio16";
+          };
+
+          pinctrl_pci_gnt1: pci_gnt1-pins {
+            function = "pci_gnt1";
+            pins = "gpio17";
+          };
+
+          pinctrl_pci_intb: pci_intb-pins {
+            function = "pci_intb";
+            pins = "gpio18";
+          };
+
+          pinctrl_pci_req0: pci_req0-pins {
+            function = "pci_req0";
+            pins = "gpio19";
+          };
+
+          pinctrl_pci_gnt0: pci_gnt0-pins {
+            function = "pci_gnt0";
+            pins = "gpio20";
+          };
+        };
+
+        pinctrl_pcmcia: pcmcia-pins {
+          pinctrl_pcmcia_cd1: pcmcia_cd1-pins {
+            function = "pcmcia_cd1";
+            pins = "gpio22";
+          };
+
+          pinctrl_pcmcia_cd2: pcmcia_cd2-pins {
+            function = "pcmcia_cd2";
+            pins = "gpio23";
+          };
+
+          pinctrl_pcmcia_vs1: pcmcia_vs1-pins {
+            function = "pcmcia_vs1";
+            pins = "gpio24";
+          };
+
+          pinctrl_pcmcia_vs2: pcmcia_vs2-pins {
+            function = "pcmcia_vs2";
+            pins = "gpio25";
+          };
+        };
+
+        pinctrl_ebi_cs2: ebi_cs2-pins {
+          function = "ebi_cs2";
+          pins = "gpio26";
+        };
+
+        pinctrl_ebi_cs3: ebi_cs3-pins {
+          function = "ebi_cs3";
+          pins = "gpio27";
+        };
+
+        pinctrl_spi_cs2: spi_cs2-pins {
+          function = "spi_cs2";
+          pins = "gpio28";
+        };
+
+        pinctrl_spi_cs3: spi_cs3-pins {
+          function = "spi_cs3";
+          pins = "gpio29";
+        };
+
+        pinctrl_spi_cs4: spi_cs4-pins {
+          function = "spi_cs4";
+          pins = "gpio30";
+        };
+
+        pinctrl_spi_cs5: spi_cs5-pins {
+          function = "spi_cs5";
+          pins = "gpio31";
+        };
+
+        pinctrl_uart1: uart1-pins {
+          function = "uart1";
+          group = "uart1_grp";
+        };
+      };
+    };
-- 
2.20.1

