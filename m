Return-Path: <linux-gpio+bounces-33630-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJmlJllCuWnq9wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33630-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:00:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B512A96A2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B80630FBBE7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0453B7B97;
	Tue, 17 Mar 2026 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ggcUxh88"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C13B8BD0;
	Tue, 17 Mar 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748632; cv=none; b=SNTkhQ69E1QRYGs0xAY9U0bIpBJrYZjS454gDvT0viPtyKWQUqmcscLq2WIEePy7zDCYphJM6VraZ7q5k/cdqV/P+dq/NYAqRG7oeCJrgY9g2ZAMEXNmDiO396UgzWZr/hH2ZIthZ+QIWhr9Er5WNRtnFY4QJe+QK0MJ2dCqfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748632; c=relaxed/simple;
	bh=XfoMroQ0TIhK0DXGBQbwrFySoZu8MK1ppddQRxnCZmo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTEIXNDujJiiIjOTBJHaE3B9iBaB6p1C5bex3Yzh0QRedWFtowNSnJ2vvNRK2w1iZ1caQvgdbStnodHQjMuonI8aPZarHjc1mUSzrY6F7eD5L2FmCjMax1LVucxdjKBMZOCeYMqE6iGlottKRbfhzpF6ig+lJkqtXdwdBsdN9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ggcUxh88; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsCNu93851630, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748452; bh=bCM9T1PPAhP08u7Sn7E1Ji+w1HYBZ9W0+ZPvZ8vTV0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ggcUxh88etXbioiEzFKGYcJ2PxvysnY4d8SZr8g1PUJ6tc648E9kSTToM83MfaTQJ
	 kHiciXx6nQIgwh8CpH/qEktP8qeQDPlZvtQLtJcYpdhcrhynckH1ZnXakJydQd8Z+F
	 F2B+aet+AbXLu5gCi/m/VHn2Z6Uba9Z6bEiWmQZomP/HgyGBxBbDJ/vlRKvC9chVCD
	 Gt+RYiADJf8yv7B+CsJlGdurKGzS7NFGEHj3amDFMM5zgL8gqqGZrCwZ4b8HTtlFIc
	 JYwf9BmgUl0arFo3om/7FZNkf+1g2Ke2TOB8jF9fMDDS+6VEqOpHOEb9Z/wR7k2Cju
	 +r8WsPlKbmg4g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsCNu93851630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:12 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:12 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:12 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 5/8] dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
Date: Tue, 17 Mar 2026 19:54:07 +0800
Message-ID: <20260317115411.2154365-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33630-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,devicetree.org:url,4e000:email,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Queue-Id: 40B512A96A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add device tree bindings for RTD1625.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add Reviewed-by tags from Linus and Conor.
---
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      | 260 ++++++++++++++++++
 1 file changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
