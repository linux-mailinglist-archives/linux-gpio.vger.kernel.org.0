Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F90A243553
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgHMHt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:28 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39089 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgHMHt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:27 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7n9fP5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7n9fP5028965
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 13 Aug 2020 15:49:09 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/9] dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1295
Date:   Thu, 13 Aug 2020 15:49:04 +0800
Message-ID: <20200813074908.889-6-tychang@realtek.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813074908.889-1-tychang@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation for rtd1295
pinctrl driver.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 .../pinctrl/realtek,rtd1295-pinctrl.yaml      | 192 ++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
new file mode 100644
index 000000000000..20f612017f24
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1295-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1295 pin control
+
+maintainers:
+  - Andreas Farber <afaerber@suse.de>
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1295-iso-pinctrl
+      - realtek,rtd1295-sb2-pinctrl
+      - realtek,rtd1295-disp-pinctrl
+      - realtek,rtd1295-cr-pinctrl
+  reg:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '(-pin|-pins)$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    allOf:
+      - $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        items:
+          enum: [ iso_gpio_0, iso_gpio_1, iso_gpio_2, iso_gpio_3, iso_gpio_4,
+          iso_gpio_5, hdmi_hpd, iso_gpio_7, ir_rx, ir_tx, ur0_rx,
+          ur0_tx, ur1_rx, ur1_tx, ur1_cts_n, ur1_rts_n, i2c_scl_0,
+          i2c_sda_0, i2c_scl_1, i2c_sda_1, i2c_scl_6, iso_gpio_21,
+          iso_gpio_22, iso_gpio_23, iso_gpio_24, iso_gpio_25,
+          i2c_sda_6, etn_led_link, etn_led_rxtx, nat_led_0,
+          nat_led_1, nat_led_2, nat_led_3, iso_gpio_33,
+          iso_gpio_34, pwm_23_loc0, pwm_01_loc0, pwm_23_loc1,
+          pwm_01_loc1, ejtag_avcpu_loc, ur2_loc, i2c0, i2c1,
+          i2c6, uart0, uart1, uart2_0, uart2_1, gpio_0, gpio_1,
+          gpio_2, gpio_3, gpio_4, gpio_5, gpio_6, gpio_7, gpio_8,
+          gpio_9, tp1_sync, i2c_scl_4, i2c_sda_4, i2c_scl_5,
+          i2c_sda_5, usb_id, sensor_cko_0, sensor_cko_1, sensor_rst,
+          sensor_stb_0, sensor_stb_1, tp0_data, tp0_clk, tp0_valid,
+          tp0_sync, tp1_data, tp1_clk, tp1_valid, rgmii0_txc,
+          rgmii0_tx_ctl,rgmii0_txd_0, rgmii0_txd_1, rgmii0_txd_2,
+          rgmii0_txd_3, rgmii0_rxc, rgmii0_rx_ctl, rgmii0_rxd_0,
+          rgmii0_rxd_1, rgmii0_rxd_2, rgmii0_rxd_3, rgmii0_mdio,
+          rgmii0_mdc, rgmii1_txc, rgmii1_tx_ctl, rgmii1_txd_0,
+          rgmii1_txd_1, rgmii1_txd_2, rgmii1_txd_3, rgmii1_rxc,
+          rgmii1_rx_ctl, rgmii1_rxd_0, rgmii1_rxd_1, rgmii1_rxd_2,
+          rgmii1_rxd_3, hif_loc, ejtag_scpu_loc, sf_en, tp0_loc,
+          tp1_loc, spdif, dmic_clk, dmic_data, ao_lrck, ao_bck,
+          aock, ao_sd_0, ao_sd_1, ao_sd_2, ao_sd_3, nf_cle,
+          nf_ale, nf_rd_n, nf_wr_n, nf_rdy, nf_dd_7, nf_dd_6,
+          nf_dd_5, nf_dd_4, nf_dd_3, nf_dd_2, nf_dd_1, nf_dd_0,
+          nf_dqs, nf_ce_n_0, nf_ce_n_1, emmc_dd_sb, mmc_cmd,
+          mmc_clk, mmc_wp, mmc_cd, mmc_data_0, mmc_data_1,
+          mmc_data_2, mmc_data_3, sdio_cmd, sdio_clk, sdio_data_0,
+          sdio_data_1, sdio_data_2, sdio_data_3, pcie_clkreq_0,
+          pcie_clkreq_1, prob_0, prob_1, prob_2, prob_3, sdio_loc ]
+        minItems: 1
+
+      groups:
+        items:
+          enum: [ iso_gpio_0, iso_gpio_1, iso_gpio_2, iso_gpio_3, iso_gpio_4,
+          iso_gpio_5, hdmi_hpd, iso_gpio_7, ir_rx, ir_tx, ur0_rx,
+          ur0_tx, ur1_rx, ur1_tx, ur1_cts_n, ur1_rts_n, i2c_scl_0,
+          i2c_sda_0, i2c_scl_1, i2c_sda_1, i2c_scl_6, iso_gpio_21,
+          iso_gpio_22, iso_gpio_23, iso_gpio_24, iso_gpio_25,
+          i2c_sda_6, etn_led_link, etn_led_rxtx, nat_led_0,
+          nat_led_1, nat_led_2, nat_led_3, iso_gpio_33,
+          iso_gpio_34, pwm_23_loc0, pwm_01_loc0, pwm_23_loc1,
+          pwm_01_loc1, ejtag_avcpu_loc, ur2_loc, i2c0, i2c1,
+          i2c6, uart0, uart1, uart2_0, uart2_1, gpio_0, gpio_1,
+          gpio_2, gpio_3, gpio_4, gpio_5, gpio_6, gpio_7, gpio_8,
+          gpio_9, tp1_sync, i2c_scl_4, i2c_sda_4, i2c_scl_5,
+          i2c_sda_5, usb_id, sensor_cko_0, sensor_cko_1, sensor_rst,
+          sensor_stb_0, sensor_stb_1, tp0_data, tp0_clk, tp0_valid,
+          tp0_sync, tp1_data, tp1_clk, tp1_valid, rgmii0_txc,
+          rgmii0_tx_ctl,rgmii0_txd_0, rgmii0_txd_1, rgmii0_txd_2,
+          rgmii0_txd_3, rgmii0_rxc, rgmii0_rx_ctl, rgmii0_rxd_0,
+          rgmii0_rxd_1, rgmii0_rxd_2, rgmii0_rxd_3, rgmii0_mdio,
+          rgmii0_mdc, rgmii1_txc, rgmii1_tx_ctl, rgmii1_txd_0,
+          rgmii1_txd_1, rgmii1_txd_2, rgmii1_txd_3, rgmii1_rxc,
+          rgmii1_rx_ctl, rgmii1_rxd_0, rgmii1_rxd_1, rgmii1_rxd_2,
+          rgmii1_rxd_3, hif_loc, ejtag_scpu_loc, sf_en, tp0_loc,
+          tp1_loc, spdif, dmic_clk, dmic_data, ao_lrck, ao_bck,
+          aock, ao_sd_0, ao_sd_1, ao_sd_2, ao_sd_3, nf_cle,
+          nf_ale, nf_rd_n, nf_wr_n, nf_rdy, nf_dd_7, nf_dd_6,
+          nf_dd_5, nf_dd_4, nf_dd_3, nf_dd_2, nf_dd_1, nf_dd_0,
+          nf_dqs, nf_ce_n_0, nf_ce_n_1, emmc_dd_sb, mmc_cmd,
+          mmc_clk, mmc_wp, mmc_cd, mmc_data_0, mmc_data_1,
+          mmc_data_2, mmc_data_3, sdio_cmd, sdio_clk, sdio_data_0,
+          sdio_data_1, sdio_data_2, sdio_data_3, pcie_clkreq_0,
+          pcie_clkreq_1, prob_0, prob_1, prob_2, prob_3, sdio_loc ]
+        minItems: 1
+
+      function:
+        enum: [ gpio, acpu_ejtag_loc_iso, edp_hpd, etn_led, i2c0, i2c1, i2c6,
+        ir_rx, ir_tx, nat_led, pwm_0, pwm_1, rtc, sc, standby_dbg,
+        uart0, uart1, uart2_0, uart2_1, pwm_01_loc0_normal,
+        pwm_23_loc0_normal, pwm_01_loc0_open_drain, pwm_23_loc0_open_drain,
+        pwm_01_loc1_normal, pwm_23_loc1_normal, pwm_01_loc1_open_drain,
+        pwm_23_loc1_open_drain, acpu_ejtag_loc_nf, ai, dc_fan_sensor,
+        eth_gpy, gspi, i2c2, i2c3, i2c4, i2c5, nand, rgmii, scpu_ejtag_loc_gpio,
+        sensor_cko_output, spi, test_loop_dis, tp0_loc_rgmii0_tx, tp0_loc_tp0,
+        tp0_loc_tp1, tp1_loc_rgmii0_rx, tp1_loc_tp0, tp1_loc_tp1,
+        usb_clock_output, hif_loc_misc, hif_loc_nf, scpu_ejtag_loc_cr, ao,
+        dmic, spdif_out, avcpu_ej, emmc, hif, nand, p2s, pcie, pll_test,
+        scpu_ejtag_loc_cr, sd_card, sdio_0, sdio_1 ]
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
+      rtk,pdrive:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 0xf
+        description:
+          For nand flash, emmc, sdio, sdmmc and emmc pins, there exists specific
+          driving setup. We can adjust the postive drive or negative drive individually.
+          "rtk,pdrive = <XXXX>" and "rtk,ndrive = <XXXX>" are used to describe the specific
+          driving setup property. XXXX means the value of E5E4E3E2. They are the driving capability
+          of the pins. "rtk,pdrive" use to adjust the positive drive; "rtk,ndrive" use to
+          adjust the negative drive.
+          E2, E3, E4 and E5 have different driving capability. There is also an EN which is always
+          enabled and has basic driving capability. The driving capability of the pin is the sum
+          of En, E2, E3, E4 and E5.
+          The driving capability is corresponded to the driving current. It should be noted that the
+          positive drive and the negative drive with the same driving capability value is corresponded
+          to different driving current.
+          The following is the pad driving mapping table.
+          EN E2 E3 E4 E5      driving_capability    negative_drive(mA)  positive_drive(mA)
+           1                       0.125                  1.3                  1.1
+              1                    0.125                  1.3                  1.1
+                 1                  0.25                  2.6                  2.2
+                    1                0.5                  5.2                  4.4
+                       1             0.5                  5.2                  4.4
+      rtk,ndrive:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 0xf
+        description:
+          It used to setup negative drive of nand flash, emmc, sdio or emmc pins. It has
+          been described in the description of the property "rtk,pdrive" above.
+
+    oneOf:
+      - required:
+        - pins
+      - required:
+        - groups
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    iso_pinctrl: pinctrl@300 {
+        compatible = "realtek,rtd1295-iso-pinctrl";
+        reg = <0x300 0x24>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&etn_led_pins>;
+
+        etn_led_pins: etn-led-pins {
+            function = "etn_led";
+            groups = "etn_led_link", "etn_led_rxtx";
+            bias-pull-up;
+            drive-strength = <4>;
+        };
+    };
+
-- 
2.28.0

