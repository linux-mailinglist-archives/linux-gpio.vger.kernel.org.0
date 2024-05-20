Return-Path: <linux-gpio+bounces-6473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4AF8C9F3F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 17:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CF4281346
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 15:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE82136E2A;
	Mon, 20 May 2024 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Uqi/sBdJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43613698F
	for <linux-gpio@vger.kernel.org>; Mon, 20 May 2024 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217475; cv=none; b=S/XSwCw5GfDUDOHqcF6X6gxjXLuxK5NLmvY32gsYECbHTj422lb9Muym82J+QixNc4Kb2xV9DVyF9VHUHFwV9VqHKQQmTtswvhrDnQdDm/kDvPfFPSCYd5AD951Lc+GYEMMM9Xh/W8lJ7lS6DTGaermdpHuWzISGus4QMe9gim4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217475; c=relaxed/simple;
	bh=QKBM7a35A0yfq/FhMFgLRJzmYDSpklTPhXpr/KX8SVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L/irlcSLuC6VmyMnHNwwl1OZ9xGo0xwf4FUpJyL2hXzH6EFGUJxU9iRXrjY2cADvoOq6gZ4Uyenx3Zro/CrWrUFC39gW8lUB3F7dJGCL6FtZ/anZ5mTV4YNiFWOckznAKasgbebDZYuiQhtJ6uL8XzDjsQwtaChuACm4/D+YLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Uqi/sBdJ; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linus.walleij@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716217471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRhCmPGTef9VfNsrqBF1ByGyOi11Xyt5DUS8PGobBn0=;
	b=Uqi/sBdJyo2PyfeULU4+Tsz677JUKDmpLv1/1qJJfrXM9vZeRYaTD3wXeVBqMUH6bQO4BJ
	Ug7R+S1RbVog2lK5jJg80pGuxQjt0gXuego4jcD8IuFUFkikQIJc1Z5i8hj47yEyIj5d7w
	0tk/fLAxwUibWCYVrhlSDEgazs5Yp0s=
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: sai.krishna.potthuri@amd.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: andy.shevchenko@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: sean.anderson@linux.dev
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org
Cc: Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: xilinx: Add support for function with pins
Date: Mon, 20 May 2024 11:04:23 -0400
Message-Id: <20240520150424.2531458-2-sean.anderson@linux.dev>
In-Reply-To: <20240520150424.2531458-1-sean.anderson@linux.dev>
References: <20240520150424.2531458-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Support specifying the function per-pin. The driver doesn't care
whethern you use pins or groups for this purpose.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 344 +++++++++---------
 1 file changed, 176 insertions(+), 168 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index f13d315b5d5e..d3b258245e28 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -42,179 +42,187 @@ patternProperties:
         $ref: pinmux-node.yaml#
 
         properties:
+          pins:
+            description:
+              List of pins to select (either this or "groups" must be specified)
+            items:
+              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+
           groups:
             description:
               List of groups to select (either this or "pins" must be
               specified), available groups for this subnode.
             items:
