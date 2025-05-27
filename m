Return-Path: <linux-gpio+bounces-20616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB541AC5CE0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 055EF3A43F8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2362321883C;
	Tue, 27 May 2025 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieNz0fri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C79621765B;
	Tue, 27 May 2025 22:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384473; cv=none; b=mz+7WKdZh5f0Hqqf54v87FsRtafo0906awqlGNnK6+TFPzYZgLRxYDa4ziHEfPa3iksrvPDWmrO6bsxBwpqjaK4EaiMr1ECrHaYmzuBrYpVLyxR+OiiwNKkb/GwOnC/9vaQcJ2RfG2m6XKaM0RSRTmfoszhFPf9WY3/MF5Ndt8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384473; c=relaxed/simple;
	bh=JJKtf2c0+VB180PIO0EHKthwD7qt05RzdnLcJlT4bSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0mZpudFTmcGlZXqh8NZ+E4J+3Do7fbfjVr9QOmmKuhtLTFO8LdqXs+VDSGTPxEukDcCTZlIhKwFRFF/j6xxJp+GxBwf+yLs5BYFdU2XCw5bi7wq3iIhOi7y1FliXtsQcZ5zsEjQ/q46d7oz94kYpfRtmGed1PqJ0fXTCuq/rQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieNz0fri; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso33533345e9.2;
        Tue, 27 May 2025 15:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384469; x=1748989269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3NADvkga3zsMnIDaERP8P2SH/kTuoL1CAc5aDMyKmc=;
        b=ieNz0friSMOz0z+i33i7ANS6qJIbwBI4TNBo8qzCBPalUrByxT7heAmQiv9A+z/SXf
         IoIIXKOwp5dssMRctDl4wjCNmMiv6ALmqwahpGbT0lvI9qHGYwH2coe9rx7yLwizRydt
         HVFljHrulQE0wAtR2ISuj/Hpf2MzyYzzMNKrsY/IbtVCAo8rOZ2QrQuTbrEme6OedwOI
         mwYT294pisuRUOrmaBnp1XxjP6U4GQrxxYklm11hdxMp/0/jqHk3O+J98rxvZoPDJ6Uw
         rYAoIQo73dHNs5ghhLLmfVUMwKjo/Y5KGJeHIcMXQ0+2C4t9X9V5zyj6gYBMK1RHW2hZ
         6gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384469; x=1748989269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3NADvkga3zsMnIDaERP8P2SH/kTuoL1CAc5aDMyKmc=;
        b=R99pjxSI0evPTHmWN7cxEeVW6KtUQFxqHSx1sG9mmh5JwpWIUHDL16X04dZfepZw2f
         /cDDHZuBJLPrxH42PgMARt+4wfMyLWn2Ok1rYbaBD2qI2z+keGEyEJaF2bOjhg0+vz3r
         jwD1WY3qDdiMOgs54wmnmzaQqNWG9Gz2SLE+m5xIguB4AsemCpyGV2XfWoS9QehkVILt
         wU0GC0LIgm8niDt44NKe+ECGkGPNxiDnjTaBemBKektoHh4r9YjcVCecqyCsODcXW2V7
         RzU7KT4Mj0DBFi9LGdWo3Xep3wGl7UP7josVkBw5ZEQ7UToCwx8S80sZgJn970NKRU8S
         /H3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi5qtw/xrSDxikTMVRf2/1dYAR9q1Ke+CWHynUACwQeRiNd1Jj6nyALj1ybKYg+9OGHGXhKUr21j4N@vger.kernel.org, AJvYcCXi8601WvJI8071iCig071bVHjcbTfw0sU7JvQDFVBKJAy3s+o7KjUu2a8w0ZdomPYOWTtJAOd4Wz3Cyg==@vger.kernel.org, AJvYcCXyG/Z6FegrnrKnCwrGxfShjdTavZIe/DhVNZhbXnoySfbWCQ6XbkdfKdYQumJcETjzg6iBZRdhYzcmc62W@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCz0DxGzJSDx4iyZEOmdURH02s6gAcDTNiHRAVCUXU3qgl5aK
	FQ9g7Hxk3N6p2Fd0WVH96KKxk6m2V78aMwZL8priv+Pu6tukN8klcNMmpFTxeg==
