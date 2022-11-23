Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F92634FA3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 06:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbiKWFgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 00:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKWFgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 00:36:02 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5298220E;
        Tue, 22 Nov 2022 21:36:00 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZfVO069638;
        Tue, 22 Nov 2022 23:35:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669181741;
        bh=gtv691NYVsk28aiaN9x+rwnIaXxKLu3uYt/E+Q7kN6I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BpIJeO2pZ42hJEy9CW+9MLKnbJf8SbCeSBknQZI7xDiCesEzMnRITGQZrKYXf6I7E
         6wshFVGMfIBhFz9ozBdxB+cXVZ8xRTxr64kv5XlFkB8JmnPwUZ4DIvt/fwBToDSZ8O
         bL9GIMl4texVlTTZnH9XD/Ox73FcUbWTyBZPCU4o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN5ZfJw009670
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Nov 2022 23:35:41 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 23:35:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 23:35:40 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZbBF119209;
        Tue, 22 Nov 2022 23:35:39 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <michael@walle.cc>, <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v5 1/4] dt-bindings: mfd: ti,tps6594: add TPS6594 PMIC support
Date:   Tue, 22 Nov 2022 21:35:09 -0800
Message-ID: <20221123053512.1195309-2-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221123053512.1195309-1-mranostay@ti.com>
References: <20221123053512.1195309-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for the TPS6594 PMIC including its RTC and GPIO
functionalities.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 .../devicetree/bindings/mfd/ti,tps6594.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
new file mode 100644
index 000000000000..0de0db87dbf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPS6594 Power Management Integrated Circuit (PMIC)
+
+description: |
+  TPS6594 Power Management Integrated Circuit (PMIC)
+  https://www.ti.com/lit/ds/symlink/tps6594-q1.pdf
+
+maintainers:
+  - Keerthy <j-keerthy@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tps6594
+
+  reg:
+    const: 0x48
+
+  ti,system-power-controller:
+    type: boolean
+    description: PMIC is controlling the system power.
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: ti,tps6594-rtc
+
+  gpio:
+    type: object
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: ti,tps6594-gpio
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: pmic@48 {
+            compatible = "ti,tps6594";
+            reg = <0x48>;
+
+            rtc {
+                compatible = "ti,tps6594-rtc";
+            };
+
+            gpio {
+                compatible = "ti,tps6594-gpio";
+            };
+        };
+    };
+
+...
-- 
2.38.GIT

