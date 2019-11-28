Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B12F710CC34
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 16:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfK1PzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 10:55:07 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41371 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1Pyw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 10:54:52 -0500
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B4EE840002;
        Thu, 28 Nov 2019 15:54:49 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/5] dt-bindings: mfd: Document the Xylon LogiCVC multi-function device
Date:   Thu, 28 Nov 2019 16:54:35 +0100
Message-Id: <20191128155438.325738-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128155438.325738-1-paul.kocialkowski@bootlin.com>
References: <20191128155438.325738-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The LogiCVC is a display engine which also exposes GPIO functionality.
For this reason, it is described as a multi-function device that is expected
to provide register access to its children nodes for gpio and display.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
new file mode 100644
index 000000000000..abc9937506e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Bootlin
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xylon LogiCVC multi-function device
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+description: |
+  The LogiCVC is a display controller that also contains a GPIO controller.
+  As a result, a multi-function device is exposed as parent of the display
+  and GPIO blocks.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - xylon,logicvc-3.02.a
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - xylon,logicvc-3.02.a
+
+  required:
+    - compatible
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    logicvc: logicvc@43c00000 {
+      compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
+      reg = <0x43c00000 0x6000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+    };
-- 
2.24.0

