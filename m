Return-Path: <linux-gpio+bounces-25179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86552B3B457
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 09:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A17AB1619F5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 07:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165192727EB;
	Fri, 29 Aug 2025 07:30:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C82701BD;
	Fri, 29 Aug 2025 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756452649; cv=none; b=donOD0k7kX5fMO4u3E/uciSuiNo1soiq3uroW0V7Xd9CtLButt2hJXwp6Ce758Y/Leehos3a0qhPnvnNzfptvGNxdETZSjTRmWe7me+ym+wyZh6X+SdatapUaPSWPzMNktta9PbjHag7WHkSoVyRusB14xQgmru4Hpc7qsj1L1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756452649; c=relaxed/simple;
	bh=b3vguPxCKF9wzhsaJi8JlJGc2hIegQHZDjQYC9STc3E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XobH8RdjTRv7eW//RvIqAcG41CFjsKztJyBgjRz3QecbY0KKv7VBW21eAXbltM2Wy+fteR0zwWmFUjdzxgpCfw9Wwm3PjmDDICS9jSY7Mtm6SOUQpdnWoI4O2L1a989FniY1eHqdb1C3LIHN3Kk83+q8zLYXJ4Ll0kEG85JmLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 29 Aug
 2025 15:30:31 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 29 Aug 2025 15:30:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v1 4/4] arm64: dts: add AST27xx pinctrl configuration nodes
