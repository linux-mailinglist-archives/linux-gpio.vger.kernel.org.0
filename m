Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BF1221A1A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 04:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgGPCeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 22:34:01 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:57574 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgGPCd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 22:33:59 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06G2Xei26017581, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06G2Xei26017581
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jul 2020 10:33:40 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jul 2020 10:33:39 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jul 2020 10:33:39 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 16 Jul 2020 10:33:39 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/8] dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1195
Date:   Thu, 16 Jul 2020 10:33:34 +0800
Message-ID: <20200716023338.14922-5-tychang@realtek.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716023338.14922-1-tychang@realtek.com>
References: <20200716023338.14922-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation for rtd1195
pinctrl driver.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 .../pinctrl/realtek,rtd1195-pinctrl.yaml      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
new file mode 100644
index 000000000000..50a95bc46e2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1195-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1195 pin control
+
+maintainers:
+  - Andreas Farber <afaerber@suse.de>
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1195-iso-pinctrl
+      - realtek,rtd1195-crt-pinctrl
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    allOf:
+      - $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      groups:
+        items:
+          enum: [ iso_gpio_0, iso_gpio_1, usb0, usb1, vfd_cs_n,
+          vfd_clk, vfd_d, ir_rx, ir_tx, ur0_rx, ur0_tx,
+          ur1_rx, ur1_tx, ur1_cts_n, ur1_rts_n, i2c_scl_0,
+          i2c_sda_0, etn_led_link, etn_led_rxtx,
+          i2c_scl_6, i2c_sda_6, ai_loc, ejtag_avcpu_loc,
+          ur1_loc, pwm_01_open_drain, pwm_23_open_drain,
+          gpio_0, gpio_1, gpio_2, gpio_3, gpio_4, gpio_5,
+          gpio_6, gpio_7, gpio_8, nf_dd_0, nf_dd_1,
+          nf_dd_2, nf_dd_3, nf_dd_4, nf_dd_5, nf_dd_6,
+          nf_dd_7, nf_rdy, nf_rd_n, nf_wr_n, nf_ale,
+          nf_cle, nf_ce_n_0, nf_ce_n_1, mmc_data_0,
+          mmc_data_1, mmc_data_2, mmc_data_3, mmc_clk,
+          mmc_cmd, mmc_wp, mmc_cd, sdio_clk, sdio_data_0,
+          sdio_data_1, sdio_data_2, sdio_data_3, sdio_cmd,
+          i2c_scl_5, i2c_sda_5, tp1_data, tp1_clk,
+          tp1_valid, tp1_sync, tp0_data, tp0_clk,
+          tp0_valid, tp0_sync, usb_id, hdmi_hpd, spdif,
+          i2c_scl_1, i2c_sda_1, i2c_scl_4, i2c_sda_4,
+          sensor_cko_0, sensor_cko_1, sensor_rst,
+          sensor_stb_0, sensor_stb_1, ejtag_scpu_loc,
+          hif_loc, ao_loc ]
+        minItems: 1
+
+      function:
+        enum: [ gpio, ai_ur1, ai_vfd, avcpu_ejtag_iso,
+        avcpu_ejtag_misc_loc, etn_led, i2c0, i2c2,
+        i2c3, i2c6, ir_rx, ir_tx, pwm, standby_dbg,
+        uart0, uart1, ur1_misc, vfd, pwm_01_normal,
+        pwm_23_normal, pwm_01_open_drain, pwm_23_open_drain,
+        ao_tp0, ao_gpio, avcpu_ejtag_misc, cpu_loop, emmc,
+        gspi, hif_misc, hif_nf, i2c1, i2c2, i2c3,
+        i2c4, i2c5, mmc, nand, scpu_ejtag_gpio,
+        scpu_ejtag_cr, sdio, sensor, spdif, tp0, tp1,
+        uart1, usb ]
+
+      drive-strength:
+        enum: [2, 4, 8]
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      input-schmitt-disable: true
+
+      input-schmitt-enable: true
+
+    required:
+      - groups
+      - function
+
+    additionalProperties: false
+
+examples:
+  - |
+    iso_pinctrl: pinctrl@300 {
+        compatible = "realtek,rtd1195-iso-pinctrl";
+        reg = <0x300 0x14>;
+
+        i2c0_pins: i2c0-pins {
+            function = "i2c0";
+            groups = "i2c_scl_0", "i2c_sda_0";
+            drive-strength = <4>;
+            bias-disable;
+        };
+    };
+
-- 
2.27.0

