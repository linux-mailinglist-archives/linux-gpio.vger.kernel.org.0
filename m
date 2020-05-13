Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A381D138C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgEMM5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:57:05 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:7011 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732929AbgEMM5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374623; x=1620910623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cocnq6C3Sx04OlU4tTo1v6TxiLLEsTWDPS8e3sD9Sss=;
  b=PZLEjl0brNrY9AD0quJxESwfP2mVLxbmshWUXyImJdKvcWpwoOVunOuJ
   7IpCrzmvZl2xjw1GtDBnYlT6RfWpXhYmHzjrKl/nSMWqKaPfmehKlhS5K
   N3ndKmJ2PY42mqYpltqoWDhhtoGJ1Fe8ltH9URsEgp5DQOcRnETtBFxQk
   wxYg7SItJRcmHsZDGBwp3RvEd+re1s/AezKTvLLRGhljh014MpuEkW3T1
   E9SP1zxZBiN779D3VTYC4hkWkyaoD1XUqJ7P5ZpARbMGrvsRLUnVLWi91
   LU7aVIZqj/xF7MtP3BS2r8mPGoXZO9tuYQFoz5X7vqvrReOGr7wmPDnZq
   A==;
IronPort-SDR: hMNzW5FtpKKk1XnrrpvqvgpTTqFT95jAYklPcOtPflJB8uikGtYPodcZHxK0eLpS7ZYdmnqpmF
 yaHywINWj1rT6V8JJAIr95dAifHfuLZzJ0X5q6A28eIs2Ju3VYuM4ebHoHrAoSEEFGUW7DIVw3
 ZApFkDW8iEmeyIWNhgOrPMLX3lzz3FjzhOCarPXBrA/k2JhKRAgdkb2n5dG597AVtYR4JnEfvG
 ArGAy9kkiTIKVWzdSkuQXfymTpgzxEAW0CXfoUKqFFS31J6VCvf6VzSNH44fztIOwDVw9N/LJ+
 9AI=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="75132842"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:57:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:57:02 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:59 -0700
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
Subject: [PATCH 10/14] dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
Date:   Wed, 13 May 2020 14:55:28 +0200
Message-ID: <20200513125532.24585-11-lars.povlsen@microchip.com>
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

This add the DT bindings documentation for the Sparx5 SoC DPLL clock

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../bindings/clock/microchip,sparx5-dpll.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml b/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
new file mode 100644
index 0000000000000..594007d8fc59a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,sparx5-dpll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Sparx5 DPLL Clock
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+description: |
+  The Sparx5 DPLL clock controller generates and supplies clock to
+  various peripherals within the SoC.
+
+  This binding uses common clock bindings
+  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+properties:
+  compatible:
+    const: microchip,sparx5-dpll
+
+  reg:
+    items:
+      - description: dpll registers
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock provider for eMMC:
+  - |
+    clks: clks@61110000c {
+         compatible = "microchip,sparx5-dpll";
+         #clock-cells = <1>;
+         reg = <0x1110000c 0x24>;
+    };
+
+...
--
2.26.2
