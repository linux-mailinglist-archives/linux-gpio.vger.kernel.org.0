Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD60347357
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbhCXIUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbhCXITf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:35 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBC4C0613DC;
        Wed, 24 Mar 2021 01:19:33 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so659006wmi.3;
        Wed, 24 Mar 2021 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEyIaU8y7mXt4Gg0I3xq5N9devig0Sz1hn0U1xjnkdM=;
        b=s0Mq/B4O1l3sYnxHuzEigSXGZXbnHbLEPXKpJi8ixG1knGPkjw1PPOuI+O/6h9YY9v
         DHWi7BM0KTOpRTzGBO7AFSBlhSdXj2eIgwAcilj/dvE2dOkRyoB0fBg6NNtukbYisSHc
         2Gz4oYs4M42yci5PHR3cqRsMABejpct7MOvYGhD432m1p9I3k09h9M2xc+pLMUarPpyx
         IwLGsuCgDszQi08txKl81SXM/EqEWA553L1MsKhi6iPJvUsAC9tsDmyRja4gK/wUTz0B
         CGADyws+w9GjCDwTCt0KV9rWIggNzfsfgenBE8RF48g7WN73r71Ozgf3+Ven3phItrDA
         C9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEyIaU8y7mXt4Gg0I3xq5N9devig0Sz1hn0U1xjnkdM=;
        b=tbxSYIGAVrUzCVdgIjRLDIDk8GKlFqVUxDajeU1UrG3pTVig366NCpEipAusOvsJNX
         4NaqNlSZ1oMswK/U7NxYGkjE873WstgAacVtQRQD9A9Dhrja9MxjoCoxDlwlUtPoFPum
         dbQ/A7KIjB9DzyghQBdtlGjaiRmP1iCLSkNBHrSSAajbxxSFioPGky9zoJT7BV8opVZr
         0/3XEjL1mxP+Q2W1CVKnrn1y0tbVG2d8SKCO3wsJ3UyrkfFlmYbka49lk0fKPz4ThJZ+
         MphE03su5IYTxsmtItl7cXdP7CF78Un4N0r4Azs+ihkNFVkOeZndgR4KdWpT855eoUH6
         A3+w==
X-Gm-Message-State: AOAM530is3DecFe3WBPyTnpW14sdPTJ2ebzjbigSxCclEFYTU9MvtTZy
        hxOhpfF8JUM7KYxPRoYDrV8=
X-Google-Smtp-Source: ABdhPJwG/Qc2I7XySp3pTREF1dLndnCtB5kbMV8EwSdFBI49yB8wB6XTblTgcJKWd7pT9RVQPC3zzw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr1702653wmc.59.1616573971900;
        Wed, 24 Mar 2021 01:19:31 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:31 -0700 (PDT)
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
Subject: [PATCH v9 06/22] dt-bindings: add BCM6328 GPIO sysctl binding documentation
Date:   Wed, 24 Mar 2021 09:19:07 +0100
Message-Id: <20210324081923.20379-7-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM6328 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v9: no changes
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

