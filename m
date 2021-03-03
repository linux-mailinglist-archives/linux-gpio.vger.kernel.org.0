Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD0B32C7EE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344465AbhCDAdL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbhCCQCC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 11:02:02 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFC1C061797;
        Wed,  3 Mar 2021 06:23:17 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u16so5875860wrt.1;
        Wed, 03 Mar 2021 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qbm9/SWx08/nIVkUic7xUt6DD5RVdbp6U4+K6ZbTeg0=;
        b=K5gZGH8f/9lAkQI6saXlg+k6iI/LNE9XE5CUqwzb9uNJAQuUweKmhN0B71Xwnsrr0I
         Y2opGvjU8KfUoNHIlplCTIcFck4FIAyIahjIFdnBvBGDksTOXLY9e4kj77vwJletkjT9
         nQO7dho0/GVcjysRck8KVV0V8AUWP2lWZb3EBLz2uHf5jjpmUc1oLyupQLOlcCAabXgi
         jFOC7w9aMMAaHOd9yBYRLybyz5hbid81w6z4CXTv/j5SQ1ciTgDG5sZQhlewu2Np//bc
         WNRuYgOmbivwTufQFRAXRTHSM7i8qZY+Hy4bPs4PxzRsSTCRr8dTsrJIRc0/BjRrbbpq
         u9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qbm9/SWx08/nIVkUic7xUt6DD5RVdbp6U4+K6ZbTeg0=;
        b=opc2HzsU2hCr2F5T7rTWAR4+4l97oflwCIkZPuKI5BV+v4j3aRiWiO0dwnCahm0XeN
         +6Rw63TgOLaiagv2Wncxnt55eLpsfVl4gOf9d/mHrrnXfMP+53P5Yxb2Q7SqSJ4Ta65b
         6RNbAM/DgQGOpPPbj3V/uim1LJzTLKttq0ovd4Z1EGLt60BwN99jZvS1DosPEN5+baqU
         CJQCX2nqCKxXpn5f+ob5FpDguytINpFUCaKPOcO5lWVtQ5WpfMAHycKqh9HkCL23BbfP
         iiAXjFZd58zjcVYJdcQGeOiJf31KSlTumGNMqahkhqdXvEfS13Gzw4wQblt8Y+JLW+WU
         UP1g==
X-Gm-Message-State: AOAM530pdISxwf9ibNWreDWZGW3xCjKYUzTtpDSz84gve6GtFTejSuPw
        RKVAEImqDfl7jq2IBP4qgmY=
X-Google-Smtp-Source: ABdhPJyPNGrlJSq/uk5ZfDC2jfp/a7tI6+vz1UNIemtM4xxVu06XF4usCEyeg5fLpxpK40/HvEgSwQ==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr27630282wrr.341.1614781396373;
        Wed, 03 Mar 2021 06:23:16 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:16 -0800 (PST)
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
Subject: [PATCH v3 05/14] Documentation: add BCM6358 pincontroller binding documentation
Date:   Wed,  3 Mar 2021 15:23:01 +0100
Message-Id: <20210303142310.6371-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303142310.6371-1-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6358 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..eb14dd4cdaaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6358-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6358 pin controller
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
+    const: brcm,bcm6358-pinctrl
+
+patternProperties:
+  '^gpio$':
+    type: object
+    properties:
+      compatible:
+        const: brcm,bcm6358-gpio
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
+          enum: [ ebi_cs, uart1, serial_led, legacy_led, led, spi_cs, utopia,
+                  pwm_syn_clk, sys_irq ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ ebi_cs_grp, uart1_grp, serial_led_grp, legacy_led_grp,
+                  led_grp, spi_cs_grp, utopia_grp, pwm_syn_clk, sys_irq_grp ]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_cntl@fffe0080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0xfffe0080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6358-pinctrl";
+
+        gpio {
+          compatible = "brcm,bcm6358-gpio";
+          data = <0xc>;
+          dirout = <0x4>;
+
+          gpio-controller;
+          gpio-ranges = <&pinctrl 0 0 40>;
+          #gpio-cells = <2>;
+        };
+
+        pinctrl_ebi_cs: ebi_cs {
+          function = "ebi_cs";
+          groups = "ebi_cs_grp";
+        };
+
+        pinctrl_uart1: uart1 {
+          function = "uart1";
+          groups = "uart1_grp";
+        };
+
+        pinctrl_serial_led: serial_led {
+          function = "serial_led";
+          groups = "serial_led_grp";
+        };
+
+        pinctrl_legacy_led: legacy_led {
+          function = "legacy_led";
+          groups = "legacy_led_grp";
+        };
+
+        pinctrl_led: led {
+          function = "led";
+          groups = "led_grp";
+        };
+
+        pinctrl_spi_cs_23: spi_cs {
+          function = "spi_cs";
+          groups = "spi_cs_grp";
+        };
+
+        pinctrl_utopia: utopia {
+          function = "utopia";
+          groups = "utopia_grp";
+        };
+
+        pinctrl_pwm_syn_clk: pwm_syn_clk {
+          function = "pwm_syn_clk";
+          groups = "pwm_syn_clk_grp";
+        };
+
+        pinctrl_sys_irq: sys_irq {
+          function = "sys_irq";
+          groups = "sys_irq_grp";
+        };
+      };
+    };
-- 
2.20.1

