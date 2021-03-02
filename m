Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5303E32AD37
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384008AbhCBV3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835597AbhCBTSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:21 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61625C0617A9;
        Tue,  2 Mar 2021 11:16:29 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id w7so3154555wmb.5;
        Tue, 02 Mar 2021 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HLoji8JyLmH6ReYihGwizdlvh/FMuSrkV/UJTQFB9qo=;
        b=rZ6ecPF0iwx2a36UdlTHckhp8qrxkcx4S1AURNqoef6GOAnlQVrmePsVOJDpU5kIhA
         Yxs0fmwpxVWQpK/Nbb0vYJ6HguxAoEOK3hyqreYS8fzVfsUbmyDgcBWIgalNUSIGQmGs
         Xj8SkQHEoB2UPmDQzyj3gmkLGOiaBe+gMnVUBcIFEIPbUP8eViGe66HkqIFceZKU1rS8
         7Zd4REBhGgrQd3EjIFUlzxWHfI8CzqUAnoJBdQsFbO31v4bAfEPHOz1agswh7PG6iy8R
         LhPlvh+6/y9TM28mBERQfcnjJ3rU/ac8bG1p0DC7xeB7aaCsiWW2yb2ag2xB366VsCMO
         kzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HLoji8JyLmH6ReYihGwizdlvh/FMuSrkV/UJTQFB9qo=;
        b=dT+R1IlNvs+rq/qUhjy+mCKRubrdluvmB6uhk/WO8UeGaLE8XJOwGg64w/RNuPFjjG
         iA99zR4Q4u5TPnKz71oG1v8Wd5dqbyLbGb3jhlgc/yg3D+T+p7d9ntxnraTdWhDW6p4G
         J43qFW3K9oMIONpc/q7dczQ1ghb/4YCA0OfRQHgI6s70KWKdsc4bY7YB63ghriB04nid
         j90j3dp2ClcIV/IMtIOs5Kb0kIHus1r1IlvCkBBCGnBU/V7D6OspaMn3aNz15N370IAE
         mlEjZ/af3AWvv749kb2xII7eZl7ViPpwmLXACBk6QUvg7BBAJyfa2c830Cz+HEstp8DO
         vSgw==
X-Gm-Message-State: AOAM532lYTvM2gJvV0AADVl5GZmrsu2D277QKDb+fDpe1BG57F3JNF4M
        3nPEIWl0F7PW8gNJvOuIc1A=
X-Google-Smtp-Source: ABdhPJz/U0C7aPmB2I5QoPLOTC/mijX/B6BSrNj42nTWTLackJbU7i+cbO8GQewiHafk4+vu36SQGw==
X-Received: by 2002:a05:600c:4844:: with SMTP id j4mr3641911wmo.179.1614712588076;
        Tue, 02 Mar 2021 11:16:28 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:23 -0800 (PST)
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
Subject: [PATCH v2 03/12] Documentation: add BCM6358 pincontroller binding documentation
Date:   Tue,  2 Mar 2021 20:16:04 +0100
Message-Id: <20210302191613.29476-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
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
 v2: remove interrupts

 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
new file mode 100644
index 000000000000..822d1ca8789c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
@@ -0,0 +1,111 @@
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
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@fffe0080 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0xfffe0080 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm6358-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
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

