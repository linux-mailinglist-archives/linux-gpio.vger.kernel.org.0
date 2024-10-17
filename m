Return-Path: <linux-gpio+bounces-11483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6A9A1697
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1311F2397C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CFD2F36;
	Thu, 17 Oct 2024 00:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hWjJGZHR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9088F6C;
	Thu, 17 Oct 2024 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123724; cv=none; b=CrKKuGFW7fuYuUoRJwEeYOV2a6wxk7yoeZ1tSHgxgO5GSK+8xAMZyCu9LAj1I2XlvYTtzvqs3xunt1ew6JcsxqcaU8wBPdAKHqkxp93eZooyV71eQAd3Ja5dYMANczjv17Q+qbLyxTzlq7u/JDY6tby3UVVAZreZtO1Y1Zgk+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123724; c=relaxed/simple;
	bh=QSnj+/Is9e0IGZPqEZNt0zUdFsRnSF2z5d9geqgSsfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SElrPVqPGciHLTEm3x0HB3xO0e/rJyVbrvHqL4POyK3ZQyiQmng+mLIKudiRfH8fE550hwLANFnSpLr5cW3QXLsQsyo2pbjqulMCGTTmxfpbMPSszba+nHiriPdEZP7xWC7Ca8eCvkv5mUvud5QlHvgEN6NRFnJe4PtD+RYaUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hWjJGZHR; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 87BAB88E2D;
	Thu, 17 Oct 2024 02:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123714;
	bh=NswmgthgAh6q15Y7Nn3Y0tmtXBL+X8djjSLPm0VajCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWjJGZHRr/wU3JwHc5N26004rxsch2JdHhkEGf9ktbh3nWtqMXEn+nXIDdZVwpJXT
	 NPkH9s2br+2pYZ7MAg8OlFnwxEr3kIqTeKtDL9rCRCapVoyFfDYNTA9sM77US2XPoB
	 scKa7myfff31dyPHIblrKRhCg2c8Z+KKzBNH8BkXg6yyHKIjavxVdLaTMxrtF4XySh
	 o3gGZ6VPBPbbLp5j9UURcrdnjzAjSTYN4OKVFwYCbL/xgbxN9LrB3rCz5PxnorgSnk
	 pboBzEgAOT5akrvjetIyk0bGT5iYmWuqj5ebrwjaKhGk4sJhQlUGoZdarX8bIYy6HW
	 6BmsNcwMc2fdw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 08/12] ARM: dts: imx6qdl: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:54 +0200
Message-ID: <20241017000801.149276-8-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017000801.149276-1-marex@denx.de>
References: <20241017000801.149276-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Bindings expect pin configuration nodes in pinctrl to match certain
naming and not be part of another fake node:

pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Drop the wrapping node and adjust the names to have "grp" prefix.
Diff looks big but this should have no functional impact, use e.g.
git show -w to view the diff.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
---
 .../dts/nxp/imx/imx6qdl-aristainetos.dtsi     |   6 +-
 .../dts/nxp/imx/imx6qdl-aristainetos2.dtsi    |   6 +-
 .../arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi | 136 +++--
 .../dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ds.dtsi     |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi  |  39 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi |   4 +-
 .../dts/nxp/imx/imx6qdl-hummingboard.dtsi     |  30 +-
 .../nxp/imx/imx6qdl-hummingboard2-emmc.dtsi   |   4 +-
 .../dts/nxp/imx/imx6qdl-hummingboard2.dtsi    |  40 +-
 .../boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   | 354 ++++++-----
 .../dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |   2 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  | 406 +++++++------
 .../imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi  |   4 +-
 .../dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi    | 274 +++++----
 .../boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   | 554 +++++++++---------
 .../boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   | 428 +++++++-------
 .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 430 +++++++-------
 .../boot/dts/nxp/imx/imx6qdl-solidsense.dtsi  |  78 ++-
 .../boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi |  86 ++-
 .../boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi |  30 +-
 .../boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   |  88 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi |  96 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi   | 224 ++++---
 .../boot/dts/nxp/imx/imx6qdl-var-dart.dtsi    |   4 +-
 .../dts/nxp/imx/imx6qdl-wandboard-revb1.dtsi  |   2 +-
 .../dts/nxp/imx/imx6qdl-wandboard-revc1.dtsi  |  32 +-
 .../dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi  |  78 ++-
 .../boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   | 247 ++++----
 31 files changed, 1830 insertions(+), 1866 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi
index baa197c90060e..09192800e13f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi
@@ -179,12 +179,12 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog &pinctrl_gpio>;
 
-	imx6qdl-aristainetos {
-		pinctrl_aristainetos_usbh1_vbus: aristainetos-usbh1-vbus {
+	imx6qdl-aristainetosgrp {
+		pinctrl_aristainetos_usbh1_vbus: aristainetos-usbh1-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_EIM_D31__GPIO3_IO31 0x130b0>;
 		};
 
-		pinctrl_aristainetos_usbotg_vbus: aristainetos-usbotg-vbus {
+		pinctrl_aristainetos_usbotg_vbus: aristainetos-usbotg-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_KEY_ROW4__GPIO4_IO15 0x130b0>;
 		};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
index f7fac86f0a6bc..7cc7ae1959882 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
@@ -413,7 +413,7 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio>;
 
-	pinctrl_audmux: audmux {
+	pinctrl_audmux: audmuxgrp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD  0x1b0b0
 			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC  0x1b0b0
@@ -599,11 +599,11 @@ MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x17059
 		>;
 	};
 
-	pinctrl_aristainetos2_usbh1_vbus: aristainetos-usbh1-vbus {
+	pinctrl_aristainetos2_usbh1_vbus: aristainetos-usbh1-vbusgrp {
 		fsl,pins = <MX6QDL_PAD_GPIO_0__USB_H1_PWR 0x130b0>;
 	};
 
-	pinctrl_aristainetos2_usbotg_vbus: aristainetos-usbotg-vbus {
+	pinctrl_aristainetos2_usbotg_vbus: aristainetos-usbotg-vbusgrp {
 		fsl,pins = <MX6QDL_PAD_KEY_ROW4__USB_OTG_PWR 0x130b0>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
index bd66430c1d78d..41d073f5bfe7a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
@@ -153,87 +153,85 @@ rtc@68 {
 };
 
 &iomuxc {
-	cubox_i {
-		pinctrl_cubox_i_hdmi: cubox-i-hdmi {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
-			>;
-		};
+	pinctrl_cubox_i_hdmi: cubox-i-hdmigrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
+		>;
+	};
 
-		pinctrl_cubox_i_i2c2: cubox-i-i2c2 {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
-			>;
-		};
+	pinctrl_cubox_i_i2c2: cubox-i-i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
+		>;
+	};
 
-		pinctrl_cubox_i_i2c3: cubox-i-i2c3 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
-				MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
-			>;
-		};
+	pinctrl_cubox_i_i2c3: cubox-i-i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
+			MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
+		>;
+	};
 
-		pinctrl_cubox_i_ir: cubox-i-ir {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_DA9__GPIO3_IO09 0x80000000
-			>;
-		};
+	pinctrl_cubox_i_ir: cubox-i-irgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09 0x80000000
+		>;
+	};
 
-		pinctrl_cubox_i_pwm1: cubox-i-pwm1-front-led {
-			fsl,pins = <MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b0>;
-		};
+	pinctrl_cubox_i_pwm1: cubox-i-pwm1-front-ledgrp {
+		fsl,pins = <MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b0>;
+	};
 
-		pinctrl_cubox_i_spdif: cubox-i-spdif {
-			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
-		};
+	pinctrl_cubox_i_spdif: cubox-i-spdifgrp {
+		fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
+	};
 
-		pinctrl_cubox_i_usbh1: cubox-i-usbh1 {
-			fsl,pins = <MX6QDL_PAD_GPIO_3__USB_H1_OC 0x1b0b0>;
-		};
+	pinctrl_cubox_i_usbh1: cubox-i-usbh1grp {
+		fsl,pins = <MX6QDL_PAD_GPIO_3__USB_H1_OC 0x1b0b0>;
+	};
 
-		pinctrl_cubox_i_usbh1_vbus: cubox-i-usbh1-vbus {
-			fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x4001b0b0>;
-		};
+	pinctrl_cubox_i_usbh1_vbus: cubox-i-usbh1-vbusgrp {
+		fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x4001b0b0>;
+	};
 
-		pinctrl_cubox_i_usbotg: cubox-i-usbotg {
-			/*
-			 * The Cubox-i pulls ID low, but as it's pointless
-			 * leaving it as a pull-up, even if it is just 10uA.
-			 */
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059
-				MX6QDL_PAD_KEY_COL4__USB_OTG_OC 0x1b0b0
-			>;
-		};
+	pinctrl_cubox_i_usbotg: cubox-i-usbotggrp {
+		/*
+		 * The Cubox-i pulls ID low, but as it's pointless
+		 * leaving it as a pull-up, even if it is just 10uA.
+		 */
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059
+			MX6QDL_PAD_KEY_COL4__USB_OTG_OC 0x1b0b0
+		>;
+	};
 
-		pinctrl_cubox_i_usbotg_vbus: cubox-i-usbotg-vbus {
-			fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x4001b0b0>;
-		};
+	pinctrl_cubox_i_usbotg_vbus: cubox-i-usbotg-vbusgrp {
+		fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x4001b0b0>;
+	};
 
-		pinctrl_cubox_i_usdhc2_aux: cubox-i-usdhc2-aux {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x1f071
-				MX6QDL_PAD_KEY_ROW1__SD2_VSELECT 0x1b071
-			>;
-		};
+	pinctrl_cubox_i_usdhc2_aux: cubox-i-usdhc2-auxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x1f071
+			MX6QDL_PAD_KEY_ROW1__SD2_VSELECT 0x1b071
+		>;
+	};
 
-		pinctrl_cubox_i_usdhc2: cubox-i-usdhc2 {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x13059
-			>;
-		};
+	pinctrl_cubox_i_usdhc2: cubox-i-usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x13059
+		>;
+	};
 
