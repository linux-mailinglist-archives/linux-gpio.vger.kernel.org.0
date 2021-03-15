Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8480533B17B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhCOLm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhCOLmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:32 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F592C061574;
        Mon, 15 Mar 2021 04:42:32 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso20045136wmi.3;
        Mon, 15 Mar 2021 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AVtwqfzOrUbBZLzoxpJthvoI1ofJe2eOPNw2zhIxGv4=;
        b=YDSRUmK+2B22v6e0Q8kkp8utPk+uJ/1R8S5exYub/L8Bu9IMg0AX7Ndds7giiksvB7
         9/DZnXec2rIThL87APN/puWwOieRNfEYg/GmLuf3WcqZHPmLMyvQG5QxyOJocT/T5Ism
         osqUmnB8j7Wo893A7qR1scP/SZpJoUbVHoW059IvMvEDy1yE9v7kVHuS+o9vFgJsI+A7
         5pWP3m8+lHosKhbacyAy+ekCnETMvfKaEJOy9u+URtWja/BwciP1PaRW3LvpqS2o5Ls4
         GV6VZ+dfNumWnw8XxV04k2K/uONTO5pha/nOl216/XWLNg2xsUahHYRqOtF7mD3d8nyj
         BCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVtwqfzOrUbBZLzoxpJthvoI1ofJe2eOPNw2zhIxGv4=;
        b=Afrf5ahjdmywpTEzVz+/dmPO+EGSDuLRz1Yp2G58Pn7NMHA5tWhF6MojGwh7iX4gKm
         PRPxYDWbYu1AzQpKMZ+pfNNvx984UBbcKjp7sl7OSG0S7B4LY5QGMje5BA1F7flPDLhU
         a0utjT5nWnYMtLU3/EHbNnRJ5Qt7cRKY86+z/YzLj19afbLCL0a03YPL4XC9Ddinb4DT
         ETBrZS0I8qOB0MiAnkb+ruy5HliNzHD1+CsrUZDEmtQ+BjytklRrTvxSlWe3dcJ/lkR9
         qQ9sYAfN607MOtKh+OdQkfqc3MVD87a8yeh+EstZvkjQZcfuyHy1ULQBCfZMC7Psd9c5
         sqFA==
X-Gm-Message-State: AOAM532MR5YPbfmzQqzsxqiL5bCeksc36NRpbfQc/vFV/CSoktpYr+uX
        BRxpO1ZNfeaGlUYrHoeNRgQ=
X-Google-Smtp-Source: ABdhPJy/HsI5uRtswzeoHckgW2UYZlccl3LykdXK8NBk9+iSnMpRF92PL6FpPzpvXsXzYYyWynXfBA==
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr25642303wmg.87.1615808550998;
        Mon, 15 Mar 2021 04:42:30 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:30 -0700 (PDT)
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
Subject: [PATCH v7 14/22] dt-bindings: add BCM6368 pincontroller binding documentation
Date:   Mon, 15 Mar 2021 12:42:06 +0100
Message-Id: <20210315114214.3096-15-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6368 SoCs.

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

 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 222 ++++++++++++++++++
 1 file changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