X-Gm-Gg: ASbGncvO8VsvHVo6PofsHJRvlj5xJs+mOpXOkYIG7eaU/h7Dezma83xs8h8SSmE4cwq
	DyP/RO3ZqxrWWb9Jm57wxvl0HqP2GO7D9HWQ3ui12dbPnaQnq5m5A6rBH7DyG2auSJDYi+m3jgA
	VaRyJmFvCm+TRMy275vtZkwqQgnrQOi9u5+Ed2JsJeHviMp90Sfuvk35ueAon9otlQee117cKIg
	mhc3i19xO7T798gydNuiXqchrQ7//dGfK/ay+ae4InIJfZNoARzpPr6omJ133/Uo+KZkaPsasl5
	ARwej1xQIHMgYybgrymfD10SiiWoYSfhf+kVmghBwZ2r1sfaVzeJMS1xwgqUtW2LPB8z9gmflJD
	oFE35/2jsF/sbU+B2MzIu
X-Google-Smtp-Source: AGHT+IHeJk9AIJsEiPsDyOdkcBclUn9Ng6cF493QMFTmIDUtcT3zRKSyDDIr4ygGErAH4I0uAPPn+g==
X-Received: by 2002:a05:6000:4284:b0:3a4:cad8:42b0 with SMTP id ffacd0b85a97d-3a4cb47e137mr11905018f8f.47.1748384469086;
        Tue, 27 May 2025 15:21:09 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:08 -0700 (PDT)
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
Subject: [PATCH 2/6] pinctrl: mediatek: airoha: generalize pins/group/function/confs handling
Date: Wed, 28 May 2025 00:20:34 +0200
Message-ID: <20250527222040.32000-3-ansuelsmth@gmail.com>
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

In preparation for support of Airoha AN7583, generalize
pins/group/function/confs handling and move them in match_data.
Inner function will base the values on the pinctrl priv struct instead of
relying on hardcoded struct.

This permits to use different PIN data while keeping the same logic.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 569 ++++++++++++----------
 1 file changed, 319 insertions(+), 250 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 8ef7f88477aa..8af9109db992 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -30,20 +30,20 @@
 #include "../pinconf.h"
 #include "../pinmux.h"
 