-		pinctrl_gpio_key: gpio-key {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_DA8__GPIO3_IO08	0x17059
-			>;
-		};
+	pinctrl_gpio_key: gpio-keygrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA8__GPIO3_IO08	0x17059
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi
index 0a6c3a092b343..c20ff43c9c7e2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi
@@ -47,7 +47,7 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6qdl-dfi-fs700-m60 {
+	imx6qdl-dfi-fs700-m60grp {
 		pinctrl_hog: hoggrp {
 			fsl,pins = <
 				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x80000000
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-ds.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-ds.dtsi
index f7e5175556977..99ebd4dd63e88 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-ds.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-ds.dtsi
@@ -253,7 +253,7 @@ MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
 		>;
 	};
 
-	pinctrl_ecspi1_gpio: ecspi1grpgpiogrp {
+	pinctrl_ecspi1_gpio: ecspi1gpiogrp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_ROW1__GPIO4_IO09		0x1b0b0
 			MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x1b0b0
@@ -349,7 +349,7 @@ MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x17059
 		>;
 	};
 
-	pinctrl_usdhc1_gpio: usdhc1grpgpiogrp {
+	pinctrl_usdhc1_gpio: usdhc1gpiogrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0
 		>;
@@ -366,7 +366,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D0__GPIO2_IO00		0x1b0b0
 			MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index a308a3584b625..97763db3959fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -330,7 +330,6 @@ &i2c2 {
 };
 
 &iomuxc {
-
 	pinctrl_audmux: audmuxgrp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD			0x130b0
@@ -382,79 +381,79 @@ MX6QDL_PAD_EIM_RW__GPIO2_IO26			0x100b1
 		>;
 	};
 
-	pinctrl_emcon_gpio1: emcongpio1 {
+	pinctrl_emcon_gpio1: emcongpio1grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D0__GPIO2_IO00			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio2: emcongpio2 {
+	pinctrl_emcon_gpio2: emcongpio2grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D1__GPIO2_IO01			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio3: emcongpio3 {
+	pinctrl_emcon_gpio3: emcongpio3grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D2__GPIO2_IO02			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio4: emcongpio4 {
+	pinctrl_emcon_gpio4: emcongpio4grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D3__GPIO2_IO03			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio5: emcongpio5 {
+	pinctrl_emcon_gpio5: emcongpio5grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D4__GPIO2_IO04			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio6: emcongpio6 {
+	pinctrl_emcon_gpio6: emcongpio6grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D5__GPIO2_IO05			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio7: emcongpio7 {
+	pinctrl_emcon_gpio7: emcongpio7grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D6__GPIO2_IO06			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_gpio8: emcongpio8 {
+	pinctrl_emcon_gpio8: emcongpio8grp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D7__GPIO2_IO07			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_irq_a: emconirqa {
+	pinctrl_emcon_irq_a: emconirqagrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_CLE__GPIO6_IO07		0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_irq_b: emconirqb {
+	pinctrl_emcon_irq_b: emconirqbgrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_CS2__GPIO6_IO15		0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_irq_c: emconirqc {
+	pinctrl_emcon_irq_c: emconirqcgrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_CS3__GPIO6_IO16		0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_irq_pwr: emconirqpwr {
+	pinctrl_emcon_irq_pwr: emconirqpwrgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D23__GPIO3_IO23			0x0b0b1
 		>;
 	};
 
-	pinctrl_emcon_wake: emconwake {
+	pinctrl_emcon_wake: emconwakegrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_DA2__GPIO3_IO02			0x1b0b1
 		>;
@@ -503,13 +502,13 @@ MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b870
 		>;
 	};
 
-	pinctrl_irq_touch1: irqtouch1 {
+	pinctrl_irq_touch1: irqtouch1grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_5__GPIO1_IO05			0x0b0b1
 		>;
 	};
 
-	pinctrl_irq_touch2: irqtouch2 {
+	pinctrl_irq_touch2: irqtouch2grp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_BCLK__GPIO6_IO31			0x0b0b1
 		>;
@@ -552,7 +551,7 @@ MX6QDL_PAD_SD4_DAT0__GPIO2_IO08			0x0b0b1
 		>;
 	};
 
-	pinctrl_pwm_fan: pwmfan {
+	pinctrl_pwm_fan: pwmfangrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD4_DAT2__PWM4_OUT			0x0b0b1
 		>;
@@ -565,7 +564,7 @@ MX6QDL_PAD_NANDF_ALE__GPIO6_IO08		0x0b0b1
 		>;
 	};
 
-	pinctrl_rgb_bl_en: rgbenable {
+	pinctrl_rgb_bl_en: rgbenablegrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD4_CMD__GPIO7_IO09			0x0b0b1
 		>;
@@ -617,13 +616,13 @@ MX6QDL_PAD_EIM_DA1__GPIO3_IO01			0x0b0b1
 		>;
 	};
 
-	pinctrl_spdif_in: spdifin {
+	pinctrl_spdif_in: spdifingrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_16__SPDIF_IN			0x1b0b0
 		>;
 	};
 
-	pinctrl_spdif_out: spdifout {
+	pinctrl_spdif_out: spdifoutgrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_19__SPDIF_OUT			0x13091
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
index 0ed6d25024a24..94f1d1ae59aa2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
@@ -770,14 +770,14 @@ MX6QDL_PAD_SD4_DAT1__PWM3_OUT		0x1b0b1
 		>;
 	};
 
-	pinctrl_pwm4_backlight: pwm4grpbacklight {
+	pinctrl_pwm4_backlight: pwm4backlightgrp {
 		fsl,pins = <
 			/* LVDS_PWM J6.5 */
 			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
 		>;
 	};
 
-	pinctrl_pwm4_dio: pwm4grpdio {
+	pinctrl_pwm4_dio: pwm4diogrp {
 		fsl,pins = <
 			/* DIO3 J16.4 */
 			MX6QDL_PAD_SD4_DAT2__PWM4_OUT		0x1b0b1
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
index d1ad65ab6b72e..26468c9be5d4b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
@@ -223,41 +223,41 @@ &i2c2 {
 };
 
 &iomuxc {
-	hummingboard {
-		pinctrl_hummingboard_flexcan1: hummingboard-flexcan1 {
+	hummingboardgrp {
+		pinctrl_hummingboard_flexcan1: hummingboard-flexcan1grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD3_CLK__FLEXCAN1_RX 0x80000000
 				MX6QDL_PAD_SD3_CMD__FLEXCAN1_TX 0x80000000
 			>;
 		};
 
-		pinctrl_hummingboard_gpio3_5: hummingboard-gpio3_5 {
+		pinctrl_hummingboard_gpio3_5: hummingboard-gpio3_5grp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_DA5__GPIO3_IO05 0x1b0b1
 			>;
 		};
 
-		pinctrl_hummingboard_hdmi: hummingboard-hdmi {
+		pinctrl_hummingboard_hdmi: hummingboard-hdmigrp {
 			fsl,pins = <
 				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
 			>;
 		};
 
-		pinctrl_hummingboard_i2c1: hummingboard-i2c1 {
+		pinctrl_hummingboard_i2c1: hummingboard-i2c1grp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
 				MX6QDL_PAD_EIM_D28__I2C1_SDA 0x4001b8b1
 			>;
 		};
 
-		pinctrl_hummingboard_i2c2: hummingboard-i2c2 {
+		pinctrl_hummingboard_i2c2: hummingboard-i2c2grp {
 			fsl,pins = <
 				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
 				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
 			>;
 		};
 
-		pinctrl_hummingboard_pcie_reset: hummingboard-pcie-reset {
+		pinctrl_hummingboard_pcie_reset: hummingboard-pcie-resetgrp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_DA4__GPIO3_IO04 0x1b0b1
 			>;
@@ -267,7 +267,7 @@ pinctrl_hummingboard_pwm1: pwm1grp {
 			fsl,pins = <MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b1>;
 		};
 
-		pinctrl_hummingboard_sgtl5000: hummingboard-sgtl5000 {
+		pinctrl_hummingboard_sgtl5000: hummingboard-sgtl5000grp {
 			fsl,pins = <
 				MX6QDL_PAD_DISP0_DAT19__AUD5_RXD 0x130b0
 				MX6QDL_PAD_KEY_COL0__AUD5_TXC 0x130b0
@@ -277,32 +277,32 @@ MX6QDL_PAD_GPIO_5__CCM_CLKO1 0x130b0
 			>;
 		};
 
-		pinctrl_hummingboard_spdif: hummingboard-spdif {
+		pinctrl_hummingboard_spdif: hummingboard-spdifgrp {
 			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
 		};
 
-		pinctrl_hummingboard_usbh1_vbus: hummingboard-usbh1-vbus {
+		pinctrl_hummingboard_usbh1_vbus: hummingboard-usbh1-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x1b0b0>;
 		};
 
-		pinctrl_hummingboard_usbotg_id: hummingboard-usbotg-id {
+		pinctrl_hummingboard_usbotg_id: hummingboard-usbotg-idgrp {
 			/*
 			 * We want it pulled down for a fixed host connection.
 			 */
 			fsl,pins = <MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID 0x13059>;
 		};
 
-		pinctrl_hummingboard_usbotg_vbus: hummingboard-usbotg-vbus {
+		pinctrl_hummingboard_usbotg_vbus: hummingboard-usbotg-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b0>;
 		};
 
-		pinctrl_hummingboard_usdhc2_aux: hummingboard-usdhc2-aux {
+		pinctrl_hummingboard_usdhc2_aux: hummingboard-usdhc2-auxgrp {
 			fsl,pins = <
 				MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x1f071
 			>;
 		};
 
-		pinctrl_hummingboard_usdhc2: hummingboard-usdhc2 {
+		pinctrl_hummingboard_usdhc2: hummingboard-usdhc2grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
 				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
@@ -312,7 +312,7 @@ MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17059
 				MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x13059
 			>;
 		};
-		pinctrl_hummingboard_vmmc: hummingboard-vmmc {
+		pinctrl_hummingboard_vmmc: hummingboard-vmmcgrp {
 			fsl,pins = <
 				MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
 			>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
index f400405381a72..87ba8036c1b2f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
@@ -42,8 +42,8 @@
  */
 
 &iomuxc {
-	hummingboard2 {
-		pinctrl_hummingboard2_usdhc3: hummingboard2-usdhc3 {
+	hummingboard2grp {
+		pinctrl_hummingboard2_usdhc3: hummingboard2-usdhc3grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
 				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
index e6017f9bf6409..c0cff7ebbae1b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
@@ -261,7 +261,7 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	hummingboard2 {
+	hummingboard2grp {
 		pinctrl_hog: hoggrp {
 		fsl,pins = <
 				/*
@@ -369,40 +369,40 @@ MX6QDL_PAD_EIM_RW__GPIO2_IO26	0x000b1 /* CS */
 			>;
 		};
 
-		pinctrl_hummingboard2_gpio7_9: hummingboard2-gpio7_9 {
+		pinctrl_hummingboard2_gpio7_9: hummingboard2-gpio7_9grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD4_CMD__GPIO7_IO09 0x80000000
 			>;
 		};
 
-		pinctrl_hummingboard2_hdmi: hummingboard2-hdmi {
+		pinctrl_hummingboard2_hdmi: hummingboard2-hdmigrp {
 			fsl,pins = <
 				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
 			>;
 		};
 
-		pinctrl_hummingboard2_i2c1: hummingboard2-i2c1 {
+		pinctrl_hummingboard2_i2c1: hummingboard2-i2c1grp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
 				MX6QDL_PAD_EIM_D28__I2C1_SDA 0x4001b8b1
 			>;
 		};
 
-		pinctrl_hummingboard2_i2c2: hummingboard2-i2c2 {
+		pinctrl_hummingboard2_i2c2: hummingboard2-i2c2grp {
 			fsl,pins = <
 				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
 				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
 			>;
 		};
 
-		pinctrl_hummingboard2_i2c3: hummingboard2-i2c3 {
+		pinctrl_hummingboard2_i2c3: hummingboard2-i2c3grp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
 				MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
 			>;
 		};
 
-		pinctrl_hummingboard2_mipi: hummingboard2_mipi {
+		pinctrl_hummingboard2_mipi: hummingboard2_mipigrp {
 			fsl,pins = <
 				MX6QDL_PAD_SD4_DAT2__GPIO2_IO10 0x4001b8b1
 				MX6QDL_PAD_KEY_COL4__GPIO4_IO14 0x4001b8b1
@@ -410,7 +410,7 @@ MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x130b0
 			>;
 		};
 
-		pinctrl_hummingboard2_pcie_reset: hummingboard2-pcie-reset {
+		pinctrl_hummingboard2_pcie_reset: hummingboard2-pcie-resetgrp {
 			fsl,pins = <
 				MX6QDL_PAD_SD4_DAT3__GPIO2_IO11 0x1b0b1
 			>;
@@ -428,7 +428,7 @@ MX6QDL_PAD_SD4_DAT1__PWM3_OUT 0x1b0b1
 			>;
 		};
 
-		pinctrl_hummingboard2_sgtl5000: hummingboard2-sgtl5000 {
+		pinctrl_hummingboard2_sgtl5000: hummingboard2-sgtl5000grp {
 			fsl,pins = <
 				MX6QDL_PAD_DISP0_DAT19__AUD5_RXD 0x130b0
 				MX6QDL_PAD_KEY_COL0__AUD5_TXC 0x130b0
@@ -438,37 +438,37 @@ MX6QDL_PAD_GPIO_5__CCM_CLKO1 0x130b0
 			>;
 		};
 
-		pinctrl_hummingboard2_usbh1_vbus: hummingboard2-usbh1-vbus {
+		pinctrl_hummingboard2_usbh1_vbus: hummingboard2-usbh1-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x1b0b0>;
 		};
 
-		pinctrl_hummingboard2_usbh2_vbus: hummingboard2-usbh2-vbus {
+		pinctrl_hummingboard2_usbh2_vbus: hummingboard2-usbh2-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_SD4_DAT5__GPIO2_IO13 0x1b0b0>;
 		};
 
-		pinctrl_hummingboard2_usbh3_vbus: hummingboard2-usbh3-vbus {
+		pinctrl_hummingboard2_usbh3_vbus: hummingboard2-usbh3-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_SD4_CLK__GPIO7_IO10 0x1b0b0>;
 		};
 
-		pinctrl_hummingboard2_usbotg_id: hummingboard2-usbotg-id {
+		pinctrl_hummingboard2_usbotg_id: hummingboard2-usbotg-idgrp {
 			/*
 			 * We want it pulled down for a fixed host connection.
 			 */
 			fsl,pins = <MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059>;
 		};
 
-		pinctrl_hummingboard2_usbotg_vbus: hummingboard2-usbotg-vbus {
+		pinctrl_hummingboard2_usbotg_vbus: hummingboard2-usbotg-vbusgrp {
 			fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b0>;
 		};
 
-		pinctrl_hummingboard2_usdhc2_aux: hummingboard2-usdhc2-aux {
+		pinctrl_hummingboard2_usdhc2_aux: hummingboard2-usdhc2-auxgrp {
 			fsl,pins = <
 				MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x1f071
 				MX6QDL_PAD_KEY_ROW1__SD2_VSELECT 0x1b071
 			>;
 		};
 
-		pinctrl_hummingboard2_usdhc2: hummingboard2-usdhc2 {
+		pinctrl_hummingboard2_usdhc2: hummingboard2-usdhc2grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
 				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
@@ -479,7 +479,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x13059
 			>;
 		};
 
-		pinctrl_hummingboard2_usdhc2_100mhz: hummingboard2-usdhc2-100mhz {
+		pinctrl_hummingboard2_usdhc2_100mhz: hummingboard2-usdhc2-100mhzgrp {
 			fsl,pins = <
 				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x170b9
 				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x100b9
@@ -490,7 +490,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x130b9
 			>;
 		};
 
-		pinctrl_hummingboard2_usdhc2_200mhz: hummingboard2-usdhc2-200mhz {
+		pinctrl_hummingboard2_usdhc2_200mhz: hummingboard2-usdhc2-200mhzgrp {
 			fsl,pins = <
 				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x170f9
 				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x100f9
@@ -501,13 +501,13 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x130f9
 			>;
 		};
 
-		pinctrl_hummingboard2_vmmc: hummingboard2-vmmc {
+		pinctrl_hummingboard2_vmmc: hummingboard2-vmmcgrp {
 			fsl,pins = <
 				MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
 			>;
 		};
 
-		pinctrl_hummingboard2_uart3: hummingboard2-uart3 {
+		pinctrl_hummingboard2_uart3: hummingboard2-uart3grp {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D25__UART3_TX_DATA	0x1b0b1
 				MX6QDL_PAD_EIM_D24__UART3_RX_DATA	0x40013000
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
index a30cf0d06206f..8ee65f9858c0f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
@@ -276,205 +276,203 @@ &iomuxc {
 	pinctrl-0 = <&pinctrl_j10>;
 	pinctrl-1 = <&pinctrl_j28>;
 
-	imx6dl-nit6xlite {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x000b1
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x000b1
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x100b0
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x100b0
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x100b0
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x100b0
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x100b0
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x100b0
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				/* Phy reset */
-				MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x0f0b0
-				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0
-				MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x100b0
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x100b0
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x100b0
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x100b0
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x100b0
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x100b0
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			/* Phy reset */
+			MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x0f0b0
+			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0
+			MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
+		>;
+	};
 
-		pinctrl_gpio_keys: gpio-keysgrp {
-			fsl,pins = <
-				/* Home Button: J14 pin 5 */
-				MX6QDL_PAD_GPIO_18__GPIO7_IO13		0x1b0b0
-				/* Back Button: J14 pin 7 */
-				MX6QDL_PAD_GPIO_19__GPIO4_IO05		0x1b0b0
-			>;
-		};
+	pinctrl_gpio_keys: gpio-keysgrp {
+		fsl,pins = <
+			/* Home Button: J14 pin 5 */
+			MX6QDL_PAD_GPIO_18__GPIO7_IO13		0x1b0b0
+			/* Back Button: J14 pin 7 */
+			MX6QDL_PAD_GPIO_19__GPIO4_IO05		0x1b0b0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL	0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA	0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL	0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA	0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL	0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA	0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL	0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA	0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__I2C3_SCL	0x4001b8b1
-				MX6QDL_PAD_GPIO_16__I2C3_SDA	0x4001b8b1
-				/* Touch IRQ: J7 pin 4 */
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0
-				/* tcs2004 IRQ */
-				MX6QDL_PAD_EIM_LBA__GPIO2_IO27	0x1b0b0
-				/* tsc2004 reset */
-				MX6QDL_PAD_KEY_COL2__GPIO4_IO10	0x0b0b0
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL	0x4001b8b1
+			MX6QDL_PAD_GPIO_16__I2C3_SDA	0x4001b8b1
+			/* Touch IRQ: J7 pin 4 */
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0
+			/* tcs2004 IRQ */
+			MX6QDL_PAD_EIM_LBA__GPIO2_IO27	0x1b0b0
+			/* tsc2004 reset */
+			MX6QDL_PAD_KEY_COL2__GPIO4_IO10	0x0b0b0
+		>;
+	};
 
-		pinctrl_j10: j10grp {
-			fsl,pins = <
-				/* Broadcom WiFi module pins */
-				MX6QDL_PAD_NANDF_D0__GPIO2_IO00		0x1b0b0
-				MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
-				MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
-				MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x1b0b0
-				MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09	0x0b0b0
-				MX6QDL_PAD_NANDF_CS1__GPIO6_IO14	0x1b0b0
-				MX6QDL_PAD_SD1_CLK__OSC32K_32K_OUT	0x000b0
-			>;
-		};
+	pinctrl_j10: j10grp {
+		fsl,pins = <
+			/* Broadcom WiFi module pins */
+			MX6QDL_PAD_NANDF_D0__GPIO2_IO00		0x1b0b0
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
+			MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x1b0b0
+			MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09	0x0b0b0
+			MX6QDL_PAD_NANDF_CS1__GPIO6_IO14	0x1b0b0
+			MX6QDL_PAD_SD1_CLK__OSC32K_32K_OUT	0x000b0
+		>;
+	};
 
-		pinctrl_j28: j28grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0
-			>;
-		};
+	pinctrl_j28: j28grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0
+		>;
+	};
 
-		pinctrl_leds: ledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x0b0b0
-				MX6QDL_PAD_GPIO_3__GPIO1_IO03		0x0b0b0
-				MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x030b0
-				MX6QDL_PAD_GPIO_7__GPIO1_IO07		0x0b0b0
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0b0b0
-			>;
-		};
+	pinctrl_leds: ledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x0b0b0
+			MX6QDL_PAD_GPIO_3__GPIO1_IO03		0x0b0b0
+			MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x030b0
+			MX6QDL_PAD_GPIO_7__GPIO1_IO07		0x0b0b0
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0b0b0
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT3__PWM1_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT3__PWM1_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_wlan_vmmc: wlan-vmmcgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__GPIO6_IO07	0x030b0
-			>;
-		};
+	pinctrl_wlan_vmmc: wlan-vmmcgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__GPIO6_IO07	0x030b0
+		>;
+	};
 
-		pinctrl_rtc: rtcgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_RW__GPIO2_IO26		0x1b0b0
-			>;
-		};
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_RW__GPIO2_IO26		0x1b0b0
+		>;
+	};
 
-		pinctrl_sgtl5000: sgtl5000grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x000b0
-				MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b0
-			>;
-		};
+	pinctrl_sgtl5000: sgtl5000grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x000b0
+			MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
-				MX6QDL_PAD_EIM_D31__UART3_RTS_B		0x1b0b1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_D31__UART3_RTS_B		0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_KEY_COL4__USB_OTG_OC		0x1b0b0
-				/* power enable, high active */
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x000b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_KEY_COL4__USB_OTG_OC		0x1b0b0
+			/* power enable, high active */
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x000b0
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x1b0b0
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x1b0b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
index 33174febf410b..d5133b3748bff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
@@ -411,7 +411,7 @@ touchscreen@38 {
 };
 
 &iomuxc {
-	imx6q-nitrogen6-max {
+	imx6q-nitrogen6-maxgrp {
 		pinctrl_audmux: audmuxgrp {
 			fsl,pins = <
 				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
index 121177273dd00..8a0bfc387a599 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
@@ -343,231 +343,229 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6q-nitrogen6x {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				/* SGTL5000 sys_mclk */
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x030b0
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* SGTL5000 sys_mclk */
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x030b0
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+		>;
+	};
 
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b0
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b0
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
+		>;
+	};
 
-		pinctrl_can_xcvr: can-xcvrgrp {
-			fsl,pins = <
-				/* Flexcan XCVR enable */
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
-			>;
-		};
+	pinctrl_can_xcvr: can-xcvrgrp {
+		fsl,pins = <
+			/* Flexcan XCVR enable */
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19  0x000b1	/* CS */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19  0x000b1	/* CS */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x10030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x10030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x10030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x10030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x10030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x10030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				/* Phy reset */
-				MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x000b0
-				MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x10030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x10030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x10030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x10030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x10030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x10030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			/* Phy reset */
+			MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x000b0
+			MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
+		>;
+	};
 
-		pinctrl_gpio_keys: gpio-keysgrp {
-			fsl,pins = <
-				/* Power Button */
-				MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
-				/* Menu Button */
-				MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
-				/* Home Button */
-				MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x1b0b0
-				/* Back Button */
-				MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
-				/* Volume Up Button */
-				MX6QDL_PAD_GPIO_18__GPIO7_IO13		0x1b0b0
-				/* Volume Down Button */
-				MX6QDL_PAD_GPIO_19__GPIO4_IO05		0x1b0b0
-			>;
-		};
+	pinctrl_gpio_keys: gpio-keysgrp {
+		fsl,pins = <
+			/* Power Button */
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
+			/* Menu Button */
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
+			/* Home Button */
+			MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x1b0b0
+			/* Back Button */
+			MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
+			/* Volume Up Button */
+			MX6QDL_PAD_GPIO_18__GPIO7_IO13		0x1b0b0
+			/* Volume Down Button */
+			MX6QDL_PAD_GPIO_19__GPIO4_IO05		0x1b0b0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_j15: j15grp {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
-				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
-				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
-				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
-				MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
-				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
-				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
-				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
-				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
-				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
-				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
-				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
-				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
-				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
-				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
-				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
-				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
-				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
-				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
-				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
-				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
-				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
-				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
-				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
-				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
-				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
-				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
-				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
-			>;
-		};
+	pinctrl_j15: j15grp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
+			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
+			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
+			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
+			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
+			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
+			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
+			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
+			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
+			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
+			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
+			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
+			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
+			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
+			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
+			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
+			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
+			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
+			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
+			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
+			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
+			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
+			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
+			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
+			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
+			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
+			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
+			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT3__PWM1_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT3__PWM1_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x030b0
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x030b0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID	0x17059
-				MX6QDL_PAD_KEY_COL4__USB_OTG_OC	0x1b0b0
-				/* power enable, high active */
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x000b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID	0x17059
+			MX6QDL_PAD_KEY_COL4__USB_OTG_OC	0x1b0b0
+			/* power enable, high active */
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x000b0
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17071
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10071
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17071
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17071
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17071
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17071
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17071
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10071
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17071
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17071
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17071
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17071
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00 0x1b0b0	/* CD */
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00 0x1b0b0	/* CD */
+		>;
+	};
 
-		pinctrl_usdhc4: usdhc4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
-				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
-				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
-				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
-				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
-				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
-				MX6QDL_PAD_NANDF_D6__GPIO2_IO06 0x1b0b0	/* CD */
-			>;
-		};
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
+			MX6QDL_PAD_NANDF_D6__GPIO2_IO06 0x1b0b0	/* CD */
+		>;
+	};
 
-		pinctrl_wlan_vmmc: wlan-vmmcgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CS0__GPIO6_IO11	0x100b0
-				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x000b0
-				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x000b0
-				MX6QDL_PAD_SD1_CLK__OSC32K_32K_OUT	0x000b0
-			>;
-		};
+	pinctrl_wlan_vmmc: wlan-vmmcgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CS0__GPIO6_IO11	0x100b0
+			MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x000b0
+			MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x000b0
+			MX6QDL_PAD_SD1_CLK__OSC32K_32K_OUT	0x000b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
index 84f884d6e55bc..08b2dd06580ab 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
@@ -54,7 +54,7 @@ brmcf: wifi@1 {
 };
 
 &iomuxc {
-	pinctrl_uart3_bt: uart3grp-bt {
+	pinctrl_uart3_bt: uart3-btgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
 			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
@@ -66,7 +66,7 @@ MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0xb0b1  /* HOST WAKEUP */
 		>;
 	};
 
-	pinctrl_usdhc3_wl: usdhc3grp-wl {
+	pinctrl_usdhc3_wl: usdhc3-wlgrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
 			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index c0c47adc5866e..11ed349e5d673 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -227,7 +227,7 @@ &i2c3 {
 };
 
 &iomuxc {
-	imx6q-phytec-pfla02 {
+	imx6q-phytec-pfla02grp {
 		pinctrl_ecspi3: ecspi3grp {
 			fsl,pins = <
 				MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi
index eba698d04243a..64ded5e5559c7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi
@@ -154,159 +154,157 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6qdl-rex {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				/* SGTL5000 sys_mclk */
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x030b0
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* SGTL5000 sys_mclk */
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x030b0
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+		>;
+	};
 
-		pinctrl_ecspi2: ecspi2grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
-				MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
-				MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
-				/* CS */
-				MX6QDL_PAD_DISP0_DAT5__GPIO4_IO26	0x000b1
-			>;
-		};
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
+			MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
+			MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
+			/* CS */
+			MX6QDL_PAD_DISP0_DAT5__GPIO4_IO26	0x000b1
+		>;
+	};
 
-		pinctrl_ecspi3: ecspi3grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT17__ECSPI2_MISO	0x100b1
-				MX6QDL_PAD_DISP0_DAT16__ECSPI2_MOSI	0x100b1
-				MX6QDL_PAD_DISP0_DAT19__ECSPI2_SCLK	0x100b1
-				/* CS */
-				MX6QDL_PAD_DISP0_DAT18__GPIO5_IO12	0x000b1
-			>;
-		};
+	pinctrl_ecspi3: ecspi3grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT17__ECSPI2_MISO	0x100b1
+			MX6QDL_PAD_DISP0_DAT16__ECSPI2_MOSI	0x100b1
+			MX6QDL_PAD_DISP0_DAT19__ECSPI2_SCLK	0x100b1
+			/* CS */
+			MX6QDL_PAD_DISP0_DAT18__GPIO5_IO12	0x000b1
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-				/* Phy reset */
-				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x000b0
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+			/* Phy reset */
+			MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x000b0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
-				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D18__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D18__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_led: ledgrp {
-			fsl,pins = <
-				/* user led */
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000
-			>;
-		};
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			/* user led */
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000
+		>;
+	};
 
-		pinctrl_pca9535: pca9535grp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x17059
-		   >;
-		};
+	pinctrl_pca9535: pca9535grp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x17059
+	   >;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				/* power enable, high active */
-				MX6QDL_PAD_EIM_D31__GPIO3_IO31		0x10b0
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			/* power enable, high active */
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31		0x10b0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_EIM_D21__USB_OTG_OC		0x1b0b0
-				/* power enable, high active */
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x10b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_EIM_D21__USB_OTG_OC		0x1b0b0
+			/* power enable, high active */
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x10b0
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-				/* CD */
-				MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
-				/* WP */
-				MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1f0b0
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+			/* CD */
+			MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
+			/* WP */
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1f0b0
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				/* CD */
-				MX6QDL_PAD_NANDF_D0__GPIO2_IO00		0x1b0b0
-				/* WP */
-				MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1f0b0
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			/* CD */
+			MX6QDL_PAD_NANDF_D0__GPIO2_IO00		0x1b0b0
+			/* WP */
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1f0b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
index 35b6bec7a3fab..a381cb224c1e2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
@@ -472,312 +472,310 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6qdl-sabreauto {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15 0x80000000
-				MX6QDL_PAD_SD2_DAT2__GPIO1_IO13  0x80000000
-				MX6QDL_PAD_GPIO_18__SD3_VSELECT 0x17059
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CS2__GPIO6_IO15 0x80000000
+			MX6QDL_PAD_SD2_DAT2__GPIO1_IO13  0x80000000
+			MX6QDL_PAD_GPIO_18__SD3_VSELECT 0x17059
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+		>;
+	};
 
-		pinctrl_ecspi1_cs: ecspi1cs {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19 0x80000000
-			>;
-		};
+	pinctrl_ecspi1_cs: ecspi1csgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19 0x80000000
+		>;
+	};
 
-		pinctrl_egalax_int: egalax-intgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_EB0__GPIO2_IO28		0xb0b1
-			>;
-		};
+	pinctrl_egalax_int: egalax-intgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB0__GPIO2_IO28		0xb0b1
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_KEY_COL2__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_KEY_COL2__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
+		>;
+	};
 
-		pinctrl_esai: esaigrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_CRS_DV__ESAI_TX_CLK 0x1b030
-				MX6QDL_PAD_ENET_RXD1__ESAI_TX_FS    0x1b030
-				MX6QDL_PAD_ENET_TX_EN__ESAI_TX3_RX2 0x1b030
-				MX6QDL_PAD_GPIO_5__ESAI_TX2_RX3     0x1b030
-				MX6QDL_PAD_ENET_TXD0__ESAI_TX4_RX1  0x1b030
-				MX6QDL_PAD_ENET_MDC__ESAI_TX5_RX0   0x1b030
-				MX6QDL_PAD_GPIO_17__ESAI_TX0        0x1b030
-				MX6QDL_PAD_NANDF_CS3__ESAI_TX1      0x1b030
-				MX6QDL_PAD_ENET_MDIO__ESAI_RX_CLK   0x1b030
-				MX6QDL_PAD_GPIO_9__ESAI_RX_FS       0x1b030
-			>;
-		};
+	pinctrl_esai: esaigrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_CRS_DV__ESAI_TX_CLK 0x1b030
+			MX6QDL_PAD_ENET_RXD1__ESAI_TX_FS    0x1b030
+			MX6QDL_PAD_ENET_TX_EN__ESAI_TX3_RX2 0x1b030
+			MX6QDL_PAD_GPIO_5__ESAI_TX2_RX3     0x1b030
+			MX6QDL_PAD_ENET_TXD0__ESAI_TX4_RX1  0x1b030
+			MX6QDL_PAD_ENET_MDC__ESAI_TX5_RX0   0x1b030
+			MX6QDL_PAD_GPIO_17__ESAI_TX0        0x1b030
+			MX6QDL_PAD_NANDF_CS3__ESAI_TX1      0x1b030
+			MX6QDL_PAD_ENET_MDIO__ESAI_RX_CLK   0x1b030
+			MX6QDL_PAD_GPIO_9__ESAI_RX_FS       0x1b030
+		>;
+	};
 
-		pinctrl_flexcan1: flexcan1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX        0x17059
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x17059
-			>;
-		};
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX        0x17059
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x17059
+		>;
+	};
 
-		pinctrl_flexcan2: flexcan2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX	0x17059
-				MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX	0x17059
-			>;
-		};
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX	0x17059
+			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX	0x17059
+		>;
+	};
 
-		pinctrl_gpio_keys: gpiokeysgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__GPIO1_IO11		0x1b0b0
-				MX6QDL_PAD_SD2_DAT3__GPIO1_IO12		0x1b0b0
-				MX6QDL_PAD_SD4_DAT4__GPIO2_IO12		0x1b0b0
-				MX6QDL_PAD_SD4_DAT7__GPIO2_IO15		0x1b0b0
-				MX6QDL_PAD_DISP0_DAT20__GPIO5_IO14	0x1b0b0
-			>;
-		};
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__GPIO1_IO11		0x1b0b0
+			MX6QDL_PAD_SD2_DAT3__GPIO1_IO12		0x1b0b0
+			MX6QDL_PAD_SD4_DAT4__GPIO2_IO12		0x1b0b0
+			MX6QDL_PAD_SD4_DAT7__GPIO2_IO15		0x1b0b0
+			MX6QDL_PAD_DISP0_DAT20__GPIO5_IO14	0x1b0b0
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT21__GPIO5_IO15	0x80000000
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT21__GPIO5_IO15	0x80000000
+		>;
+	};
 
-		pinctrl_gpmi_nand: gpminandgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
-				MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
-				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
-				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
-				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
-				MX6QDL_PAD_NANDF_CS1__NAND_CE1_B	0xb0b1
-				MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
-				MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
-				MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
-				MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
-				MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
-				MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
-				MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
-				MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
-				MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
-				MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
-				MX6QDL_PAD_SD4_DAT0__NAND_DQS		0x00b1
-			>;
-		};
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CLE__NAND_CLE		0xb0b1
+			MX6QDL_PAD_NANDF_ALE__NAND_ALE		0xb0b1
+			MX6QDL_PAD_NANDF_WP_B__NAND_WP_B	0xb0b1
+			MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0xb000
+			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B	0xb0b1
+			MX6QDL_PAD_NANDF_CS1__NAND_CE1_B	0xb0b1
+			MX6QDL_PAD_SD4_CMD__NAND_RE_B		0xb0b1
+			MX6QDL_PAD_SD4_CLK__NAND_WE_B		0xb0b1
+			MX6QDL_PAD_NANDF_D0__NAND_DATA00	0xb0b1
+			MX6QDL_PAD_NANDF_D1__NAND_DATA01	0xb0b1
+			MX6QDL_PAD_NANDF_D2__NAND_DATA02	0xb0b1
+			MX6QDL_PAD_NANDF_D3__NAND_DATA03	0xb0b1
+			MX6QDL_PAD_NANDF_D4__NAND_DATA04	0xb0b1
+			MX6QDL_PAD_NANDF_D5__NAND_DATA05	0xb0b1
+			MX6QDL_PAD_NANDF_D6__NAND_DATA06	0xb0b1
+			MX6QDL_PAD_NANDF_D7__NAND_DATA07	0xb0b1
+			MX6QDL_PAD_SD4_DAT0__NAND_DQS		0x00b1
+		>;
+	};
 
-		pinctrl_hdmi_cec: hdmicecgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE	0x1f8b0
-			>;
-		};
+	pinctrl_hdmi_cec: hdmicecgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE	0x1f8b0
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_EB2__I2C2_SCL	0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA	0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__I2C2_SCL	0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA	0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL  0x4001b8b1
-				MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL  0x4001b8b1
+			MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3mux: i2c3muxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_A24__GPIO5_IO04 0x0b0b1
-			>;
-		};
+	pinctrl_i2c3mux: i2c3muxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A24__GPIO5_IO04 0x0b0b1
+		>;
+	};
 
-		pinctrl_ipu1_csi0: ipu1csi0grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18  0x1b0b0
-				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19  0x1b0b0
-				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK 0x1b0b0
-				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC    0x1b0b0
-				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC   0x1b0b0
-			>;
-		};
+	pinctrl_ipu1_csi0: ipu1csi0grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18  0x1b0b0
+			MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19  0x1b0b0
+			MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK 0x1b0b0
+			MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC    0x1b0b0
+			MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC   0x1b0b0
+		>;
+	};
 
-		pinctrl_max7310: max7310grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__GPIO1_IO15 0x1b0b0
-			>;
-		};
+	pinctrl_max7310: max7310grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__GPIO1_IO15 0x1b0b0
+		>;
+	};
 
-		pinctrl_mma8451_int: mma8451intgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_BCLK__GPIO6_IO31		0xb0b1
-			>;
-		};
+	pinctrl_mma8451_int: mma8451intgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_BCLK__GPIO6_IO31		0xb0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_gpt_input_capture0: gptinputcapture0grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT0__GPT_CAPTURE1	0x1b0b0
-			>;
-		};
+	pinctrl_gpt_input_capture0: gptinputcapture0grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__GPT_CAPTURE1	0x1b0b0
+		>;
+	};
 
-		pinctrl_gpt_input_capture1: gptinputcapture1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__GPT_CAPTURE2	0x1b0b0
-			>;
-		};
+	pinctrl_gpt_input_capture1: gptinputcapture1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__GPT_CAPTURE2	0x1b0b0
+		>;
+	};
 
-		pinctrl_spdif: spdifgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__SPDIF_IN 0x1b0b0
-			>;
-		};
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__SPDIF_IN 0x1b0b0
+		>;
+	};
 
-		pinctrl_uart4: uart4grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID 0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID 0x17059
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
+		>;
+	};
 
-		pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x170b9
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x170b9
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x170b9
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170b9
-			>;
-		};
+	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170b9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100b9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x170b9
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x170b9
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x170b9
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170b9
+		>;
+	};
 
-		pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x170f9
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x170f9
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x170f9
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170f9
-			>;
-		};
+	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x170f9
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x170f9
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x170f9
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x170f9
+		>;
+	};
 
-		pinctrl_weim_cs0: weimcs0grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_CS0__EIM_CS0_B		0xb0b1
-			>;
-		};
+	pinctrl_weim_cs0: weimcs0grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_CS0__EIM_CS0_B		0xb0b1
+		>;
+	};
 
-		pinctrl_weim_nor: weimnorgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_OE__EIM_OE_B		0xb0b1
-				MX6QDL_PAD_EIM_RW__EIM_RW		0xb0b1
-				MX6QDL_PAD_EIM_WAIT__EIM_WAIT_B		0xb060
-				MX6QDL_PAD_EIM_D16__EIM_DATA16		0x1b0b0
-				MX6QDL_PAD_EIM_D17__EIM_DATA17		0x1b0b0
-				MX6QDL_PAD_EIM_D18__EIM_DATA18		0x1b0b0
-				MX6QDL_PAD_EIM_D19__EIM_DATA19		0x1b0b0
-				MX6QDL_PAD_EIM_D20__EIM_DATA20		0x1b0b0
-				MX6QDL_PAD_EIM_D21__EIM_DATA21		0x1b0b0
-				MX6QDL_PAD_EIM_D22__EIM_DATA22		0x1b0b0
-				MX6QDL_PAD_EIM_D23__EIM_DATA23		0x1b0b0
-				MX6QDL_PAD_EIM_D24__EIM_DATA24		0x1b0b0
-				MX6QDL_PAD_EIM_D25__EIM_DATA25		0x1b0b0
-				MX6QDL_PAD_EIM_D26__EIM_DATA26		0x1b0b0
-				MX6QDL_PAD_EIM_D27__EIM_DATA27		0x1b0b0
-				MX6QDL_PAD_EIM_D28__EIM_DATA28		0x1b0b0
-				MX6QDL_PAD_EIM_D29__EIM_DATA29		0x1b0b0
-				MX6QDL_PAD_EIM_D30__EIM_DATA30		0x1b0b0
-				MX6QDL_PAD_EIM_D31__EIM_DATA31		0x1b0b0
-				MX6QDL_PAD_EIM_A23__EIM_ADDR23		0xb0b1
-				MX6QDL_PAD_EIM_A22__EIM_ADDR22		0xb0b1
-				MX6QDL_PAD_EIM_A21__EIM_ADDR21		0xb0b1
-				MX6QDL_PAD_EIM_A20__EIM_ADDR20		0xb0b1
-				MX6QDL_PAD_EIM_A19__EIM_ADDR19		0xb0b1
-				MX6QDL_PAD_EIM_A18__EIM_ADDR18		0xb0b1
-				MX6QDL_PAD_EIM_A17__EIM_ADDR17		0xb0b1
-				MX6QDL_PAD_EIM_A16__EIM_ADDR16		0xb0b1
-				MX6QDL_PAD_EIM_DA15__EIM_AD15		0xb0b1
-				MX6QDL_PAD_EIM_DA14__EIM_AD14		0xb0b1
-				MX6QDL_PAD_EIM_DA13__EIM_AD13		0xb0b1
-				MX6QDL_PAD_EIM_DA12__EIM_AD12		0xb0b1
-				MX6QDL_PAD_EIM_DA11__EIM_AD11		0xb0b1
-				MX6QDL_PAD_EIM_DA10__EIM_AD10		0xb0b1
-				MX6QDL_PAD_EIM_DA9__EIM_AD09		0xb0b1
-				MX6QDL_PAD_EIM_DA8__EIM_AD08		0xb0b1
-				MX6QDL_PAD_EIM_DA7__EIM_AD07		0xb0b1
-				MX6QDL_PAD_EIM_DA6__EIM_AD06		0xb0b1
-				MX6QDL_PAD_EIM_DA5__EIM_AD05		0xb0b1
-				MX6QDL_PAD_EIM_DA4__EIM_AD04		0xb0b1
-				MX6QDL_PAD_EIM_DA3__EIM_AD03		0xb0b1
-				MX6QDL_PAD_EIM_DA2__EIM_AD02		0xb0b1
-				MX6QDL_PAD_EIM_DA1__EIM_AD01		0xb0b1
-				MX6QDL_PAD_EIM_DA0__EIM_AD00		0xb0b1
-			>;
-		};
+	pinctrl_weim_nor: weimnorgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_OE__EIM_OE_B		0xb0b1
+			MX6QDL_PAD_EIM_RW__EIM_RW		0xb0b1
+			MX6QDL_PAD_EIM_WAIT__EIM_WAIT_B		0xb060
+			MX6QDL_PAD_EIM_D16__EIM_DATA16		0x1b0b0
+			MX6QDL_PAD_EIM_D17__EIM_DATA17		0x1b0b0
+			MX6QDL_PAD_EIM_D18__EIM_DATA18		0x1b0b0
+			MX6QDL_PAD_EIM_D19__EIM_DATA19		0x1b0b0
+			MX6QDL_PAD_EIM_D20__EIM_DATA20		0x1b0b0
+			MX6QDL_PAD_EIM_D21__EIM_DATA21		0x1b0b0
+			MX6QDL_PAD_EIM_D22__EIM_DATA22		0x1b0b0
+			MX6QDL_PAD_EIM_D23__EIM_DATA23		0x1b0b0
+			MX6QDL_PAD_EIM_D24__EIM_DATA24		0x1b0b0
+			MX6QDL_PAD_EIM_D25__EIM_DATA25		0x1b0b0
+			MX6QDL_PAD_EIM_D26__EIM_DATA26		0x1b0b0
+			MX6QDL_PAD_EIM_D27__EIM_DATA27		0x1b0b0
+			MX6QDL_PAD_EIM_D28__EIM_DATA28		0x1b0b0
+			MX6QDL_PAD_EIM_D29__EIM_DATA29		0x1b0b0
+			MX6QDL_PAD_EIM_D30__EIM_DATA30		0x1b0b0
+			MX6QDL_PAD_EIM_D31__EIM_DATA31		0x1b0b0
+			MX6QDL_PAD_EIM_A23__EIM_ADDR23		0xb0b1
+			MX6QDL_PAD_EIM_A22__EIM_ADDR22		0xb0b1
+			MX6QDL_PAD_EIM_A21__EIM_ADDR21		0xb0b1
+			MX6QDL_PAD_EIM_A20__EIM_ADDR20		0xb0b1
+			MX6QDL_PAD_EIM_A19__EIM_ADDR19		0xb0b1
+			MX6QDL_PAD_EIM_A18__EIM_ADDR18		0xb0b1
+			MX6QDL_PAD_EIM_A17__EIM_ADDR17		0xb0b1
+			MX6QDL_PAD_EIM_A16__EIM_ADDR16		0xb0b1
+			MX6QDL_PAD_EIM_DA15__EIM_AD15		0xb0b1
+			MX6QDL_PAD_EIM_DA14__EIM_AD14		0xb0b1
+			MX6QDL_PAD_EIM_DA13__EIM_AD13		0xb0b1
+			MX6QDL_PAD_EIM_DA12__EIM_AD12		0xb0b1
+			MX6QDL_PAD_EIM_DA11__EIM_AD11		0xb0b1
+			MX6QDL_PAD_EIM_DA10__EIM_AD10		0xb0b1
+			MX6QDL_PAD_EIM_DA9__EIM_AD09		0xb0b1
+			MX6QDL_PAD_EIM_DA8__EIM_AD08		0xb0b1
+			MX6QDL_PAD_EIM_DA7__EIM_AD07		0xb0b1
+			MX6QDL_PAD_EIM_DA6__EIM_AD06		0xb0b1
+			MX6QDL_PAD_EIM_DA5__EIM_AD05		0xb0b1
+			MX6QDL_PAD_EIM_DA4__EIM_AD04		0xb0b1
+			MX6QDL_PAD_EIM_DA3__EIM_AD03		0xb0b1
+			MX6QDL_PAD_EIM_DA2__EIM_AD02		0xb0b1
+			MX6QDL_PAD_EIM_DA1__EIM_AD01		0xb0b1
+			MX6QDL_PAD_EIM_DA0__EIM_AD00		0xb0b1
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
index 9c502bf77d0bf..bdef7e642d3cf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
@@ -389,243 +389,241 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6q-sabrelite {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				/* SGTL5000 sys_mclk */
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x030b0
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* SGTL5000 sys_mclk */
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x030b0
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
-				MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
-				MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
-				MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__AUD4_RXD		0x130b0
+			MX6QDL_PAD_SD2_DAT3__AUD4_TXC		0x130b0
+			MX6QDL_PAD_SD2_DAT2__AUD4_TXD		0x110b0
+			MX6QDL_PAD_SD2_DAT1__AUD4_TXFS		0x130b0
+		>;
+	};
 
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b0
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b0
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
+		>;
+	};
 
-		pinctrl_can_xcvr: can-xcvrgrp {
-			fsl,pins = <
-				/* Flexcan XCVR enable */
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
-			>;
-		};
+	pinctrl_can_xcvr: can-xcvrgrp {
+		fsl,pins = <
+			/* Flexcan XCVR enable */
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19  0x000b1	/* CS */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19  0x000b1	/* CS */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x10030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x10030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x10030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x10030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x10030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x10030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				/* Phy reset */
-				MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x000b0
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x10030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x10030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x10030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x10030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x10030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x10030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			/* Phy reset */
+			MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x000b0
+		>;
+	};
 
-		pinctrl_gpio_keys: gpio-keysgrp {
-			fsl,pins = <
-				/* Power Button */
-				MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
-				/* Menu Button */
-				MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
-				/* Home Button */
-				MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x1b0b0
-				/* Back Button */
-				MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
-				/* Volume Up Button */
-				MX6QDL_PAD_GPIO_18__GPIO7_IO13		0x1b0b0
-				/* Volume Down Button */
-				MX6QDL_PAD_GPIO_19__GPIO4_IO05		0x1b0b0
-			>;
-		};
+	pinctrl_gpio_keys: gpio-keysgrp {
+		fsl,pins = <
+			/* Power Button */
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03		0x1b0b0
+			/* Menu Button */
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01		0x1b0b0
+			/* Home Button */
+			MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x1b0b0
+			/* Back Button */
+			MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
+			/* Volume Up Button */
+			MX6QDL_PAD_GPIO_18__GPIO7_IO13		0x1b0b0
+			/* Volume Down Button */
+			MX6QDL_PAD_GPIO_19__GPIO4_IO05		0x1b0b0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_ipu1_csi0: ipu1csi0grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
-				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
-				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
-				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
-				MX6QDL_PAD_CSI0_DATA_EN__IPU1_CSI0_DATA_EN 0x1b0b0
-			>;
-		};
+	pinctrl_ipu1_csi0: ipu1csi0grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
+			MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
+			MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
+			MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
+			MX6QDL_PAD_CSI0_DATA_EN__IPU1_CSI0_DATA_EN 0x1b0b0
+		>;
+	};
 
-		pinctrl_j15: j15grp {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
-				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
-				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
-				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
-				MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
-				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
-				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
-				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
-				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
-				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
-				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
-				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
-				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
-				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
-				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
-				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
-				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
-				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
-				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
-				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
-				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
-				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
-				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
-				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
-				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
-				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
-				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
-				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
-			>;
-		};
+	pinctrl_j15: j15grp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
+			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
+			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
+			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
+			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
+			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
+			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
+			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
+			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
+			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
+			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
+			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
+			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
+			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
+			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
+			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
+			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
+			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
+			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
+			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
+			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
+			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
+			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
+			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
+			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
+			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
+			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
+			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
+		>;
+	};
 
-		pinctrl_ov5640: ov5640grp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_D5__GPIO2_IO05   0x000b0
-				MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09 0x0b0b0
-			>;
-		};
+	pinctrl_ov5640: ov5640grp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D5__GPIO2_IO05   0x000b0
+			MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09 0x0b0b0
+		>;
+	};
 
-		pinctrl_ov5642: ov5642grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT0__GPIO1_IO16 0x1b0b0
-				MX6QDL_PAD_GPIO_6__GPIO1_IO06   0x1b0b0
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08   0x130b0
-				MX6QDL_PAD_GPIO_3__CCM_CLKO2    0x000b0
-			>;
-		};
+	pinctrl_ov5642: ov5642grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__GPIO1_IO16 0x1b0b0
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06   0x1b0b0
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08   0x130b0
+			MX6QDL_PAD_GPIO_3__CCM_CLKO2    0x000b0
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT3__PWM1_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT3__PWM1_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT 0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT 0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x030b0
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x030b0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-				MX6QDL_PAD_KEY_COL4__USB_OTG_OC	0x1b0b0
-				/* power enable, high active */
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x000b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+			MX6QDL_PAD_KEY_COL4__USB_OTG_OC	0x1b0b0
+			/* power enable, high active */
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x000b0
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00 0x1b0b0	/* CD */
-				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01 0x1f0b0	/* WP */
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00 0x1b0b0	/* CD */
+			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01 0x1f0b0	/* WP */
+		>;
+	};
 
