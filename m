Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88448420D9D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 15:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbhJDNQ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 09:16:58 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55214 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235522AbhJDNPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 09:15:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 194DD9Xf043034;
        Mon, 4 Oct 2021 08:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633353189;
        bh=FZbBTK0q95a0KEDM21pIW5OH+dM+gH76vkJazgGj0XY=;
        h=From:To:CC:Subject:Date;
        b=NhTsjImI6qukttBzAhQu8QT5ALJxRaiG8MILOVGs0wjb19PHkUt4SIchBC3g+EZd4
         CYolhVHnLAVXrJK2gAXIzSPnjFzOXS9ZhwrB+i2QIw/o/dAIkqGPLqJevBu1dHyzkg
         rFT7kOTfVpLifty3vVpgtuNsw8EqLDliTS/f0VAQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 194DD9NM033831
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Oct 2021 08:13:09 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 4
 Oct 2021 08:13:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 4 Oct 2021 08:13:09 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 194DD6m3126177;
        Mon, 4 Oct 2021 08:13:06 -0500
From:   Aparna M <a-m1@ti.com>
To:     <a-govindraju@ti.com>
CC:     <vigneshr@ti.com>, <grygorii.strashko@ti.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <bgolaszewski@baylibre.com>, Aparna M <a-m1@ti.com>
Subject: [PATCH v2] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller bindings to YAML
Date:   Mon, 4 Oct 2021 18:45:00 +0530
Message-ID: <20211004131500.22100-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert gpio-tpic2810 bindings to yaml format and remove outdated
bindings in .txt format.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../bindings/gpio/gpio-tpic2810.txt           | 16 -------
 .../bindings/gpio/gpio-tpic2810.yaml          | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 16 deletions(-)
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
index 000000000000..811aee483f43
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
@@ -0,0 +1,48 @@
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
+    description: The I2C address of the device
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
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
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@60 {
+            compatible = "ti,tpic2810";
+            reg = <0x60>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.17.1