-#define PINCTRL_PIN_GROUP(id)						\
-	PINCTRL_PINGROUP(#id, id##_pins, ARRAY_SIZE(id##_pins))
+#define PINCTRL_PIN_GROUP(id, table)					\
+	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
 
-#define PINCTRL_FUNC_DESC(id)						\
+#define PINCTRL_FUNC_DESC(id, table)					\
 	{								\
 		.desc = {						\
 			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
+				.name = id,				\
+				.groups = table##_groups,		\
+				.ngroups = ARRAY_SIZE(table##_groups),	\
 			}						\
 		},							\
-		.groups = id##_func_group,				\
-		.group_size = ARRAY_SIZE(id##_func_group),		\
+		.groups = table##_func_group,				\
+		.group_size = ARRAY_SIZE(table##_func_group),		\
 	}
 
 #define PINCTRL_CONF_DESC(p, offset, mask)				\
@@ -359,16 +359,46 @@ struct airoha_pinctrl_gpiochip {
 	u32 irq_type[AIROHA_NUM_PINS];
 };
 
+struct airoha_pinctrl_confs_info {
+	const struct airoha_pinctrl_conf *confs;
+	unsigned int num_confs;
+};
+
+enum airoha_pinctrl_confs_type {
+	AIROHA_PINCTRL_CONFS_PULLUP,
+	AIROHA_PINCTRL_CONFS_PULLDOWN,
+	AIROHA_PINCTRL_CONFS_DRIVE_E2,
+	AIROHA_PINCTRL_CONFS_DRIVE_E4,
+	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
+
+	AIROHA_PINCTRL_CONFS_MAX,
+};
+
 struct airoha_pinctrl {
 	struct pinctrl_dev *ctrl;
 
+	struct pinctrl_desc desc;
+	const struct pingroup *grps;
+	const struct airoha_pinctrl_func *funcs;
+	const struct airoha_pinctrl_confs_info *confs_info;
+
 	struct regmap *chip_scu;
 	struct regmap *regmap;
 
 	struct airoha_pinctrl_gpiochip gpiochip;
 };
 
-static struct pinctrl_pin_desc airoha_pinctrl_pins[] = {
+struct airoha_pinctrl_match_data {
+	const struct pinctrl_pin_desc *pins;
+	const unsigned int num_pins;
+	const struct pingroup *grps;
+	const unsigned int num_grps;
+	const struct airoha_pinctrl_func *funcs;
+	const unsigned int num_funcs;
+	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+};
+
+static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
 	PINCTRL_PIN(2, "i2c_scl"),
@@ -429,172 +459,172 @@ static struct pinctrl_pin_desc airoha_pinctrl_pins[] = {
 	PINCTRL_PIN(63, "pcie_reset2"),
 };
 
-static const int pon_pins[] = { 49, 50, 51, 52, 53, 54 };
-static const int pon_tod_1pps_pins[] = { 46 };
-static const int gsw_tod_1pps_pins[] = { 46 };
-static const int sipo_pins[] = { 16, 17 };
-static const int sipo_rclk_pins[] = { 16, 17, 43 };
-static const int mdio_pins[] = { 14, 15 };
-static const int uart2_pins[] = { 48, 55 };
-static const int uart2_cts_rts_pins[] = { 46, 47 };
-static const int hsuart_pins[] = { 28, 29 };
-static const int hsuart_cts_rts_pins[] = { 26, 27 };
-static const int uart4_pins[] = { 38, 39 };
-static const int uart5_pins[] = { 18, 19 };
-static const int i2c0_pins[] = { 2, 3 };
-static const int i2c1_pins[] = { 14, 15 };
-static const int jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
-static const int jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
-static const int i2s_pins[] = { 26, 27, 28, 29 };
-static const int pcm1_pins[] = { 22, 23, 24, 25 };
-static const int pcm2_pins[] = { 18, 19, 20, 21 };
-static const int spi_quad_pins[] = { 32, 33 };
-static const int spi_pins[] = { 4, 5, 6, 7 };
-static const int spi_cs1_pins[] = { 34 };
-static const int pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
-static const int pcm_spi_int_pins[] = { 14 };
-static const int pcm_spi_rst_pins[] = { 15 };
-static const int pcm_spi_cs1_pins[] = { 43 };
-static const int pcm_spi_cs2_pins[] = { 40 };
-static const int pcm_spi_cs2_p128_pins[] = { 40 };
-static const int pcm_spi_cs2_p156_pins[] = { 40 };
-static const int pcm_spi_cs3_pins[] = { 41 };
-static const int pcm_spi_cs4_pins[] = { 42 };
-static const int emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
-static const int pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
-static const int gpio0_pins[] = { 13 };
-static const int gpio1_pins[] = { 14 };
-static const int gpio2_pins[] = { 15 };
-static const int gpio3_pins[] = { 16 };
-static const int gpio4_pins[] = { 17 };
-static const int gpio5_pins[] = { 18 };
-static const int gpio6_pins[] = { 19 };
-static const int gpio7_pins[] = { 20 };
-static const int gpio8_pins[] = { 21 };
-static const int gpio9_pins[] = { 22 };
-static const int gpio10_pins[] = { 23 };
-static const int gpio11_pins[] = { 24 };
-static const int gpio12_pins[] = { 25 };
-static const int gpio13_pins[] = { 26 };
-static const int gpio14_pins[] = { 27 };
-static const int gpio15_pins[] = { 28 };
-static const int gpio16_pins[] = { 29 };
-static const int gpio17_pins[] = { 30 };
-static const int gpio18_pins[] = { 31 };
-static const int gpio19_pins[] = { 32 };
-static const int gpio20_pins[] = { 33 };
-static const int gpio21_pins[] = { 34 };
-static const int gpio22_pins[] = { 35 };
-static const int gpio23_pins[] = { 36 };
-static const int gpio24_pins[] = { 37 };
-static const int gpio25_pins[] = { 38 };
-static const int gpio26_pins[] = { 39 };
-static const int gpio27_pins[] = { 40 };
-static const int gpio28_pins[] = { 41 };
-static const int gpio29_pins[] = { 42 };
-static const int gpio30_pins[] = { 43 };
-static const int gpio31_pins[] = { 44 };
-static const int gpio33_pins[] = { 46 };
-static const int gpio34_pins[] = { 47 };
-static const int gpio35_pins[] = { 48 };
-static const int gpio36_pins[] = { 49 };
-static const int gpio37_pins[] = { 50 };
-static const int gpio38_pins[] = { 51 };
-static const int gpio39_pins[] = { 52 };
-static const int gpio40_pins[] = { 53 };
-static const int gpio41_pins[] = { 54 };
-static const int gpio42_pins[] = { 55 };
-static const int gpio43_pins[] = { 56 };
-static const int gpio44_pins[] = { 57 };
-static const int gpio45_pins[] = { 58 };
-static const int gpio46_pins[] = { 59 };
-static const int pcie_reset0_pins[] = { 61 };
-static const int pcie_reset1_pins[] = { 62 };
-static const int pcie_reset2_pins[] = { 63 };
-
-static const struct pingroup airoha_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP(pon),
-	PINCTRL_PIN_GROUP(pon_tod_1pps),
-	PINCTRL_PIN_GROUP(gsw_tod_1pps),
-	PINCTRL_PIN_GROUP(sipo),
-	PINCTRL_PIN_GROUP(sipo_rclk),
-	PINCTRL_PIN_GROUP(mdio),
-	PINCTRL_PIN_GROUP(uart2),
-	PINCTRL_PIN_GROUP(uart2_cts_rts),
-	PINCTRL_PIN_GROUP(hsuart),
-	PINCTRL_PIN_GROUP(hsuart_cts_rts),
-	PINCTRL_PIN_GROUP(uart4),
-	PINCTRL_PIN_GROUP(uart5),
-	PINCTRL_PIN_GROUP(i2c0),
-	PINCTRL_PIN_GROUP(i2c1),
-	PINCTRL_PIN_GROUP(jtag_udi),
-	PINCTRL_PIN_GROUP(jtag_dfd),
-	PINCTRL_PIN_GROUP(i2s),
-	PINCTRL_PIN_GROUP(pcm1),
-	PINCTRL_PIN_GROUP(pcm2),
-	PINCTRL_PIN_GROUP(spi),
-	PINCTRL_PIN_GROUP(spi_quad),
-	PINCTRL_PIN_GROUP(spi_cs1),
-	PINCTRL_PIN_GROUP(pcm_spi),
-	PINCTRL_PIN_GROUP(pcm_spi_int),
-	PINCTRL_PIN_GROUP(pcm_spi_rst),
-	PINCTRL_PIN_GROUP(pcm_spi_cs1),
-	PINCTRL_PIN_GROUP(pcm_spi_cs2_p128),
-	PINCTRL_PIN_GROUP(pcm_spi_cs2_p156),
-	PINCTRL_PIN_GROUP(pcm_spi_cs2),
-	PINCTRL_PIN_GROUP(pcm_spi_cs3),
-	PINCTRL_PIN_GROUP(pcm_spi_cs4),
-	PINCTRL_PIN_GROUP(emmc),
-	PINCTRL_PIN_GROUP(pnand),
-	PINCTRL_PIN_GROUP(gpio0),
-	PINCTRL_PIN_GROUP(gpio1),
-	PINCTRL_PIN_GROUP(gpio2),
-	PINCTRL_PIN_GROUP(gpio3),
-	PINCTRL_PIN_GROUP(gpio4),
-	PINCTRL_PIN_GROUP(gpio5),
-	PINCTRL_PIN_GROUP(gpio6),
-	PINCTRL_PIN_GROUP(gpio7),
-	PINCTRL_PIN_GROUP(gpio8),
-	PINCTRL_PIN_GROUP(gpio9),
-	PINCTRL_PIN_GROUP(gpio10),
-	PINCTRL_PIN_GROUP(gpio11),
-	PINCTRL_PIN_GROUP(gpio12),
-	PINCTRL_PIN_GROUP(gpio13),
-	PINCTRL_PIN_GROUP(gpio14),
-	PINCTRL_PIN_GROUP(gpio15),
-	PINCTRL_PIN_GROUP(gpio16),
-	PINCTRL_PIN_GROUP(gpio17),
-	PINCTRL_PIN_GROUP(gpio18),
-	PINCTRL_PIN_GROUP(gpio19),
-	PINCTRL_PIN_GROUP(gpio20),
-	PINCTRL_PIN_GROUP(gpio21),
-	PINCTRL_PIN_GROUP(gpio22),
-	PINCTRL_PIN_GROUP(gpio23),
-	PINCTRL_PIN_GROUP(gpio24),
-	PINCTRL_PIN_GROUP(gpio25),
-	PINCTRL_PIN_GROUP(gpio26),
-	PINCTRL_PIN_GROUP(gpio27),
-	PINCTRL_PIN_GROUP(gpio28),
-	PINCTRL_PIN_GROUP(gpio29),
-	PINCTRL_PIN_GROUP(gpio30),
-	PINCTRL_PIN_GROUP(gpio31),
-	PINCTRL_PIN_GROUP(gpio33),
-	PINCTRL_PIN_GROUP(gpio34),
-	PINCTRL_PIN_GROUP(gpio35),
-	PINCTRL_PIN_GROUP(gpio36),
-	PINCTRL_PIN_GROUP(gpio37),
-	PINCTRL_PIN_GROUP(gpio38),
-	PINCTRL_PIN_GROUP(gpio39),
-	PINCTRL_PIN_GROUP(gpio40),
-	PINCTRL_PIN_GROUP(gpio41),
-	PINCTRL_PIN_GROUP(gpio42),
-	PINCTRL_PIN_GROUP(gpio43),
-	PINCTRL_PIN_GROUP(gpio44),
-	PINCTRL_PIN_GROUP(gpio45),
-	PINCTRL_PIN_GROUP(gpio46),
-	PINCTRL_PIN_GROUP(pcie_reset0),
-	PINCTRL_PIN_GROUP(pcie_reset1),
-	PINCTRL_PIN_GROUP(pcie_reset2),
+static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
+static const int en7581_pon_tod_1pps_pins[] = { 46 };
+static const int en7581_gsw_tod_1pps_pins[] = { 46 };
+static const int en7581_sipo_pins[] = { 16, 17 };
+static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
+static const int en7581_mdio_pins[] = { 14, 15 };
+static const int en7581_uart2_pins[] = { 48, 55 };
+static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
+static const int en7581_hsuart_pins[] = { 28, 29 };
+static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
+static const int en7581_uart4_pins[] = { 38, 39 };
+static const int en7581_uart5_pins[] = { 18, 19 };
+static const int en7581_i2c0_pins[] = { 2, 3 };
+static const int en7581_i2c1_pins[] = { 14, 15 };
+static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
+static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
+static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
+static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
+static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
+static const int en7581_spi_quad_pins[] = { 32, 33 };
+static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
+static const int en7581_spi_cs1_pins[] = { 34 };
+static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
+static const int en7581_pcm_spi_int_pins[] = { 14 };
+static const int en7581_pcm_spi_rst_pins[] = { 15 };
+static const int en7581_pcm_spi_cs1_pins[] = { 43 };
+static const int en7581_pcm_spi_cs2_pins[] = { 40 };
+static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
+static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
+static const int en7581_pcm_spi_cs3_pins[] = { 41 };
+static const int en7581_pcm_spi_cs4_pins[] = { 42 };
+static const int en7581_emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
+static const int en7581_pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
+static const int en7581_gpio0_pins[] = { 13 };
+static const int en7581_gpio1_pins[] = { 14 };
+static const int en7581_gpio2_pins[] = { 15 };
+static const int en7581_gpio3_pins[] = { 16 };
+static const int en7581_gpio4_pins[] = { 17 };
+static const int en7581_gpio5_pins[] = { 18 };
+static const int en7581_gpio6_pins[] = { 19 };
+static const int en7581_gpio7_pins[] = { 20 };
+static const int en7581_gpio8_pins[] = { 21 };
+static const int en7581_gpio9_pins[] = { 22 };
+static const int en7581_gpio10_pins[] = { 23 };
+static const int en7581_gpio11_pins[] = { 24 };
+static const int en7581_gpio12_pins[] = { 25 };
+static const int en7581_gpio13_pins[] = { 26 };
+static const int en7581_gpio14_pins[] = { 27 };
+static const int en7581_gpio15_pins[] = { 28 };
+static const int en7581_gpio16_pins[] = { 29 };
+static const int en7581_gpio17_pins[] = { 30 };
+static const int en7581_gpio18_pins[] = { 31 };
+static const int en7581_gpio19_pins[] = { 32 };
+static const int en7581_gpio20_pins[] = { 33 };
+static const int en7581_gpio21_pins[] = { 34 };
+static const int en7581_gpio22_pins[] = { 35 };
+static const int en7581_gpio23_pins[] = { 36 };
+static const int en7581_gpio24_pins[] = { 37 };
+static const int en7581_gpio25_pins[] = { 38 };
+static const int en7581_gpio26_pins[] = { 39 };
+static const int en7581_gpio27_pins[] = { 40 };
+static const int en7581_gpio28_pins[] = { 41 };
+static const int en7581_gpio29_pins[] = { 42 };
+static const int en7581_gpio30_pins[] = { 43 };
+static const int en7581_gpio31_pins[] = { 44 };
+static const int en7581_gpio33_pins[] = { 46 };
+static const int en7581_gpio34_pins[] = { 47 };
+static const int en7581_gpio35_pins[] = { 48 };
+static const int en7581_gpio36_pins[] = { 49 };
+static const int en7581_gpio37_pins[] = { 50 };
+static const int en7581_gpio38_pins[] = { 51 };
+static const int en7581_gpio39_pins[] = { 52 };
+static const int en7581_gpio40_pins[] = { 53 };
+static const int en7581_gpio41_pins[] = { 54 };
+static const int en7581_gpio42_pins[] = { 55 };
+static const int en7581_gpio43_pins[] = { 56 };
+static const int en7581_gpio44_pins[] = { 57 };
+static const int en7581_gpio45_pins[] = { 58 };
+static const int en7581_gpio46_pins[] = { 59 };
+static const int en7581_pcie_reset0_pins[] = { 61 };
+static const int en7581_pcie_reset1_pins[] = { 62 };
+static const int en7581_pcie_reset2_pins[] = { 63 };
+
+static const struct pingroup en7581_pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", en7581_pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
+	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
+	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
+	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
+	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
+	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
+	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
+	PINCTRL_PIN_GROUP("spi", en7581_spi),
+	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
+	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
+	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
+	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
+	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
+	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
+	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
+	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
+	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
+	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
+	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
+	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
+	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
+	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
+	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
+	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
+	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
+	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
+	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
+	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
+	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
+	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
+	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
+	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
+	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
+	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
+	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
+	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
+	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
+	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
+	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
+	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
+	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
+	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
+	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
+	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
+	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
+	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
+	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
+	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
+	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
+	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
+	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
+	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
+	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
+	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
+	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
+	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
+	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
 };
 
 static const char *const pon_groups[] = { "pon" };
@@ -1957,33 +1987,33 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
-	PINCTRL_FUNC_DESC(pon),
-	PINCTRL_FUNC_DESC(tod_1pps),
-	PINCTRL_FUNC_DESC(sipo),
-	PINCTRL_FUNC_DESC(mdio),
-	PINCTRL_FUNC_DESC(uart),
-	PINCTRL_FUNC_DESC(i2c),
-	PINCTRL_FUNC_DESC(jtag),
-	PINCTRL_FUNC_DESC(pcm),
-	PINCTRL_FUNC_DESC(spi),
-	PINCTRL_FUNC_DESC(pcm_spi),
-	PINCTRL_FUNC_DESC(i2s),
-	PINCTRL_FUNC_DESC(emmc),
-	PINCTRL_FUNC_DESC(pnand),
-	PINCTRL_FUNC_DESC(pcie_reset),
-	PINCTRL_FUNC_DESC(pwm),
-	PINCTRL_FUNC_DESC(phy1_led0),
-	PINCTRL_FUNC_DESC(phy2_led0),
-	PINCTRL_FUNC_DESC(phy3_led0),
-	PINCTRL_FUNC_DESC(phy4_led0),
-	PINCTRL_FUNC_DESC(phy1_led1),
-	PINCTRL_FUNC_DESC(phy2_led1),
-	PINCTRL_FUNC_DESC(phy3_led1),
-	PINCTRL_FUNC_DESC(phy4_led1),
+static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
+	PINCTRL_FUNC_DESC("i2s", i2s),
+	PINCTRL_FUNC_DESC("emmc", emmc),
+	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
@@ -2044,7 +2074,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
@@ -2105,7 +2135,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
@@ -2166,7 +2196,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
@@ -2227,7 +2257,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_pcie_rst_od_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
@@ -2548,12 +2578,17 @@ airoha_pinctrl_get_conf_reg(const struct airoha_pinctrl_conf *conf,
 }
 
 static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
-				   const struct airoha_pinctrl_conf *conf,
-				   int conf_size, int pin, u32 *val)
+				   enum airoha_pinctrl_confs_type conf_type,
+				   int pin, u32 *val)
 {
+	const struct airoha_pinctrl_confs_info *confs_info;
 	const struct airoha_pinctrl_reg *reg;
 
-	reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
+	confs_info = &pinctrl->confs_info[conf_type];
+
+	reg = airoha_pinctrl_get_conf_reg(confs_info->confs,
+					  confs_info->num_confs,
+					  pin);
 	if (!reg)
 		return -EINVAL;
 
@@ -2566,12 +2601,17 @@ static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
 }
 
 static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
-				   const struct airoha_pinctrl_conf *conf,
-				   int conf_size, int pin, u32 val)
+				   enum airoha_pinctrl_confs_type conf_type,
+				   int pin, u32 val)
 {
+	const struct airoha_pinctrl_confs_info *confs_info;
 	const struct airoha_pinctrl_reg *reg = NULL;
 
-	reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
+	confs_info = &pinctrl->confs_info[conf_type];
+
+	reg = airoha_pinctrl_get_conf_reg(confs_info->confs,
+					  confs_info->num_confs,
+					  pin);
 	if (!reg)
 		return -EINVAL;
 
@@ -2584,44 +2624,34 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 }
 
 #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
