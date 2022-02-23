Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D281E4C1A02
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 18:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243094AbiBWRnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 12:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbiBWRnD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 12:43:03 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B1F3EA88;
        Wed, 23 Feb 2022 09:42:35 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NHgPBJ043894;
        Wed, 23 Feb 2022 11:42:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1645638145;
        bh=71VKBZlzfawa2k4ICvtL0nMLvisqBZLYxeXPD7Q2JiI=;
        h=From:To:CC:Subject:Date;
        b=rYkiafohMBdFfL0D4vQsuOxk7Z4RNiZBczqFJtqUkRyNKPz3N1b3yC6DnPli8xnv/
         CohptNCYZwY1XX/1EDxN3y62JcmIfjzTtSKvEHiQeLo9wPDwyLghsIDYYGAArIcIgu
         ofxBZlKYM93s5ifGQVKf3xqNeax5nWAMIaIOZrOc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NHgPlu038885
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Feb 2022 11:42:25 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 11:42:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 11:42:25 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NHgMwD118869;
        Wed, 23 Feb 2022 11:42:22 -0600
From:   Aparna M <a-m1@ti.com>
To:     <a-govindraju@ti.com>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>
CC:     <praneeth@ti.com>, <grygorii.strashko@ti.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <bgolaszewski@baylibre.com>
Subject: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller bindings to YAML
Date:   Wed, 23 Feb 2022 23:12:15 +0530
Message-ID: <20220223174215.17838-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert gpio-tpic2810 bindings to yaml format and remove outdated
bindings in .txt format.

Signed-off-by: Aparna M <a-m1@ti.com>
---

v4 -> v5: Fix indentation issues
v3 -> v4: Add gpio-line-names property
v2 -> v3: Remove redundant descriptions and make minor change in example
v1 -> v2: Fix identation issues and update commit message

 .../bindings/gpio/gpio-tpic2810.txt           | 16 ------
 .../bindings/gpio/gpio-tpic2810.yaml          | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
deleted file mode 100644
index 1afc2de7a537..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-TPIC2810 GPIO controller bindings
-
-Required properties:
- - compatible		: Should be "ti,tpic2810".
- - reg			: The I2C address of the device
- - gpio-controller	: Marks the device node as a GPIO controller.
- - #gpio-cells		: Should be two. For consumer use see gpio.txt.
-
-Example:
-
-	gpio@60 {
-		compatible = "ti,tpic2810";
-		reg = <0x60>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
new file mode 100644
index 000000000000..cb8a5c376e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-tpic2810.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPIC2810 GPIO controller bindings
+
+maintainers:
+  - Aswath Govindraju <a-govindraju@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tpic2810
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpio@60 {
+            compatible = "ti,tpic2810";
+            reg = <0x60>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-line-names = "LED A", "LED B", "LED C";
+        };
+    };
-- 
2.17.1