Date: Fri, 29 Aug 2025 15:30:30 +0800
Message-ID: <20250829073030.2749482-5-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add pinctrl0 and pinctrl1 nodes for AST27xx SoC0 and SoC1 to configure
the pinmux settings for each ball.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++++++++++
 1 file changed, 1359 insertions(+)
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
new file mode 100644
index 000000000000..2167db85839d
--- /dev/null
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
@@ -0,0 +1,1359 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 ASPEED Corp.
+
+&pinctrl0 {
+	pinctrl_emmc_default: emmc-default {
+		function = "EMMC";
+		groups = "EMMCG1";
+	};
+
+	pinctrl_emmcg4_default: emmc-default {
+		function = "EMMC";
+		groups = "EMMCG4";
+	};
+
+	pinctrl_emmcg8_default: emmcg8-default {
+		function = "EMMC";
+		groups = "EMMCG8";
+	};
+
+	pinctrl_emmcwpn_default: emmcwpn-default {
+		function = "EMMC";
+		groups = "EMMCWPN";
+	};
+
+	pinctrl_emmccdn_default: emmccdn-default {
+		function = "EMMC";
+		groups = "EMMCCDN";
+	};
+
+	pinctrl_vgaddc_default: vgaddc-default {
+		function = "VGADDC";
+		groups = "VGADDC";
+	};
+
+	pinctrl_usb3axhd_default: usb3axhd-default {
+		function = "USB3A";
+		groups = "USB3AXHD";
+	};
+
+	pinctrl_usb3axhpd_default: usb3axhpd-default {
+		function = "USB3A";
+		groups = "USB3AXHPD";
+	};
+
+	pinctrl_usb3axh_default: usb3axh-default {
+		function = "USB3A";
+		groups = "USB3AXH";
+	};
+
+	pinctrl_usb3axhp_default: usb3axhp-default {
+		function = "USB3A";
+		groups = "USB3AXHP";
+	};
+
+	pinctrl_usb3axh2b_default: usb3axh2b-default {
+		function = "USB3A";
+		groups = "USB3AXH2B";
+	};
+
+	pinctrl_usb3axhp2b_default: usb3axhp2b-default {
+		function = "USB3A";
+		groups = "USB3AXHP2B";
+	};
+
+	pinctrl_usb2axhd1_default: usb2axhd1-default {
+		function = "USB2A";
+		groups = "USB2AXHD1";
+	};
+
+	pinctrl_usb2axhpd1_default: usb2axhpd1-default {
+		function = "USB2A";
+		groups = "USB2AXHPD1";
+	};
+
+	pinctrl_usb2ad1_default: usb2ad1-default {
+		function = "USB2A";
+		groups = "USB2AD1";
+	};
+
+	pinctrl_usb2axh_default: usb2axh-default {
+		function = "USB2A";
+		groups = "USB2AXH";
+	};
+
+	pinctrl_usb2axhp_default: usb2axhp-default {
+		function = "USB2A";
+		groups = "USB2AXHP";
+	};
+
+	pinctrl_usb2axh2b_default: usb2axh2b-default {
+		function = "USB2A";
+		groups = "USB2AXH2B";
+	};
+
+	pinctrl_usb2axhp2b_default: usb2axhp2b-default {
+		function = "USB2A";
+		groups = "USB2AXHP2B";
+	};
+
+	pinctrl_usb2ahpd0_default: usb2ahpd0-default {
+		function = "USB2A";
+		groups = "USB2AHPD0";
+	};
+
+	pinctrl_usb2ad0_default: usb2ad0-default {
+		function = "USB2A";
+		groups = "USB2AD0";
+	};
+
+	pinctrl_usb2ah_default: usb2ah-default {
+		function = "USB2A";
+		groups = "USB2AH";
+	};
+
+	pinctrl_usb2ahp_default: usb2ahp-default {
+		function = "USB2A";
+		groups = "USB2AHP";
+	};
+
+	pinctrl_usb3bxhd_default: usb3bxhd-default {
+		function = "USB3B";
+		groups = "USB3BXHD";
+	};
+
+	pinctrl_usb3bxhpd_default: usb3bxhpd-default {
+		function = "USB3B";
+		groups = "USB3BXHPD";
+	};
+
+	pinctrl_usb3bxh_default: usb3bxh-default {
+		function = "USB3B";
+		groups = "USB3BXH";
+	};
+
+	pinctrl_usb3bxhp_default: usb3bxhp-default {
+		function = "USB3B";
+		groups = "USB3BXHP";
+	};
+
+	pinctrl_usb3bxh2a_default: usb3bxh2a-default {
+		function = "USB3B";
+		groups = "USB3BXH2A";
+	};
+
+	pinctrl_usb3bxhp2a_default: usb3bxhp2a-default {
+		function = "USB3B";
+		groups = "USB3BXHP2A";
+	};
+
+	pinctrl_usb2bxhd1_default: usb2bxhd1-default {
+		function = "USB2B";
+		groups = "USB2BXHD1";
+	};
+
+	pinctrl_usb2bxhpd1_default: usb2bxhpd1-default {
+		function = "USB2B";
+		groups = "USB2BXHPD1";
+	};
+
+	pinctrl_usb2bd1_default: usb2bd1-default {
+		function = "USB2B";
+		groups = "USB2BD1";
+	};
+
+	pinctrl_usb2bxh_default: usb2bxh-default {
+		function = "USB2B";
+		groups = "USB2BXH";
+	};
+
+	pinctrl_usb2bxhp_default: usb2bxhp-default {
+		function = "USB2B";
+		groups = "USB2BXHP";
+	};
+
+	pinctrl_usb2bxh2a_default: usb2bxh2a-default {
+		function = "USB2B";
+		groups = "USB2BXH2A";
+	};
+
+	pinctrl_usb2bxhp2a_default: usb2bxhp2a-default {
+		function = "USB2B";
+		groups = "USB2BXHP2A";
+	};
+
+	pinctrl_usb2bhpd0_default: usb2bhpd0-default {
+		function = "USB2B";
+		groups = "USB2BHPD0";
+	};
+
+	pinctrl_usb2bd0_default: usb2bd0-default {
+		function = "USB2B";
+		groups = "USB2BD0";
+	};
+
+	pinctrl_usb2bh_default: usb2bh-default {
+		function = "USB2B";
+		groups = "USB2BH";
+	};
+
+	pinctrl_usb2bhp_default: usb2bhp-default {
+		function = "USB2B";
+		groups = "USB2BHP";
+	};
+
+	pinctrl_jtagm0_default: jtagm0-default {
+		function = "JTAG0";
+		groups = "JTAGM0";
+	};
+
+	pinctrl_jtag_psp_default: jtag-psp-default {
+		function = "JTAG0";
+		groups = "PSP";
+	};
+
+	pinctrl_jtag_ssp_default: jtag-ssp-default {
+		function = "JTAG0";
+		groups = "SSP";
+	};
+
+	pinctrl_jtag_tsp_default: jtag-tsp-default {
+		function = "JTAG0";
+		groups = "TSP";
+	};
+
+	pinctrl_jtag_ddr_default: jtag-ddr-default {
+		function = "JTAG0";
+		groups = "DDR";
+	};
+
+	pinctrl_jtag_usb3a_default: jtag-usb3a-default {
+		function = "JTAG0";
+		groups = "USB3A";
+	};
+
+	pinctrl_jtag_usb3b_default: jtag-usb3b-default {
+		function = "JTAG0";
+		groups = "USB3B";
+	};
+
+	pinctrl_jtag_pciea_default: jtag-pciea-default {
+		function = "JTAG0";
+		groups = "PCIEA";
+	};
+
+	pinctrl_jtag_pcieb_default: jtag-pcieb-default {
+		function = "JTAG0";
+		groups = "PCIEB";
+	};
+
+	pinctrl_pcierc0_perst_default: pcierc0-perst-default {
+		function = "PCIERC";
+		groups = "PCIERC0PERST";
+	};
+
+	pinctrl_pcierc1_perst_default: pcierc1-perst-default {
+		function = "PCIERC";
+		groups = "PCIERC1PERST";
+	};
+};
+
+&pinctrl1 {
+	pinctrl_sgpm0_default: sgpm0-default {
+		function = "SGPM0";
+		groups = "SGPM0";
+	};
+
+	pinctrl_sgpm1_default: sgpm1-default {
+		function = "SGPM1";
+		groups = "SGPM1";
+	};
+
+	pinctrl_sgps_default: sgps-default {
+		function = "SGPS";
+		groups = "SGPS";
+	};
+
+	pinctrl_adc0_default: adc0-default {
+		function = "ADC0";
+		groups = "ADC0";
+	};
+
+	pinctrl_adc1_default: adc1-default {
+		function = "ADC1";
+		groups = "ADC1";
+	};
+
+	pinctrl_adc2_default: adc2-default {
+		function = "ADC2";
+		groups = "ADC2";
+	};
+
+	pinctrl_adc3_default: adc3-default {
+		function = "ADC3";
+		groups = "ADC3";
+	};
+
+	pinctrl_adc4_default: adc4-default {
+		function = "ADC4";
+		groups = "ADC4";
+	};
+
+	pinctrl_adc5_default: adc5-default {
+		function = "ADC5";
+		groups = "ADC5";
+	};
+
+	pinctrl_adc6_default: adc6-default {
+		function = "ADC6";
+		groups = "ADC6";
+	};
+
+	pinctrl_adc7_default: adc7-default {
+		function = "ADC7";
+		groups = "ADC7";
+	};
+
+	pinctrl_adc8_default: adc8-default {
+		function = "ADC8";
+		groups = "ADC8";
+	};
+
+	pinctrl_adc9_default: adc9-default {
+		function = "ADC9";
+		groups = "ADC9";
+	};
+
+	pinctrl_adc10_default: adc10-default {
+		function = "ADC10";
+		groups = "ADC10";
+	};
+
+	pinctrl_adc11_default: adc11-default {
+		function = "ADC11";
+		groups = "ADC11";
+	};
+
+	pinctrl_adc12_default: adc12-default {
+		function = "ADC12";
+		groups = "ADC12";
+	};
+
+	pinctrl_adc13_default: adc13-default {
+		function = "ADC13";
+		groups = "ADC13";
+	};
+
+	pinctrl_adc14_default: adc14-default {
+		function = "ADC14";
+		groups = "ADC14";
+	};
+
+	pinctrl_adc15_default: adc15-default {
+		function = "ADC15";
+		groups = "ADC15";
+	};
+
+	pinctrl_pwm0_default: pwm0-default {
+		function = "PWM0";
+		groups = "PWM0";
+	};
+
+	pinctrl_pwm1_default: pwm1-default {
+		function = "PWM1";
+		groups = "PWM1";
+	};
+
+	pinctrl_pwm2_default: pwm2-default {
+		function = "PWM2";
+		groups = "PWM2";
+	};
+
+	pinctrl_pwm3_default: pwm3-default {
+		function = "PWM3";
+		groups = "PWM3";
+	};
+
+	pinctrl_pwm4_default: pwm4-default {
+		function = "PWM4";
+		groups = "PWM4";
+	};
+
+	pinctrl_pwm5_default: pwm5-default {
+		function = "PWM5";
+		groups = "PWM5";
+	};
+
+	pinctrl_pwm6_default: pwm6-default {
+		function = "PWM6";
+		groups = "PWM6";
+	};
+
+	pinctrl_pwm7_default: pwm7-default {
+		function = "PWM7";
+		groups = "PWM7";
+	};
+
+	pinctrl_pwm8_default: pwm8-default {
+		function = "PWM8";
+		groups = "PWM8";
+	};
+
+	pinctrl_pwm9_default: pwm9-default {
+		function = "PWM9";
+		groups = "PWM9";
+	};
+
+	pinctrl_pwm10_default: pwm10-default {
+		function = "PWM10";
+		groups = "PWM10";
+	};
+
+	pinctrl_pwm11_default: pwm11-default {
+		function = "PWM11";
+		groups = "PWM11";
+	};
+
+	pinctrl_pwm12_default: pwm12-default {
+		function = "PWM12";
+		groups = "PWM12";
+	};
+
+	pinctrl_pwm13_default: pwm13-default {
+		function = "PWM13";
+		groups = "PWM13";
+	};
+
+	pinctrl_pwm14_default: pwm14-default {
+		function = "PWM14";
+		groups = "PWM14";
+	};
+
+	pinctrl_pwm15_default: pwm15-default {
+		function = "PWM15";
+		groups = "PWM15";
+	};
+
+	pinctrl_tach0_default: tach0-default {
+		function = "TACH0";
+		groups = "TACH0";
+	};
+
+	pinctrl_tach1_default: tach1-default {
+		function = "TACH1";
+		groups = "TACH1";
+	};
+
+	pinctrl_tach2_default: tach2-default {
+		function = "TACH2";
+		groups = "TACH2";
+	};
+
+	pinctrl_tach3_default: tach3-default {
+		function = "TACH3";
+		groups = "TACH3";
+	};
+
+	pinctrl_tach4_default: tach4-default {
+		function = "TACH4";
+		groups = "TACH4";
+	};
+
+	pinctrl_tach5_default: tach5-default {
+		function = "TACH5";
+		groups = "TACH5";
+	};
+
+	pinctrl_tach6_default: tach6-default {
+		function = "TACH6";
+		groups = "TACH6";
+	};
+
+	pinctrl_tach7_default: tach7-default {
+		function = "TACH7";
+		groups = "TACH7";
+	};
+
+	pinctrl_tach8_default: tach8-default {
+		function = "TACH8";
+		groups = "TACH8";
+	};
+
+	pinctrl_tach9_default: tach9-default {
+		function = "TACH9";
+		groups = "TACH9";
+	};
+
+	pinctrl_tach10_default: tach10-default {
+		function = "TACH10";
+		groups = "TACH10";
+	};
+
+	pinctrl_tach11_default: tach11-default {
+		function = "TACH11";
+		groups = "TACH11";
+	};
+
+	pinctrl_tach12_default: tach12-default {
+		function = "TACH12";
+		groups = "TACH12";
+	};
+
+	pinctrl_tach13_default: tach13-default {
+		function = "TACH13";
+		groups = "TACH13";
+	};
+
+	pinctrl_tach14_default: tach14-default {
+		function = "TACH14";
+		groups = "TACH14";
+	};
+
+	pinctrl_tach15_default: tach15-default {
+		function = "TACH15";
+		groups = "TACH15";
+	};
+
+	pinctrl_jtagm1_default: jtagm1-default {
+		function = "JTAGM1";
+		groups = "JTAGM1";
+	};
+
+	pinctrl_mdio0_default: mdio0-default {
+		function = "MDIO0";
+		groups = "MDIO0";
+	};
+
+	pinctrl_mdio1_default: mdio1-default {
+		function = "MDIO1";
+		groups = "MDIO1";
+	};
+
+	pinctrl_mdio2_default: mdio2-default {
+		function = "MDIO2";
+		groups = "MDIO2";
+	};
+
+	pinctrl_rgmii0_default: rgmii0-default {
+		function = "RGMII0";
+		groups = "RGMII0";
+	};
+
+	pinctrl_rgmii1_default: rgmii1-default {
+		function = "RGMII1";
+		groups = "RGMII1";
+	};
+
+	pinctrl_rmii0_default: rmii0-default {
+		function = "RMII0";
+		groups = "RMII0";
+	};
+
+	pinctrl_rmii0_rclko_default: rmii0-rclko-default {
+		function = "RMII0RCLKO";
+		groups = "RMII0RCLKO";
+	};
+
+	pinctrl_rmii1_default: rmii1-default {
+		function = "RMII1";
+		groups = "RMII1";
+	};
+
+	pinctrl_rmii1_rclko_default: rmii1-rclko-default {
+		function = "RMII1RCLKO";
+		groups = "RMII1RCLKO";
+	};
+
+	pinctrl_sgmii_default: sgmii-default {
+		function = "SGMII";
+		groups = "SGMII";
+	};
+
+	pinctrl_fwspi_quad_default: fwspi-quad-default {
+		function = "FWQSPI";
+		groups = "FWQSPI";
+	};
+
+	pinctrl_fsi0_default: fsi0-default {
+		function = "FSI0";
+		groups = "FSI0";
+	};
+
+	pinctrl_fsi1_default: fsi1-default {
+		function = "FSI1";
+		groups = "FSI1";
+	};
+
+	pinctrl_fsi2_default: fsi2-default {
+		function = "FSI2";
+		groups = "FSI2";
+	};
+
+	pinctrl_fsi3_default: fsi3-default {
+		function = "FSI3";
+		groups = "FSI3";
+	};
+
+	pinctrl_spi0_default: spi0-default {
+		function = "SPI0";
+		groups = "SPI0";
+	};
+
+	pinctrl_spi0_quad_default: spi0-quad-default {
+		function = "QSPI0";
+		groups = "QSPI0";
+	};
+
+	pinctrl_spi0_cs1_default: spi0-cs1-default {
+		function = "SPI0CS1";
+		groups = "SPI0CS1";
+	};
+
+	pinctrl_spi1_default: spi1-default {
+		function = "SPI1";
+		groups = "SPI1";
+	};
+
+	pinctrl_spi1_quad_default: spi1-quad-default {
+		function = "QSPI1";
+		groups = "QSPI1";
+	};
+
+	pinctrl_spi1_cs1_default: spi1-cs1-default {
+		function = "SPI1CS1";
+		groups = "SPI1CS1";
+	};
+
+	pinctrl_spi2_default: spi2-default {
+		function = "SPI2";
+		groups = "SPI2";
+	};
+
+	pinctrl_spi2_quad_default: spi2-quad-default {
+		function = "QSPI2";
+		groups = "QSPI2";
+	};
+
+	pinctrl_spi2_cs1_default: spi2-cs1-default {
+		function = "SPI2CS1";
+		groups = "SPI2CS1";
+	};
+
+	pinctrl_espi0_default: espi0-default {
+		function = "ESPI0";
+		groups = "ESPI0";
+	};
+
+	pinctrl_espi1_default: espi1-default {
+		function = "ESPI1";
+		groups = "ESPI1";
+	};
+
+	pinctrl_lpc0_default: lpc0-default {
+		function = "LPC0";
+		groups = "LPC0";
+	};
+
+	pinctrl_lpc1_default: lpc1-default {
+		function = "LPC1";
+		groups = "LPC1";
+	};
+
+	pinctrl_vpi_default: vpi-default {
+		function = "VPI";
+		groups = "VPI";
+	};
+
+	pinctrl_sd_default: sd-default {
+		function = "SD";
+		groups = "SD";
+	};
+
+	pinctrl_hvi3c0_default: hvi3c0-default {
+		function = "I3C0";
+		groups = "HVI3C0";
+	};
+
+	pinctrl_hvi3c1_default: hvi3c1-default {
+		function = "I3C1";
+		groups = "HVI3C1";
+	};
+
+	pinctrl_hvi3c2_default: hvi3c2-default {
+		function = "I3C2";
+		groups = "HVI3C2";
+	};
+
+	pinctrl_hvi3c3_default: hvi3c3-default {
+		function = "I3C3";
+		groups = "HVI3C3";
+	};
+
+	pinctrl_i3c4_default: i3c4-default {
+		function = "I3C4";
+		groups = "I3C4";
+	};
+
+	pinctrl_i3c5_default: i3c5-default {
+		function = "I3C5";
+		groups = "I3C5";
+	};
+
+	pinctrl_i3c6_default: i3c6-default {
+		function = "I3C6";
+		groups = "I3C6";
+	};
+
+	pinctrl_i3c7_default: i3c7-default {
+		function = "I3C7";
+		groups = "I3C7";
+	};
+
+	pinctrl_i3c8_default: i3c8-default {
+		function = "I3C8";
+		groups = "I3C8";
+	};
+
+	pinctrl_i3c9_default: i3c9-default {
+		function = "I3C9";
+		groups = "I3C9";
+	};
+
+	pinctrl_i3c10_default: i3c10-default {
+		function = "I3C10";
+		groups = "I3C10";
+	};
+
+	pinctrl_i3c11_default: i3c11-default {
+		function = "I3C11";
+		groups = "I3C11";
+	};
+
+	pinctrl_hvi3c12_default: hvi3c12-default {
+		function = "I3C12";
+		groups = "HVI3C12";
+	};
+
+	pinctrl_hvi3c13_default: hvi3c13-default {
+		function = "I3C13";
+		groups = "HVI3C13";
+	};
+
+	pinctrl_hvi3c14_default: hvi3c14-default {
+		function = "I3C14";
+		groups = "HVI3C14";
+	};
+
+	pinctrl_hvi3c15_default: hvi3c15-default {
+		function = "I3C15";
+		groups = "HVI3C15";
+	};
+
+	pinctrl_tach0_default: tach0-default {
+		function = "TACH0";
+		groups = "TACH0";
+	};
+
+	pinctrl_tach1_default: tach1-default {
+		function = "TACH1";
+		groups = "TACH1";
+	};
+
+	pinctrl_tach2_default: tach2-default {
+		function = "TACH2";
+		groups = "TACH2";
+	};
+
+	pinctrl_tach3_default: tach3-default {
+		function = "TACH3";
+		groups = "TACH3";
+	};
+
+	pinctrl_tach4_default: tach4-default {
+		function = "TACH4";
+		groups = "TACH4";
+	};
+
+	pinctrl_tach5_default: tach5-default {
+		function = "TACH5";
+		groups = "TACH5";
+	};
+
+	pinctrl_tach6_default: tach6-default {
+		function = "TACH6";
+		groups = "TACH6";
+	};
+
+	pinctrl_tach7_default: tach7-default {
+		function = "TACH7";
+		groups = "TACH7";
+	};
+
+	pinctrl_tach8_default: tach8-default {
+		function = "TACH8";
+		groups = "TACH8";
+	};
+
+	pinctrl_tach9_default: tach9-default {
+		function = "TACH9";
+		groups = "TACH9";
+	};
+
+	pinctrl_tach10_default: tach10-default {
+		function = "TACH10";
+		groups = "TACH10";
+	};
+
+	pinctrl_tach11_default: tach11-default {
+		function = "TACH11";
+		groups = "TACH11";
+	};
+
+	pinctrl_tach12_default: tach12-default {
+		function = "TACH12";
+		groups = "TACH12";
+	};
+
+	pinctrl_tach13_default: tach13-default {
+		function = "TACH13";
+		groups = "TACH13";
+	};
+
+	pinctrl_tach14_default: tach14-default {
+		function = "TACH14";
+		groups = "TACH14";
+	};
+
+	pinctrl_tach15_default: tach15-default {
+		function = "TACH15";
+		groups = "TACH15";
+	};
+
+	pinctrl_thru0_default: thru0-default {
+		function = "THRU0";
+		groups = "THRU0";
+	};
+
+	pinctrl_thru1_default: thru1-default {
+		function = "THRU1";
+		groups = "THRU1";
+	};
+
+	pinctrl_thru2_default: thru2-default {
+		function = "THRU2";
+		groups = "THRU2";
+	};
+
+	pinctrl_thru3_default: thru3-default {
+		function = "THRU3";
+		groups = "THRU3";
+	};
+
+	pinctrl_ncts5_default: ncts5-default {
+		function = "NCTS5";
+		groups = "NCTS5";
+	};
+
+	pinctrl_ndcd5_default: ndcd5-default {
+		function = "NDCD5";
+		groups = "NDCD5";
+	};
+
+	pinctrl_ndsr5_default: ndsr5-default {
+		function = "NDSR5";
+		groups = "NDSR5";
+	};
+
+	pinctrl_nri5_default: nri5-default {
+		function = "NRI5";
+		groups = "NRI5";
+	};
+
+	pinctrl_i2c0_default: i2c0-default {
+		function = "I2C0";
+		groups = "I2C0";
+	};
+
+	pinctrl_i2c1_default: i2c1-default {
+		function = "I2C1";
+		groups = "I2C1";
+	};
+
+	pinctrl_i2c2_default: i2c2-default {
+		function = "I2C2";
+		groups = "I2C2";
+	};
+
+	pinctrl_i2c3_default: i2c3-default {
+		function = "I2C3";
+		groups = "I2C3";
+	};
+
+	pinctrl_i2c4_default: i2c4-default {
+		function = "I2C4";
+		groups = "I2C4";
+	};
+
+	pinctrl_i2c5_default: i2c5-default {
+		function = "I2C5";
+		groups = "I2C5";
+	};
+
+	pinctrl_i2c6_default: i2c6-default {
+		function = "I2C6";
+		groups = "I2C6";
+	};
+
+	pinctrl_i2c7_default: i2c7-default {
+		function = "I2C7";
+		groups = "I2C7";
+	};
+
+	pinctrl_i2c8_default: i2c8-default {
+		function = "I2C8";
+		groups = "I2C8";
+	};
+
+	pinctrl_i2c9_default: i2c9-default {
+		function = "I2C9";
+		groups = "I2C9";
+	};
+
+	pinctrl_i2c10_default: i2c10-default {
+		function = "I2C10";
+		groups = "I2C10";
+	};
+
+	pinctrl_i2c11_default: i2c11-default {
+		function = "I2C11";
+		groups = "I2C11";
+	};
+
+	pinctrl_i2c12_default: i2c12-default {
+		function = "I2C12";
+		groups = "I2C12";
+	};
+
+	pinctrl_i2c13_default: i2c13-default {
+		function = "I2C13";
+		groups = "I2C13";
+	};
+
+	pinctrl_i2c14_default: i2c14-default {
+		function = "I2C14";
+		groups = "I2C14";
+	};
+
+	pinctrl_i2c15_default: i2c15-default {
+		function = "I2C15";
+		groups = "I2C15";
+	};
+
+	pinctrl_salt0_default: salt0-default {
+		function = "SALT0";
+		groups = "SALT0";
+	};
+
+	pinctrl_salt1_default: salt1-default {
+		function = "SALT1";
+		groups = "SALT1";
+	};
+
+	pinctrl_salt2_default: salt2-default {
+		function = "SALT2";
+		groups = "SALT2";
+	};
+
+	pinctrl_salt3_default: salt3-default {
+		function = "SALT3";
+		groups = "SALT3";
+	};
+
+	pinctrl_salt4_default: salt4-default {
+		function = "SALT4";
+		groups = "SALT4";
+	};
+
+	pinctrl_salt5_default: salt5-default {
+		function = "SALT5";
+		groups = "SALT5";
+	};
+
+	pinctrl_salt6_default: salt6-default {
+		function = "SALT6";
+		groups = "SALT6";
+	};
+
+	pinctrl_salt7_default: salt7-default {
+		function = "SALT7";
+		groups = "SALT7";
+	};
+
+	pinctrl_salt8_default: salt8-default {
+		function = "SALT8";
+		groups = "SALT8";
+	};
+
+	pinctrl_salt9_default: salt9-default {
+		function = "SALT9";
+		groups = "SALT9";
+	};
+
+	pinctrl_salt10_default: salt10-default {
+		function = "SALT10";
+		groups = "SALT10";
+	};
+
+	pinctrl_salt11_default: salt11-default {
+		function = "SALT11";
+		groups = "SALT11";
+	};
+
+	pinctrl_salt12_default: salt12-default {
+		function = "SALT12";
+		groups = "SALT12";
+	};
+
+	pinctrl_salt13_default: salt13-default {
+		function = "SALT13";
+		groups = "SALT13";
+	};
+
+	pinctrl_salt14_default: salt14-default {
+		function = "SALT14";
+		groups = "SALT14";
+	};
+
+	pinctrl_salt15_default: salt15-default {
+		function = "SALT15";
+		groups = "SALT15";
+	};
+
+	pinctrl_can_default: can-default {
+		function = "CANBUS";
+		groups = "CANBUS";
+	};
+	pinctrl_di2c0_default: di2c0-default {
+		function = "I2C0";
+		groups = "DI2C0";
+	};
+
+	pinctrl_di2c1_default: di2c1-default {
+		function = "I2C1";
+		groups = "DI2C1";
+	};
+
+	pinctrl_di2c2_default: di2c2-default {
+		function = "I2C2";
+		groups = "DI2C2";
+	};
+
+	pinctrl_di2c3_default: di2c3-default {
+		function = "I2C3";
+		groups = "DI2C3";
+	};
+	pinctrl_di2c8_default: di2c8-default {
+		function = "I2C8";
+		groups = "DI2C8";
+	};
+
+	pinctrl_di2c9_default: di2c9-default {
+		function = "I2C9";
+		groups = "DI2C9";
+	};
+
+	pinctrl_di2c10_default: di2c10-default {
+		function = "I2C10";
+		groups = "DI2C10";
+	};
+
+	pinctrl_di2c11_default: di2c11-default {
+		function = "I2C11";
+		groups = "DI2C11";
+	};
+
+	pinctrl_di2c12_default: id2c12-default {
+		function = "I2C12";
+		groups = "DI2C12";
+	};
+
+	pinctrl_di2c13_default: di2c13-default {
+		function = "I2C13";
+		groups = "DI2C13";
+	};
+
+	pinctrl_di2c14_default: di2c14-default {
+		function = "I2C14";
+		groups = "DI2C14";
+	};
+
+	pinctrl_di2c15_default: di2c15-default {
+		function = "I2C15";
+		groups = "DI2C15";
+	};
+
+	pinctrl_ncts0_default: ncts0-default {
+		function = "UART0";
+		groups = "NCTS0";
+	};
+
+	pinctrl_ndcd0_default: ndcd0-default {
+		function = "UART0";
+		groups = "NDCD0";
+	};
+
+	pinctrl_ndsr0_default: ndsr0-default {
+		function = "UART0";
+		groups = "NDSR0";
+	};
+
+	pinctrl_nri0_default: nri0-default {
+		function = "UART0";
+		groups = "NRI0";
+	};
+
+	pinctrl_ndtr0_default: ndtr0-default {
+		function = "UART0";
+		groups = "NDTR0";
+	};
+
+	pinctrl_nrts0_default: nrts0-default {
+		function = "UART0";
+		groups = "NRTS0";
+	};
+
+	pinctrl_txd0_default: txd0-default {
+		function = "UART0";
+		groups = "TXD0";
+	};
+
+	pinctrl_rxd0_default: rxd0-default {
+		function = "UART0";
+		groups = "RXD0";
+	};
+
+	pinctrl_ncts1_default: ncts1-default {
+		function = "UART1";
+		groups = "NCTS1";
+	};
+
+	pinctrl_ndcd1_default: ndcd1-default {
+		function = "UART1";
+		groups = "NDCD1";
+	};
+
+	pinctrl_ndsr1_default: ndsr1-default {
+		function = "UART1";
+		groups = "NDSR1";
+	};
+
+	pinctrl_nri1_default: nri1-default {
+		function = "UART1";
+		groups = "NRI1";
+	};
+
+	pinctrl_ndtr1_default: ndtr1-default {
+		function = "UART1";
+		groups = "NDTR1";
+	};
+
+	pinctrl_nrts1_default: nrts1-default {
+		function = "UART1";
+		groups = "NRTS1";
+	};
+
+	pinctrl_txd1_default: txd1-default {
+		function = "UART1";
+		groups = "TXD1";
+	};
+
+	pinctrl_rxd1_default: rxd1-default {
+		function = "UART1";
+		groups = "RXD1";
+	};
+
+	pinctrl_txd2_default: txd2-default {
+		function = "UART2";
+		groups = "TXD2";
+	};
+
+	pinctrl_rxd2_default: rxd2-default {
+		function = "UART2";
+		groups = "RXD2";
+	};
+
+	pinctrl_txd3_default: txd3-default {
+		function = "UART3";
+		groups = "TXD3";
+	};
+
+	pinctrl_rxd3_default: rxd3-default {
+		function = "UART3";
+		groups = "RXD3";
+	};
+
+	pinctrl_ncts5_default: ncts5-default {
+		function = "UART5";
+		groups = "NCTS5";
+	};
+
+	pinctrl_ndcd5_default: ndcd5-default {
+		function = "UART5";
+		groups = "NDCD5";
+	};
+
+	pinctrl_ndsr5_default: ndsr5-default {
+		function = "UART5";
+		groups = "NDSR5";
+	};
+
+	pinctrl_nri5_default: nri5-default {
+		function = "UART5";
+		groups = "NRI5";
+	};
+
+	pinctrl_ndtr5_default: ndtr5-default {
+		function = "UART5";
+		groups = "NDTR5";
+	};
+
+	pinctrl_nrts5_default: nrts5-default {
+		function = "UART5";
+		groups = "NRTS5";
+	};
+
+	pinctrl_txd5_default: txd5-default {
+		function = "UART5";
+		groups = "TXD5";
+	};
+
+	pinctrl_rxd5_default: rxd5-default {
+		function = "UART5";
+		groups = "RXD5";
+	};
+
+	pinctrl_ncts6_default: ncts6-default {
+		function = "UART6";
+		groups = "NCTS6";
+	};
+
+	pinctrl_ndcd6_default: ndcd6-default {
+		function = "UART6";
+		groups = "NDCD6";
+	};
+
+	pinctrl_ndsr6_default: ndsr6-default {
+		function = "UART6";
+		groups = "NDSR6";
+	};
+
+	pinctrl_nri6_default: nri6-default {
+		function = "UART6";
+		groups = "NRI6";
+	};
+
+	pinctrl_ndtr6_default: ndtr6-default {
+		function = "UART6";
+		groups = "NDTR6";
+	};
+
+	pinctrl_nrts6_default: nrts6-default {
+		function = "UART6";
+		groups = "NRTS6";
+	};
+
+	pinctrl_txd6_default: txd6-default {
+		function = "UART6";
+		groups = "TXD6";
+	};
+
+	pinctrl_rxd6_default: rxd6-default {
+		function = "UART6";
+		groups = "RXD6";
+	};
+
+	pinctrl_txd7_default: txd7-default {
+		function = "UART7";
+		groups = "TXD7";
+	};
+
+	pinctrl_rxd7_default: rxd7-default {
+		function = "UART7";
+		groups = "RXD7";
+	};
+
+	pinctrl_txd8_default: txd8-default {
+		function = "UART8";
+		groups = "TXD8";
+	};
+
+	pinctrl_rxd8_default: rxd8-default {
+		function = "UART8";
+		groups = "RXD8";
+	};
+
+	pinctrl_txd9_default: txd9-default {
+		function = "UART9";
+		groups = "TXD9";
+	};
+
+	pinctrl_rxd9_default: rxd9-default {
+		function = "UART9";
+		groups = "RXD9";
+	};
+
+	pinctrl_txd10_default: txd10-default {
+		function = "UART10";
+		groups = "TXD10";
+	};
+
+	pinctrl_rxd10_default: rxd10-default {
+		function = "UART10";
+		groups = "RXD10";
+	};
+
+	pinctrl_txd11_default: txd11-default {
+		function = "UART11";
+		groups = "TXD11";
+	};
+
+	pinctrl_rxd11_default: rxd11-default {
+		function = "UART11";
+		groups = "RXD11";
+	};
+
+	pinctrl_pcierc2_perst_default: pcierc2-perst-default {
+		function = "PCIERC";
+		groups = "PE2SGRSTN";
+	};
+
+	pinctrl_usb2cud_default: usb2cud-default {
+		function = "USB2C";
+		groups = "USB2CUD";
+	};
+
+	pinctrl_usb2cd_default: usb2cd-default {
+		function = "USB2C";
+		groups = "USB2CD";
+	};
+
+	pinctrl_usb2ch_default: usb2ch-default {
+		function = "USB2C";
+		groups = "USB2CH";
+	};
+
+	pinctrl_usb2cu_default: usb2cu-default {
+		function = "USB2C";
+		groups = "USB2CU";
+	};
+
+	pinctrl_usb2dd_default: usb2dd-default {
+		function = "USB2D";
+		groups = "USB2DD";
+	};
+
+	pinctrl_usb2dh_default: usb2dh-default {
+		function = "USB2D";
+		groups = "USB2DH";
+	};
+};
-- 
2.25.1