-		pinctrl_usdhc4: usdhc4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
-				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
-				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
-				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
-				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
-				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
-				MX6QDL_PAD_NANDF_D6__GPIO2_IO06 0x1b0b0	/* CD */
-			>;
-		};
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
+			MX6QDL_PAD_NANDF_D6__GPIO2_IO06 0x1b0b0	/* CD */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index 8f4f5fba68cc5..dc8298f6db34b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -480,251 +480,247 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6qdl-sabresd {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
-				MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x1b0b0
-				MX6QDL_PAD_NANDF_D2__GPIO2_IO02 0x1b0b0
-				MX6QDL_PAD_NANDF_D3__GPIO2_IO03 0x1b0b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
-				MX6QDL_PAD_NANDF_CLE__GPIO6_IO07 0x1b0b0
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x1b0b0
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x1b0b0
-				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x1b0b0
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x1b0b0
+			MX6QDL_PAD_NANDF_D2__GPIO2_IO02 0x1b0b0
+			MX6QDL_PAD_NANDF_D3__GPIO2_IO03 0x1b0b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
+			MX6QDL_PAD_NANDF_CLE__GPIO6_IO07 0x1b0b0
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x1b0b0
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x1b0b0
+			MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x1b0b0
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__ECSPI1_MISO	0x100b1
-				MX6QDL_PAD_KEY_ROW0__ECSPI1_MOSI	0x100b1
-				MX6QDL_PAD_KEY_COL0__ECSPI1_SCLK	0x100b1
-				MX6QDL_PAD_KEY_ROW1__GPIO4_IO09		0x1b0b0
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__ECSPI1_MISO	0x100b1
+			MX6QDL_PAD_KEY_ROW0__ECSPI1_MOSI	0x100b1
+			MX6QDL_PAD_KEY_COL0__ECSPI1_SCLK	0x100b1
+			MX6QDL_PAD_KEY_ROW1__GPIO4_IO09		0x1b0b0
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_gpio_keys: gpio_keysgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x1b0b0
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x1b0b0
-				MX6QDL_PAD_GPIO_5__GPIO1_IO05  0x1b0b0
-			>;
-		};
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x1b0b0
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x1b0b0
+			MX6QDL_PAD_GPIO_5__GPIO1_IO05  0x1b0b0
+		>;
+	};
 
