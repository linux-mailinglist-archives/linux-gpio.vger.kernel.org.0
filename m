Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F97F34735C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhCXIUR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhCXITi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:38 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F202AC0613DC;
        Wed, 24 Mar 2021 01:19:37 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x13so23455299wrs.9;
        Wed, 24 Mar 2021 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqPxoNXDX+gzwRxDi3CG1oGbczMP3jWbfKJOWRwgW6M=;
        b=ajpQiY737pgumowAOOJ0AxJ8MGswP7iZpT53mKwgvmfL2FeCkw0IIwbfUrLYqcqoMK
         keJuM6XhD2Npc/sK2h3MqFQGn2lezn1ahj3muYsqjXK04OLHGXm0T17WzUAQNmAnvdXh
         Px0b++reF0OeL6STdSi6yqxYWjwBOmL6B/iXFmF+3yhyfX3MB+VvldegejoJ7ICkoaHN
         yMfWyGBYDNvpDp+Uf8AISlhbGXsu8IICRtRtQ/JQcRjQpSFw5qUB3FIYRSRELGQ4kJAv
         fNc9NoMfIX+oi2bJnOlS6owsl6+Shl67qyfMhzVBICLIb3etFk+Zi1O1i/4z51055T+D
         YIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqPxoNXDX+gzwRxDi3CG1oGbczMP3jWbfKJOWRwgW6M=;
        b=Pn0ILcX3f0cgXp4tFtxHXmXhKY61pALJzzR1sHqLVbcp7WzccKPhcw8COPt99wE3lM
         f1p83Omg4Kn4k5OHdyI5M9qdWR3iS9rxap58KKF8NInqbw/bYDfD5jpDpIG1WV4BQOMz
         iBSG+LsLO+P1hmc5l2xDEAiP0BTOH4DZKAzopk4ep1fmoPYOTDMcv96/uHAxVlTVWKSK
         uS/sCjJ+CvY29kMb2b3Po9ciN9zS7h4KmfQYPgBej+K4KF7Teo08EHJ3zTCdbDmDiO4v
         oghNdsHFtItBRHvEBZq+VeYMSmKOoANAWwdt11YNLC3bQxusYNkv0vcdphYIFGgyogaD
         F9KA==
X-Gm-Message-State: AOAM530DQYfJbBQ0dp6HukEBI63ZYbsSqNL6ZENShBxNAHJfce2+R2Nu
        YZ7dlAdKWiDON7flUZSL1sc=