-              enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
-                     ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
-                     gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
-                     mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
-                     qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
-                     spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
-                     spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
-                     spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
-                     spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
-                     spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
-                     spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
-                     spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
-                     spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
-                     spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
-                     spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
-                     spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
-                     spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
-                     spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
-                     spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
-                     spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
-                     spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
-                     sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
-                     sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
-                     sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
-                     sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
-                     sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
-                     sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
-                     sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
-                     sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
-                     sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
-                     sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
-                     sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
-                     sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
-                     sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
-                     sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
-                     sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
-                     sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
-                     sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
-                     sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
-                     sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
-                     sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
-                     sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
-                     sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
-                     nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
-                     nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
-                     can0_1_grp, can0_2_grp, can0_3_grp,
-                     can0_4_grp, can0_5_grp, can0_6_grp,
-                     can0_7_grp, can0_8_grp, can0_9_grp,
-                     can0_10_grp, can0_11_grp, can0_12_grp,
-                     can0_13_grp, can0_14_grp, can0_15_grp,
-                     can0_16_grp, can0_17_grp, can0_18_grp,
-                     can1_0_grp, can1_1_grp, can1_2_grp,
-                     can1_3_grp, can1_4_grp, can1_5_grp,
-                     can1_6_grp, can1_7_grp, can1_8_grp,
-                     can1_9_grp, can1_10_grp, can1_11_grp,
-                     can1_12_grp, can1_13_grp, can1_14_grp,
-                     can1_15_grp, can1_16_grp, can1_17_grp,
-                     can1_18_grp, can1_19_grp, uart0_0_grp,
-                     uart0_1_grp, uart0_2_grp, uart0_3_grp,
-                     uart0_4_grp, uart0_5_grp, uart0_6_grp,
-                     uart0_7_grp, uart0_8_grp, uart0_9_grp,
-                     uart0_10_grp, uart0_11_grp, uart0_12_grp,
-                     uart0_13_grp, uart0_14_grp, uart0_15_grp,
-                     uart0_16_grp, uart0_17_grp, uart0_18_grp,
-                     uart1_0_grp, uart1_1_grp, uart1_2_grp,
-                     uart1_3_grp, uart1_4_grp, uart1_5_grp,
-                     uart1_6_grp, uart1_7_grp, uart1_8_grp,
-                     uart1_9_grp, uart1_10_grp, uart1_11_grp,
-                     uart1_12_grp, uart1_13_grp, uart1_14_grp,
-                     uart1_15_grp, uart1_16_grp, uart1_17_grp,
-                     uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
-                     i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
-                     i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
-                     i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
-                     i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
-                     i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
-                     i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
-                     i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
-                     i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
-                     i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
-                     i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
-                     i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
-                     i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
-                     i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
-                     ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
-                     ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
-                     ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
-                     ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
-                     ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
-                     ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
-                     ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
-                     ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
-                     ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
-                     ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
-                     ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
-                     ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
-                     ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
-                     ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
-                     ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
-                     ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
-                     ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
-                     ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
-                     ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
-                     ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
-                     ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
-                     ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
-                     ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
-                     ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
-                     swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
-                     swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
-                     swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
-                     swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
-                     swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
-                     swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
-                     swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
-                     swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
-                     swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
-                     swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
-                     swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
-                     swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
-                     swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
-                     swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
-                     swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
-                     swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
-                     swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
-                     gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
-                     gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
-                     gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
-                     gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
-                     gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
-                     gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
-                     gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
-                     gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
-                     gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
-                     gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
-                     gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
-                     gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
-                     gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
-                     gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
-                     gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
-                     gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
-                     gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
-                     gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
-                     gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
-                     gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
-                     gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
-                     gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
-                     gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
-                     gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
-                     gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
-                     gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
-                     usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
-                     pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
-                     pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
-                     pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
-                     pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
-                     pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
-                     pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
-                     csu0_0_grp, csu0_1_grp, csu0_2_grp,
-                     csu0_3_grp, csu0_4_grp, csu0_5_grp,
-                     csu0_6_grp, csu0_7_grp, csu0_8_grp,
-                     csu0_9_grp, csu0_10_grp, csu0_11_grp,
-                     dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
-                     dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
-                     pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
-                     pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
-                     trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
-                     trace0_clk_2_grp, testscan0_0_grp]
+              anyOf:
+                - pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+                - enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
+                         ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
+                         gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
+                         mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
+                         qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
+                         spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
+                         spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
+                         spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
+                         spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
+                         spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
+                         spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
+                         spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
+                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
+                         spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                         spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
+                         spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
+                         spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
+                         spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
+                         spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
+                         spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
+                         spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
+                         sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
+                         sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
+                         sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
+                         sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
+                         sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
+                         sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
+                         sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
+                         sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
+                         sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
+                         sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
+                         sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
+                         sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
+                         sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
+                         sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
+                         sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
+                         sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
+                         sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
+                         sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
+                         sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
+                         sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
+                         sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
+                         sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
+                         nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
+                         nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
+                         can0_1_grp, can0_2_grp, can0_3_grp,
+                         can0_4_grp, can0_5_grp, can0_6_grp,
+                         can0_7_grp, can0_8_grp, can0_9_grp,
+                         can0_10_grp, can0_11_grp, can0_12_grp,
+                         can0_13_grp, can0_14_grp, can0_15_grp,
+                         can0_16_grp, can0_17_grp, can0_18_grp,
+                         can1_0_grp, can1_1_grp, can1_2_grp,
+                         can1_3_grp, can1_4_grp, can1_5_grp,
+                         can1_6_grp, can1_7_grp, can1_8_grp,
+                         can1_9_grp, can1_10_grp, can1_11_grp,
+                         can1_12_grp, can1_13_grp, can1_14_grp,
+                         can1_15_grp, can1_16_grp, can1_17_grp,
+                         can1_18_grp, can1_19_grp, uart0_0_grp,
+                         uart0_1_grp, uart0_2_grp, uart0_3_grp,
+                         uart0_4_grp, uart0_5_grp, uart0_6_grp,
+                         uart0_7_grp, uart0_8_grp, uart0_9_grp,
+                         uart0_10_grp, uart0_11_grp, uart0_12_grp,
+                         uart0_13_grp, uart0_14_grp, uart0_15_grp,
+                         uart0_16_grp, uart0_17_grp, uart0_18_grp,
+                         uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                         uart1_3_grp, uart1_4_grp, uart1_5_grp,
+                         uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                         uart1_9_grp, uart1_10_grp, uart1_11_grp,
+                         uart1_12_grp, uart1_13_grp, uart1_14_grp,
+                         uart1_15_grp, uart1_16_grp, uart1_17_grp,
+                         uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
+                         i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
+                         i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
+                         i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
+                         i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
+                         i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
+                         i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
+                         i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
+                         i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
+                         i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
+                         i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
+                         ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
+                         ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
+                         ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
+                         ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
+                         ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
+                         ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
+                         ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
+                         ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
+                         ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
+                         ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
+                         ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
+                         ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
+                         ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
+                         ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
+                         ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
+                         ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
+                         ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
+                         ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
+                         ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
+                         ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
+                         ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
+                         ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
+                         ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
+                         ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
+                         swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
+                         swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
+                         swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
+                         swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
+                         swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
+                         swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
+                         swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
+                         swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
+                         swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
+                         swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
+                         swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
+                         swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
+                         swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
+                         swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
+                         swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
+                         swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
+                         swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
+                         gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
+                         gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
+                         gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
+                         gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
+                         gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
+                         gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                         gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
+                         gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
+                         gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
+                         gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
+                         gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
+                         gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
+                         gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
+                         gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
+                         gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
+                         gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
+                         gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
+                         gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
+                         gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
+                         gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
+                         gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
+                         gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
+                         gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
+                         gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
+                         usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
+                         pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
+                         pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
+                         pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
+                         pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
+                         pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
+                         pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
+                         csu0_0_grp, csu0_1_grp, csu0_2_grp,
+                         csu0_3_grp, csu0_4_grp, csu0_5_grp,
+                         csu0_6_grp, csu0_7_grp, csu0_8_grp,
+                         csu0_9_grp, csu0_10_grp, csu0_11_grp,
+                         dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
+                         dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
+                         pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
+                         pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
+                         trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
+                         trace0_clk_2_grp, testscan0_0_grp]
             maxItems: 78
 
           function:
-- 
2.35.1.1320.gc452695387.dirty