new file mode 100644
index 000000000000..9562a043707e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
@@ -0,0 +1,260 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1625-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1625 Pin Controller
+
+maintainers:
+  - Tzuyi Chang <tychang@realtek.com>
+  - Yu-Chun Lin <eleanor.lin@realtek.com>
+
+description:
+  The Realtek DHC RTD1625 is a high-definition media processor SoC. The
+  RTD1625 pin controller is used to control pin function, pull-up/down
+  resistors, drive strength, slew rate, Schmitt trigger, power source
+  (I/O output voltage), input threshold domain selection and a higher-VIL mode.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - realtek,rtd1625-iso-pinctrl
+          - realtek,rtd1625-main2-pinctrl
+          - realtek,rtd1625-isom-pinctrl
+          - realtek,rtd1625-ve4-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    properties:
+      pins:
+        items:
+          enum: [gpio_0, gpio_1, gpio_2, gpio_3, gpio_4, gpio_5, gpio_6,
+                 gpio_7, gpio_8, gpio_9, gpio_10, gpio_11, gpio_12, gpio_13,
+                 gpio_14, gpio_15, gpio_16, gpio_17, gpio_18, gpio_19, gpio_20,
+                 gpio_21, gpio_22, gpio_23, gpio_24, gpio_25, gpio_28, gpio_29,
+                 gpio_30, gpio_31, gpio_32, gpio_33, gpio_34, gpio_35, gpio_40,
+                 gpio_41, gpio_42, gpio_43, gpio_44, gpio_45, gpio_46, gpio_47,
+                 gpio_48, gpio_49, gpio_50, gpio_51, gpio_52, gpio_53, gpio_54,
+                 gpio_55, gpio_56, gpio_57, gpio_58, gpio_59, gpio_60, gpio_61,
+                 gpio_62, gpio_63, gpio_64, gpio_65, gpio_66, gpio_67, gpio_80,
+                 gpio_81, gpio_82, gpio_83, gpio_84, gpio_85, gpio_86, gpio_87,
+                 gpio_88, gpio_89, gpio_90, gpio_91, gpio_92, gpio_93, gpio_94,
+                 gpio_95, gpio_96, gpio_97, gpio_98, gpio_99, gpio_100,
+                 gpio_101, gpio_102, gpio_103, gpio_104, gpio_105, gpio_106,
+                 gpio_107, gpio_108, gpio_109, gpio_110, gpio_111, gpio_112,
+                 gpio_128, gpio_129, gpio_130, gpio_131, gpio_132, gpio_133,
+                 gpio_134, gpio_135, gpio_136, gpio_137, gpio_138, gpio_139,
+                 gpio_140, gpio_141, gpio_142, gpio_143, gpio_144, gpio_145,
+                 gpio_146, gpio_147, gpio_148, gpio_149, gpio_150, gpio_151,
+                 gpio_152, gpio_153, gpio_154, gpio_155, gpio_156, gpio_157,
+                 gpio_158, gpio_159, gpio_160, gpio_161, gpio_162, gpio_163,
+                 gpio_164, gpio_165, ai_i2s1_loc, ao_i2s1_loc, arm_trace_dbg_en,
+                 csi_vdsel, ejtag_acpu_loc, ejtag_aucpu0_loc, ejtag_aucpu1_loc,
+                 ejtag_pcpu_loc, ejtag_scpu_loc, ejtag_ve2_loc, emmc_clk,
+                 emmc_cmd, emmc_data_0, emmc_data_1, emmc_data_2, emmc_data_3,
+                 emmc_data_4, emmc_data_5, emmc_data_6, emmc_data_7,
+                 emmc_dd_sb, emmc_rst_n, etn_phy_loc, hif_clk, hif_data,
+                 hif_en, hif_rdy, hi_width, i2c6_loc, ir_rx_loc, rgmii_vdsel,
+                 sf_en, spdif_in_mode, spdif_loc, uart0_loc, usb_cc1, usb_cc2,
+                 ve4_uart_loc]
+
+      function:
+        enum: [gpio, ai_i2s0, ai_i2s2, ai_tdm0, ai_tdm1, ai_tdm2, ao_i2s0,
+               ao_i2s2, ao_tdm0, ao_tdm1, ao_tdm2, csi0, csi1, csi_1v2, csi_1v8,
+               csi_2v5, csi_3v3, dmic0, dmic1, dmic2, dptx_hpd, edptx_hdp, emmc,
+               gspi0, gspi1, gspi2, hi_width_1bit, hi_width_disable, i2c0, i2c1,
+               i2c3, i2c4, i2c5, i2c7, iso_tristate, pcie0, pcie1, pcm, pctrl,
+               pwm4, pwm5, pwm6, rgmii, rgmii_1v2, rgmii_1v8, rgmii_2v5,
+               rgmii_3v3, rmii, sd, sdio, sf_disable, sf_enable,
+               spdif_in_coaxial, spdif_in_gpio, spdif_out, spi, ts0, ts1, uart1,
+               uart2, uart3, uart4, uart5, uart6, uart7, uart8, uart9, uart10,
+               usb_cc1, usb_cc2, vi0_dtv, vi1_dtv, vtc_ao_i2s, vtc_dmic,
+               vtc_i2s, ai_i2s1_loc0, ai_i2s1_loc1, ao_i2s0_loc0, ao_i2s0_loc1,
+               ao_i2s1_loc0, ao_i2s1_loc1, ao_tdm1_loc0, ao_tdm1_loc1,
+               etn_led_loc0, etn_led_loc1, etn_phy_loc0, etn_phy_loc1,
+               i2c6_loc0, i2c6_loc1, ir_rx_loc0, ir_rx_loc1, pwm0_loc0,
+               pwm0_loc1, pwm0_loc2, pwm0_loc3, pwm1_loc0, pwm1_loc1, pwm2_loc0,
+               pwm2_loc1, pwm3_loc0, pwm3_loc1, spdif_loc0, spdif_loc1,
+               uart0_loc0, uart0_loc1, ve4_uart_loc0, ve4_uart_loc1,
+               ve4_uart_loc2, acpu_ejtag_loc0, acpu_ejtag_loc1, acpu_ejtag_loc2,
+               aucpu0_ejtag_loc0, aucpu0_ejtag_loc1, aucpu0_ejtag_loc2,
+               aucpu1_ejtag_loc0, aucpu1_ejtag_loc1, aucpu1_ejtag_loc2,
+               aupu0_ejtag_loc1, aupu1_ejtag_loc1, gpu_ejtag_loc0,
+               pcpu_ejtag_loc0, pcpu_ejtag_loc1, pcpu_ejtag_loc2,
+               scpu_ejtag_loc0, scpu_ejtag_loc1, scpu_ejtag_loc2,
+               ve2_ejtag_loc0, ve2_ejtag_loc1, ve2_ejtag_loc2, pll_test_loc0,
+               pll_test_loc1, dbg_out1, isom_dbg_out, arm_trace_debug_disable,
+               arm_trace_debug_enable]
+
+      drive-strength:
+        enum: [4, 8]
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      input-schmitt-enable: true
+
+      input-schmitt-disable: true
+
+      input-voltage-microvolt:
+        description: |
+          Select the input receiver voltage domain for the pin.
+          Valid arguments are:
+          - 1800000: 1.8V input logic level
+          - 3300000: 3.3V input logic level
+        enum: [1800000, 3300000]
+
+      drive-push-pull: true
+
+      power-source:
+        description: |
+          Valid arguments are described as below:
+          0: power supply of 1.8V
+          1: power supply of 3.3V
+        enum: [0, 1]
+
+      slew-rate:
+        description: |
+          Valid arguments are described as below:
+            1: ~1ns falling time
+            10: ~10ns falling time
+            20: ~20ns falling time
+            30: ~30ns falling time
+        enum: [1, 10, 20, 30]
+
+      realtek,drive-strength-p:
+        description: |
+          Some of pins can be driven using the P-MOS and N-MOS transistor to
+          achieve finer adjustments. The block-diagram representation is as
+          follows:
+                         VDD
+                          |
+                      ||--+
+               +-----o||     P-MOS-FET
+               |      ||--+
+          IN --+          +----- out
+               |      ||--+
+               +------||     N-MOS-FET
+                      ||--+
+                          |
+                         GND
+          The driving strength of the P-MOS/N-MOS transistors impacts the
+          waveform's rise/fall times. Greater driving strength results in
+          shorter rise/fall times. Each P-MOS and N-MOS transistor offers
+          8 configurable levels (0 to 7), with higher values indicating
+          greater driving strength, contributing to achieving the desired
+          speed.
+
+          The realtek,drive-strength-p is used to control the driving strength
+          of the P-MOS output.
+
+          This value is not a simple count of transistors. Instead, it
+          represents a weighted configuration. There is a base driving
+          capability (even at value 0), and each bit adds a different weight to
+          the total strength. The resulting current is non-linear and varies
+          significantly based on the IO voltage (1.8V vs 3.3V) and the specific
+          pad group.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 7
+
+      realtek,drive-strength-n:
+        description: |
+          Similar to the realtek,drive-strength-p, the realtek,drive-strength-n
+          is used to control the driving strength of the N-MOS output.
+
+          This property uses the same weighted configuration logic where values
+          0-7 represent non-linear strength adjustments rather than a transistor
+          count.
+
+          Higher values indicate greater driving strength, resulting in shorter
+          fall times.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 7
+
+      realtek,duty-cycle:
+        description: |
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
+
+          Valid arguments are described as below:
+          0: 0ns
+          2: + 0.25ns
+          3: + 0.5ns
+          4: -0.25ns
+          5: -0.5ns
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 2, 3, 4, 5]
+
+      realtek,high-vil-microvolt:
+        description: |
+          The threshold value for the input receiver's LOW recognition (VIL).
+
+          This property is used to address specific HDMI I2C compatibility
+          issues where some sinks (TVs) have weak pull-down capabilities and
+          fail to pull the bus voltage below the standard VIL threshold
+          (~0.7V).
+
+          Setting this property to 1100000 (1.1V) enables a specialized input
+          receiver mode that raises the effective VIL threshold to improve
+          detection.
+        enum: [1100000]
+
+    required:
+      - pins
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
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1625-iso-pinctrl";
+        reg = <0x4e000 0x130>;
+
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <2>;
+            realtek,drive-strength-n = <2>;
+        };
+
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
-- 
2.34.1


