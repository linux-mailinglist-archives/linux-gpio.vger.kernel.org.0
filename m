Return-Path: <linux-gpio+bounces-20620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 831BDAC5CED
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17C129E1B19
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6C921ABBD;
	Tue, 27 May 2025 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZKjeRq0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CD2192EB;
	Tue, 27 May 2025 22:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384483; cv=none; b=Q38UrYeitaqBBHjZAB4B+1uxp2l7xnQe4TAaSxur3GIadii3bXBd/sC6erPgsBUvNJFGmNfSf+C0zIhUbIl/O34N2LYZ6kRqNJD69eF193is+0g5s7zshPSTTwffTcP/ABbMFgdO0FHrVVmVTcZIXgka3K+9QI3pNW5+0YjH+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384483; c=relaxed/simple;
	bh=COFy6CP61UYNIMOuecBTPqG57FzrWb5hWUMo5+ELOtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPz9Bv04mVxBQzvL1rNTSyIDNBgbuAlBuNs2sB+Tqqf1vXFu097IRN2voN9STutzN7MMXmMQNZkl0+mLTVXF9KuFp9UVx2SM9Q62X8omBEbv1FBuu9jOWEsobGJtrLCqixP9rjfaKDti+/5+HApyry1rcJtm2m9X2EDzc/FzKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZKjeRq0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a3758b122cso2464405f8f.1;
        Tue, 27 May 2025 15:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384478; x=1748989278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSkphQYYeMWK00nIyggcQ+uNNWVPgJT7i0mAQjLqP9E=;
        b=BZKjeRq0lI03NGS8FSZNlHCNoS/PojsfqCPIJjGtuNon0Ftm1OZ9YxlkNmAd1ojzR7
         lKi0cE7gzQ5KL0pg3IzhSEkQnaXk9V756kwjHBBZJbectHPYi1S5z0M2GPS+cGKjxDVM
         J0u/iItn26va9Kig1Z/ZhRFIJHGYIHUr0RfxPkhozvwd2Au0Hz6QZJ8sUjwrDiMyjruY
         z1VyocHINdNTd7ckqy4Bgs1pDRVgTKuxFjW3lPIJNcybPF+hz5hTyOOEvzyxQZ4dzVpA
         +ctX+lq6sYP9vdz0JVpa5WOmsX0sKQ7uDeVPSQIwmMmsPxGr/QARMo9G3NhaHCVGkkk7
         I24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384478; x=1748989278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSkphQYYeMWK00nIyggcQ+uNNWVPgJT7i0mAQjLqP9E=;
        b=jF0+hdOpS0NsxaSIoQa0gZy5zKe8on7TcDN6tTSCYp0+AYuvQeicdaGmL0b5BN/ibg
         7x4QbRDUftcJVXf3p8PuN5hmYIxZbnmE5Idyxr1qojJpMREOLD2c1Y60bNB7W4SzX3Jl
         HJU0PZVb/bxgjl340fc9zVCYyv90bnD8yHoNdSeWFmGv/XY9rSLwzUUoJ/G52J/jV6yh
         7+aARgohKKVK0VuYnUfN11PC0vD0k1SDQziL/2/A87A9ij30A/0vrcSLE1NRbDRVijhP
         CzFoCFMlIge7LMv2zO9ZEOgLpcD2ya0j4Gyw6APFtvs887m53dhBANQPWH5BbRNUUf04
         Fc5w==
X-Forwarded-Encrypted: i=1; AJvYcCUn0uq+KOeEmgsAGO8XXdROH5YEzLj8xQk6j+WPNMBkvUsET07Zaln9109XpehFpFCo/POvfoPnRKm95nTw@vger.kernel.org, AJvYcCV8v4dQjrJAB5rkZH7W3jxvPv2DLMO2SDMoQckDNUMvN5rTiz2vaRFwhISxBia9+sxHJ/65NIajZA+x@vger.kernel.org, AJvYcCVvYusSuAlycPfODC5pefHyU0UP4hsxJXjkY9gL516uO2dPXxqoTwapMWmT+Ka4O8jIkLl1YCWnx79toQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBPBEtDlQJENcDJGgEGXMLbMvM5/cEpiXJXgwoYl9ZfzSRe1K
	yHtLNCU5JJdsirLpF8ZZ4Bur1OZZVY3eo5OcctU52mzuHD4JM+LvMWnz
