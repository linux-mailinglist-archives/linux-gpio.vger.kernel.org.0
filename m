Return-Path: <linux-gpio+bounces-24326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F49B23AA8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 23:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2E21AA0BE0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 21:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C87A2D73A2;
	Tue, 12 Aug 2025 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXww9RDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1F2D7389;
	Tue, 12 Aug 2025 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033886; cv=none; b=OOm/2bx5gchS2P0gi/ADXNtj2vJgtbrvwSnOOMJcgzGkVurPx3AGc3552KIvdPSZIyJf+VPbN6KfiyO+X/0KQUsVWknL7ymYTKQyZYmfx4xu0MCEe9BTUoSd0vURVxib6lAc4gDRna1GIPF+ntdo4QM5FxsmwMEjPkmMxPYaIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033886; c=relaxed/simple;
	bh=bDAAXZnKRVzBHC1naPeHj9bYiq5Z57onASKM6/0SNDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O82vy3MB9maJ0hBnJIB2w2IH+ZouFKy8mm2G5RpewdrXdf6JfBjJgH/597Xmc+VMnxJ7kH6Bf+UlXsR4CFdcjhmaO89v3QdxfKBNfixeRnK3Wor8lHveCSTZuQvEgBlOXKj79LwW2zjtnkFwI1lzG9hIxSl5XuBdu03Gxat+2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXww9RDC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98B2AC4CEF7;
	Tue, 12 Aug 2025 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033885;
	bh=bDAAXZnKRVzBHC1naPeHj9bYiq5Z57onASKM6/0SNDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VXww9RDCJFOQ5o2gwJxGvk6CZpxslwPDmMBhNcp/2rDrKIXb3VOWCR0D2KbIlJc4v
	 82fvEzo8OfBRrQWqCJ18UAYwK2tZ3+v2Qjhz1OSamF83232ELeZn7H5kptFf/jrGXg
	 3oiHauV8r7JlrWzARJUU/zh8ze7YpSc8XDiXePfxWTTlolPulCRZvZK6G8T4PK+vDH
	 +Q6NgWNtWdrCrWE64vE0JXjtLCIMFOXb09gvZqjiMGTaOAlwRnF0lHBOIQZUgpJFqQ
	 aPMohYUSfyM+4I83bTrtqYfCnxUniKf4dAIG3ZFUA7yVlgKAarKTmPipxyXWfH4jzQ
	 5gtuUl6v49Oug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB87CA0EE4;
	Tue, 12 Aug 2025 21:24:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 12 Aug 2025 16:24:42 -0500