-		pinctrl_hdmi_cec: hdmicecgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE	0x1f8b0
-			>;
-		};
+	pinctrl_hdmi_cec: hdmicecgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE	0x1f8b0
+		>;
+	};
 
-		pinctrl_hp: hpgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_RST__GPIO7_IO08          0x1b0b0
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09           0x1b0b0
-			>;
-		};
+	pinctrl_hp: hpgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_RST__GPIO7_IO08          0x1b0b0
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09           0x1b0b0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
-				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c1_mma8451_int: i2c1mma8451intgrp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__GPIO1_IO18		0xb0b1
-			>;
-		};
+	pinctrl_i2c1_mma8451_int: i2c1mma8451intgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__GPIO1_IO18		0xb0b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2_egalax_int: i2c2egalaxintgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x1b0b0
-			>;
-		};
+	pinctrl_i2c2_egalax_int: i2c2egalaxintgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x1b0b0
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3_isl29023_int: i2c3isl29023intgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0xb0b1
-			>;
-		};
+	pinctrl_i2c3_isl29023_int: i2c3isl29023intgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0xb0b1
+		>;
+	};
 
-		pinctrl_i2c3_mag3110_int: i2c3mag3110intgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D16__GPIO3_IO16		0xb0b1
-			>;
-		};
+	pinctrl_i2c3_mag3110_int: i2c3mag3110intgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D16__GPIO3_IO16		0xb0b1
+		>;
+	};
 