X-Gm-Gg: ASbGncuNTWboiSq0P0u/rYcYLRzdKiZrXM6LGwDuAOnaQ8dm3mOaOJofKLsPbUxQiOg
	gE+R9gtwUwqlnxxTwFsbFdOECj0AWDOvEHYzb0Vg9VTidN+Rg059inpZs6n8FA219ci9MOsT8e+
	KVdggMGxGkauAoo/yRVhX0X1+TliE7S4RAbUErfcF1tYtNXjmV8b3waBcIfbyAkiYJcDaS8f335
	6Aty2ttNujkBXwAV2XbmWLQ60+N9sHIuTln5zRbT8R3zUrnHs4f7ZmFmjX54YCmzwvrUnA6lUAP
	g+PfFeKGa2rFpgPXyCBU3ZeVVa3tfATgJly0V97FeDmoM/gfjLsB2PLRwI+GTREZwOGrEH/vFn8
	Qj+E30q+uG7zn+YQZzwbaGBCGRg2+Gmg=
X-Google-Smtp-Source: AGHT+IGrSHdrcrpVhEyZnvSk93Wt+7bI5a1Zz+rYKG5TonvMzlOhUzUs6FHBkSrLRXs8+sG7JrNtAg==
X-Received: by 2002:a05:6000:2505:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3a4cb4a9776mr11241515f8f.55.1748384477776;
        Tue, 27 May 2025 15:21:17 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 6/6] pinctrl: airoha: add support for Airoha AN7583 PINs
Date: Wed, 28 May 2025 00:20:38 +0200
Message-ID: <20250527222040.32000-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the required entry to add suppot for Airoha AN7583 PINs.

Where possible the same function group are used from Airoha EN7581 to
reduce code duplication.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 733 ++++++++++++++++++++++
 1 file changed, 733 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 8c8d5b598f4f..0960649d5d66 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -75,6 +75,7 @@
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
 #define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
 #define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
+#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
 #define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
 #define GPIO_PCM_SPI_MODE_MASK			BIT(16)
 #define GPIO_PCM2_MODE_MASK			BIT(13)
@@ -129,6 +130,8 @@
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
+#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
+#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
 #define SPI_MISO_E2_MASK			BIT(14)
 #define SPI_MOSI_E2_MASK			BIT(13)
 #define SPI_CLK_E2_MASK				BIT(12)
@@ -136,12 +139,16 @@
 #define PCIE2_RESET_E2_MASK			BIT(10)
 #define PCIE1_RESET_E2_MASK			BIT(9)
 #define PCIE0_RESET_E2_MASK			BIT(8)
+#define AN7583_MDIO_0_E2_MASK			BIT(5)
+#define AN7583_MDC_0_E2_MASK			BIT(4)
 #define UART1_RXD_E2_MASK			BIT(3)
 #define UART1_TXD_E2_MASK			BIT(2)
 #define I2C_SCL_E2_MASK				BIT(1)
 #define I2C_SDA_E2_MASK				BIT(0)
 
 #define REG_I2C_SDA_E4				0x0020
+#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
+#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
 #define SPI_MISO_E4_MASK			BIT(14)
 #define SPI_MOSI_E4_MASK			BIT(13)
 #define SPI_CLK_E4_MASK				BIT(12)
@@ -149,6 +156,8 @@
 #define PCIE2_RESET_E4_MASK			BIT(10)
 #define PCIE1_RESET_E4_MASK			BIT(9)
 #define PCIE0_RESET_E4_MASK			BIT(8)
+#define AN7583_MDIO_0_E4_MASK			BIT(5)
+#define AN7583_MDC_0_E4_MASK			BIT(4)
 #define UART1_RXD_E4_MASK			BIT(3)
 #define UART1_TXD_E4_MASK			BIT(2)
 #define I2C_SCL_E4_MASK				BIT(1)