-				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
 				(pin), (val))
 #define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
 				(pin), (val))
 #define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
 				(pin), (val))
 #define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
 				(pin), (val))
 #define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
 				(pin), (val))
 #define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
-				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
 				(pin), (val))
 #define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
 				(pin), (val))
 #define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
 				(pin), (val))
 #define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
 				(pin), (val))
 #define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
 				(pin), (val))
 
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
@@ -2798,12 +2828,13 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 static int airoha_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
 				    unsigned int group, unsigned long *config)
 {
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	u32 cur_config = 0;
 	int i;
 
-	for (i = 0; i < airoha_pinctrl_groups[group].npins; i++) {
+	for (i = 0; i < pinctrl->grps[group].npins; i++) {
 		if (airoha_pinconf_get(pctrl_dev,
-				       airoha_pinctrl_groups[group].pins[i],
+				       pinctrl->grps[group].pins[i],
 				       config))
 			return -EOPNOTSUPP;
 
@@ -2820,13 +2851,14 @@ static int airoha_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
 				    unsigned int group, unsigned long *configs,
 				    unsigned int num_configs)
 {
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	int i;
 
-	for (i = 0; i < airoha_pinctrl_groups[group].npins; i++) {
+	for (i = 0; i < pinctrl->grps[group].npins; i++) {
 		int err;
 
 		err = airoha_pinconf_set(pctrl_dev,
-					 airoha_pinctrl_groups[group].pins[i],
+					 pinctrl->grps[group].pins[i],
 					 configs, num_configs);
 		if (err)
 			return err;
@@ -2852,23 +2884,16 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc airoha_pinctrl_desc = {
-	.name = KBUILD_MODNAME,
-	.owner = THIS_MODULE,
-	.pctlops = &airoha_pctlops,
-	.pmxops = &airoha_pmxops,
-	.confops = &airoha_confops,
-	.pins = airoha_pinctrl_pins,
-	.npins = ARRAY_SIZE(airoha_pinctrl_pins),
-};
-
 static int airoha_pinctrl_probe(struct platform_device *pdev)
 {
+	const struct airoha_pinctrl_match_data *data;
 	struct device *dev = &pdev->dev;
 	struct airoha_pinctrl *pinctrl;
 	struct regmap *map;
 	int err, i;
 
+	data = device_get_match_data(dev);
+
 	pinctrl = devm_kzalloc(dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
 		return -ENOMEM;
@@ -2883,14 +2908,23 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 	pinctrl->chip_scu = map;
 
-	err = devm_pinctrl_register_and_init(dev, &airoha_pinctrl_desc,
+	/* Init pinctrl desc struct */
+	pinctrl->desc.name = KBUILD_MODNAME;
+	pinctrl->desc.owner = THIS_MODULE,
+	pinctrl->desc.pctlops = &airoha_pctlops,
+	pinctrl->desc.pmxops = &airoha_pmxops,
+	pinctrl->desc.confops = &airoha_confops,
+	pinctrl->desc.pins = data->pins,
+	pinctrl->desc.npins = data->num_pins,
+
+	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
 	if (err)
 		return err;
 
 	/* build pin groups */
-	for (i = 0; i < ARRAY_SIZE(airoha_pinctrl_groups); i++) {
-		const struct pingroup *grp = &airoha_pinctrl_groups[i];
+	for (i = 0; i < data->num_grps; i++) {
+		const struct pingroup *grp = &data->grps[i];
 
 		err = pinctrl_generic_add_group(pinctrl->ctrl, grp->name,
 						grp->pins, grp->npins,
@@ -2903,10 +2937,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	/* build functions */
-	for (i = 0; i < ARRAY_SIZE(airoha_pinctrl_funcs); i++) {
+	for (i = 0; i < data->num_funcs; i++) {
 		const struct airoha_pinctrl_func *func;
 
-		func = &airoha_pinctrl_funcs[i];
+		func = &data->funcs[i];
 		err = pinmux_generic_add_function(pinctrl->ctrl,
 						  func->desc.func.name,
 						  func->desc.func.groups,
@@ -2919,6 +2953,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
+	pinctrl->grps = data->grps;
+	pinctrl->funcs = data->funcs;
+	pinctrl->confs_info = data->confs_info;
+
 	err = pinctrl_enable(pinctrl->ctrl);
 	if (err)
 		return err;
@@ -2927,8 +2965,39 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
 }
 
+static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
+	.pins = en7581_pinctrl_pins,
+	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
+	.grps = en7581_pinctrl_groups,
+	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
+	.funcs = en7581_pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = en7581_pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = en7581_pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = en7581_pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = en7581_pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
+			.confs = en7581_pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
+		},
+	},
+};
+
 static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,en7581-pinctrl" },
+	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.48.1