Subject: [PATCH v3 3/3] arm64: tegra: Add Tegra186 pin controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-tegra186-pinctrl-v3-3-115714eeecb1@gmail.com>
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
In-Reply-To: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755033884; l=20006;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=pB+/onAiPha9RsAtad8CuZzGrciiZ7BBUa9bH4GbV1w=;
 b=zS3Ey12PwhnRGCoLi4oypTmIuJbYIK3UkKF1ANw/MJvUHQZWkF7hcKyjOKkys9C8qKtEN7zLY
 nmlrVQNPoK3CkoLXfwTLT8EBZrk56LA2b1nMfS1FWcadubPjANMahL3
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add the device tree nodes for the MAIN and AON pin controllers found on
the Tegra186 family of SoCs.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi |  12 ++
 drivers/pinctrl/tegra/pinctrl-tegra186.c | 207 ++++++++++++++++++++++++++++++-
 2 files changed, 213 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 5778c93af3e6e72f5f14a9fcee1e7abf80d2d2c5..66fdcec17073a0954b3bf600588324e4c047d0bf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -36,6 +36,12 @@ gpio: gpio@2200000 {
 		interrupt-controller;
 		#gpio-cells = <2>;
 		gpio-controller;
+		gpio-ranges = <&pinmux 0 0 140>;
+	};
+
+	pinmux: pinmux@2430000 {
+		compatible = "nvidia,tegra186-pinmux";
+		reg = <0x0 0x2430000 0x0 0x15000>;
 	};
 
 	ethernet@2490000 {
@@ -1274,10 +1280,16 @@ gpio_aon: gpio@c2f0000 {
 		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-ranges = <&pinmux_aon 0 0 47>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
+	pinmux_aon: pinmux@c300000 {
+		compatible = "nvidia,tegra186-pinmux-aon";
+		reg = <0x0 0xc300000 0x0 0x4000>;
+	};
+
 	pwm4: pwm@c340000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0xc340000 0x0 0x10000>;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra186.c b/drivers/pinctrl/tegra/pinctrl-tegra186.c
index c7dd215273430a797bfd8299d4560d15e791f02c..4a1d6476af9bb4c070ce7131852caa0b8150f1a1 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra186.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra186.c
@@ -377,588 +377,783 @@ static const struct pinctrl_pin_desc tegra186_pins[] = {
 static const unsigned int pex_l0_rst_n_pa0_pins[] = {
 	TEGRA_PIN_PEX_L0_RST_N_PA0,
 };
+
 static const unsigned int pex_l0_clkreq_n_pa1_pins[] = {
 	TEGRA_PIN_PEX_L0_CLKREQ_N_PA1,
 };
+
 static const unsigned int pex_wake_n_pa2_pins[] = {
 	TEGRA_PIN_PEX_WAKE_N_PA2,
 };
+
 static const unsigned int pex_l1_rst_n_pa3_pins[] = {
 	TEGRA_PIN_PEX_L1_RST_N_PA3,
 };
+
 static const unsigned int pex_l1_clkreq_n_pa4_pins[] = {
 	TEGRA_PIN_PEX_L1_CLKREQ_N_PA4,
 };
+
 static const unsigned int pex_l2_rst_n_pa5_pins[] = {
 	TEGRA_PIN_PEX_L2_RST_N_PA5,
 };
+
 static const unsigned int pex_l2_clkreq_n_pa6_pins[] = {
 	TEGRA_PIN_PEX_L2_CLKREQ_N_PA6,
 };
+
 static const unsigned int uart4_tx_pb0_pins[] = {
 	TEGRA_PIN_UART4_TX_PB0,
 };
+
 static const unsigned int uart4_rx_pb1_pins[] = {
 	TEGRA_PIN_UART4_RX_PB1,
 };
+
 static const unsigned int uart4_rts_pb2_pins[] = {
 	TEGRA_PIN_UART4_RTS_PB2,
 };
+
 static const unsigned int uart4_cts_pb3_pins[] = {
 	TEGRA_PIN_UART4_CTS_PB3,
 };
+
 static const unsigned int gpio_wan1_pb4_pins[] = {
 	TEGRA_PIN_GPIO_WAN1_PB4,
 };
+
 static const unsigned int gpio_wan2_pb5_pins[] = {
 	TEGRA_PIN_GPIO_WAN2_PB5,
 };
+
 static const unsigned int gpio_wan3_pb6_pins[] = {
 	TEGRA_PIN_GPIO_WAN3_PB6,
 };
+
 static const unsigned int gpio_wan4_pc0_pins[] = {
 	TEGRA_PIN_GPIO_WAN4_PC0,
 };
+
 static const unsigned int dap2_sclk_pc1_pins[] = {
 	TEGRA_PIN_DAP2_SCLK_PC1,
 };
+
 static const unsigned int dap2_dout_pc2_pins[] = {
 	TEGRA_PIN_DAP2_DOUT_PC2,
 };
+
 static const unsigned int dap2_din_pc3_pins[] = {
 	TEGRA_PIN_DAP2_DIN_PC3,
 };
+
 static const unsigned int dap2_fs_pc4_pins[] = {
 	TEGRA_PIN_DAP2_FS_PC4,
 };
+
 static const unsigned int gen1_i2c_scl_pc5_pins[] = {
 	TEGRA_PIN_GEN1_I2C_SCL_PC5,
 };
+
 static const unsigned int gen1_i2c_sda_pc6_pins[] = {
 	TEGRA_PIN_GEN1_I2C_SDA_PC6,
 };
+
 static const unsigned int sdmmc1_clk_pd0_pins[] = {
 	TEGRA_PIN_SDMMC1_CLK_PD0,
 };
+
 static const unsigned int sdmmc1_cmd_pd1_pins[] = {
 	TEGRA_PIN_SDMMC1_CMD_PD1,
 };
+
 static const unsigned int sdmmc1_dat0_pd2_pins[] = {
 	TEGRA_PIN_SDMMC1_DAT0_PD2,
 };
+
 static const unsigned int sdmmc1_dat1_pd3_pins[] = {
 	TEGRA_PIN_SDMMC1_DAT1_PD3,
 };
+
 static const unsigned int sdmmc1_dat2_pd4_pins[] = {
 	TEGRA_PIN_SDMMC1_DAT2_PD4,
 };
+
 static const unsigned int sdmmc1_dat3_pd5_pins[] = {
 	TEGRA_PIN_SDMMC1_DAT3_PD5,
 };
+
 static const unsigned int eqos_txc_pe0_pins[] = {
 	TEGRA_PIN_EQOS_TXC_PE0,
 };
+
 static const unsigned int eqos_td0_pe1_pins[] = {
 	TEGRA_PIN_EQOS_TD0_PE1,
 };
+
 static const unsigned int eqos_td1_pe2_pins[] = {
 	TEGRA_PIN_EQOS_TD1_PE2,
 };
+
 static const unsigned int eqos_td2_pe3_pins[] = {
 	TEGRA_PIN_EQOS_TD2_PE3,
 };
+
 static const unsigned int eqos_td3_pe4_pins[] = {
 	TEGRA_PIN_EQOS_TD3_PE4,
 };
+
 static const unsigned int eqos_tx_ctl_pe5_pins[] = {
 	TEGRA_PIN_EQOS_TX_CTL_PE5,
 };
+
 static const unsigned int eqos_rd0_pe6_pins[] = {
 	TEGRA_PIN_EQOS_RD0_PE6,
 };
+
 static const unsigned int eqos_rd1_pe7_pins[] = {
 	TEGRA_PIN_EQOS_RD1_PE7,
 };
+
 static const unsigned int eqos_rd2_pf0_pins[] = {
 	TEGRA_PIN_EQOS_RD2_PF0,
 };
+
 static const unsigned int eqos_rd3_pf1_pins[] = {
 	TEGRA_PIN_EQOS_RD3_PF1,
 };
+
 static const unsigned int eqos_rx_ctl_pf2_pins[] = {
 	TEGRA_PIN_EQOS_RX_CTL_PF2,
 };
+
 static const unsigned int eqos_rxc_pf3_pins[] = {
 	TEGRA_PIN_EQOS_RXC_PF3,
 };
+
 static const unsigned int eqos_mdio_pf4_pins[] = {
 	TEGRA_PIN_EQOS_MDIO_PF4,
 };
+
 static const unsigned int eqos_mdc_pf5_pins[] = {
 	TEGRA_PIN_EQOS_MDC_PF5,
 };
+
 static const unsigned int sdmmc3_clk_pg0_pins[] = {
 	TEGRA_PIN_SDMMC3_CLK_PG0,
 };
+
 static const unsigned int sdmmc3_cmd_pg1_pins[] = {
 	TEGRA_PIN_SDMMC3_CMD_PG1,
 };
+
 static const unsigned int sdmmc3_dat0_pg2_pins[] = {
 	TEGRA_PIN_SDMMC3_DAT0_PG2,
 };
+
 static const unsigned int sdmmc3_dat1_pg3_pins[] = {
 	TEGRA_PIN_SDMMC3_DAT1_PG3,
 };
+
 static const unsigned int sdmmc3_dat2_pg4_pins[] = {
 	TEGRA_PIN_SDMMC3_DAT2_PG4,
 };
+
 static const unsigned int sdmmc3_dat3_pg5_pins[] = {
 	TEGRA_PIN_SDMMC3_DAT3_PG5,
 };
+
 static const unsigned int gpio_wan5_ph0_pins[] = {
 	TEGRA_PIN_GPIO_WAN5_PH0,
 };
+
 static const unsigned int gpio_wan6_ph1_pins[] = {
 	TEGRA_PIN_GPIO_WAN6_PH1,
 };
+
 static const unsigned int gpio_wan7_ph2_pins[] = {
 	TEGRA_PIN_GPIO_WAN7_PH2,
 };
+
 static const unsigned int gpio_wan8_ph3_pins[] = {
 	TEGRA_PIN_GPIO_WAN8_PH3,
 };
+
 static const unsigned int bcpu_pwr_req_ph4_pins[] = {
 	TEGRA_PIN_BCPU_PWR_REQ_PH4,
 };
+
 static const unsigned int mcpu_pwr_req_ph5_pins[] = {
 	TEGRA_PIN_MCPU_PWR_REQ_PH5,
 };
+
 static const unsigned int gpu_pwr_req_ph6_pins[] = {
 	TEGRA_PIN_GPU_PWR_REQ_PH6,
 };
+
 static const unsigned int gpio_pq0_pi0_pins[] = {
 	TEGRA_PIN_GPIO_PQ0_PI0,
 };
+
 static const unsigned int gpio_pq1_pi1_pins[] = {
 	TEGRA_PIN_GPIO_PQ1_PI1,
 };
+
 static const unsigned int gpio_pq2_pi2_pins[] = {
 	TEGRA_PIN_GPIO_PQ2_PI2,
 };
+
 static const unsigned int gpio_pq3_pi3_pins[] = {
 	TEGRA_PIN_GPIO_PQ3_PI3,
 };
+
 static const unsigned int gpio_pq4_pi4_pins[] = {
 	TEGRA_PIN_GPIO_PQ4_PI4,
 };
+
 static const unsigned int gpio_pq5_pi5_pins[] = {
 	TEGRA_PIN_GPIO_PQ5_PI5,
 };
+
 static const unsigned int gpio_pq6_pi6_pins[] = {
 	TEGRA_PIN_GPIO_PQ6_PI6,
 };
+
 static const unsigned int gpio_pq7_pi7_pins[] = {
 	TEGRA_PIN_GPIO_PQ7_PI7,
 };
+
 static const unsigned int dap1_sclk_pj0_pins[] = {
 	TEGRA_PIN_DAP1_SCLK_PJ0,
 };
+
 static const unsigned int dap1_dout_pj1_pins[] = {
 	TEGRA_PIN_DAP1_DOUT_PJ1,
 };
+
 static const unsigned int dap1_din_pj2_pins[] = {
 	TEGRA_PIN_DAP1_DIN_PJ2,
 };
+
 static const unsigned int dap1_fs_pj3_pins[] = {
 	TEGRA_PIN_DAP1_FS_PJ3,
 };
+
 static const unsigned int aud_mclk_pj4_pins[] = {
 	TEGRA_PIN_AUD_MCLK_PJ4,
 };
+
 static const unsigned int gpio_aud0_pj5_pins[] = {
 	TEGRA_PIN_GPIO_AUD0_PJ5,
 };
+
 static const unsigned int gpio_aud1_pj6_pins[] = {
 	TEGRA_PIN_GPIO_AUD1_PJ6,
 };
+
 static const unsigned int gpio_aud2_pj7_pins[] = {
 	TEGRA_PIN_GPIO_AUD2_PJ7,
 };
+
 static const unsigned int gpio_aud3_pk0_pins[] = {
 	TEGRA_PIN_GPIO_AUD3_PK0,
 };
+
 static const unsigned int gen7_i2c_scl_pl0_pins[] = {
 	TEGRA_PIN_GEN7_I2C_SCL_PL0,
 };
+
 static const unsigned int gen7_i2c_sda_pl1_pins[] = {
 	TEGRA_PIN_GEN7_I2C_SDA_PL1,
 };
+
 static const unsigned int gen9_i2c_scl_pl2_pins[] = {
 	TEGRA_PIN_GEN9_I2C_SCL_PL2,
 };
+
 static const unsigned int gen9_i2c_sda_pl3_pins[] = {
 	TEGRA_PIN_GEN9_I2C_SDA_PL3,
 };
+
 static const unsigned int usb_vbus_en0_pl4_pins[] = {
 	TEGRA_PIN_USB_VBUS_EN0_PL4,
 };
+
 static const unsigned int usb_vbus_en1_pl5_pins[] = {
 	TEGRA_PIN_USB_VBUS_EN1_PL5,
 };
+
 static const unsigned int gp_pwm6_pl6_pins[] = {
 	TEGRA_PIN_GP_PWM6_PL6,
 };
+
 static const unsigned int gp_pwm7_pl7_pins[] = {
 	TEGRA_PIN_GP_PWM7_PL7,
 };
+
 static const unsigned int dmic1_dat_pm0_pins[] = {
 	TEGRA_PIN_DMIC1_DAT_PM0,
 };
+
 static const unsigned int dmic1_clk_pm1_pins[] = {
 	TEGRA_PIN_DMIC1_CLK_PM1,
 };
+
 static const unsigned int dmic2_dat_pm2_pins[] = {
 	TEGRA_PIN_DMIC2_DAT_PM2,
 };
+
 static const unsigned int dmic2_clk_pm3_pins[] = {
 	TEGRA_PIN_DMIC2_CLK_PM3,
 };
+
 static const unsigned int dmic4_dat_pm4_pins[] = {
 	TEGRA_PIN_DMIC4_DAT_PM4,
 };
+
 static const unsigned int dmic4_clk_pm5_pins[] = {
 	TEGRA_PIN_DMIC4_CLK_PM5,
 };
+
 static const unsigned int gpio_cam1_pn0_pins[] = {
 	TEGRA_PIN_GPIO_CAM1_PN0,
 };
+
 static const unsigned int gpio_cam2_pn1_pins[] = {
 	TEGRA_PIN_GPIO_CAM2_PN1,
 };
+
 static const unsigned int gpio_cam3_pn2_pins[] = {
 	TEGRA_PIN_GPIO_CAM3_PN2,
 };
+
 static const unsigned int gpio_cam4_pn3_pins[] = {
 	TEGRA_PIN_GPIO_CAM4_PN3,
 };
+
 static const unsigned int gpio_cam5_pn4_pins[] = {
 	TEGRA_PIN_GPIO_CAM5_PN4,
 };
+
 static const unsigned int gpio_cam6_pn5_pins[] = {
 	TEGRA_PIN_GPIO_CAM6_PN5,
 };
+
 static const unsigned int gpio_cam7_pn6_pins[] = {
 	TEGRA_PIN_GPIO_CAM7_PN6,
 };
+
 static const unsigned int extperiph1_clk_po0_pins[] = {
 	TEGRA_PIN_EXTPERIPH1_CLK_PO0,
 };
+
 static const unsigned int extperiph2_clk_po1_pins[] = {
 	TEGRA_PIN_EXTPERIPH2_CLK_PO1,
 };
+
 static const unsigned int cam_i2c_scl_po2_pins[] = {
 	TEGRA_PIN_CAM_I2C_SCL_PO2,
 };
+
 static const unsigned int cam_i2c_sda_po3_pins[] = {
 	TEGRA_PIN_CAM_I2C_SDA_PO3,
 };
+
 static const unsigned int dp_aux_ch0_hpd_pp0_pins[] = {
 	TEGRA_PIN_DP_AUX_CH0_HPD_PP0,
 };
+
 static const unsigned int dp_aux_ch1_hpd_pp1_pins[] = {
 	TEGRA_PIN_DP_AUX_CH1_HPD_PP1,
 };
+
 static const unsigned int hdmi_cec_pp2_pins[] = {
 	TEGRA_PIN_HDMI_CEC_PP2,
 };
+
 static const unsigned int gpio_edp0_pp3_pins[] = {
 	TEGRA_PIN_GPIO_EDP0_PP3,
 };
+
 static const unsigned int gpio_edp1_pp4_pins[] = {
 	TEGRA_PIN_GPIO_EDP1_PP4,
 };
+
 static const unsigned int gpio_edp2_pp5_pins[] = {
 	TEGRA_PIN_GPIO_EDP2_PP5,
 };
+
 static const unsigned int gpio_edp3_pp6_pins[] = {
 	TEGRA_PIN_GPIO_EDP3_PP6,
 };
+
 static const unsigned int directdc1_clk_pq0_pins[] = {
 	TEGRA_PIN_DIRECTDC1_CLK_PQ0,
 };
+
 static const unsigned int directdc1_in_pq1_pins[] = {
 	TEGRA_PIN_DIRECTDC1_IN_PQ1,
 };
+
 static const unsigned int directdc1_out0_pq2_pins[] = {
 	TEGRA_PIN_DIRECTDC1_OUT0_PQ2,
 };
+
 static const unsigned int directdc1_out1_pq3_pins[] = {
 	TEGRA_PIN_DIRECTDC1_OUT1_PQ3,
 };
+
 static const unsigned int directdc1_out2_pq4_pins[] = {
 	TEGRA_PIN_DIRECTDC1_OUT2_PQ4,
 };
+
 static const unsigned int directdc1_out3_pq5_pins[] = {
 	TEGRA_PIN_DIRECTDC1_OUT3_PQ5,
 };
+
 static const unsigned int qspi_sck_pr0_pins[] = {
 	TEGRA_PIN_QSPI_SCK_PR0,
 };
+
 static const unsigned int qspi_io0_pr1_pins[] = {
 	TEGRA_PIN_QSPI_IO0_PR1,
 };
+
 static const unsigned int qspi_io1_pr2_pins[] = {
 	TEGRA_PIN_QSPI_IO1_PR2,
 };
+
 static const unsigned int qspi_io2_pr3_pins[] = {
 	TEGRA_PIN_QSPI_IO2_PR3,
 };
+
 static const unsigned int qspi_io3_pr4_pins[] = {
 	TEGRA_PIN_QSPI_IO3_PR4,
 };
+
 static const unsigned int qspi_cs_n_pr5_pins[] = {
 	TEGRA_PIN_QSPI_CS_N_PR5,
 };
+
 static const unsigned int pwr_i2c_scl_ps0_pins[] = {
 	TEGRA_PIN_PWR_I2C_SCL_PS0,
 };
+
 static const unsigned int pwr_i2c_sda_ps1_pins[] = {
 	TEGRA_PIN_PWR_I2C_SDA_PS1,
 };
+
 static const unsigned int batt_oc_ps2_pins[] = {
 	TEGRA_PIN_BATT_OC_PS2,
 };
+
 static const unsigned int safe_state_ps3_pins[] = {
 	TEGRA_PIN_SAFE_STATE_PS3,
 };
+
 static const unsigned int vcomp_alert_ps4_pins[] = {
 	TEGRA_PIN_VCOMP_ALERT_PS4,
 };
+
 static const unsigned int uart1_tx_pt0_pins[] = {
 	TEGRA_PIN_UART1_TX_PT0,
 };
+
 static const unsigned int uart1_rx_pt1_pins[] = {
 	TEGRA_PIN_UART1_RX_PT1,
 };
+
 static const unsigned int uart1_rts_pt2_pins[] = {
 	TEGRA_PIN_UART1_RTS_PT2,
 };
+
 static const unsigned int uart1_cts_pt3_pins[] = {
 	TEGRA_PIN_UART1_CTS_PT3,
 };
+
 static const unsigned int gpio_dis0_pu0_pins[] = {
 	TEGRA_PIN_GPIO_DIS0_PU0,
 };
+
 static const unsigned int gpio_dis1_pu1_pins[] = {
 	TEGRA_PIN_GPIO_DIS1_PU1,
 };
+
 static const unsigned int gpio_dis2_pu2_pins[] = {
 	TEGRA_PIN_GPIO_DIS2_PU2,
 };
+
 static const unsigned int gpio_dis3_pu3_pins[] = {
 	TEGRA_PIN_GPIO_DIS3_PU3,
 };
+
 static const unsigned int gpio_dis4_pu4_pins[] = {
 	TEGRA_PIN_GPIO_DIS4_PU4,
 };
+
 static const unsigned int gpio_dis5_pu5_pins[] = {
 	TEGRA_PIN_GPIO_DIS5_PU5,
 };
+
 static const unsigned int gpio_sen0_pv0_pins[] = {
 	TEGRA_PIN_GPIO_SEN0_PV0,
 };
+
 static const unsigned int gpio_sen1_pv1_pins[] = {
 	TEGRA_PIN_GPIO_SEN1_PV1,
 };
+
 static const unsigned int gpio_sen2_pv2_pins[] = {
 	TEGRA_PIN_GPIO_SEN2_PV2,
 };
+
 static const unsigned int gpio_sen3_pv3_pins[] = {
 	TEGRA_PIN_GPIO_SEN3_PV3,
 };
+
 static const unsigned int gpio_sen4_pv4_pins[] = {
 	TEGRA_PIN_GPIO_SEN4_PV4,
 };
+
 static const unsigned int gpio_sen5_pv5_pins[] = {
 	TEGRA_PIN_GPIO_SEN5_PV5,
 };
+
 static const unsigned int gpio_sen6_pv6_pins[] = {
 	TEGRA_PIN_GPIO_SEN6_PV6,
 };
+
 static const unsigned int gpio_sen7_pv7_pins[] = {
 	TEGRA_PIN_GPIO_SEN7_PV7,
 };
+
 static const unsigned int gen8_i2c_scl_pw0_pins[] = {
 	TEGRA_PIN_GEN8_I2C_SCL_PW0,
 };
+
 static const unsigned int gen8_i2c_sda_pw1_pins[] = {
 	TEGRA_PIN_GEN8_I2C_SDA_PW1,
 };
+
 static const unsigned int uart3_tx_pw2_pins[] = {
 	TEGRA_PIN_UART3_TX_PW2,
 };
+
 static const unsigned int uart3_rx_pw3_pins[] = {
 	TEGRA_PIN_UART3_RX_PW3,
 };
+
 static const unsigned int uart3_rts_pw4_pins[] = {
 	TEGRA_PIN_UART3_RTS_PW4,
 };
+
 static const unsigned int uart3_cts_pw5_pins[] = {
 	TEGRA_PIN_UART3_CTS_PW5,
 };
+
 static const unsigned int uart7_tx_pw6_pins[] = {
 	TEGRA_PIN_UART7_TX_PW6,
 };
+
 static const unsigned int uart7_rx_pw7_pins[] = {
 	TEGRA_PIN_UART7_RX_PW7,
 };
+
 static const unsigned int uart2_tx_px0_pins[] = {
 	TEGRA_PIN_UART2_TX_PX0,
 };
+
 static const unsigned int uart2_rx_px1_pins[] = {
 	TEGRA_PIN_UART2_RX_PX1,
 };
+
 static const unsigned int uart2_rts_px2_pins[] = {
 	TEGRA_PIN_UART2_RTS_PX2,
 };
+
 static const unsigned int uart2_cts_px3_pins[] = {
 	TEGRA_PIN_UART2_CTS_PX3,
 };
+
 static const unsigned int uart5_tx_px4_pins[] = {
 	TEGRA_PIN_UART5_TX_PX4,
 };
+
 static const unsigned int uart5_rx_px5_pins[] = {
 	TEGRA_PIN_UART5_RX_PX5,
 };
+
 static const unsigned int uart5_rts_px6_pins[] = {
 	TEGRA_PIN_UART5_RTS_PX6,
 };
+
 static const unsigned int uart5_cts_px7_pins[] = {
 	TEGRA_PIN_UART5_CTS_PX7,
 };
+
 static const unsigned int gpio_mdm1_py0_pins[] = {
 	TEGRA_PIN_GPIO_MDM1_PY0,
 };
+
 static const unsigned int gpio_mdm2_py1_pins[] = {
 	TEGRA_PIN_GPIO_MDM2_PY1,
 };
+
 static const unsigned int gpio_mdm3_py2_pins[] = {
 	TEGRA_PIN_GPIO_MDM3_PY2,
 };
+
 static const unsigned int gpio_mdm4_py3_pins[] = {
 	TEGRA_PIN_GPIO_MDM4_PY3,
 };
+
 static const unsigned int gpio_mdm5_py4_pins[] = {
 	TEGRA_PIN_GPIO_MDM5_PY4,
 };
+
 static const unsigned int gpio_mdm6_py5_pins[] = {
 	TEGRA_PIN_GPIO_MDM6_PY5,
 };
+
 static const unsigned int gpio_mdm7_py6_pins[] = {
 	TEGRA_PIN_GPIO_MDM7_PY6,
 };
+
 static const unsigned int can1_dout_pz0_pins[] = {
 	TEGRA_PIN_CAN1_DOUT_PZ0,
 };
+
 static const unsigned int can1_din_pz1_pins[] = {
 	TEGRA_PIN_CAN1_DIN_PZ1,
 };
+
 static const unsigned int can0_dout_pz2_pins[] = {
 	TEGRA_PIN_CAN0_DOUT_PZ2,
 };
+
 static const unsigned int can0_din_pz3_pins[] = {
 	TEGRA_PIN_CAN0_DIN_PZ3,
 };
+
 static const unsigned int can_gpio0_paa0_pins[] = {
 	TEGRA_PIN_CAN_GPIO0_PAA0,
 };
+
 static const unsigned int can_gpio1_paa1_pins[] = {
 	TEGRA_PIN_CAN_GPIO1_PAA1,
 };
+
 static const unsigned int can_gpio2_paa2_pins[] = {
 	TEGRA_PIN_CAN_GPIO2_PAA2,
 };
+
 static const unsigned int can_gpio3_paa3_pins[] = {
 	TEGRA_PIN_CAN_GPIO3_PAA3,
 };
+
 static const unsigned int can_gpio4_paa4_pins[] = {
 	TEGRA_PIN_CAN_GPIO4_PAA4,
 };
+
 static const unsigned int can_gpio5_paa5_pins[] = {
 	TEGRA_PIN_CAN_GPIO5_PAA5,
 };
+
 static const unsigned int can_gpio6_paa6_pins[] = {
 	TEGRA_PIN_CAN_GPIO6_PAA6,
 };
+
 static const unsigned int can_gpio7_paa7_pins[] = {
 	TEGRA_PIN_CAN_GPIO7_PAA7,
 };
+
 static const unsigned int ufs0_ref_clk_pbb0_pins[] = {
 	TEGRA_PIN_UFS0_REF_CLK_PBB0,
 };
+
 static const unsigned int ufs0_rst_pbb1_pins[] = {
 	TEGRA_PIN_UFS0_RST_PBB1,
 };
+
 static const unsigned int dap4_sclk_pcc0_pins[] = {
 	TEGRA_PIN_DAP4_SCLK_PCC0,
 };
+
 static const unsigned int dap4_dout_pcc1_pins[] = {
 	TEGRA_PIN_DAP4_DOUT_PCC1,
 };
+
 static const unsigned int dap4_din_pcc2_pins[] = {
 	TEGRA_PIN_DAP4_DIN_PCC2,
 };
+
 static const unsigned int dap4_fs_pcc3_pins[] = {
 	TEGRA_PIN_DAP4_FS_PCC3,
 };
+
 static const unsigned int gpio_sen8_pee0_pins[] = {
 	TEGRA_PIN_GPIO_SEN8_PEE0,
 };
+
 static const unsigned int gpio_sen9_pee1_pins[] = {
 	TEGRA_PIN_GPIO_SEN9_PEE1,
 };
+
 static const unsigned int touch_clk_pee2_pins[] = {
 	TEGRA_PIN_TOUCH_CLK_PEE2,
 };
+
 static const unsigned int power_on_pff0_pins[] = {
 	TEGRA_PIN_POWER_ON_PFF0,
 };
+
 static const unsigned int gpio_sw1_pff1_pins[] = {
 	TEGRA_PIN_GPIO_SW1_PFF1,
 };
+
 static const unsigned int gpio_sw2_pff2_pins[] = {
 	TEGRA_PIN_GPIO_SW2_PFF2,
 };
+
 static const unsigned int gpio_sw3_pff3_pins[] = {
 	TEGRA_PIN_GPIO_SW3_PFF3,
 };
+
 static const unsigned int gpio_sw4_pff4_pins[] = {
 	TEGRA_PIN_GPIO_SW4_PFF4,
 };
+
 static const unsigned int directdc_comp_pins[] = {
 	TEGRA_PIN_DIRECTDC_COMP,
 };
+
 static const unsigned int sdmmc1_comp_pins[] = {
 	TEGRA_PIN_SDMMC1_COMP,
 };
+
 static const unsigned int eqos_comp_pins[] = {
 	TEGRA_PIN_EQOS_COMP,
 };
+
 static const unsigned int sdmmc3_comp_pins[] = {
 	TEGRA_PIN_SDMMC3_COMP,
 };
+
 static const unsigned int qspi_comp_pins[] = {
 	TEGRA_PIN_QSPI_COMP,
 };
+
 static const unsigned int shutdown_pins[] = {
 	TEGRA_PIN_SHUTDOWN,
 };
+
 static const unsigned int pmu_int_pins[] = {
 	TEGRA_PIN_PMU_INT,
 };
+
 static const unsigned int soc_pwr_req_pins[] = {
 	TEGRA_PIN_SOC_PWR_REQ,
 };
+
 static const unsigned int clk_32k_in_pins[] = {
 	TEGRA_PIN_CLK_32K_IN,
 };
@@ -1448,12 +1643,12 @@ static const char * const tegra186_functions[] = {
 		.name = #pg_name,				\
 		.pins = pg_name##_pins,				\
 		.npins = ARRAY_SIZE(pg_name##_pins),		\
-			.funcs = {				\
-				TEGRA_MUX_##f0,			\
-				TEGRA_MUX_##f1,			\
-				TEGRA_MUX_##f2,			\
-				TEGRA_MUX_##f3,			\
-			},					\
+		.funcs = {					\
+			TEGRA_MUX_##f0,				\
+			TEGRA_MUX_##f1,				\
+			TEGRA_MUX_##f2,				\
+			TEGRA_MUX_##f3,				\
+		},						\
 		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,	\
 				     e_input, e_lpdr, e_pbias_buf, \
 				     gpio_sfio_sel, e_od,	\

-- 
2.50.1