@@ -160,6 +169,8 @@
 #define REG_GPIO_H_E4				0x0030
 
 #define REG_I2C_SDA_PU				0x0044
+#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
 #define SPI_MISO_PU_MASK			BIT(14)
 #define SPI_MOSI_PU_MASK			BIT(13)
 #define SPI_CLK_PU_MASK				BIT(12)
@@ -167,12 +178,16 @@
 #define PCIE2_RESET_PU_MASK			BIT(10)
 #define PCIE1_RESET_PU_MASK			BIT(9)
 #define PCIE0_RESET_PU_MASK			BIT(8)
+#define AN7583_MDIO_0_PU_MASK			BIT(5)
+#define AN7583_MDC_0_PU_MASK			BIT(4)
 #define UART1_RXD_PU_MASK			BIT(3)
 #define UART1_TXD_PU_MASK			BIT(2)
 #define I2C_SCL_PU_MASK				BIT(1)
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
+#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
@@ -180,6 +195,8 @@
 #define PCIE2_RESET_PD_MASK			BIT(10)
 #define PCIE1_RESET_PD_MASK			BIT(9)
 #define PCIE0_RESET_PD_MASK			BIT(8)
+#define AN7583_MDIO_0_PD_MASK			BIT(5)
+#define AN7583_MDC_0_PD_MASK			BIT(4)
 #define UART1_RXD_PD_MASK			BIT(3)
 #define UART1_TXD_PD_MASK			BIT(2)
 #define I2C_SCL_PD_MASK				BIT(1)
@@ -627,10 +644,223 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
 };
 