-		pinctrl_ipu1_csi0: ipu1csi0grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
-				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
-				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
-				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
-				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
-			>;
-		};
+	pinctrl_ipu1_csi0: ipu1csi0grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
+			MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
+			MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
+			MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
+			MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
+		>;
+	};
 
-		pinctrl_ov5640: ov5640grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT2__GPIO1_IO19 0x1b0b0
-				MX6QDL_PAD_SD1_CLK__GPIO1_IO20  0x1b0b0
-			>;
-		};
+	pinctrl_ov5640: ov5640grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__GPIO1_IO19 0x1b0b0
+			MX6QDL_PAD_SD1_CLK__GPIO1_IO20  0x1b0b0
+		>;
+	};
 
-		pinctrl_ov5642: ov5642grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT0__GPIO1_IO16 0x1b0b0
-				MX6QDL_PAD_SD1_DAT1__GPIO1_IO17 0x1b0b0
-			>;
-		};
+	pinctrl_ov5642: ov5642grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__GPIO1_IO16 0x1b0b0
+			MX6QDL_PAD_SD1_DAT1__GPIO1_IO17 0x1b0b0
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_17__GPIO7_IO12	0x1b0b0
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12	0x1b0b0
+		>;
+	};
 
-		pinctrl_pcie_reg: pciereggrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19	0x1b0b0
-			>;
-		};
+	pinctrl_pcie_reg: pciereggrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19	0x1b0b0
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT3__PWM1_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT3__PWM1_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_sensors_reg: sensorsreggrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_EB3__GPIO2_IO31		0x1b0b0
-			>;
-		};
+	pinctrl_sensors_reg: sensorsreggrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB3__GPIO2_IO31		0x1b0b0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-				MX6QDL_PAD_NANDF_D4__SD2_DATA4		0x17059
-				MX6QDL_PAD_NANDF_D5__SD2_DATA5		0x17059
-				MX6QDL_PAD_NANDF_D6__SD2_DATA6		0x17059
-				MX6QDL_PAD_NANDF_D7__SD2_DATA7		0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+			MX6QDL_PAD_NANDF_D4__SD2_DATA4		0x17059
+			MX6QDL_PAD_NANDF_D5__SD2_DATA5		0x17059
+			MX6QDL_PAD_NANDF_D6__SD2_DATA6		0x17059
+			MX6QDL_PAD_NANDF_D7__SD2_DATA7		0x17059
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
+		>;
+	};
 
