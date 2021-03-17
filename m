Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DCF33F2F4
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhCQOiy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbhCQOiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:18 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196EEC061760;
        Wed, 17 Mar 2021 07:38:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x13so2074795wrs.9;
        Wed, 17 Mar 2021 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j6o0ujY9F8oWi3LVTegtHIchilcUS9LNzpiTld6XxG8=;
        b=nFhJRQBj7aiNO/rpfXADDv4LUnHbXM+78SARZ4MXrU0ycS/OnWRv9QT2zhVVlQDCPm
         NRggx0qtb8KM1aE5b2f6jR1YYJiN003K5pFY6ixZLI+1HbHEVIITNtqjdsCMOAWxbTEV
         Z3lQBAao24WEP8At+3p7/SamQ3Ri7U+FOgS/mKuXIl1WebazZIkhLOdWEFZ6sXcI5e/L
         w3fLJh/3Co2buYaM37zYeRfcTQ0o99let7UAXehceilC3X0uPw+BGPyn+iNkTAdlo0gn
         a9m7vO+iMbJAyn38wcYmGemKBeNDBYjM/n5KoAdyieJCMKHGWmTpUK5kGgDPHN50jHJ4
         IZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j6o0ujY9F8oWi3LVTegtHIchilcUS9LNzpiTld6XxG8=;
        b=D6f+AWNAMQqbVB8Sk175frAuQAkINoFDFdki1OK8fWe3S4X9tqQNjUeZG9mFR+xBi4
         SJ6BeWDZJZeU1sPThUgH8SccfeqIWH7Yqguu3MxB80yPNkL4dQJTrkeWuVGAmPFvH/Nt
         a1gCI8dAdp1Q6Vx8RXQJzhiZu6VaF6gG6rUkid/3tmDhbWKY+8J84pZ5aO1At4o/aqDi
         8u7tIXIElHFzW69nu9UM8HqrbJ4ssTzBV2Ry9Ne8GTXa49BKloiYG2UqK6scIURRVfc6
         jWc2Ky2+CsUX0Rz2L4uM3BYlpj4fJyWFx4if4ndfFzCD/x0iL88fcyV70PreFxh/oIvv
         KTvQ==
X-Gm-Message-State: AOAM532Wk3H1WQAlDlFS5mLkG16yi+9y/zqUBU7E0bC5QDbpIRYAL9ZQ
        d6dS0Pp4iABnTyuc5GsKEwg=
