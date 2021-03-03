Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F251332C7CA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355686AbhCDAct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242711AbhCCO3d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 09:29:33 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30957C0617AB;
        Wed,  3 Mar 2021 06:23:22 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u16so5876164wrt.1;
        Wed, 03 Mar 2021 06:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2qOnu3M4QV744ZDWlIJdZMtRSjvCtTwV99PAC6fI5SQ=;
        b=k2Qj0gH4c37QPZJwXMm37pXVpnO9bI2oagkDGfVBJxR7oQuBe/+mk0MT7B2BR3wFsV
         /yn0ow5W8Hz5ms/m8X4atRHkyYGj6gQun0Pd4Go8Bi/m31AYA4gh/LD9R8OIiF4ffrC5
         YLRwtSW9WrLvU5E5PDr5Dxmzp5FwfqPv/7ZrTpnx020gzU295B9ZnVVGlbvGPKPalkXH
         fYMKeCRZdHDXqd0ZS4HRSUXWc1K+18MROLFdLYpogpP2uuN2bo+lzuZmuVbimDvZhhGk
         eDJs+rx3/rxhja3YoJfxpRGqENeIGmDPvE+wL0LzqWqm0sFbQA4n8qM+TbnbpG7ml/tI
         YIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2qOnu3M4QV744ZDWlIJdZMtRSjvCtTwV99PAC6fI5SQ=;
        b=NSbOvngF6o7CWrqDX0aU6GOshgpqcdtIgLG9+ayordI9sfrOI2H+U08apbEFTJOBO/
         c0UmM9S/b3vJoX3AkCK4k5uF/PD+oq21PF0i5sjf8u9EihxpuufmHdKYGzO7KBJJ0ucB
         jj92ZFU1WqqAp4sG+promVkoSy5jaqdHb7CrIfbwh9oQ2Jy/HY4IgwvHiRpuegKhfH4Y
         hCbKc5t7Zz6cSqqNOwusX88v6VbqMSXDfzdJWMbkmOUb68iv/CA4nIbVQv8KJeiWU0Re
         vi415OaG3mWyoiw61IuEqDVVSzK7OrCbY0VmisDz1qANb9ofXqhBe3EJirQ46nGLSWJ8
         Fb9w==
X-Gm-Message-State: AOAM532+jX5fMKnrauYmEopv7XuhG9C1fpW1ejcvl9j1Hj7nas02lkRF
        mLHhz+a3e2aStLy0MXnkEg8=
X-Google-Smtp-Source: ABdhPJwa8aqA2RnoUZmk7AObfNdSz+FKuu+jmgZWA2Qu1O8i5j35c8gvz1qF3VFSxfxWyQ1Fx1LJdA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr27407240wrm.221.1614781400925;
        Wed, 03 Mar 2021 06:23:20 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:20 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/14] Documentation: add BCM6368 pincontroller binding documentation