-		pinctrl_usdhc4: usdhc4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
-				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
-				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
-				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
-				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
-				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
-				MX6QDL_PAD_SD4_DAT4__SD4_DATA4		0x17059
-				MX6QDL_PAD_SD4_DAT5__SD4_DATA5		0x17059
-				MX6QDL_PAD_SD4_DAT6__SD4_DATA6		0x17059
-				MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
-			>;
-		};
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
+			MX6QDL_PAD_SD4_DAT4__SD4_DATA4		0x17059
+			MX6QDL_PAD_SD4_DAT5__SD4_DATA5		0x17059
+			MX6QDL_PAD_SD4_DAT6__SD4_DATA6		0x17059
+			MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__WDOG2_B		0x1b0b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__WDOG2_B		0x1b0b0
+		>;
 	};
 
-	gpio_leds {
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x1b0b0
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x1b0b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi
index 234827e554d0f..60e446ba8f523 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi
@@ -93,49 +93,47 @@ &i2c3 {
 &iomuxc {
 	pinctrl-0 = <&pinctrl_hog>, <&pinctrl_solidsense_hog>;
 
-	solidsense {
-		pinctrl_solidsense_hog: solidsense-hog {
-			fsl,pins = <
-				/* Nordic RESET_N */
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09 0x400130b1
-				/* Nordic Chip 1 SWDIO - GPIO 125 */
-				MX6QDL_PAD_DISP0_DAT8__GPIO4_IO29 0x400130b1
-				/* Nordic Chip 1 SWDCLK - GPIO 59 */
-				/* already claimed in the HB2 hogs */
-				/* MX6QDL_PAD_EIM_LBA__GPIO2_IO27 0x400130b1 */
-				/* Nordic Chip 2 SWDIO - GPIO 81 */
-				MX6QDL_PAD_EIM_D17__GPIO3_IO17 0x400130b1
-				/* Nordic Chip 2 SWCLK - GPIO 82 */
-				MX6QDL_PAD_EIM_D18__GPIO3_IO18 0x400130b1
-			>;
-		};
+	pinctrl_solidsense_hog: solidsense-hoggrp {
+		fsl,pins = <
+			/* Nordic RESET_N */
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09 0x400130b1
+			/* Nordic Chip 1 SWDIO - GPIO 125 */
+			MX6QDL_PAD_DISP0_DAT8__GPIO4_IO29 0x400130b1
+			/* Nordic Chip 1 SWDCLK - GPIO 59 */
+			/* already claimed in the HB2 hogs */
+			/* MX6QDL_PAD_EIM_LBA__GPIO2_IO27 0x400130b1 */
+			/* Nordic Chip 2 SWDIO - GPIO 81 */
+			MX6QDL_PAD_EIM_D17__GPIO3_IO17 0x400130b1
+			/* Nordic Chip 2 SWCLK - GPIO 82 */
+			MX6QDL_PAD_EIM_D18__GPIO3_IO18 0x400130b1
+		>;
+	};
 
-		pinctrl_solidsense_leds: solidsense-leds {
-			fsl,pins = <
-				/* Red LED 1 - GPIO 58 */
-				MX6QDL_PAD_EIM_RW__GPIO2_IO26 0x400130b1
-				/* Green LED 1 - GPIO 55 */
-				MX6QDL_PAD_EIM_CS0__GPIO2_IO23 0x400130b1
-				/* Red LED 2 - GPIO 57 */
-				MX6QDL_PAD_EIM_OE__GPIO2_IO25 0x400130b1
-				/* Green LED 2 - GPIO 56 */
-				MX6QDL_PAD_EIM_CS1__GPIO2_IO24 0x400130b1
-			>;
-		};
+	pinctrl_solidsense_leds: solidsense-ledsgrp {
+		fsl,pins = <
+			/* Red LED 1 - GPIO 58 */
+			MX6QDL_PAD_EIM_RW__GPIO2_IO26 0x400130b1
+			/* Green LED 1 - GPIO 55 */
+			MX6QDL_PAD_EIM_CS0__GPIO2_IO23 0x400130b1
+			/* Red LED 2 - GPIO 57 */
+			MX6QDL_PAD_EIM_OE__GPIO2_IO25 0x400130b1
+			/* Green LED 2 - GPIO 56 */
+			MX6QDL_PAD_EIM_CS1__GPIO2_IO24 0x400130b1
+		>;
+	};
 
-		pinctrl_solidsense_uart2: solidsense-uart2 {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_solidsense_uart2: solidsense-uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_solidsense_uart3: solidsense-uart3 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_solidsense_uart3: solidsense-uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
index b55af61dfecab..e491f5c9d4551 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
@@ -70,55 +70,53 @@ usdhc1_pwrseq: usdhc1_pwrseq {
 };
 
 &iomuxc {
-	microsom {
-		pinctrl_microsom_brcm_bt: microsom-brcm-bt {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x40013070
-				MX6QDL_PAD_CSI0_DAT15__GPIO6_IO01	0x40013070
-				MX6QDL_PAD_CSI0_DAT18__GPIO6_IO04	0x40013070
-			>;
-		};
+	pinctrl_microsom_brcm_bt: microsom-brcm-btgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x40013070
+			MX6QDL_PAD_CSI0_DAT15__GPIO6_IO01	0x40013070
+			MX6QDL_PAD_CSI0_DAT18__GPIO6_IO04	0x40013070
+		>;
+	};
 
-		pinctrl_microsom_brcm_osc: microsom-brcm-osc {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT11__GPIO5_IO05	0x40013070
-			>;
-		};
+	pinctrl_microsom_brcm_osc: microsom-brcm-oscgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT11__GPIO5_IO05	0x40013070
+		>;
+	};
 
-		pinctrl_microsom_brcm_reg: microsom-brcm-reg {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x40013070
-			>;
-		};
+	pinctrl_microsom_brcm_reg: microsom-brcm-reggrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x40013070
+		>;
+	};
 
-		pinctrl_microsom_brcm_wifi: microsom-brcm-wifi {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__XTALOSC_REF_CLK_32K	0x1b0b0
-				MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20	0x40013070
-				MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x40013070
-				MX6QDL_PAD_CSI0_DAT9__GPIO5_IO27	0x40013070
-			>;
-		};
+	pinctrl_microsom_brcm_wifi: microsom-brcm-wifigrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__XTALOSC_REF_CLK_32K	0x1b0b0
+			MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20	0x40013070
+			MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x40013070
+			MX6QDL_PAD_CSI0_DAT9__GPIO5_IO27	0x40013070
+		>;
+	};
 
-		pinctrl_microsom_uart4: microsom-uart4 {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA 0x1b0b1
-				MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA 0x1b0b1
-				MX6QDL_PAD_CSI0_DAT16__UART4_RTS_B 0x1b0b1
-				MX6QDL_PAD_CSI0_DAT17__UART4_CTS_B 0x1b0b1
-			>;
-		};
+	pinctrl_microsom_uart4: microsom-uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA 0x1b0b1
+			MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA 0x1b0b1
+			MX6QDL_PAD_CSI0_DAT16__UART4_RTS_B 0x1b0b1
+			MX6QDL_PAD_CSI0_DAT17__UART4_CTS_B 0x1b0b1
+		>;
+	};
 
-		pinctrl_microsom_usdhc1: microsom-usdhc1 {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17059
-				MX6QDL_PAD_SD1_CLK__SD1_CLK    0x10059
-				MX6QDL_PAD_SD1_DAT0__SD1_DATA0 0x17059
-				MX6QDL_PAD_SD1_DAT1__SD1_DATA1 0x17059
-				MX6QDL_PAD_SD1_DAT2__SD1_DATA2 0x17059
-				MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059
-			>;
-		};
+	pinctrl_microsom_usdhc1: microsom-usdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17059
+			MX6QDL_PAD_SD1_CLK__SD1_CLK    0x10059
+			MX6QDL_PAD_SD1_DAT0__SD1_DATA0 0x17059
+			MX6QDL_PAD_SD1_DAT1__SD1_DATA1 0x17059
+			MX6QDL_PAD_SD1_DAT2__SD1_DATA2 0x17059
+			MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi
index 5f3b8baab20ff..ddca24414d262 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi
@@ -40,22 +40,20 @@
  */
 
 &iomuxc {
-	microsom {
-		pinctrl_microsom_usdhc3: microsom-usdhc3 {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x17059
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
-				MX6QDL_PAD_SD3_RST__SD3_RESET  0x17059
-			>;
-		};
+	pinctrl_microsom_usdhc3: microsom-usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
+			MX6QDL_PAD_SD3_RST__SD3_RESET  0x17059
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
index 352ac585ca6b8..cd1e682f11add 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
@@ -76,56 +76,54 @@ pwrseq_ti_wifi: ti-wifi-pwrseq {
 };
 
 &iomuxc {
-	microsom {
-		pinctrl_microsom_ti_bt: microsom-ti-bt {
-			fsl,pins = <
-				/* BT_EN_SOC */
-				MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x40013070
-			>;
-		};
+	pinctrl_microsom_ti_bt: microsom-ti-btgrp {
+		fsl,pins = <
+			/* BT_EN_SOC */
+			MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x40013070
+		>;
+	};
 
-		pinctrl_microsom_ti_clk: microsom-ti-clk {
-			fsl,pins = <
-				/* EXT_32K */
-				MX6QDL_PAD_GPIO_8__XTALOSC_REF_CLK_32K	0x1b0b0
-				/* WL_XTAL_PU (unrouted) */
-				MX6QDL_PAD_DISP0_DAT11__GPIO5_IO05 0x40013070
-			>;
-		};
+	pinctrl_microsom_ti_clk: microsom-ti-clkgrp {
+		fsl,pins = <
+			/* EXT_32K */
+			MX6QDL_PAD_GPIO_8__XTALOSC_REF_CLK_32K	0x1b0b0
+			/* WL_XTAL_PU (unrouted) */
+			MX6QDL_PAD_DISP0_DAT11__GPIO5_IO05 0x40013070
+		>;
+	};
 
-		pinctrl_microsom_ti_wifi_en: microsom-ti-wifi-en {
-			fsl,pins = <
-				/* WLAN_EN_SOC */
-				MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x40013070
-			>;
-		};
+	pinctrl_microsom_ti_wifi_en: microsom-ti-wifi-engrp {
+		fsl,pins = <
+			/* WLAN_EN_SOC */
+			MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x40013070
+		>;
+	};
 
-		pinctrl_microsom_ti_wifi_irq: microsom-ti-wifi-irq {
-			fsl,pins = <
-				/* WLAN_IRQ */
-				MX6QDL_PAD_CSI0_DAT18__GPIO6_IO04	0x40013070
-			>;
-		};
+	pinctrl_microsom_ti_wifi_irq: microsom-ti-wifi-irqgrp {
+		fsl,pins = <
+			/* WLAN_IRQ */
+			MX6QDL_PAD_CSI0_DAT18__GPIO6_IO04	0x40013070
+		>;
+	};
 
-		pinctrl_microsom_uart4: microsom-uart4 {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA 0x1b0b1
-				MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA 0x1b0b1
-				MX6QDL_PAD_CSI0_DAT16__UART4_RTS_B 0x1b0b1
-				MX6QDL_PAD_CSI0_DAT17__UART4_CTS_B 0x1b0b1
-			>;
-		};
+	pinctrl_microsom_uart4: microsom-uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA 0x1b0b1
+			MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA 0x1b0b1
+			MX6QDL_PAD_CSI0_DAT16__UART4_RTS_B 0x1b0b1
+			MX6QDL_PAD_CSI0_DAT17__UART4_CTS_B 0x1b0b1
+		>;
+	};
 
-		pinctrl_microsom_usdhc1: microsom-usdhc1 {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17059
-				MX6QDL_PAD_SD1_CLK__SD1_CLK    0x10059
-				MX6QDL_PAD_SD1_DAT0__SD1_DATA0 0x17059
-				MX6QDL_PAD_SD1_DAT1__SD1_DATA1 0x17059
-				MX6QDL_PAD_SD1_DAT2__SD1_DATA2 0x17059
-				MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059
-			>;
-		};
+	pinctrl_microsom_usdhc1: microsom-usdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17059
+			MX6QDL_PAD_SD1_CLK__SD1_CLK    0x10059
+			MX6QDL_PAD_SD1_DAT0__SD1_DATA0 0x17059
+			MX6QDL_PAD_SD1_DAT1__SD1_DATA1 0x17059
+			MX6QDL_PAD_SD1_DAT2__SD1_DATA2 0x17059
+			MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi
index ce543e325cd30..7af74b203e399 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi
@@ -97,57 +97,55 @@ ethernet-phy@1 {
 };
 
 &iomuxc {
-	microsom {
-		pinctrl_microsom_enet_ar8035: microsom-enet-ar8035 {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b8b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				/* AR8035 reset */
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x130b0
-				/* AR8035 interrupt */
-				MX6QDL_PAD_DI0_PIN2__GPIO4_IO18		0x1b0b0
-				/* GPIO16 -> AR8035 25MHz */
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x13030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				/* AR8035 CLK_25M --> ENET_REF_CLK (V22) */
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x0a0b1
-				/* AR8035 pin strapping: IO voltage: pull up */
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				/* AR8035 pin strapping: PHYADDR#0: pull down */
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x13030
-				/* AR8035 pin strapping: PHYADDR#1: pull down */
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x13030
-				/* AR8035 pin strapping: MODE#1: pull up */
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				/* AR8035 pin strapping: MODE#3: pull up */
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				/* AR8035 pin strapping: MODE#0: pull down */
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x13030
+	pinctrl_microsom_enet_ar8035: microsom-enet-ar8035grp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b8b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			/* AR8035 reset */
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x130b0
+			/* AR8035 interrupt */
+			MX6QDL_PAD_DI0_PIN2__GPIO4_IO18		0x1b0b0
+			/* GPIO16 -> AR8035 25MHz */
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x13030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			/* AR8035 CLK_25M --> ENET_REF_CLK (V22) */
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x0a0b1
+			/* AR8035 pin strapping: IO voltage: pull up */
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			/* AR8035 pin strapping: PHYADDR#0: pull down */
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x13030
+			/* AR8035 pin strapping: PHYADDR#1: pull down */
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x13030
+			/* AR8035 pin strapping: MODE#1: pull up */
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			/* AR8035 pin strapping: MODE#3: pull up */
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			/* AR8035 pin strapping: MODE#0: pull down */
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x13030
 
-				/*
-				 * As the RMII pins are also connected to RGMII
-				 * so that an AR8030 can be placed, set these
-				 * to high-z with the same pulls as above.
-				 * Use the GPIO settings to avoid changing the
-				 * input select registers.
-				 */
-				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x03000
-				MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x03000
-				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x03000
-			>;
-		};
+			/*
+			 * As the RMII pins are also connected to RGMII
+			 * so that an AR8030 can be placed, set these
+			 * to high-z with the same pulls as above.
+			 * Use the GPIO settings to avoid changing the
+			 * input select registers.
+			 */
+			MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x03000
+			MX6QDL_PAD_ENET_RXD0__GPIO1_IO27	0x03000
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x03000
+		>;
+	};
 
-		pinctrl_microsom_uart1: microsom-uart1 {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_microsom_uart1: microsom-uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
index e2db875b61c4e..11c70431feec9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
@@ -265,7 +265,7 @@ MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x100b1 /* Onboard Flash CS */
 		>;
 	};
 
-	pinctrl_ecspi2: ecspi2 {
+	pinctrl_ecspi2: ecspi2grp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT8__ECSPI2_SCLK      0x100b1
 			MX6QDL_PAD_CSI0_DAT9__ECSPI2_MOSI      0x100b1
@@ -280,7 +280,7 @@ MX6QDL_PAD_GPIO_4__GPIO1_IO04          0x1b088 /* FPGA_IRQ_1 */
 		>;
 	};
 
-	pinctrl_enet: enet {
+	pinctrl_enet: enetgrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
 			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi
index 14272b42f9a1a..2be7dc4a97818 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi
@@ -117,132 +117,130 @@ touchscreenp7: touchscreenp7@55 {
 };
 
 &iomuxc {
-	imx6q-udoo {
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001f8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001f8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001f8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001f8b1
+		>;
+	};
 
-		pinctrl_panel: panelgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x70
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x70
-			>;
-		};
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x70
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x70
+		>;
+	};
 
-		pinctrl_power_off: poweroffgrp {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x30
-			>;
-		};
+	pinctrl_power_off: poweroffgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D4__GPIO2_IO04		0x30
+		>;
+	};
 
-		pinctrl_touchscreenp7: touchscreenp7grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_DAT0__GPIO1_IO15		0x70
-				MX6QDL_PAD_SD2_DAT2__GPIO1_IO13		0x1b0b0
-			>;
-		};
+	pinctrl_touchscreenp7: touchscreenp7grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_DAT0__GPIO1_IO15		0x70
+			MX6QDL_PAD_SD2_DAT2__GPIO1_IO13		0x1b0b0
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart4: uart4grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbh: usbhgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x80000000
-				MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x130b0
-			>;
-		};
+	pinctrl_usbh: usbhgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x80000000
+			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x130b0
+		>;
+	};
 
-		pinctrl_usbotg: usbotg {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x17059
-				MX6QDL_PAD_EIM_D22__USB_OTG_PWR 0x17059
-				MX6QDL_PAD_EIM_D21__USB_OTG_OC 0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x17059
+			MX6QDL_PAD_EIM_D22__USB_OTG_PWR 0x17059
+			MX6QDL_PAD_EIM_D21__USB_OTG_OC 0x17059
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x1b0b0
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x1b0b0
+		>;
+	};
 
-		pinctrl_ac97_running: ac97running {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x1b0b0
-				MX6QDL_PAD_DI0_PIN3__AUD6_TXFS		0x1b0b0
-				MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x13080
-				MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x13080
-				MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
-			>;
-		};
+	pinctrl_ac97_running: ac97runninggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x1b0b0
+			MX6QDL_PAD_DI0_PIN3__AUD6_TXFS		0x1b0b0
+			MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x13080
+			MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x13080
+			MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
+		>;
+	};
 
-		pinctrl_ac97_warm_reset: ac97warmreset {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x1b0b0
-				MX6QDL_PAD_DI0_PIN3__GPIO4_IO19		0x1b0b0
-				MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x13080
-				MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x13080
-				MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
-			>;
-		};
+	pinctrl_ac97_warm_reset: ac97warmresetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x1b0b0
+			MX6QDL_PAD_DI0_PIN3__GPIO4_IO19		0x1b0b0
+			MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x13080
+			MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x13080
+			MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
+		>;
+	};
 
