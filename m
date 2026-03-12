Return-Path: <linux-gpio+bounces-33244-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPdsDfOlsmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33244-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:39:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B62711C8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8CE63181DD0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11DB3B776E;
	Thu, 12 Mar 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XcrK/Tym"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F2399016;
	Thu, 12 Mar 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315218; cv=none; b=qm36nShuSwTJco6mm/ya2loqaQvROPtbMIoS0i975b5MWFxR8gl6MdL5MmR17nA1R8nuF/YjvLbOJ6KJQRcBWErxql0infsz5rvGdtNtytk0tAyH7IaC4FM1fOvvqj+eKqYhazXpIpC2jHggle9Z50F/jU5bW4wtz39mbhG44As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315218; c=relaxed/simple;
	bh=ub0sgKDMOFndYL+2W/y1qFp2zRNLHYJbiUwh65mKNYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLJg/YiSOFpmU2wMXdHwkSC0b6O+iLGfAHte61us8oZhtY2g3CJiMKIAqY14EayEvlT5sytdTB5dFueWhx98RQBZK2dcc/8iV2pT43X3Xr1WcEVmKqS7AT4eOJvKiqbMABefRycuTfAUf59CjHrpl8ddYBsqHBZYu7Oui0dQucY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XcrK/Tym; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUf7D22456777, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=VOg0kg9B4oX7eNFY7+A1Vyl/cekXuCfFTruiO1KPDpo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=XcrK/Tymdh0bgKgiyMxmktlKxtNBkJK0FckaCBuzSu2izCcty2jd2Y/MbTkDcVOTW
	 9mwPc8aoofFzWUnxJ08UZ3SDN8noJIJMj88pVAbCnoNqhquevfF2tI8/YRuRjq2V08
	 rtPBqVxZb7OwblleUAj3cJ7Wgx8ouM9o9Q5E1GgrjODopMkVDBCUOcQu7ETpH7ULXN
	 A+5N7jJ/rt+BlRJ7wpS+eRF8CcSfIQM7Vw5uafCjCj1z1Z68Juim9V3IGSOEHQ9Edc
	 fexsjm9S0MNDKN2NiP5hdOctKHt06G58mNFqb7MdUjVq+jrYwKzRNaAm3NxydCwhK/
	 mq6+QDB6AuvRw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUf7D22456777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:41 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 4/7] dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
Date: Thu, 12 Mar 2026 19:30:37 +0800
Message-ID: <20260312113040.68189-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33244-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4e000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 8B6B62711C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add device tree bindings for RTD1625.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Changed slew-rate to use valid numbers.
- Revert realtek,pulse-width-adjust to realtek,duty-cycle.
- Fixed example values from hexadecimal to decimal format.
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