X-Google-Smtp-Source: ABdhPJwA/QoJGIcEatzb2w/fdigRb8NoPmcmFKXOR6wPzsB+EPKAUdD0m5TfHqWud3Yx+N85rwK5lw==
X-Received: by 2002:a5d:44c5:: with SMTP id z5mr4567657wrr.319.1615991896779;
        Wed, 17 Mar 2021 07:38:16 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:16 -0700 (PDT)
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
Subject: [PATCH v8 12/22] dt-bindings: add BCM6362 GPIO sysctl binding documentation
Date:   Wed, 17 Mar 2021 15:37:53 +0100
Message-Id: <20210317143803.26127-13-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6362 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
new file mode 100644
index 000000000000..48d14a5fe0d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6362-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6362 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM6362 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm6362-gpio-sysctl
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
+    $ref: "../pinctrl/brcm,bcm6362-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml.
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
+      compatible = "brcm,bcm6362-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+      ranges = <0 0x10000080 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm6362-gpio";
+        reg-names = "dirout", "dat";
+        reg = <0x0 0x8>, <0x8 0x8>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 48>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@18 {
+        compatible = "brcm,bcm6362-pinctrl";
+        reg = <0x18 0x10>, <0x38 0x4>;
+
+        pinctrl_usb_device_led: usb_device_led-pins {
+          function = "usb_device_led";
+          pins = "gpio0";
+        };
+
+        pinctrl_sys_irq: sys_irq-pins {
+          function = "sys_irq";
+          pins = "gpio1";
+        };
+
+        pinctrl_serial_led: serial_led-pins {
+          pinctrl_serial_led_clk: serial_led_clk-pins {
+            function = "serial_led_clk";
+            pins = "gpio2";
+          };
+
+          pinctrl_serial_led_data: serial_led_data-pins {
+            function = "serial_led_data";
+            pins = "gpio3";
+          };
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data-pins {
+          function = "robosw_led_data";
+          pins = "gpio4";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk-pins {
+          function = "robosw_led_clk";
+          pins = "gpio5";
+        };
+
+        pinctrl_robosw_led0: robosw_led0-pins {
+          function = "robosw_led0";
+          pins = "gpio6";
+        };
+
+        pinctrl_robosw_led1: robosw_led1-pins {
+          function = "robosw_led1";
+          pins = "gpio7";
+        };
+
+        pinctrl_inet_led: inet_led-pins {
+          function = "inet_led";
+          pins = "gpio8";
+        };
+
+        pinctrl_spi_cs2: spi_cs2-pins {
+          function = "spi_cs2";
+          pins = "gpio9";
+        };
+
+        pinctrl_spi_cs3: spi_cs3-pins {
+          function = "spi_cs3";
+          pins = "gpio10";
+        };
+
+        pinctrl_ntr_pulse: ntr_pulse-pins {
+          function = "ntr_pulse";
+          pins = "gpio11";
+        };
+
+        pinctrl_uart1_scts: uart1_scts-pins {
+          function = "uart1_scts";
+          pins = "gpio12";
+        };
+
+        pinctrl_uart1_srts: uart1_srts-pins {
+          function = "uart1_srts";
+          pins = "gpio13";
+        };
+
+        pinctrl_uart1: uart1-pins {
+          pinctrl_uart1_sdin: uart1_sdin-pins {
+            function = "uart1_sdin";
+            pins = "gpio14";
+          };
+
+          pinctrl_uart1_sdout: uart1_sdout-pins {
+            function = "uart1_sdout";
+            pins = "gpio15";
+          };
+        };
+
+        pinctrl_adsl_spi: adsl_spi-pins {
+          pinctrl_adsl_spi_miso: adsl_spi_miso-pins {
+            function = "adsl_spi_miso";
+            pins = "gpio16";
+          };
+
+          pinctrl_adsl_spi_mosi: adsl_spi_mosi-pins {
+            function = "adsl_spi_mosi";
+            pins = "gpio17";
+          };
+
+          pinctrl_adsl_spi_clk: adsl_spi_clk-pins {
+            function = "adsl_spi_clk";
+            pins = "gpio18";
+          };
+
+          pinctrl_adsl_spi_cs: adsl_spi_cs-pins {
+            function = "adsl_spi_cs";
+            pins = "gpio19";
+          };
+        };
+
+        pinctrl_ephy0_led: ephy0_led-pins {
+          function = "ephy0_led";
+          pins = "gpio20";
+        };
+
+        pinctrl_ephy1_led: ephy1_led-pins {
+          function = "ephy1_led";
+          pins = "gpio21";
+        };
+
+        pinctrl_ephy2_led: ephy2_led-pins {
+          function = "ephy2_led";
+          pins = "gpio22";
+        };
+
+        pinctrl_ephy3_led: ephy3_led-pins {
+          function = "ephy3_led";
+          pins = "gpio23";
+        };
+
+        pinctrl_ext_irq0: ext_irq0-pins {
+          function = "ext_irq0";
+          pins = "gpio24";
+        };
+
+        pinctrl_ext_irq1: ext_irq1-pins {
+          function = "ext_irq1";
+          pins = "gpio25";
+        };
+
+        pinctrl_ext_irq2: ext_irq2-pins {
+          function = "ext_irq2";
+          pins = "gpio26";
+        };
+
+        pinctrl_ext_irq3: ext_irq3-pins {
+          function = "ext_irq3";
+          pins = "gpio27";
+        };
+
+        pinctrl_nand: nand-pins {
+          function = "nand";
+          group = "nand_grp";
+        };
+      };
+    };
-- 
2.20.1