-		pinctrl_ac97_reset: ac97reset {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_PIN2__GPIO4_IO18		0x1b0b0
-				MX6QDL_PAD_DI0_PIN3__GPIO4_IO19		0x1b0b0
-				MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x13080
-				MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x13080
-				MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
-			>;
-		};
+	pinctrl_ac97_reset: ac97resetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_PIN2__GPIO4_IO18		0x1b0b0
+			MX6QDL_PAD_DI0_PIN3__GPIO4_IO19		0x1b0b0
+			MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x13080
+			MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x13080
+			MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x1b0b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
index d8283eade43e7..7749074e438d8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
@@ -194,7 +194,7 @@ &i2c3 {
 };
 
 &iomuxc {
-	pinctrl_audmux: audmux {
+	pinctrl_audmux: audmuxgrp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
 			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
@@ -205,7 +205,7 @@ MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0
 		>;
 	};
 
-	pinctrl_bt: bt {
+	pinctrl_bt: btgrp {
 		fsl,pins = <
 			/* Bluetooth enable */
 			MX6QDL_PAD_SD3_DAT6__GPIO6_IO18		0x1b0b1
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revb1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revb1.dtsi
index e781a45785ed8..44686c57730ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revb1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revb1.dtsi
@@ -9,7 +9,7 @@
 &iomuxc {
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6qdl-wandboard {
+	imx6qdl-wandboardgrp {
 		pinctrl_hog: hoggrp {
 			fsl,pins = <
 				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000	/* uSDHC1 CD */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revc1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revc1.dtsi
index 3874e74703f09..cc707972f548c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revc1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revc1.dtsi
@@ -7,24 +7,22 @@
 #include "imx6qdl-wandboard.dtsi"
 
 &iomuxc {
-	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-0 = <&pinctrl_hog_c1>;
 
-	imx6qdl-wandboard {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000	/* uSDHC1 CD */
-				MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0x80000000	/* uSDHC3 CD */
-				MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x0f0b0		/* WIFI_ON (reset, active low) */
-				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x000b0		/* WL_REG_ON (unused) */
-				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x80000000	/* WL_HOST_WAKE, input */
-				MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x0f0b0		/* GPIO5_IO31 (Wifi Power Enable) */
-				MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x80000000	/* WL_WAKE (unused) */
-				MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x80000000	/* BT_ON */
-				MX6QDL_PAD_CSI0_DAT12__GPIO5_IO30	0x80000000	/* BT_WAKE */
-				MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20	0x80000000	/* BT_HOST_WAKE */
-				MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x80000000	/* RGMII_nRST */
-			>;
-		};
+	pinctrl_hog_c1: hogc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000	/* uSDHC1 CD */
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0x80000000	/* uSDHC3 CD */
+			MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x0f0b0		/* WIFI_ON (reset, active low) */
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x000b0		/* WL_REG_ON (unused) */
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x80000000	/* WL_HOST_WAKE, input */
+			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x0f0b0		/* GPIO5_IO31 (Wifi Power Enable) */
+			MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x80000000	/* WL_WAKE (unused) */
+			MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x80000000	/* BT_ON */
+			MX6QDL_PAD_CSI0_DAT12__GPIO5_IO30	0x80000000	/* BT_WAKE */
+			MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20	0x80000000	/* BT_HOST_WAKE */
+			MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x80000000	/* RGMII_nRST */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi
index 9b8c9c23ab547..8d44e758f1f33 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi
@@ -137,49 +137,47 @@ &fec {
 };
 
 &iomuxc {
-	pinctrl-0 = <&pinctrl_hog>;
-
-	imx6qdl-wandboard {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000	/* USDHC1 CD */
-				MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0x80000000	/* uSDHC3 CD */
-				MX6QDL_PAD_EIM_D29__GPIO3_IO29   	0x1f0b1		/* RGMII PHY reset */
-			>;
-		};
+	pinctrl-0 = <&pinctrl_hog_d1>;
+
+	pinctrl_hog_d1: hoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000	/* USDHC1 CD */
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0x80000000	/* uSDHC3 CD */
+			MX6QDL_PAD_EIM_D29__GPIO3_IO29   	0x1f0b1		/* RGMII PHY reset */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-			>;
-		};
+	enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_spdif: spdifgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_19__SPDIF_OUT		0x1b0b0
-			>;
-		};
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_19__SPDIF_OUT		0x1b0b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 7130b9c3b3aa0..26489eccd5fbe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -157,146 +157,143 @@ ov5645_to_mipi_csi2: endpoint {
 &iomuxc {
 	pinctrl-names = "default";
 
-	imx6qdl-wandboard {
-
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c1_gpio: i2c1gpiogrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__GPIO3_IO21		0x4001b8b0
-				MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x4001b8b0
-			>;
-		};
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__GPIO3_IO21		0x4001b8b0
+			MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x4001b8b0
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2_gpio: i2c2gpiogrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x4001b8b0
-				MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x4001b8b0
-			>;
-		};
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x4001b8b0
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x4001b8b0
+		>;
+	};
 
-		pinctrl_mclk: mclkgrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0
-			>;
-		};
+	pinctrl_mclk: mclkgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0
+		>;
+	};
 
-		pinctrl_ov5645: ov5645grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__CCM_CLKO2		0x000b0
-				MX6QDL_PAD_GPIO_6__GPIO1_IO06		0x1b0b0
-				MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0
-			>;
-		};
+	pinctrl_ov5645: ov5645grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__CCM_CLKO2		0x000b0
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06		0x1b0b0
+			MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0
+		>;
+	};
 
-		pinctrl_spdif: spdifgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RXD0__SPDIF_OUT		0x1b0b0
-			>;
-		};
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RXD0__SPDIF_OUT		0x1b0b0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
-				MX6QDL_PAD_EIM_EB3__UART3_RTS_B		0x1b0b1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_EB3__UART3_RTS_B		0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
+		>;
+	};
 
-		pinctrl_usbotgvbus: usbotgvbusgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x130b0
-			>;
-		};
+	pinctrl_usbotgvbus: usbotgvbusgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x130b0
+		>;
+	};
 
-		pinctrl_usdhc1: usdhc1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__SD1_CMD		0x17059
-				MX6QDL_PAD_SD1_CLK__SD1_CLK		0x10059
-				MX6QDL_PAD_SD1_DAT0__SD1_DATA0		0x17059
-				MX6QDL_PAD_SD1_DAT1__SD1_DATA1		0x17059
-				MX6QDL_PAD_SD1_DAT2__SD1_DATA2		0x17059
-				MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__SD1_CMD		0x17059
+			MX6QDL_PAD_SD1_CLK__SD1_CLK		0x10059
+			MX6QDL_PAD_SD1_DAT0__SD1_DATA0		0x17059
+			MX6QDL_PAD_SD1_DAT1__SD1_DATA1		0x17059
+			MX6QDL_PAD_SD1_DAT2__SD1_DATA2		0x17059
+			MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x17059
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+		>;
 	};
 };
 
-- 
2.45.2


