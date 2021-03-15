Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEF433B171
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhCOLmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhCOLm3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:29 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFF0C061574;
        Mon, 15 Mar 2021 04:42:29 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g8so7932556wmd.4;
        Mon, 15 Mar 2021 04:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Wtsa9fuoFH1Qxx/T1deE0ds5xtMhY7s4pJm1vmurJ4o=;
        b=ORFFI+m3FJe23QzSjUa4SShj0cLBvCYZBvMPbtPklVftc4WVeXs7oE9WL2wujsSA8j
         mWJFkBGXLAzyzrO0oWUU0I06PrFEKe5qv/TxD/Rg5F5fHd+j0mp2AMR+q196O+ny2643
         VGls/dSyc88Zs2reNC46GE071UamhV3uFyx7yaMeqcZ+y8yrFLpZNVDCY9ni8Dm/vN7s
         O/fjmG81cdv8JgjgOIrJ6qqxWgQzjKmz/zkti8u9LSeTYDGG3IcrJcMD3B9eXud47Z57
         0q2Ht47tMdU0tNR7YrMqDMzfeXK4No7rYVXn1vwUwAyIcJE04SC/bJzM4zkGOryx6RXp
         SZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wtsa9fuoFH1Qxx/T1deE0ds5xtMhY7s4pJm1vmurJ4o=;
        b=LTvFTasvpuZpDddSxXp62UqkyYYlnuU2QpenkzNRjxLJV9otvBgIrU9fZ9xFhdTeBJ
         K4hmlC38MxaMOIFqLa3/va7jlt2qLlN4rCCtEgnJHu4svm+lIm68N9ERk6aXwekfGODa
         7tzDCPF0HYWhHwD0WhesS8x+tGRtSp2WSCwsJ4GvYA9+ck10wYUbRyYIQ6y8VPwQuXj+
         T4srmNcX1yueznigcPaSN0FsgXMwyQiEMxKs6vBL2GAhrvtbPXoElVWyAdcnnyhbLHtG
         LEn6Dnz00azuREWyVozjm9TUMn7wwQL5VD/aHfPTmvnHOh1CEsouFBMrIPSp/IP+mvOO
         83OA==
X-Gm-Message-State: AOAM531GyqULWfqrv2K9PLRMm9UPZTL6Wpjbd1kpZm0IJ7g5ER2Wpjc/
        xAe5Bee1HRx6DFgHOBK8Lzs=
X-Google-Smtp-Source: ABdhPJyY2sUNd86PTVA5ybNMf3ApgHVS0TiCVvxpTJjMLYEZ4zWj73DMzXhvQg+dJKCk53ok/ZYmvg==
X-Received: by 2002:a1c:e184:: with SMTP id y126mr25681218wmg.163.1615808547980;
        Mon, 15 Mar 2021 04:42:27 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:27 -0700 (PDT)
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
Subject: [PATCH v7 11/22] dt-bindings: add BCM6362 pincontroller binding documentation
Date:   Mon, 15 Mar 2021 12:42:03 +0100
Message-Id: <20210315114214.3096-12-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
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
---
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 211 ++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
new file mode 100644
index 000000000000..bde7d6cb1e5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
@@ -0,0 +1,211 @@
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
+description: |+
+  The pin controller node should be the child of a syscon node.
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6362-pinctrl
+
+  reg:
+    maxItems: 2
+
+patternProperties:
+  '^.*-pins$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "pinmux-node.yaml#/properties/function"
+          enum: [ usb_device_led, sys_irq, serial_led_clk, serial_led_data,
+                  robosw_led_data, robosw_led_clk, robosw_led0, robosw_led1,
+                  inet_led, spi_cs2, spi_cs3, ntr_pulse, uart1_scts,
+                  uart1_srts, uart1_sdin, uart1_sdout, adsl_spi_miso,
+                  adsl_spi_mosi, adsl_spi_clk, adsl_spi_cs, ephy0_led,
+                  ephy1_led, ephy2_led, ephy3_led, ext_irq0, ext_irq1,
+                  ext_irq2, ext_irq3, nand ]
+
+        pins:
+          $ref: "pinmux-node.yaml#/properties/pins"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                  gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                  gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, nand_grp ]
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