X-Google-Smtp-Source: ABdhPJwSxOdiRxAKVztsRZ8menf6lZtGYhPCH2dTQF5/biYtRVesjdU3ruTN4PkukQXPgyXZmbvt6A==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr2135438wru.366.1616573976707;
        Wed, 24 Mar 2021 01:19:36 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:36 -0700 (PDT)
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
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v9 11/22] dt-bindings: add BCM6362 pincontroller binding documentation
Date:   Wed, 24 Mar 2021 09:19:12 +0100
Message-Id: <20210324081923.20379-12-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6362 SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v9: no changes
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 206 ++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
new file mode 100644
index 000000000000..6f68fee373bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6362-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6362 pin controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Bindings for Broadcom's BCM6362 memory-mapped pin controller.
+
+properties:
+  compatible:
+    const: brcm,bcm6362-pinctrl
+
+  reg:
+    maxItems: 2
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ usb_device_led, sys_irq, serial_led_clk, serial_led_data,
+                robosw_led_data, robosw_led_clk, robosw_led0, robosw_led1,
+                inet_led, spi_cs2, spi_cs3, ntr_pulse, uart1_scts,
+                uart1_srts, uart1_sdin, uart1_sdout, adsl_spi_miso,
+                adsl_spi_mosi, adsl_spi_clk, adsl_spi_cs, ephy0_led,
+                ephy1_led, ephy2_led, ephy3_led, ext_irq0, ext_irq1,
+                ext_irq2, ext_irq3, nand ]
+
+      pins:
+        enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, nand_grp ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@18 {
+      compatible = "brcm,bcm6362-pinctrl";
+      reg = <0x18 0x10>, <0x38 0x4>;
+
+      pinctrl_usb_device_led: usb_device_led-pins {
+        function = "usb_device_led";
+        pins = "gpio0";
+      };
+
+      pinctrl_sys_irq: sys_irq-pins {
+        function = "sys_irq";
+        pins = "gpio1";
+      };
+
+      pinctrl_serial_led: serial_led-pins {
+        pinctrl_serial_led_clk: serial_led_clk-pins {
+          function = "serial_led_clk";
+          pins = "gpio2";
+        };
+
+        pinctrl_serial_led_data: serial_led_data-pins {
+          function = "serial_led_data";
+          pins = "gpio3";
+        };
+      };
+
+      pinctrl_robosw_led_data: robosw_led_data-pins {
+        function = "robosw_led_data";
+        pins = "gpio4";
+      };
+
+      pinctrl_robosw_led_clk: robosw_led_clk-pins {
+        function = "robosw_led_clk";
+        pins = "gpio5";
+      };
+
+      pinctrl_robosw_led0: robosw_led0-pins {
+        function = "robosw_led0";
+        pins = "gpio6";
+      };
+
+      pinctrl_robosw_led1: robosw_led1-pins {
+        function = "robosw_led1";
+        pins = "gpio7";
+      };
+
+      pinctrl_inet_led: inet_led-pins {
+        function = "inet_led";
+        pins = "gpio8";
+      };
+
+      pinctrl_spi_cs2: spi_cs2-pins {
+        function = "spi_cs2";
+        pins = "gpio9";
+      };
+
+      pinctrl_spi_cs3: spi_cs3-pins {
+        function = "spi_cs3";
+        pins = "gpio10";
+      };
+
+      pinctrl_ntr_pulse: ntr_pulse-pins {
+        function = "ntr_pulse";
+        pins = "gpio11";
+      };
+
+      pinctrl_uart1_scts: uart1_scts-pins {
+        function = "uart1_scts";
+        pins = "gpio12";
+      };
+
+      pinctrl_uart1_srts: uart1_srts-pins {
+        function = "uart1_srts";
+        pins = "gpio13";
+      };
+
+      pinctrl_uart1: uart1-pins {
+        pinctrl_uart1_sdin: uart1_sdin-pins {
+          function = "uart1_sdin";
+          pins = "gpio14";
+        };
+
+        pinctrl_uart1_sdout: uart1_sdout-pins {
+          function = "uart1_sdout";
+          pins = "gpio15";
+        };
+      };
+
+      pinctrl_adsl_spi: adsl_spi-pins {
+        pinctrl_adsl_spi_miso: adsl_spi_miso-pins {
+          function = "adsl_spi_miso";
+          pins = "gpio16";
+        };
+
+        pinctrl_adsl_spi_mosi: adsl_spi_mosi-pins {
+          function = "adsl_spi_mosi";
+          pins = "gpio17";
+        };
+
+        pinctrl_adsl_spi_clk: adsl_spi_clk-pins {
+          function = "adsl_spi_clk";
+          pins = "gpio18";
+        };
+
+        pinctrl_adsl_spi_cs: adsl_spi_cs-pins {
+          function = "adsl_spi_cs";
+          pins = "gpio19";
+        };
+      };
+
+      pinctrl_ephy0_led: ephy0_led-pins {
+        function = "ephy0_led";
+        pins = "gpio20";
+      };
+
+      pinctrl_ephy1_led: ephy1_led-pins {
+        function = "ephy1_led";
+        pins = "gpio21";
+      };
+
+      pinctrl_ephy2_led: ephy2_led-pins {
+        function = "ephy2_led";
+        pins = "gpio22";
+      };
+
+      pinctrl_ephy3_led: ephy3_led-pins {
+        function = "ephy3_led";
+        pins = "gpio23";
+      };
+
+      pinctrl_ext_irq0: ext_irq0-pins {
+        function = "ext_irq0";
+        pins = "gpio24";
+      };
+
+      pinctrl_ext_irq1: ext_irq1-pins {
+        function = "ext_irq1";
+        pins = "gpio25";
+      };
+
+      pinctrl_ext_irq2: ext_irq2-pins {
+        function = "ext_irq2";
+        pins = "gpio26";
+      };
+
+      pinctrl_ext_irq3: ext_irq3-pins {
+        function = "ext_irq3";
+        pins = "gpio27";
+      };
+
+      pinctrl_nand: nand-pins {
+        function = "nand";
+        group = "nand_grp";
+      };
+    };
-- 
2.20.1

