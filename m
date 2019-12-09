Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E8511749E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 19:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfLISnO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 13:43:14 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34256 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726780AbfLISm7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 13:42:59 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 33BBC2E5CE1;
        Mon,  9 Dec 2019 18:29:09 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 03/10] dt-bindings: gpio: Add documentation for AD242x GPIO controllers
Date:   Mon,  9 Dec 2019 19:35:04 +0100
Message-Id: <20191209183511.3576038-5-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This device must be place as a sub-device of an AD242x MFD node.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/gpio/adi,ad242x-gpio.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/adi,ad242x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/adi,ad242x-gpio.yaml b/Documentation/devicetree/bindings/gpio/adi,ad242x-gpio.yaml
new file mode 100644
index 000000000000..0a5a339fc84e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/adi,ad242x-gpio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpio/adi,ad242x-gpio.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices AD242x GPIO controller
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  This module is part of the AD242x MFD device. For more details and an example
+  refer to Documentation/devicetree/bindings/mfd/ad242x.yaml.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2428w-gpio
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-over-distance:
+    type: object
+    description: |
+      Sub-node to configure pins as 'GPIO over distance'.
+      Pins in this mode are not accessible as regular GPIOs; instead, their
+      state is transparantly mirrored between one or multiple nodes.
+
+      Each child node of the 'gpio-over-distance' node describes one pin
+      that is to be configured in 'over distance' mode
+
+    properties:
+      pin:
+        type: object
+        properties:
+          reg:
+            maxItems: 1
+
+          adi,virtual-port-mask:
+            $ref: '/schemas/types.yaml#/definitions/uint32'
+            description: |
+              The virtual port mask to assign this GPIO to.
+              Multiple GPIOs can use the same virtual port to link them
+              together. Refer to the datasheet for the details.
+
+          adi,gpio-output:
+            type: boolean
+            description: Configures this GPIO as output. Defaults to input mode.
+
+          adi,gpio-inverted:
+            type: boolean
+            description: Inverts the GPIO value
+
+        required:
+          - reg
+          - adi,virtual-port-mask
+
+required:
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
-- 
2.23.0

