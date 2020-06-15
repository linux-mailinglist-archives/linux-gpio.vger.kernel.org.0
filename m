Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BE21F98AC
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbgFONdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:33:05 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:17288 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbgFONdC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592227983; x=1623763983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7xKYbNgRORGSIRkucj0cga7qBY8A11GtjHiebfAEts4=;
  b=BZKxxOEh6ERkYDaYVo4u1zMpJONmStzOkBEfoXd2NJnYnD9R4tZGrYXy
   xZ7PHbeMZUANKfPDZEQJG2CIHAq5IsXCRUx4bvL8xegQTaxAIevx0Yc9n
   MGfP9XQKcsImTPzDrysSkuqGfb+lzokO4N1+0ebWF39ZM3ynMyUTeRXvP
   5RgU24ryz35DhsTSqhMDXMUyZrAgOxdwYzxugwbfJ6IE+aRZ216cxd/8G
   oj+JItjVarHsZAOGPko1vr1dEucSJtXY4cF1O4yu1almRgqxhVA1UYAD8
   NC5E+J4h4tP4Y4CjHAJNAKtyOFhZ19GyGJq7Qq6jmvJObxkvQzYNqLh8V
   w==;
IronPort-SDR: +P10UNKRjPYPhcNlyDckMifLPkD02tynVgW46HfjcCQyW5aygqAvziSg0Dl2tCY18IIMh3Iq1k
 59pbDvVExiOfL2ZcbH+SGDjp8YCji8I8s9Hj+ezrJ1Vnvz3I/sq4dIyzU7OlZunBoH5UMa692B
 hJyxbyJkfA/cIjNDb0EvdJ701n9H2FO1MFWw+N+bippQ2RPI0udRwJgIn/3B8GI4qWg6GkmKv5
 jFqN1wvNAL+TGEe6GxM3oZCxLmBJjVjYWT1eFg5E/CaA2rVdiaP+XSrSebdoANMlA089lzGMmO
 T18=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="79480463"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:33:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:33:01 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:32:57 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 01/10] dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
Date:   Mon, 15 Jun 2020 15:32:33 +0200
Message-ID: <20200615133242.24911-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the main Sparx5 SoC DT documentation file, with information
abut the supported board types.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../bindings/arm/microchip,sparx5.yaml        | 65 +++++++++++++++++++
 .../devicetree/bindings/mfd/syscon.yaml       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
new file mode 100644
index 0000000000000..ecf6fa12e6ad2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Sparx5 Boards Device Tree Bindings
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+description: |+
+   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
+   gigabit TSN-capable gigabit switches.
+
+   The SparX-5 Ethernet switch family provides a rich set of switching
+   features such as advanced TCAM-based VLAN and QoS processing
+   enabling delivery of differentiated services, and security through
+   TCAM-based frame processing using versatile content aware processor
+   (VCAP)
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: The Sparx5 pcb125 board is a modular board,
+          which has both spi-nor and eMMC storage. The modular design
+          allows for connection of different network ports.
+        items:
+          - const: microchip,sparx5-pcb125
+          - const: microchip,sparx5
+
+      - description: The Sparx5 pcb134 is a pizzabox form factor
+          gigabit switch with 20 SFP ports. It features spi-nor and
+          either spi-nand or eMMC storage (mount option).
+        items:
+          - const: microchip,sparx5-pcb134
+          - const: microchip,sparx5
+
+      - description: The Sparx5 pcb135 is a pizzabox form factor
+          gigabit switch with 48+4 Cu ports. It features spi-nor and
+          either spi-nand or eMMC storage (mount option).
+        items:
+          - const: microchip,sparx5-pcb135
+          - const: microchip,sparx5
+
+  axi@600000000:
+    type: object
+    description: the root node in the Sparx5 platforms must contain
+      an axi bus child node. They are always at physical address
+      0x600000000 in all the Sparx5 variants.
+    properties:
+      compatible:
+        items:
+          - const: simple-bus
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - axi@600000000
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 19bdaf781853b..f3fba860d3cc5 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -38,6 +38,7 @@ properties:
               - allwinner,sun8i-h3-system-controller
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
+              - microchip,sparx5-cpu-syscon
 
           - const: syscon
 
-- 
2.27.0

