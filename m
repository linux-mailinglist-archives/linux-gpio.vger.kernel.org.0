Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577B9347354
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbhCXIUP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbhCXITf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:35 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3524BC0613DE;
        Wed, 24 Mar 2021 01:19:35 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id g25so12418541wmh.0;
        Wed, 24 Mar 2021 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4KDTlX6LIuzGtMVB1mgTc4ItGSZZCuLQ0FPCmV2gWPQ=;
        b=WoEhJxPmXvHPEAwms89i1hL2snFEXOTbMj2kYOyrO+kRjS3mS3Gq6xO+uwEVwKg3iD
         3Kzh/e1T4a8Fk1iHvKDLAl6IP6kabigz5OH1G4sZU6YBrv5hkKb3uYZRSjneJ47OfgS0
         SxMCN8XsZX3UWpSnGnkP41BJBlIoNE7ftYrp+5MbltBmin8X8rZFUZijM5HVMeVqdn+T
         Ww12clryGsS38fRhVeeeq3AK5byM6BVVPsjKZwpk6yzH/quoODMObAT3/E1fAoxJ3joh
         6kxUay2DZioKgn8AKN7dv7jf6D0d9jAT2H+Fqi+gkNlCZkKNGBDxCImoM4Z22Zp0cBsS
         8k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4KDTlX6LIuzGtMVB1mgTc4ItGSZZCuLQ0FPCmV2gWPQ=;
        b=i4m/D6mqqAUuJPnQ5XSLj5d1rO5T2a7OhkSMTGFQOYVFVCwk4F9X7rkL6ZK0PZxAzT
         0pUA8FPk1trdJ/x6Gm42bzrvqGBr9chrj1pXLoNz+XyaCamzYAkcb7oZ59AtbZo0hMsJ
         yfoHtWq/jRZ78vDCJARtAivbqH+NNo4l/zEZYRPDhskAIwCgLL+5lcKwVmFPhmHMMuzV
         Kf+Xlqt32qvjxV8HWlSnm+fusD+u2s7qgXGXbph2Y+UmStRkUlFDUTTE3bgimNBCDVfJ
         i3l1cXFHLM4TLlz+KXlmAuB5ITtBbMmddGS6z1M1+UO4v07a+yhqlKlq6kgZg2Y0QF85
         zhpQ==
X-Gm-Message-State: AOAM533s8VprZngdPG+YbmTCeNDprE1d7X+fWfFrFGzydepoDkTX2tRN
        I6zSsav9WHUUKr+hczc6cfs=
X-Google-Smtp-Source: ABdhPJydKCUVwhUQD93zTp0qKisooPcPJuRpo/Z8dTuG3jMIR/Bp18+i0AxsV4tAVdujbs+9L20RUw==
X-Received: by 2002:a05:600c:35cd:: with SMTP id r13mr1722553wmq.186.1616573973874;
        Wed, 24 Mar 2021 01:19:33 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:33 -0700 (PDT)
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
Subject: [PATCH v9 08/22] dt-bindings: add BCM6358 pincontroller binding documentation
Date:   Wed, 24 Mar 2021 09:19:09 +0100
Message-Id: <20210324081923.20379-9-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6358 SoCs.

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

 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..0c3ce256aa78
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,93 @@
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
+description:
+  Bindings for Broadcom's BCM6358 memory-mapped pin controller.
+
+properties:
+  compatible:
+    const: brcm,bcm6358-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ ebi_cs, uart1, serial_led, legacy_led, led, spi_cs, utopia,
+                pwm_syn_clk, sys_irq ]
+
+      pins:
+        enum: [ ebi_cs_grp, uart1_grp, serial_led_grp, legacy_led_grp,
+                led_grp, spi_cs_grp, utopia_grp, pwm_syn_clk, sys_irq_grp ]
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
+      compatible = "brcm,bcm6358-pinctrl";
+      reg = <0x18 0x4>;
+
+      pinctrl_ebi_cs: ebi_cs-pins {
+        function = "ebi_cs";
+        groups = "ebi_cs_grp";
+      };
+
+      pinctrl_uart1: uart1-pins {
+        function = "uart1";
+        groups = "uart1_grp";
+      };
+
+      pinctrl_serial_led: serial_led-pins {
+        function = "serial_led";
+        groups = "serial_led_grp";
+      };
+
+      pinctrl_legacy_led: legacy_led-pins {
+        function = "legacy_led";
+        groups = "legacy_led_grp";
+      };
+
+      pinctrl_led: led-pins {
+        function = "led";
+        groups = "led_grp";
+      };
+
+      pinctrl_spi_cs_23: spi_cs-pins {
+        function = "spi_cs";
+        groups = "spi_cs_grp";
+      };
+
+      pinctrl_utopia: utopia-pins {
+        function = "utopia";
+        groups = "utopia_grp";
+      };
+
+      pinctrl_pwm_syn_clk: pwm_syn_clk-pins {
+        function = "pwm_syn_clk";
+        groups = "pwm_syn_clk_grp";
+      };
+
+      pinctrl_sys_irq: sys_irq-pins {
+        function = "sys_irq";
+        groups = "sys_irq_grp";
+      };
+    };
-- 
2.20.1