+static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
+	PINCTRL_PIN(2, "gpio0"),
+	PINCTRL_PIN(3, "gpio1"),
+	PINCTRL_PIN(4, "gpio2"),
+	PINCTRL_PIN(5, "gpio3"),
+	PINCTRL_PIN(6, "gpio4"),
+	PINCTRL_PIN(7, "gpio5"),
+	PINCTRL_PIN(8, "gpio6"),
+	PINCTRL_PIN(9, "gpio7"),
+	PINCTRL_PIN(10, "gpio8"),
+	PINCTRL_PIN(11, "gpio9"),
+	PINCTRL_PIN(12, "gpio10"),
+	PINCTRL_PIN(13, "gpio11"),
+	PINCTRL_PIN(14, "gpio12"),
+	PINCTRL_PIN(15, "gpio13"),
+	PINCTRL_PIN(16, "gpio14"),
+	PINCTRL_PIN(17, "gpio15"),
+	PINCTRL_PIN(18, "gpio16"),
+	PINCTRL_PIN(19, "gpio17"),
+	PINCTRL_PIN(20, "gpio18"),
+	PINCTRL_PIN(21, "gpio19"),
+	PINCTRL_PIN(22, "gpio20"),
+	PINCTRL_PIN(23, "gpio21"),
+	PINCTRL_PIN(24, "gpio22"),
+	PINCTRL_PIN(25, "gpio23"),
+	PINCTRL_PIN(26, "gpio24"),
+	PINCTRL_PIN(27, "gpio25"),
+	PINCTRL_PIN(28, "gpio26"),
+	PINCTRL_PIN(29, "gpio27"),
+	PINCTRL_PIN(30, "gpio28"),
+	PINCTRL_PIN(31, "gpio29"),
+	PINCTRL_PIN(32, "gpio30"),
+	PINCTRL_PIN(33, "gpio31"),
+	PINCTRL_PIN(34, "gpio32"),
+	PINCTRL_PIN(35, "gpio33"),
+	PINCTRL_PIN(36, "gpio34"),
+	PINCTRL_PIN(37, "gpio35"),
+	PINCTRL_PIN(38, "gpio36"),
+	PINCTRL_PIN(39, "gpio37"),
+	PINCTRL_PIN(40, "gpio38"),
+	PINCTRL_PIN(41, "i2c0_scl"),
+	PINCTRL_PIN(42, "i2c0_sda"),
+	PINCTRL_PIN(43, "i2c1_scl"),
+	PINCTRL_PIN(44, "i2c1_sda"),
+	PINCTRL_PIN(45, "spi_clk"),
+	PINCTRL_PIN(46, "spi_cs"),
+	PINCTRL_PIN(47, "spi_mosi"),
+	PINCTRL_PIN(48, "spi_miso"),
+	PINCTRL_PIN(49, "uart_txd"),
+	PINCTRL_PIN(50, "uart_rxd"),
+	PINCTRL_PIN(51, "pcie_reset0"),
+	PINCTRL_PIN(52, "pcie_reset1"),
+	PINCTRL_PIN(53, "mdc_0"),
+	PINCTRL_PIN(54, "mdio_0"),
+};
+
+static const int an7583_pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int an7583_pon_tod_1pps_pins[] = { 32 };
+static const int an7583_gsw_tod_1pps_pins[] = { 32 };
+static const int an7583_sipo_pins[] = { 34, 35 };
+static const int an7583_sipo_rclk_pins[] = { 34, 35, 33 };
+static const int an7583_mdio_pins[] = { 43, 44 };
+static const int an7583_uart2_pins[] = { 34, 35 };
+static const int an7583_uart2_cts_rts_pins[] = { 32, 33 };
+static const int an7583_hsuart_pins[] = { 30, 31 };
+static const int an7583_hsuart_cts_rts_pins[] = { 28, 29 };
+static const int an7583_npu_uart_pins[] = { 7, 8 };
+static const int an7583_uart4_pins[] = { 7, 8 };
+static const int an7583_uart5_pins[] = { 23, 24 };
+static const int an7583_i2c0_pins[] = { 41, 42 };
+static const int an7583_i2c1_pins[] = { 43, 44 };
+static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
+static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
+static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
+static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
+static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
+static const int an7583_spi_quad_pins[] = { 25, 26 };
+static const int an7583_spi_cs1_pins[] = { 27 };
+static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
+static const int an7583_pcm_spi_rst_pins[] = { 14 };
+static const int an7583_pcm_spi_cs1_pins[] = { 24 };
+static const int an7583_emmc_pins[] = { 7, 8, 9, 22, 23, 24, 25, 26, 45, 46, 47 };
+static const int an7583_pnand_pins[] = { 7, 8, 9, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 45, 46, 47, 48 };
+static const int an7583_gpio0_pins[] = { 2 };
+static const int an7583_gpio1_pins[] = { 3 };
+static const int an7583_gpio2_pins[] = { 4 };
+static const int an7583_gpio3_pins[] = { 5 };
+static const int an7583_gpio4_pins[] = { 6 };
+static const int an7583_gpio5_pins[] = { 7 };
+static const int an7583_gpio6_pins[] = { 8 };
+static const int an7583_gpio7_pins[] = { 9 };
+static const int an7583_gpio8_pins[] = { 10 };
+static const int an7583_gpio9_pins[] = { 11 };
+static const int an7583_gpio10_pins[] = { 12 };
+static const int an7583_gpio11_pins[] = { 13 };
+static const int an7583_gpio12_pins[] = { 14 };
+static const int an7583_gpio13_pins[] = { 15 };
+static const int an7583_gpio14_pins[] = { 16 };
+static const int an7583_gpio15_pins[] = { 17 };
+static const int an7583_gpio16_pins[] = { 18 };
+static const int an7583_gpio17_pins[] = { 19 };
+static const int an7583_gpio18_pins[] = { 20 };
+static const int an7583_gpio19_pins[] = { 21 };
+static const int an7583_gpio20_pins[] = { 22 };
+static const int an7583_gpio21_pins[] = { 24 };
+static const int an7583_gpio23_pins[] = { 25 };
+static const int an7583_gpio24_pins[] = { 26 };
+static const int an7583_gpio25_pins[] = { 27 };
+static const int an7583_gpio26_pins[] = { 28 };
+static const int an7583_gpio27_pins[] = { 29 };
+static const int an7583_gpio28_pins[] = { 30 };
+static const int an7583_gpio29_pins[] = { 31 };
+static const int an7583_gpio30_pins[] = { 32 };
+static const int an7583_gpio31_pins[] = { 33 };
+static const int an7583_gpio33_pins[] = { 35 };
+static const int an7583_gpio34_pins[] = { 36 };
+static const int an7583_gpio35_pins[] = { 37 };
+static const int an7583_gpio36_pins[] = { 38 };
+static const int an7583_gpio37_pins[] = { 39 };
+static const int an7583_gpio38_pins[] = { 40 };
+static const int an7583_gpio39_pins[] = { 41 };
+static const int an7583_gpio40_pins[] = { 42 };
+static const int an7583_gpio41_pins[] = { 43 };
+static const int an7583_gpio42_pins[] = { 44 };
+static const int an7583_gpio43_pins[] = { 45 };
+static const int an7583_gpio44_pins[] = { 46 };
+static const int an7583_gpio45_pins[] = { 47 };
+static const int an7583_gpio46_pins[] = { 48 };
+static const int an7583_gpio47_pins[] = { 49 };
+static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_pcie_reset0_pins[] = { 51 };
+static const int an7583_pcie_reset1_pins[] = { 52 };
+
+static const struct pingroup an7583_pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", an7583_pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", an7583_pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", an7583_gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
+	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", an7583_hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", an7583_hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("npu_uart", an7583_npu_uart),
+	PINCTRL_PIN_GROUP("uart4", an7583_uart4),
+	PINCTRL_PIN_GROUP("uart5", an7583_uart5),
+	PINCTRL_PIN_GROUP("i2c0", an7583_i2c0),
+	PINCTRL_PIN_GROUP("i2c1", an7583_i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", an7583_jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", an7583_jtag_dfd),
+	PINCTRL_PIN_GROUP("pcm1", an7583_pcm1),
+	PINCTRL_PIN_GROUP("pcm2", an7583_pcm2),
+	PINCTRL_PIN_GROUP("spi", an7583_spi),
+	PINCTRL_PIN_GROUP("spi_quad", an7583_spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", an7583_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", an7583_pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", an7583_pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", an7583_pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("emmc", an7583_emmc),
+	PINCTRL_PIN_GROUP("pnand", an7583_pnand),
+	PINCTRL_PIN_GROUP("gpio0", an7583_gpio0),
+	PINCTRL_PIN_GROUP("gpio1", an7583_gpio1),
+	PINCTRL_PIN_GROUP("gpio2", an7583_gpio2),
+	PINCTRL_PIN_GROUP("gpio3", an7583_gpio3),
+	PINCTRL_PIN_GROUP("gpio4", an7583_gpio4),
+	PINCTRL_PIN_GROUP("gpio5", an7583_gpio5),
+	PINCTRL_PIN_GROUP("gpio6", an7583_gpio6),
+	PINCTRL_PIN_GROUP("gpio7", an7583_gpio7),
+	PINCTRL_PIN_GROUP("gpio8", an7583_gpio8),
+	PINCTRL_PIN_GROUP("gpio9", an7583_gpio9),
+	PINCTRL_PIN_GROUP("gpio10", an7583_gpio10),
+	PINCTRL_PIN_GROUP("gpio11", an7583_gpio11),
+	PINCTRL_PIN_GROUP("gpio12", an7583_gpio12),
+	PINCTRL_PIN_GROUP("gpio13", an7583_gpio13),
+	PINCTRL_PIN_GROUP("gpio14", an7583_gpio14),
+	PINCTRL_PIN_GROUP("gpio15", an7583_gpio15),
+	PINCTRL_PIN_GROUP("gpio16", an7583_gpio16),
+	PINCTRL_PIN_GROUP("gpio17", an7583_gpio17),
+	PINCTRL_PIN_GROUP("gpio18", an7583_gpio18),
+	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
+	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
+	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
+	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
+	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
+	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
+	PINCTRL_PIN_GROUP("gpio26", an7583_gpio26),
+	PINCTRL_PIN_GROUP("gpio27", an7583_gpio27),
+	PINCTRL_PIN_GROUP("gpio28", an7583_gpio28),
+	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
+	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
+	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
+	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
+	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
+	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
+	PINCTRL_PIN_GROUP("gpio36", an7583_gpio36),
+	PINCTRL_PIN_GROUP("gpio37", an7583_gpio37),
+	PINCTRL_PIN_GROUP("gpio38", an7583_gpio38),
+	PINCTRL_PIN_GROUP("gpio39", an7583_gpio39),
+	PINCTRL_PIN_GROUP("gpio40", an7583_gpio40),
+	PINCTRL_PIN_GROUP("gpio41", an7583_gpio41),
+	PINCTRL_PIN_GROUP("gpio42", an7583_gpio42),
+	PINCTRL_PIN_GROUP("gpio43", an7583_gpio43),
+	PINCTRL_PIN_GROUP("gpio44", an7583_gpio44),
+	PINCTRL_PIN_GROUP("gpio45", an7583_gpio45),
+	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
+};
+
 static const char *const pon_groups[] = { "pon" };
 static const char *const tod_1pps_groups[] = { "pon_tod_1pps", "gsw_tod_1pps" };
 static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
