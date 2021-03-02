Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A989132AD38
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384020AbhCBV3N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835604AbhCBTSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:21 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C61C06121D;
        Tue,  2 Mar 2021 11:16:36 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o2so3357682wme.5;
        Tue, 02 Mar 2021 11:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gguzg40ontqXCKMWfWXz+G1qHD36uG1eMPZ4oKaPEfQ=;
        b=sRYzVjZVIdZxh1RvObz6V4tphB4YBbP6XmnZuyOhjKRdI0paEDmQ9/vKagT6tEzG6i
         sHNbZHXlC2+PlNST5IPRQkAbvjtKsqae/zatTNE1+VTsWM5jitJUKfrv1RrMENU/UuRB
         GBT/RcRw02tUlfc2xM0/9dngo01eV1pKZ8dU7F1eJpWyPqp5vRaaCVSOzdg5LlL3+AKV
         2nxdCREGVj8/jcYjSiehoBWrjTBZu0kvvZcBRlvCtCXGOWvpFHLfV5hGLmtPP9LFURrB
         ZlTlJ+Wc413gvPKPbJAypPUFTDN09qm6yeaCX5VMgotjOCavD55f65tsWqGSMEj68DEs
         en0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gguzg40ontqXCKMWfWXz+G1qHD36uG1eMPZ4oKaPEfQ=;
        b=mGeW9OO3c9601MdkVj2fj/KVUyMCmEPIhnmraxufhOzikDuRiW3hSKCIbzEHNAaEVr
         De0nn4ZHzwAnkWUea9r3VasFG5lKw3oUR9S607HjlVrthwEe8DNeF1kIuXsKiC6dPyKW
         juuLKfjf5kUrB9WfJru7Cdb4VczPMv5xDDHDhN8KrITEujGf/z7yswtio+NrRQ9MtccR
         IwvLv6glyhW2sPb+EGsIc/4KcQdaFIdDRVoG4CdrzA2/c5pXkv8UhAa/2MzRLPCZB4i3
         o+GKbbDH3wa99LrIiJThb7698hDXGRVlELUAE6VhHYD1YzCjqL4eGGpUWO/DBMv/HuV+
         hFow==
X-Gm-Message-State: AOAM533DBkyt5OIpnkPPCIMkNhd9SgJnKzu16bqIjaZXXl9vw/Xo4y8w
        e6BSze3/5E8zDztdBwE/Qas=
X-Google-Smtp-Source: ABdhPJzYtVGzTsP8vCw6SJbul6phGXy7AUidcb9690XV6Rq5FP9sUbAXay2a4jiFKdTKaCmDe6c98w==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr5514157wmk.101.1614712595131;
        Tue, 02 Mar 2021 11:16:35 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:34 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>, f.fainelli@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/12] Documentation: add BCM6368 pincontroller binding documentation
Date:   Tue,  2 Mar 2021 20:16:08 +0100
Message-Id: <20210302191613.29476-8-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
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
 v2: remove interrupts

 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 235 ++++++++++++++++++
 1 file changed, 235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
new file mode 100644
index 000000000000..226f202bb8d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
@@ -0,0 +1,235 @@
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
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+patternProperties:
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
+        compatible = "brcm,bcm6368-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
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