new file mode 100644
index 000000000000..83e979544895
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
@@ -0,0 +1,222 @@
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
+          enum: [ analog_afe_0, analog_afe_1, sys_irq, serial_led_data,
+                  serial_led_clk, inet_led, ephy0_led, ephy1_led, ephy2_led,
+                  ephy3_led, robosw_led_data, robosw_led_clk, robosw_led0,
+                  robosw_led1, usb_device_led, pci_req1, pci_gnt1, pci_intb,
+                  pci_req0, pci_gnt0, pcmcia_cd1, pcmcia_cd2, pcmcia_vs1,
+                  pcmcia_vs2, ebi_cs2, ebi_cs3, spi_cs2, spi_cs3, spi_cs4,
+                  spi_cs5, uart1 ]
+
+        pins:
+          $ref: "pinmux-node.yaml#/properties/pins"
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                  gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                  gpio16, gpio17, gpio18, gpio19, gpio20, gpio22, gpio23,
+                  gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30,
+                  gpio31, uart1_grp ]
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
+      compatible = "brcm,bcm6368-pinctrl";
+      reg = <0x18 0x4>, <0x38 0x4>;
+
+      pinctrl_analog_afe_0: analog_afe_0-pins {
+        function = "analog_afe_0";
+        pins = "gpio0";
+      };
+
+      pinctrl_analog_afe_1: analog_afe_1-pins {
+        function = "analog_afe_1";
+        pins = "gpio1";
+      };
+
+      pinctrl_sys_irq: sys_irq-pins {
+        function = "sys_irq";
+        pins = "gpio2";
+      };
+
+      pinctrl_serial_led: serial_led-pins {
+        pinctrl_serial_led_data: serial_led_data-pins {
+          function = "serial_led_data";
+          pins = "gpio3";
+        };
+
+        pinctrl_serial_led_clk: serial_led_clk-pins {
+          function = "serial_led_clk";
+          pins = "gpio4";
+        };
+      };
+
+      pinctrl_inet_led: inet_led-pins {
+        function = "inet_led";
+        pins = "gpio5";
+      };
+
+      pinctrl_ephy0_led: ephy0_led-pins {
+        function = "ephy0_led";
+        pins = "gpio6";
+      };
+
+      pinctrl_ephy1_led: ephy1_led-pins {
+        function = "ephy1_led";
+        pins = "gpio7";
+      };
+
+      pinctrl_ephy2_led: ephy2_led-pins {
+        function = "ephy2_led";
+        pins = "gpio8";
+      };
+
+      pinctrl_ephy3_led: ephy3_led-pins {
+        function = "ephy3_led";
+        pins = "gpio9";
+      };
+
+      pinctrl_robosw_led_data: robosw_led_data-pins {
+        function = "robosw_led_data";
+        pins = "gpio10";
+      };
+
+      pinctrl_robosw_led_clk: robosw_led_clk-pins {
+        function = "robosw_led_clk";
+        pins = "gpio11";
+      };
+
+      pinctrl_robosw_led0: robosw_led0-pins {
+        function = "robosw_led0";
+        pins = "gpio12";
+      };
+
+      pinctrl_robosw_led1: robosw_led1-pins {
+        function = "robosw_led1";
+        pins = "gpio13";
+      };
+
+      pinctrl_usb_device_led: usb_device_led-pins {
+        function = "usb_device_led";
+        pins = "gpio14";
+      };
+
+      pinctrl_pci: pci-pins {
+        pinctrl_pci_req1: pci_req1-pins {
+          function = "pci_req1";
+          pins = "gpio16";
+        };
+
+        pinctrl_pci_gnt1: pci_gnt1-pins {
+          function = "pci_gnt1";
+          pins = "gpio17";
+        };
+
+        pinctrl_pci_intb: pci_intb-pins {
+          function = "pci_intb";
+          pins = "gpio18";
+        };
+
+        pinctrl_pci_req0: pci_req0-pins {
+          function = "pci_req0";
+          pins = "gpio19";
+        };
+
+        pinctrl_pci_gnt0: pci_gnt0-pins {
+          function = "pci_gnt0";
+          pins = "gpio20";
+        };
+      };
+
+      pinctrl_pcmcia: pcmcia-pins {
+        pinctrl_pcmcia_cd1: pcmcia_cd1-pins {
+          function = "pcmcia_cd1";
+          pins = "gpio22";
+        };
+
+        pinctrl_pcmcia_cd2: pcmcia_cd2-pins {
+          function = "pcmcia_cd2";
+          pins = "gpio23";
+        };
+
+        pinctrl_pcmcia_vs1: pcmcia_vs1-pins {
+          function = "pcmcia_vs1";
+          pins = "gpio24";
+        };
+
+        pinctrl_pcmcia_vs2: pcmcia_vs2-pins {
+          function = "pcmcia_vs2";
+          pins = "gpio25";
+        };
+      };
+
+      pinctrl_ebi_cs2: ebi_cs2-pins {
+        function = "ebi_cs2";
+        pins = "gpio26";
+      };
+
+      pinctrl_ebi_cs3: ebi_cs3-pins {
+        function = "ebi_cs3";
+        pins = "gpio27";
+      };
+
+      pinctrl_spi_cs2: spi_cs2-pins {
+        function = "spi_cs2";
+        pins = "gpio28";
+      };
+
+      pinctrl_spi_cs3: spi_cs3-pins {
+        function = "spi_cs3";
+        pins = "gpio29";
+      };
+
+      pinctrl_spi_cs4: spi_cs4-pins {
+        function = "spi_cs4";
+        pins = "gpio30";
+      };
+
+      pinctrl_spi_cs5: spi_cs5-pins {
+        function = "spi_cs5";
+        pins = "gpio31";
+      };
+
+      pinctrl_uart1: uart1-pins {
+        function = "uart1";
+        group = "uart1_grp";
+      };
+    };
-- 
2.20.1