+static const char *const an7583_mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = { "uart2", "uart2_cts_rts", "hsuart",
 					   "hsuart_cts_rts", "uart4",
 					   "uart5" };
@@ -643,11 +873,16 @@ static const char *const pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
 					      "pcm_spi_cs2_p156",
 					      "pcm_spi_cs2_p128",
 					      "pcm_spi_cs3", "pcm_spi_cs4" };
+static const char *const an7583_pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
+						     "pcm_spi_rst", "pcm_spi_cs1",
+						     "pcm_spi_cs2", "pcm_spi_cs3",
+						     "pcm_spi_cs4" };
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
 					  "gpio4", "gpio5",
@@ -686,6 +921,22 @@ static const char *const phy3_led1_groups[] = { "gpio43", "gpio44",
 						"gpio45", "gpio46" };
 static const char *const phy4_led1_groups[] = { "gpio43", "gpio44",
 						"gpio45", "gpio46" };
+static const char *const an7583_phy1_led0_groups[] = { "gpio1", "gpio2",
+						       "gpio3", "gpio4" };
+static const char *const an7583_phy2_led0_groups[] = { "gpio1", "gpio2",
+						       "gpio3", "gpio4" };
+static const char *const an7583_phy3_led0_groups[] = { "gpio1", "gpio2",
+						       "gpio3", "gpio4" };
+static const char *const an7583_phy4_led0_groups[] = { "gpio1", "gpio2",
+						       "gpio3", "gpio4" };
+static const char *const an7583_phy1_led1_groups[] = { "gpio8", "gpio9",
+						       "gpio10", "gpio11" };
+static const char *const an7583_phy2_led1_groups[] = { "gpio8", "gpio9",
+						       "gpio10", "gpio11" };
+static const char *const an7583_phy3_led1_groups[] = { "gpio8", "gpio9",
+						       "gpio10", "gpio11" };
+static const char *const an7583_phy4_led1_groups[] = { "gpio8", "gpio9",
+						       "gpio10", "gpio11" };
 
 static const struct airoha_pinctrl_func_group pon_func_group[] = {
 	{
@@ -763,6 +1014,25 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
+	{
+		.name = "mdio",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_SGMII_MDIO_MODE_MASK,
+			GPIO_SGMII_MDIO_MODE_MASK
+		},
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_MDC_IO_MASTER_MODE_MODE,
+			GPIO_MDC_IO_MASTER_MODE_MODE
+		},
+		.regmap_size = 2,
+	},
+};
+
 static const struct airoha_pinctrl_func_group uart_func_group[] = {
 	{
 		.name = "uart2",
@@ -1004,6 +1274,73 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
+	{
+		.name = "pcm_spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_MODE_MASK,
+			GPIO_PCM_SPI_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_int",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_INT_MODE_MASK,
+			GPIO_PCM_INT_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_rst",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_RESET_MODE_MASK,
+			GPIO_PCM_RESET_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS1_MODE_MASK,
+			GPIO_PCM_SPI_CS1_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs2",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
+			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs3",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS3_MODE_MASK,
+			GPIO_PCM_SPI_CS3_MODE_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcm_spi_cs4",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_SPI_CS1_MODE,
+			GPIO_PCM_SPI_CS4_MODE_MASK,
+			GPIO_PCM_SPI_CS4_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group i2s_func_group[] = {
 	{
 		.name = "i2s",
@@ -1074,6 +1411,28 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
+	{
+		.name = "pcie_reset0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET0_MASK,
+			GPIO_PCIE_RESET0_MASK
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "pcie_reset1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET1_MASK,
+			GPIO_PCIE_RESET1_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 /* PWM */
 #define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
 	{						\
@@ -1252,6 +1611,94 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
+static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio1", GPIO_LAN0_LED0_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED("gpio2", GPIO_LAN1_LED0_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED("gpio3", GPIO_LAN2_LED0_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+	AIROHA_PINCTRL_PHY_LED("gpio4", GPIO_LAN3_LED0_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+	AIROHA_PINCTRL_PHY_LED("gpio1", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+	AIROHA_PINCTRL_PHY_LED("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
+static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
+	AIROHA_PINCTRL_PHY_LED("gpio8", GPIO_LAN0_LED1_MODE_MASK,
+			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio9", GPIO_LAN1_LED1_MODE_MASK,
+			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio10", GPIO_LAN2_LED1_MODE_MASK,
+			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+	AIROHA_PINCTRL_PHY_LED("gpio11", GPIO_LAN3_LED1_MODE_MASK,
+			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+};
+
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
@@ -1278,6 +1725,31 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
+static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
+	PINCTRL_FUNC_DESC("emmc", emmc),
+	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", an7583_phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", an7583_phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", an7583_phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", an7583_phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", an7583_phy4_led1),
+};
+
 static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
@@ -1339,6 +1811,62 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
+static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_PU, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_PU, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_PU, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_PU, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_PU, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_PU, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_PU, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_PU, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_PU, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_PU, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PU, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PU, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PU, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PU, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PU, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PU, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PU, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PU, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_PU, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_PU, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_PU, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_PU, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_PU, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_PU, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_PU, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, AN7583_I2C1_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, AN7583_I2C1_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_PU, SPI_MISO_PU_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, AN7583_MDC_0_PU_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, AN7583_MDIO_0_PU_MASK),
+};
+
 static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
@@ -1400,6 +1928,62 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
+static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_PD, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_PD, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_PD, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_PD, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_PD, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_PD, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_PD, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_PD, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_PD, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_PD, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_PD, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_PD, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_PD, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_PD, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_PD, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_PD, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_PD, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_PD, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_PD, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_PD, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_PD, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_PD, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_PD, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_PD, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_PD, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_PD, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_PD, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, AN7583_I2C1_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, AN7583_I2C1_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_PD, SPI_MISO_PD_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, AN7583_MDC_0_PD_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, AN7583_MDIO_0_PD_MASK),
+};
+
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
@@ -1461,6 +2045,62 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
+static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_E2, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_E2, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_E2, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_E2, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_E2, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_E2, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_E2, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_E2, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_E2, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_E2, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E2, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E2, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E2, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E2, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E2, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E2, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E2, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E2, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E2, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E2, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_E2, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_E2, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_E2, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_E2, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_E2, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_E2, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_E2, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, AN7583_I2C1_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, AN7583_I2C1_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_E2, SPI_MISO_E2_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, AN7583_MDC_0_E2_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, AN7583_MDIO_0_E2_MASK),
+};
+
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
@@ -1522,12 +2162,73 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
+static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
+	PINCTRL_CONF_DESC(2, REG_GPIO_L_E4, BIT(0)),
+	PINCTRL_CONF_DESC(3, REG_GPIO_L_E4, BIT(1)),
+	PINCTRL_CONF_DESC(4, REG_GPIO_L_E4, BIT(2)),
+	PINCTRL_CONF_DESC(5, REG_GPIO_L_E4, BIT(3)),
+	PINCTRL_CONF_DESC(6, REG_GPIO_L_E4, BIT(4)),
+	PINCTRL_CONF_DESC(7, REG_GPIO_L_E4, BIT(5)),
+	PINCTRL_CONF_DESC(8, REG_GPIO_L_E4, BIT(6)),
+	PINCTRL_CONF_DESC(9, REG_GPIO_L_E4, BIT(7)),
+	PINCTRL_CONF_DESC(10, REG_GPIO_L_E4, BIT(8)),
+	PINCTRL_CONF_DESC(11, REG_GPIO_L_E4, BIT(9)),
+	PINCTRL_CONF_DESC(12, REG_GPIO_L_E4, BIT(10)),
+	PINCTRL_CONF_DESC(13, REG_GPIO_L_E4, BIT(11)),
+	PINCTRL_CONF_DESC(14, REG_GPIO_L_E4, BIT(12)),
+	PINCTRL_CONF_DESC(15, REG_GPIO_L_E4, BIT(13)),
+	PINCTRL_CONF_DESC(16, REG_GPIO_L_E4, BIT(14)),
+	PINCTRL_CONF_DESC(17, REG_GPIO_L_E4, BIT(15)),
+	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
+	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
+	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
+	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
+	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
+	PINCTRL_CONF_DESC(25, REG_GPIO_L_E4, BIT(23)),
+	PINCTRL_CONF_DESC(26, REG_GPIO_L_E4, BIT(24)),
+	PINCTRL_CONF_DESC(27, REG_GPIO_L_E4, BIT(25)),
+	PINCTRL_CONF_DESC(28, REG_GPIO_L_E4, BIT(26)),
+	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(27)),
+	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(28)),
+	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(29)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(30)),
+	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(31)),
+	PINCTRL_CONF_DESC(34, REG_GPIO_H_E4, BIT(0)),
+	PINCTRL_CONF_DESC(35, REG_GPIO_H_E4, BIT(1)),
+	PINCTRL_CONF_DESC(36, REG_GPIO_H_E4, BIT(2)),
+	PINCTRL_CONF_DESC(37, REG_GPIO_H_E4, BIT(3)),
+	PINCTRL_CONF_DESC(38, REG_GPIO_H_E4, BIT(4)),
+	PINCTRL_CONF_DESC(39, REG_GPIO_H_E4, BIT(5)),
+	PINCTRL_CONF_DESC(40, REG_GPIO_H_E4, BIT(6)),
+	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, AN7583_I2C1_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, AN7583_I2C1_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
+	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
+	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
+	PINCTRL_CONF_DESC(48, REG_I2C_SDA_E4, SPI_MISO_E4_MASK),
+	PINCTRL_CONF_DESC(49, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
+	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
+	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, AN7583_MDC_0_E4_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, AN7583_MDIO_0_E4_MASK),
+};
+
 static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
+static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
+	PINCTRL_CONF_DESC(51, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(52, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+};
+
 static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 					    struct pinctrl_gpio_range *range,
 					    int pin)
@@ -2261,8 +2962,40 @@ static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
 	},
 };
 
+static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
+	.pins = an7583_pinctrl_pins,
+	.num_pins = ARRAY_SIZE(an7583_pinctrl_pins),
+	.grps = an7583_pinctrl_groups,
+	.num_grps = ARRAY_SIZE(an7583_pinctrl_groups),
+	.funcs = an7583_pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(an7583_pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = an7583_pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = an7583_pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = en7581_pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = an7583_pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e4_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
+			.confs = an7583_pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(an7583_pinctrl_pcie_rst_od_conf),
+		},
+	},
+};
+
 static const struct of_device_id airoha_pinctrl_of_match[] = {
 	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
+	{ .compatible = "airoha,an7583-pinctrl", .data = &an7583_pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.48.1


