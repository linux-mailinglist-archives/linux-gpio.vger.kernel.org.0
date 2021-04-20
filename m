Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32987365912
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 14:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhDTMkJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Apr 2021 08:40:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:51334 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231718AbhDTMkI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Apr 2021 08:40:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 96237B2E1;
        Tue, 20 Apr 2021 12:39:35 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: gpio: Add devicetree binding for IDT 79RC3243x GPIO controller
Date:   Tue, 20 Apr 2021 14:39:31 +0200
Message-Id: <20210420123932.24634-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210420123932.24634-1-tsbogend@alpha.franken.de>
References: <20210420123932.24634-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add YAML devicetree binding for IDT 79RC3243x GPIO controller

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 .../bindings/gpio/gpio-idt3243x.yaml          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
new file mode 100644
index 000000000000..346a57ef8298
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-idt3243x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IDT 79RC32434x GPIO controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+properties:
+  compatible:
+    const: idt,3243x-gpio
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: pic
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  ngpios:
+    description:
+      Number of available gpios in a bank.
+    minimum: 1
+    maximum: 32
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - ngpios
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio0: interrupt-controller@50000 {
+        compatible = "idt,3243x-gpio";
+        reg = <0x50000 0x14>, <0x38030 0x0c>;
+        reg-names = "gpio", "pic";
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        interrupt-parent = <&cpuintc>;
+        interrupts = <6>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        ngpios = <14>;
+    };
-- 
2.29.2

