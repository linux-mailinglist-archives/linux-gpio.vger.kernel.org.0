Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC59A4FEF75
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 08:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiDMGLc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 02:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbiDMGLb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 02:11:31 -0400
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F604704A;
        Tue, 12 Apr 2022 23:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649830130; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=GlbhLNwzhdNvH8aEOqanJ4bWmfhYL3hfSxRQdBdJAS8Ut6vNR+xmicB2cVUHSONPGPV4erwBEM+CI3nTaiXOoLq7/kszTx5m9KLg+lgqOHCZr1yqecw77wIFzjtLneUJ2ZJopIL20ReV2rlsHG8BslSL5Oth7/W92N+leneUaSw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1649830130; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=mpwcTh8CjWF1bV6nY35bIDn7PlK6pgxOAGh4mpV6q+4=; 
        b=fzie1MADyCPQ9mCVRKBzzVzcU6OQL2C9tQF51V9qkvyRgUzfaTsahbpusxrC46K30yyq1OjHC8bGPCKs63bw+cmocER3yfVJLCJM4nL5cE9o1Chi0tCVOv3SqteuQxnDS05Wgu0GBILxQUO3ilIMt6WCq9u53O/l34WjdadlG9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830129;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=mpwcTh8CjWF1bV6nY35bIDn7PlK6pgxOAGh4mpV6q+4=;
        b=A0L8wqdCbJnEyGzRtXzzS2766oZ5HilbHnXdMW9gQjUmGPZ2U6aTbM9KLDPzPVc9
        KiMX/k4xEnpfmjaFF5/BurMu8e3EAAI6grq+IZJ4OZQzfFqikhlzp1DbNxNJln82I4K
        X7cJ053TcWKd6+ksFEx3DMGP7BR/kalqk7SBPt2I=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
        with SMTPS id 1649830128143542.8941953542978; Tue, 12 Apr 2022 23:08:48 -0700 (PDT)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 13/14] dt-bindings: pinctrl: add binding for Ralink RT305X pinctrl
Date:   Wed, 13 Apr 2022 09:07:28 +0300
Message-Id: <20220413060729.27639-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding for the Ralink RT305X pin controller for RT3050, RT3052,
RT3350, RT3352 and RT5350 SoCs.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../pinctrl/ralink,rt305x-pinctrl.yaml        | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
new file mode 100644
index 000000000000..39f4a153d94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ralink,rt305x-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT305X Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description:
+  Ralink RT305X pin controller for RT3050, RT3052, RT3350, RT3352 and RT5350 SoCs.
+  The pin controller can only set the muxing of pin groups. Muxing indiviual pins
+  is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    const: ralink,rt305x-pinctrl
+
+patternProperties:
+  '-pins$':
+    type: object
+    patternProperties:
+      '^(.*-)?pinmux$':
+        type: object
+        description: node for pinctrl.
+        $ref: pinmux-node.yaml#
+
+        properties:
+          groups:
+            description: The pin group to select.
+            enum: [
+              # For RT3050, RT3052 and RT3350 SoCs
+              i2c, jtag, mdio, rgmii, sdram, spi, uartf, uartlite,
+
+              # For RT3352 SoC
+              i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1, uartf, uartlite,
+
+              # For RT5350 SoC
+              i2c, jtag, led, spi, spi_cs1, uartf, uartlite,
+            ]
+
+          function:
+            description: The mux function to select.
+            enum: [
+              # For RT3050, RT3052 and RT3350 SoCs
+              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio, pcm gpio, pcm i2s, pcm uartf, rgmii,
+              sdram, spi, uartf, uartlite,
+
+              # For RT3352 SoC
+              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, lna, mdio, pa, pcm gpio, pcm i2s,
+              pcm uartf, rgmii, spi, spi_cs1, uartf, uartlite, wdg_cs1,
+
+              # For RT5350 SoC
+              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, pcm gpio, pcm i2s, pcm uartf, spi,
+              spi_cs1, uartf, uartlite, wdg_cs1,
+            ]
+
+        required:
+          - groups
+          - function
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    pinctrl {
+      compatible = "ralink,rt305x-pinctrl";
+
+      i2c_pins: i2c0-pins {
+        pinmux {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
-- 
2.25.1