Date:   Wed,  3 Mar 2021 15:23:05 +0100
Message-Id: <20210303142310.6371-10-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303142310.6371-1-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6368 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
new file mode 100644
index 000000000000..6a289c93d6b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6368-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6368 pin controller
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
+    const: brcm,bcm6368-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6368-gpio
+
+      data:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Offset in the register map for the data register (in bytes).
+
+      dirout:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Offset in the register map for the dirout register (in bytes).
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - gpio-controller
+      - gpio-ranges
+      - '#gpio-cells'
+
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ analog_afe_0, analog_afe_1, sys_irq, serial_led_data,
+                  serial_led_clk, inet_led, ephy0_led, ephy1_led, ephy2_led,
+                  ephy3_led, robosw_led_data, robosw_led_clk, robosw_led0,
+                  robosw_led1, usb_device_led, pci_req1, pci_gnt1, pci_intb,
+                  pci_req0, pci_gnt0, pcmcia_cd1, pcmcia_cd2, pcmcia_vs1,
+                  pcmcia_vs2, ebi_cs2, ebi_cs3, spi_cs2, spi_cs3, spi_cs4,
+                  spi_cs5, uart1 ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                  gpio16, gpio17, gpio18, gpio19, gpio20, gpio22, gpio23,
+                  gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30,
+                  gpio31, uart1_grp ]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_cntl@10000080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x10000080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6368-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6368-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 38>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_analog_afe_0: analog_afe_0 {
+          function = "analog_afe_0";
+          pins = "gpio0";
+        };
+
+        pinctrl_analog_afe_1: analog_afe_1 {
+          function = "analog_afe_1";
+          pins = "gpio1";
+        };
+
+        pinctrl_sys_irq: sys_irq {
+          function = "sys_irq";
+          pins = "gpio2";
+        };
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio3";
+          };
+
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio4";
+          };
+        };
+
+        pinctrl_inet_led: inet_led {
+          function = "inet_led";
+          pins = "gpio5";
+        };
+
+        pinctrl_ephy0_led: ephy0_led {
+          function = "ephy0_led";
+          pins = "gpio6";
+        };
+
+        pinctrl_ephy1_led: ephy1_led {
+          function = "ephy1_led";
+          pins = "gpio7";
+        };
+
+        pinctrl_ephy2_led: ephy2_led {
+          function = "ephy2_led";
+          pins = "gpio8";
+        };
+
+        pinctrl_ephy3_led: ephy3_led {
+          function = "ephy3_led";
+          pins = "gpio9";
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data {
+          function = "robosw_led_data";
+          pins = "gpio10";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk {
+          function = "robosw_led_clk";
+          pins = "gpio11";
+        };
+
+        pinctrl_robosw_led0: robosw_led0 {
+          function = "robosw_led0";
+          pins = "gpio12";
+        };
+
+        pinctrl_robosw_led1: robosw_led1 {
+          function = "robosw_led1";
+          pins = "gpio13";
+        };
+
+        pinctrl_usb_device_led: usb_device_led {
+          function = "usb_device_led";
+          pins = "gpio14";
+        };
+
+        pinctrl_pci: pci {
+          pinctrl_pci_req1: pci_req1 {
+            function = "pci_req1";
+            pins = "gpio16";
+          };
+
+          pinctrl_pci_gnt1: pci_gnt1 {
+            function = "pci_gnt1";
+            pins = "gpio17";
+          };
+
+          pinctrl_pci_intb: pci_intb {
+            function = "pci_intb";
+            pins = "gpio18";
+          };
+
+          pinctrl_pci_req0: pci_req0 {
+            function = "pci_req0";
+            pins = "gpio19";
+          };
+
+          pinctrl_pci_gnt0: pci_gnt0 {
+            function = "pci_gnt0";
+            pins = "gpio20";
+          };
+        };
+
+        pinctrl_pcmcia: pcmcia {
+          pinctrl_pcmcia_cd1: pcmcia_cd1 {
+            function = "pcmcia_cd1";
+            pins = "gpio22";
+          };
+
+          pinctrl_pcmcia_cd2: pcmcia_cd2 {
+            function = "pcmcia_cd2";
+            pins = "gpio23";
+          };
+
+          pinctrl_pcmcia_vs1: pcmcia_vs1 {
+            function = "pcmcia_vs1";
+            pins = "gpio24";
+          };
+
+          pinctrl_pcmcia_vs2: pcmcia_vs2 {
+            function = "pcmcia_vs2";
+            pins = "gpio25";
+          };
+        };
+
+        pinctrl_ebi_cs2: ebi_cs2 {
+          function = "ebi_cs2";
+          pins = "gpio26";
+        };
+
+        pinctrl_ebi_cs3: ebi_cs3 {
+          function = "ebi_cs3";
+          pins = "gpio27";
+        };
+
+        pinctrl_spi_cs2: spi_cs2 {
+          function = "spi_cs2";
+          pins = "gpio28";
+        };
+
+        pinctrl_spi_cs3: spi_cs3 {
+          function = "spi_cs3";
+          pins = "gpio29";
+        };
+
+        pinctrl_spi_cs4: spi_cs4 {
+          function = "spi_cs4";
+          pins = "gpio30";
+        };
+
+        pinctrl_spi_cs5: spi_cs5 {
+          function = "spi_cs5";
+          pins = "gpio31";
+        };
+
+        pinctrl_uart1: uart1 {
+          function = "uart1";
+          group = "uart1_grp";
+        };
+      };
+    };
-- 
2.20.1

