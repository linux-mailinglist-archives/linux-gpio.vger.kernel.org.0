Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C78932CF07
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbhCDI6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237042AbhCDI6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:58:36 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA68BC061763;
        Thu,  4 Mar 2021 00:57:20 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id w7so7285066wmb.5;
        Thu, 04 Mar 2021 00:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y4YeH0Nz5An81nmCpdBuGlzbp8MPE1s6v56bJHKkBrM=;
        b=NVYN7vhxcpxRoPXVhZNYBtPapHEpU5DGr7tGrLzTQLji1l0JMzcP0Jws4cov6eMB6Z
         kKlalk3oxzy+5wJEiukxp2I2Y9ocIxsL5iu1MMzvc72rdMcPNoZPuJIPs2CF6a4c9/2N
         aTboWZTwIl05nPlN+M/f9xakUeNkfn0dXrUE3roZZeQ/y2YO8K/S0pFS1sFPTb/X8g+h
         kodDtVUIWWra5eUxlPUKCAoz2ZvNMwv1wrL8q/GobX3lPXXIBg++J5hjVBXdOP24u96V
         gW9Wv0v6vYjNhp5J+ezScjgm+eyp87bfsJp8Joo0ZSC20XsMc2xhu+YqwF1i4/HhWVaI
         h6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4YeH0Nz5An81nmCpdBuGlzbp8MPE1s6v56bJHKkBrM=;
        b=pxOZTLivaJKsl7VSZKcCDsVlyUfJEF3azp/P3TUXWBN+OGkfsjxG5skxikUbxH77+F
         MX8nPCG8OOMBz120Ps+Gfzt4g+CzCCHjsUOAvn59zx7GdcrvWLLdqu3ZtIt8K7DfF0vC
         bbeNqJD4Ie3q1TmzykUrG5BptHYYgs0L7AsXkjRCKkPCXedLLRbYSqaIoAghrCUzWH5l
         M+dpVYAGsFDJlCiDLI2GBJ6nc0ilda65v4CZ459mdihz/Jcy6kaUD6nmvlr+YUAd8k3b
         hPt/ebkjGa6xXRLPjr77293q/kogsdxV7NUuNk3BLK9LBhOiFW/GjL9xvayEjxSrSxK7
         eyfQ==
X-Gm-Message-State: AOAM531aGTbHn8R7Y+iIFhl45i91MG3Z/fvHFv9Y5qqLObJeUTzCripH
        g0knfRAzgTGghne80ENFdcQ=
X-Google-Smtp-Source: ABdhPJxzuTR2nE6+UFhiROJlHlEwVBBTmn+Zcpl8Z4Syo8+Gao8uNfP6UzS34ZEdICj2BMSp4IDCfw==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr2720059wmi.15.1614848239568;
        Thu, 04 Mar 2021 00:57:19 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:19 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 06/15] Documentation: add BCM6358 pincontroller binding documentation
Date:   Thu,  4 Mar 2021 09:57:01 +0100
Message-Id: <20210304085710.7128-7-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
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
 v4: no changes
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

