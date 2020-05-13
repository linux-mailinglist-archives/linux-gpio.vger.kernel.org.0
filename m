Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17391D1375
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732989AbgEMM4s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:48 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:29570 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731644AbgEMM4r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374606; x=1620910606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=poBPrhT3w6QbThTNX7WMhvl6ITRtWZafa6qFqSWWJSM=;
  b=19ZI/nOyOQ1yISZ95HqFgMsJfoNCP1o6QilIEtkIeFZzP6oG9MO4HE5w
   rOBhuWvbYAux5N5aRp4TWCfH/Yi42QtY/cluJgoyEHkfDpogrc9cIQAQo
   UVQ1qA9Pl4+ZCgF76ZbBKjJKzyKmhGm/uEd85/w8U8zOTfGAQbueVRMY8
   dWRgqWMjgNdYgX2Pna0+jRD8X5bw5scDxL9YEIqbR61saMANjdUh1RvNH
   BQ0XcLWKEq0ZntWc75NVPB3XqacRdUeFaH6I//O7VAFBjwXpytvbi+QV5
   x5dWvmDIho3dMWtMQEsueqnKi5A8OzS+1XtEsgbRAaOloKxmP1T7g0dJF
   g==;
IronPort-SDR: xxJdrEOxoKFUoLTD14Tc43OvYgZ/knJ6/cbfPW9+CoTHjCaaQ1u/jmYup6A6CbZQhwERynlnod
 rFRLF3M/WkpD1TVTYVAN1fmXQV9PmBKBpdq21AnRDX3Htw4lER5Hn6WV0fZ3Q+Z5l/HVaEko8p
 DE3WRmiUUiLPbP3U1bNAyP2RpFCyQlU7/Vwwl2No0MeKdcrk8QFbonZJpZzCpkVPeGL0+z01xE
 s/CVAdnli96L3/nH5bHtKt61tiSbkEh+u8NbFYaWRLA9pYgSkO3cTnj7eVdZV4Lvewn6indXai
 sFM=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="76494614"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:48 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:42 -0700
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
Subject: [PATCH 05/14] dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
Date:   Wed, 13 May 2020 14:55:23 +0200
Message-ID: <20200513125532.24585-6-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
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
 .../bindings/arm/microchip,sparx5.yaml        | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
new file mode 100644
index 0000000000000..83b36d1217988
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
@@ -0,0 +1,87 @@
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
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+patternProperties:
+  "^syscon@[0-9a-f]+$":
+    description: All Sparx5 boards must provide a system controller,
+      typically under the axi bus node. It contain reset registers and
+      other system control.
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: microchip,sparx5-cpu-syscon
+          - const: syscon
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - axi@600000000
+  - syscon@600000000
+
+...
--
2.26.2
