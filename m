Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CA032C7C8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355685AbhCDAcs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243294AbhCCO3d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 09:29:33 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BD0C06121D;
        Wed,  3 Mar 2021 06:23:24 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id u14so23894725wri.3;
        Wed, 03 Mar 2021 06:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O0WmeBOGzP81ZDTLLuj33t6fm6t9serMeVzU6ZvSzOA=;
        b=RJTSTnRMe6yVaA4C+wk46J6STz+/EtWPfiL5TktvOlntYuq38kwtl5ckpyC0/hy3wR
         oQTsRJcXJes2mYVmHwczskIxGoVoaToyd5MuQrjbaB9F+aerMcC0fSKzdcThLA/jtPz5
         6vA97D1+ETLhAHBBwwZtNacdb9VlQ7AOMgSZPRvV96XJ+9mMS/DhHClazlnQetk0fXOl
         6xaerXHin0U0W/LzMvnWn/pZ63oeBsaZwwS7reJMAlkJMNNTbQTeEtPAj+tRPEyqtF9l
         SjORjH0KFWtltjfccz7vOUMdI43SKW3ZyvIra69Vjawg7vljARkvf7tSy8A2Xd5WpCCM
         emIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O0WmeBOGzP81ZDTLLuj33t6fm6t9serMeVzU6ZvSzOA=;
        b=ZvOMbhBYA/IkXzEbTnPWoC5JlHG6+HcS/zh7Z1tH6iWrCm105GvqskHRx0Ia57y1Xa
         PrPbxte2HbJtq6+pV+DGpApt1xT4rBF7dADG5y8R17MVG4IILkDyxpsKRGdSa+CQkoz5
         tQBAruvlenNtED8eFgWrFXI3YxZdWszM5dFf9N/T77GslPLf1HQtEjz+8yWggeoX5O+G
         tZZ+IMN7s22qtGETOeRFZ4qsu9f9x1tmrzLY1uW8neEVK/higKqaCJSbs8gf9dA4ryfd
         55QDaj56ACUrwWZwxE1lNIeWGyCdmevbdqUFj/Vw8DhpxKNpIBR0NSCL0EarmkecdEvs
         Wl7A==
X-Gm-Message-State: AOAM531d8y97nLkn/872ddjrWYSY8YvLV2YWuKE6S395ek8l3ouD+Bq6
        m6m3WrYY0qxDLvXB8j07kkQ=
X-Google-Smtp-Source: ABdhPJzQX0ByPxYiTPdbWTZb6z950eyxm4fRx55IUL7w8Meus5HP6XR8IplytjoBSTCaFUijMRi7TQ==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr19609985wrh.396.1614781402850;
        Wed, 03 Mar 2021 06:23:22 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:22 -0800 (PST)
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
Subject: [PATCH v3 11/14] Documentation: add BCM63268 pincontroller binding documentation
Date:   Wed,  3 Mar 2021 15:23:07 +0100
Message-Id: <20210303142310.6371-12-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303142310.6371-1-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in the BCM63268
family SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
new file mode 100644
index 000000000000..1668ab567e35
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm63268-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM63268 pin controller
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
+    const: brcm,bcm63268-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm63268-gpio
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
+          enum: [ serial_led_clk, serial_led_data, hsspi_cs4, hsspi_cs5,
+                  hsspi_cs6, hsspi_cs7, adsl_spi_miso, adsl_spi_mosi,
+                  vreq_clk, pcie_clkreq_b, robosw_led_clk, robosw_led_data,
+                  nand, gpio35_alt, dectpd, vdsl_phy_override_0,
+                  vdsl_phy_override_1, vdsl_phy_override_2,
+                  vdsl_phy_override_3, dsl_gpio8, dsl_gpio9 ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio0, gpio1, gpio16, gpio17, gpio8, gpio9, gpio18, gpio19,
+                  gpio22, gpio23, gpio30, gpio31, nand_grp, gpio35
+                  dectpd_grp, vdsl_phy_override_0_grp,
+                  vdsl_phy_override_1_grp, vdsl_phy_override_2_grp,
+                  vdsl_phy_override_3_grp, dsl_gpio8, dsl_gpio9 ]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_cntl@100000c0 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x100000c0 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm63268-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm63268-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 52>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio0";
+          };
+
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio1";
+          };
+        };
+
+        pinctrl_hsspi_cs4: hsspi_cs4 {
+          function = "hsspi_cs4";
+          pins = "gpio16";
+        };
+
+        pinctrl_hsspi_cs5: hsspi_cs5 {
+          function = "hsspi_cs5";
+          pins = "gpio17";
+        };
+
+        pinctrl_hsspi_cs6: hsspi_cs6 {
+          function = "hsspi_cs6";
+          pins = "gpio8";
+        };
+
+        pinctrl_hsspi_cs7: hsspi_cs7 {
+          function = "hsspi_cs7";
+          pins = "gpio9";
+        };
+
+        pinctrl_adsl_spi: adsl_spi {
+          pinctrl_adsl_spi_miso: adsl_spi_miso {
+            function = "adsl_spi_miso";
+            pins = "gpio18";
+          };
+
+          pinctrl_adsl_spi_mosi: adsl_spi_mosi {
+            function = "adsl_spi_mosi";
+            pins = "gpio19";
+          };
+        };
+
+        pinctrl_vreq_clk: vreq_clk {
+          function = "vreq_clk";
+          pins = "gpio22";
+        };
+
+        pinctrl_pcie_clkreq_b: pcie_clkreq_b {
+          function = "pcie_clkreq_b";
+          pins = "gpio23";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk {
+          function = "robosw_led_clk";
+          pins = "gpio30";
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data {
+          function = "robosw_led_data";
+          pins = "gpio31";
+        };
+
+        pinctrl_nand: nand {
+          function = "nand";
+          group = "nand_grp";
+        };
+
+        pinctrl_gpio35_alt: gpio35_alt {
+          function = "gpio35_alt";
+          pin = "gpio35";
+        };
+
+        pinctrl_dectpd: dectpd {
+          function = "dectpd";
+          group = "dectpd_grp";
+        };
+
+        pinctrl_vdsl_phy_override_0: vdsl_phy_override_0 {
+          function = "vdsl_phy_override_0";
+          group = "vdsl_phy_override_0_grp";
+        };
+
+        pinctrl_vdsl_phy_override_1: vdsl_phy_override_1 {
+          function = "vdsl_phy_override_1";
+          group = "vdsl_phy_override_1_grp";
+        };
+
+        pinctrl_vdsl_phy_override_2: vdsl_phy_override_2 {
+          function = "vdsl_phy_override_2";
+          group = "vdsl_phy_override_2_grp";
+        };
+
+        pinctrl_vdsl_phy_override_3: vdsl_phy_override_3 {
+          function = "vdsl_phy_override_3";
+          group = "vdsl_phy_override_3_grp";
+        };
+
+        pinctrl_dsl_gpio8: dsl_gpio8 {
+          function = "dsl_gpio8";
+          group = "dsl_gpio8";
+        };
+
+        pinctrl_dsl_gpio9: dsl_gpio9 {
+          function = "dsl_gpio9";
+          group = "dsl_gpio9";
+        };
+      };
+    };
-- 
2.20.1

