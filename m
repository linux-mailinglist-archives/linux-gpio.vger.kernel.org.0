Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D5F3253B7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhBYQnK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbhBYQnD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:03 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA990C061756;
        Thu, 25 Feb 2021 08:42:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id w11so5881849wrr.10;
        Thu, 25 Feb 2021 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6hkW7suAFaiZeM1Sy2O+nOrhjHJ//Jazavsp18uR06g=;
        b=bTQ8tD9pyBtMGdRKw1hpKtPzxgymaWzL+Qa39SWbrBdBQLpsGE7auUAW8dq/keKv0w
         psKKoRmdOPK8KQan5GB6UEktHOUZ9B4DElyNTEMMWzXoe0HAWI16TGdmG6zuA6Zr8Ljc
         3gdkwTPZTdVfnIq8zlEKsJxOKJytZd0aolrjl8FrYSePi3C+6wyawq7758jyaCpvSn/9
         FkalpJlFIPYYolSr/AWdJGWT9tib52bNfH/0GNMBe3gXrTiaZtHyhD9gUMCNqOeED2Aa
         gDjkef8NmMumLwe5VzqMUWUXK9tjjrwNK1ogEUrCgAlMh6Vqf9deZfq0oykY6d2nFWtv
         i8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6hkW7suAFaiZeM1Sy2O+nOrhjHJ//Jazavsp18uR06g=;
        b=LEq+OZY4HDy0FYwAlcMetTuenxpSWPllbOYgi3unDPLyKjA9jC812iV7tw5Va5AHzy
         Cu23Yb+bbHwPEO/7D3Lnsi8S1RPPV23E57T6UPVqZ5yrxqk56MVLwv6vNUc59jX6olCI
         IykTgA06mizpzGP6DjLZ+J0UAC0RGwwZ4lcZ1StN+buJehdmh1MB/4K98FjBUeAhXwuX
         5qzRRodGvGw8Gr6vEzfS3rCIsms0pXRYcS9z/9N5Yxc+YfVjaviGusxQO5BXIdkQq9QK
         Rg6uHkemFy8DPter2Mv3IFKz6bw4N5xZGvwVYXz0JT8g9R+8ljpTbJxOBQILEJYqbE8b
         TLZw==
X-Gm-Message-State: AOAM530/T9XMtfFMQ1IgOPdXViJsNPF3w2k1Bi6LTOn/a2Z6OslHLiSl
        2xbJVKmA2/zQrVBKu7FTNEE=
X-Google-Smtp-Source: ABdhPJzwrc01FSwP8z5Pq6c2DBJ4qWy2VGrbpKITZXCi3BLT5ysP8NLOU0P/irwKtAnnGv+00ZHGkQ==
X-Received: by 2002:a05:6000:186f:: with SMTP id d15mr4477392wri.237.1614271340512;
        Thu, 25 Feb 2021 08:42:20 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:20 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] Documentation: add BCM6328 pincontroller binding documentation
Date:   Thu, 25 Feb 2021 17:42:05 +0100
Message-Id: <20210225164216.21124-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225164216.21124-1-noltari@gmail.com>
References: <20210225164216.21124-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6328 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
new file mode 100644
index 000000000000..2012cb1dbf5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6328 pin controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  The pin controller node should be the child of a syscon node.
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm6328-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  interrupts-extended:
+    description:
+      One interrupt per each of the 4 GPIO ports supported by the controller,
+      sorted by port number ascending order.
+    minItems: 4
+    maxItems: 4
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
+                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
+                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
+                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
+                  usb_port1 ]
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@10000080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6328-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupts-extended = <&ext_intc 3 0>,
+                              <&ext_intc 2 0>,
+                              <&ext_intc 1 0>,
+                              <&ext_intc 0 0>;
+        interrupt-names = "gpio12",
+                          "gpio15",
+                          "gpio23",
+                          "gpio24";
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio6";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio7";
+          };
+        };
+
+        pinctrl_inet_act_led: inet_act_led {
+          function = "inet_act_led";
+          pins = "gpio11";
+        };
+
+        pinctrl_pcie_clkreq: pcie_clkreq {
+          function = "pcie_clkreq";
+          pins = "gpio16";
+        };
+
+        pinctrl_ephy0_spd_led: ephy0_spd_led {
+          function = "led";
+          pins = "gpio17";
+        };
+
+        pinctrl_ephy1_spd_led: ephy1_spd_led {
+          function = "led";
+          pins = "gpio18";
+        };
+
+        pinctrl_ephy2_spd_led: ephy2_spd_led {
+          function = "led";
+          pins = "gpio19";
+        };
+
+        pinctrl_ephy3_spd_led: ephy3_spd_led {
+          function = "led";
+          pins = "gpio20";
+        };
+
+        pinctrl_ephy0_act_led: ephy0_act_led {
+          function = "ephy0_act_led";
+          pins = "gpio25";
+        };
+
+        pinctrl_ephy1_act_led: ephy1_act_led {
+          function = "ephy1_act_led";
+          pins = "gpio26";
+        };
+
+        pinctrl_ephy2_act_led: ephy2_act_led {
+          function = "ephy2_act_led";
+          pins = "gpio27";
+        };
+
+        pinctrl_ephy3_act_led: ephy3_act_led {
+          function = "ephy3_act_led";
+          pins = "gpio28";
+        };
+
+        pinctrl_hsspi_cs1: hsspi_cs1 {
+          function = "hsspi_cs1";
+          pins = "hsspi_cs1";
+        };
+
+        pinctrl_usb_port1_device: usb_port1_device {
+          function = "usb_device_port";
+          pins = "usb_port1";
+        };
+
+        pinctrl_usb_port1_host: usb_port1_host {
+          function = "usb_host_port";
+          pins = "usb_port1";
+        };
+      };
+    };
-- 
2.20.1

