Return-Path: <linux-gpio+bounces-26678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D2BACC45
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 307283B1AF5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE9F2F90CD;
	Tue, 30 Sep 2025 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bg0cAZdT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566302F7AB9
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233804; cv=none; b=GGzztZrMj4nTzGtwg0e6vb7+uhZdv/GYHywfDmPdcHfu1KcGVh8kshR2t+yI1wkcpANhbuHUsTCLfRQge7kfdUgForqOcCWsK9cQk5sqeK5tYkHo5/X0wYHYipW3z+LZjeZtxLv6e35KfUDeEXMyrBGT22bntGleVhmhWFm3RHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233804; c=relaxed/simple;
	bh=DeeJs8Iyqemk9HQZ3dDZhXBo4w534fS/ge157ogLl1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSzIDawjmxN1bqunGMQFmNHwevcokEv8vM9DoaKK8mJquCbTZbXNc9LFQYTUBNjU10BnMmLtrvXrWKj+8NFchvP6jqaTXxlpbn6+/dBWIfEGLAAqShWlwjhlKPuEmOeIN5ZVY8piyTdw1MtVGyjziYGTROsIJiyWFRxmXnQwNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bg0cAZdT; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4e0302e2b69so22268811cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233800; x=1759838600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNxhbuDMMW5e1gvjhZr082pFtNBwAWv3uREKYlnISRw=;
        b=bg0cAZdT8e0kncS3VrYX93h+wRj2nGk8vB/WfZaVPd4VQhSTTUBJePYGLY9lx5Jqop
         WyLfMyFk4jcJvXc7mIjGn56dwalmEgn8GZPv8K+mLvtWdmyLiQxxtYQ87ePCzsIcOSA9
         3hRano2w9TXq3FrRZ4Ps/CksGCSvrCXWR2hbjMgLrsmr9tz6yK6T5UAhR4dLrjn9KrZo
         +VDEdH0RfIdmBlmOIsiD5d3jYgsjAGPgsbBIV12K3lUEuT1wyOO9l6z/wlwtsWo1wwAW
         1Metjznzx2y9k+1oO+BQ5FfSoEhBUgjvpc3PpCewyW86JM85XV8o/7MUnoAQybPTo999
         wzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233800; x=1759838600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNxhbuDMMW5e1gvjhZr082pFtNBwAWv3uREKYlnISRw=;
        b=H2Nw/6S60kjWz+TaPbXgRH7I+OysVMSFzIoxxBju4ZMyBlHbiXqwxE0mZEn91cKgDt
         6wkPMoCmp1gG0+1pozrNV6MSVSu/8la3vCvzXxfUilAC4aTyaf46K5KUbFg7RYFhwsNX
         k7x/omoQpnu47TquhjF7dFcZOXnq9CkF84BhkQUjDUmIwAbQ+R9lXn9nRZM3O+brS+E0
         /97T6RnKs3ZeCD7zhZg7dy7ZA4hIVhyNhdgRTP4ud0REPMl/TD6/47pfuSxQNAgU3ohJ
         gBEaYOsYSXWHCAJKlzKlo3vCSOf5OiGeNlGuHUplz9XIi5dzTx4RCFZu0XRcmhDyTNBt
         QkRg==
X-Gm-Message-State: AOJu0Yzctg5/9L/EntxdjKYIitSC+uzz5WF+ZovtSzixoI6caJZqMVQg
	uyN0UFSTpHKlTqgKKTbR/ffzHTQ+2lFBXbvgWG02xe9kUgJa5D/4OKPy4MYyiCkqyVI=
X-Gm-Gg: ASbGncuCzqHYqwiaby3ghWPggB2tFt2KLYKI9tTFruNDPvZ4PTckQjWpxM4iNGW1oJ2
	NyjYFvURNfZ0Kv117synhUVHJSaqt+hJ0v0BjiTMpccYw+rhBi1bQI2fHI5uwlGhRY9kpWIMb7I
	p0gs0Dzx3VZc02ScVe4sAKChbKUcA0OuMAcLg+6ScjBVEYoKBrNy8IZHLdB/obVGifvLihwmWI2
	pXMp2f/6PIqRq2PPY63ElCa/VE4VbnLVN698tjt2aAL+I9qzoeJjqqFTMASHpQ5caHUJPJR0AA0
	THhTNhoj2PpCLuS+zh+Uwa9T4SDZUuUKkLLZ0sYyiqSNW4OJl5Ukf15qKV6AND2pgxVrTaecPUl
	HxhSqI3JHxZv5//c75RLUanAgUUNEqWQyhmrdMh64UOUu+y48zbPMIflR5w==
X-Google-Smtp-Source: AGHT+IHM02Tcn2EtoKnslaKQ7MB5RuceBly1KJFhzW2QsvlJhSpws0OshslGC6oO0T9NkTACvuSFkw==
X-Received: by 2002:a05:622a:46:b0:4dc:d94f:cbd9 with SMTP id d75a77b69052e-4dcd94fd2ebmr188362951cf.36.1759233799756;
        Tue, 30 Sep 2025 05:03:19 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:02:53 +0200
Subject: [PATCH 6/6] pinctrl: bcm: bcmbca: Add support for BCM6846
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-bcmbca-pinctrl-v1-6-73218459a094@linaro.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This adds groups and functions required to support the BCM6846
BCA SoC in the BCMBCA pin control driver.

Group and function definitions are based on the vendor code
drop which stuff all groups and functions into the device tree:
linux-4.19.183/arch/arm/boot/dts/brcm/6846/inc/6846_pinctrl.dtsi

The groups and functions have been adjusted to what I believe
is generally useful along the lines of the BCM4908 driver:
for example I2C has two pins SCL/SDA that can be muxed out
in one position the two pins are not muxed individually but
as a group of (SDA,SCL), and the NAND control and data pins
are handled in groups as well.

No all groups and functions are defined, like with the BCM4908
I stopped short from implementing "everything", because I
do not foresee that it would be useful to add all JTAG
scan chains etc.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcmbca.c | 531 +++++++++++++++++++++++++++++++++++
 1 file changed, 531 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcmbca.c b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
index dba25b453507300aa1435c2eb0326f5ef9694c0a..394aea544cf746f96e4563e2f5040b671620398b 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcmbca.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
@@ -57,6 +57,533 @@ struct bcmbca_pinctrl_pin_setup {
 	unsigned int function;
 };
 
+/* BCM6846 groups and functions */
+
+#define BCM6846_NUM_PINS 79
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_0_pins_a[] = {
+	{ 18, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_0_pins_b[] = {
+	{ 52, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_1_pins_a[] = {
+	{ 19, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_1_pins_b[] = {
+	{ 53, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_2_pins_a[] = {
+	{ 22, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_2_pins_b[] = {
+	{ 49, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_3_pins_a[] = {
+	{ 24, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_3_pins_b[] = {
+	{ 44, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_4_pins_a[] = {
+	{ 9, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_4_pins_b[] = {
+	{ 44, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_5_pins_a[] = {
+	{ 10, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_5_pins_b[] = {
+	{ 43, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_6_pins_a[] = {
+	{ 11, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_6_pins_b[] = {
+	{ 47, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_7_pins_a[] = {
+	{ 12, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_7_pins_b[] = {
+	{ 45, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_8_pins_a[] = {
+	{ 13, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_8_pins_b[] = {
+	{ 5, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_9_pins_a[] = {
+	{ 16, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_9_pins_b[] = {
+	{ 18, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_10_pins_a[] = {
+	{ 17, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_10_pins_b[] = {
+	{ 50, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_11_pins_a[] = {
+	{ 20, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_11_pins_b[] = {
+	{ 51, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_12_pins_a[] = {
+	{ 21, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_12_pins_b[] = {
+	{ 56, 2 },
+};
+
+/* LEDs 13 thru 17 can apparently only be muxed in one place */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_13_pins[] = {
+	{ 74, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_14_pins[] = {
+	{ 56, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_15_pins[] = {
+	{ 57, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_16_pins[] = {
+	{ 58, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_led_17_pins[] = {
+	{ 59, 0 },
+};
+
+/* Pins used for serial LED control can come out in two places */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_ser_led_pins_a[] = {
+	{ 18, 3 }, /* CLK */
+	{ 23, 3 }, /* DATA */
+	{ 25, 3 }, /* MASK */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_ser_led_pins_b[] = {
+	{ 43, 3 }, /* CLK */
+	{ 45, 3 }, /* DATA */
+	{ 44, 3 }, /* MASK */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_nand_ctrl_pins[] = {
+	{ 26, 1 },
+	{ 27, 1 },
+	{ 28, 1 },
+	{ 29, 1 },
+	{ 30, 1 },
+	{ 31, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_nand_data_pins[] = {
+	{ 32, 1 },
+	{ 33, 1 },
+	{ 34, 1 },
+	{ 35, 1 },
+	{ 36, 1 },
+	{ 37, 1 },
+	{ 38, 1 },
+	{ 39, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_nand_wp_pins[] = {
+	{ 8, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_emmc_ctrl_pins[] = {
+	{ 20, 1 },
+	{ 21, 1 },
+};
+
+/* SPI port "M" can be muxed in three different places */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_pins_a[] = {
+	{ 62, 1 }, /* CLK */
+	{ 63, 1 }, /* MOSI */
+	{ 64, 1 }, /* MISO */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss0_pins_a[] = {
+	{ 65, 1 }, /* SPI Select 0, Chip select 0 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss1_pins_a[] = {
+	{ 66, 1 }, /* SPI Select 1, Chip select 1 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss2_pins_a[] = {
+	{ 9, 1 }, /* SPI Select 2, Chip select 2 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss3_pins_a[] = {
+	{ 12, 1 }, /* SPI Select 3, Chip select 3 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_pins_b[] = {
+	{ 49, 0 }, /* CLK */
+	{ 50, 0 }, /* MOSI */
+	{ 51, 0 }, /* MISO */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss0_pins_b[] = {
+	{ 52, 0 }, /* SPI Select 0, Chip select 0 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss1_pins_b[] = {
+	{ 53, 0 }, /* SPI Select 1, Chip select 1 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss2_pins_b[] = {
+	{ 5, 0 }, /* SPI Select 2, Chip select 2 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss3_pins_b[] = {
+	{ 7, 1 }, /* SPI Select 3, Chip select 3 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_pins_c[] = {
+	{ 24, 0 }, /* CLK */
+	{ 6, 0 }, /* MOSI */
+	{ 7, 0 }, /* MISO */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss0_pins_c[] = {
+	{ 8, 0 }, /* SPI Select 0, Chip select 0 */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spim_ss1_pins_c[] = {
+	{ 73, 1 }, /* SPI Select 1, Chip select 1 */
+};
+
+/* SPI port "S", this has just one optional select pin but can be in two places */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spis_pins_a[] = {
+	{ 56, 1 }, /* CLK */
+	{ 57, 1 }, /* MOSI */
+	{ 58, 1 }, /* MISO */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spis_ss_pins_a[] = {
+	{ 59, 1 }, /* SPI S Select, Chip select */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spis_pins_b[] = {
+	{ 0, 2 }, /* CLK */
+	{ 1, 2 }, /* MOSI */
+	{ 2, 2 }, /* MISO */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_spis_ss_pins_b[] = {
+	{ 3, 2 }, /* SPI S Select, Chip select */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_usb0_pwr_pins[] = {
+	{ 74, 1 },
+	{ 75, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_usb1_pwr_pins[] = {
+	{ 76, 1 },
+	{ 77, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_i2c_pins[] = {
+	{ 68, 0 },	/* SCL */
+	{ 69, 0 },	/* SDA */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_rgmii_pins[] = {
+	{ 42, 1 },
+	{ 43, 1 },
+	{ 44, 1 },
+	{ 45, 1 },
+	{ 46, 1 },
+	{ 47, 1 },
+	{ 48, 1 },
+	{ 49, 1 },
+	{ 50, 1 },
+	{ 51, 1 },
+	{ 52, 1 },
+	{ 53, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_rgmii_rx_ok_pins[] = {
+	{ 7, 3 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_rgmii_start_stop_pins[] = {
+	{ 6, 3 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_mii_pins[] = {
+	{ 8, 3 }, /* RX ER */
+	{ 5, 3 }, /* TX ER */
+};
+
+/* "signal detect" pin can be in two positions */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_signal_detect_pins_a[] = {
+	{ 58, 3 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_signal_detect_pins_b[] = {
+	{ 15, 3 },
+};
+
+/* "one sec pls" pin can be in two positions */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_one_sec_pls_pins_a[] = {
+	{ 40, 0 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_one_sec_pls_pins_b[] = {
+	{ 6, 1 },
+};
+
+/* "Rogue onu" pin, presumably a misspelling of "rogue one" */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_rogue_onu_pins_a[] = {
+	{ 56, 3 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_rogue_onu_pins_b[] = {
+	{ 14, 3 },
+};
+
+/* WAN extra pins for SynchE and PTP */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_wan_mdio_pins[] = {
+	{ 54, 1 }, /* MDC */
+	{ 55, 1 }, /* MDIO */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_wan_nco_pins[] = {
+	{ 16, 3 }, /* 10 MHz NCO clock output */
+	{ 5, 1 }, /* 8 kHz NCO clock output */
+	{ 20, 3 }, /* NCO programmable clock output */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_wan_early_txen_pins_a[] = {
+	{ 10, 3 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_wan_early_txen_pins_b[] = {
+	{ 4, 1 },
+};
+
+/* 1PPS pin for IEEE 1588 PTP */
+static const struct bcmbca_pinctrl_pin_setup bcm6846_wan_nco_1pps_sig_pins_a[] = {
+	{ 40, 1 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_wan_nco_1pps_sig_pins_b[] = {
+	{ 6, 2 },
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_uart0_pins[] = {
+	{ 60, 1 }, /* SDIN (RX) */
+	{ 61, 1 }, /* SDOUT (TX) */
+};
+
+static const struct bcmbca_pinctrl_pin_setup bcm6846_uart2_pins[] = {
+	{ 13, 1 }, /* CTS */
+	{ 16, 1 }, /* RTS */
+	{ 14, 1 }, /* SIN (RX) */
+	{ 15, 1 }, /* SOUT (TX) */
+};
+
+static const struct bcmbca_pinctrl_grp bcm6846_pinctrl_grps[] = {
+	{ "led_0_grp_a", bcm6846_led_0_pins_a, ARRAY_SIZE(bcm6846_led_0_pins_a) },
+	{ "led_0_grp_b", bcm6846_led_0_pins_b, ARRAY_SIZE(bcm6846_led_0_pins_b) },
+	{ "led_1_grp_a", bcm6846_led_1_pins_a, ARRAY_SIZE(bcm6846_led_1_pins_a) },
+	{ "led_1_grp_b", bcm6846_led_1_pins_b, ARRAY_SIZE(bcm6846_led_1_pins_b) },
+	{ "led_2_grp_a", bcm6846_led_2_pins_a, ARRAY_SIZE(bcm6846_led_2_pins_a) },
+	{ "led_2_grp_b", bcm6846_led_2_pins_b, ARRAY_SIZE(bcm6846_led_2_pins_b) },
+	{ "led_3_grp_a", bcm6846_led_3_pins_a, ARRAY_SIZE(bcm6846_led_3_pins_a) },
+	{ "led_3_grp_b", bcm6846_led_3_pins_b, ARRAY_SIZE(bcm6846_led_3_pins_b) },
+	{ "led_4_grp_a", bcm6846_led_4_pins_a, ARRAY_SIZE(bcm6846_led_4_pins_a) },
+	{ "led_4_grp_b", bcm6846_led_4_pins_b, ARRAY_SIZE(bcm6846_led_4_pins_b) },
+	{ "led_5_grp_a", bcm6846_led_5_pins_a, ARRAY_SIZE(bcm6846_led_5_pins_a) },
+	{ "led_5_grp_b", bcm6846_led_5_pins_b, ARRAY_SIZE(bcm6846_led_5_pins_b) },
+	{ "led_6_grp_a", bcm6846_led_6_pins_a, ARRAY_SIZE(bcm6846_led_6_pins_a) },
+	{ "led_6_grp_b", bcm6846_led_6_pins_b, ARRAY_SIZE(bcm6846_led_6_pins_b) },
+	{ "led_7_grp_a", bcm6846_led_7_pins_a, ARRAY_SIZE(bcm6846_led_7_pins_a) },
+	{ "led_7_grp_b", bcm6846_led_7_pins_b, ARRAY_SIZE(bcm6846_led_7_pins_b) },
+	{ "led_8_grp_a", bcm6846_led_8_pins_a, ARRAY_SIZE(bcm6846_led_8_pins_a) },
+	{ "led_8_grp_b", bcm6846_led_8_pins_b, ARRAY_SIZE(bcm6846_led_8_pins_b) },
+	{ "led_9_grp_a", bcm6846_led_9_pins_a, ARRAY_SIZE(bcm6846_led_9_pins_a) },
+	{ "led_9_grp_b", bcm6846_led_9_pins_b, ARRAY_SIZE(bcm6846_led_9_pins_b) },
+	{ "led_10_grp_a", bcm6846_led_10_pins_a, ARRAY_SIZE(bcm6846_led_10_pins_a) },
+	{ "led_10_grp_b", bcm6846_led_10_pins_b, ARRAY_SIZE(bcm6846_led_10_pins_b) },
+	{ "led_11_grp_a", bcm6846_led_11_pins_a, ARRAY_SIZE(bcm6846_led_11_pins_a) },
+	{ "led_11_grp_b", bcm6846_led_11_pins_b, ARRAY_SIZE(bcm6846_led_11_pins_b) },
+	{ "led_12_grp_a", bcm6846_led_12_pins_a, ARRAY_SIZE(bcm6846_led_12_pins_a) },
+	{ "led_12_grp_b", bcm6846_led_12_pins_b, ARRAY_SIZE(bcm6846_led_12_pins_b) },
+	{ "led_13_grp", bcm6846_led_13_pins, ARRAY_SIZE(bcm6846_led_13_pins) },
+	{ "led_14_grp", bcm6846_led_14_pins, ARRAY_SIZE(bcm6846_led_14_pins) },
+	{ "led_15_grp", bcm6846_led_15_pins, ARRAY_SIZE(bcm6846_led_15_pins) },
+	{ "led_16_grp", bcm6846_led_16_pins, ARRAY_SIZE(bcm6846_led_16_pins) },
+	{ "led_17_grp", bcm6846_led_17_pins, ARRAY_SIZE(bcm6846_led_17_pins) },
+	{ "ser_led_grp_a", bcm6846_ser_led_pins_a, ARRAY_SIZE(bcm6846_ser_led_pins_a) },
+	{ "ser_led_grp_b", bcm6846_ser_led_pins_b, ARRAY_SIZE(bcm6846_ser_led_pins_b) },
+	{ "nand_ctrl_grp", bcm6846_nand_ctrl_pins, ARRAY_SIZE(bcm6846_nand_ctrl_pins) },
+	{ "nand_data_grp", bcm6846_nand_data_pins, ARRAY_SIZE(bcm6846_nand_data_pins) },
+	{ "nand_wp_grp", bcm6846_nand_wp_pins, ARRAY_SIZE(bcm6846_nand_wp_pins) },
+	{ "emmc_ctrl_grp", bcm6846_emmc_ctrl_pins, ARRAY_SIZE(bcm6846_emmc_ctrl_pins) },
+	{ "spim_grp_a", bcm6846_spim_pins_a, ARRAY_SIZE(bcm6846_spim_pins_a) },
+	{ "spim_ss0_grp_a", bcm6846_spim_ss0_pins_a, ARRAY_SIZE(bcm6846_spim_ss0_pins_a) },
+	{ "spim_ss1_grp_a", bcm6846_spim_ss1_pins_a, ARRAY_SIZE(bcm6846_spim_ss1_pins_a) },
+	{ "spim_ss2_grp_a", bcm6846_spim_ss2_pins_a, ARRAY_SIZE(bcm6846_spim_ss2_pins_a) },
+	{ "spim_ss3_grp_a", bcm6846_spim_ss3_pins_a, ARRAY_SIZE(bcm6846_spim_ss3_pins_a) },
+	{ "spim_grp_b", bcm6846_spim_pins_b, ARRAY_SIZE(bcm6846_spim_pins_b) },
+	{ "spim_ss0_grp_b", bcm6846_spim_ss0_pins_b, ARRAY_SIZE(bcm6846_spim_ss0_pins_b) },
+	{ "spim_ss1_grp_b", bcm6846_spim_ss1_pins_b, ARRAY_SIZE(bcm6846_spim_ss1_pins_b) },
+	{ "spim_ss2_grp_b", bcm6846_spim_ss2_pins_b, ARRAY_SIZE(bcm6846_spim_ss2_pins_b) },
+	{ "spim_ss3_grp_b", bcm6846_spim_ss3_pins_b, ARRAY_SIZE(bcm6846_spim_ss3_pins_b) },
+	{ "spim_grp_c", bcm6846_spim_pins_c, ARRAY_SIZE(bcm6846_spim_pins_c) },
+	{ "spim_ss0_grp_c", bcm6846_spim_ss0_pins_c, ARRAY_SIZE(bcm6846_spim_ss0_pins_c) },
+	{ "spim_ss1_grp_c", bcm6846_spim_ss1_pins_c, ARRAY_SIZE(bcm6846_spim_ss1_pins_c) },
+	{ "spis_grp_a", bcm6846_spis_pins_a, ARRAY_SIZE(bcm6846_spis_pins_a) },
+	{ "spis_ss_grp_a", bcm6846_spis_ss_pins_a, ARRAY_SIZE(bcm6846_spis_ss_pins_a) },
+	{ "spis_grp_b", bcm6846_spis_pins_b, ARRAY_SIZE(bcm6846_spis_pins_b) },
+	{ "spis_ss_grp_b", bcm6846_spis_ss_pins_b, ARRAY_SIZE(bcm6846_spis_ss_pins_b) },
+	{ "usb0_pwr_grp", bcm6846_usb0_pwr_pins, ARRAY_SIZE(bcm6846_usb0_pwr_pins) },
+	{ "usb1_pwr_grp", bcm6846_usb1_pwr_pins, ARRAY_SIZE(bcm6846_usb1_pwr_pins) },
+	{ "i2c_grp", bcm6846_i2c_pins, ARRAY_SIZE(bcm6846_i2c_pins) },
+	{ "rgmii_grp", bcm6846_rgmii_pins, ARRAY_SIZE(bcm6846_rgmii_pins) },
+	{ "rgmii_rx_ok_grp", bcm6846_rgmii_rx_ok_pins, ARRAY_SIZE(bcm6846_rgmii_rx_ok_pins) },
+	{ "rgmii_start_stop_grp", bcm6846_rgmii_start_stop_pins, ARRAY_SIZE(bcm6846_rgmii_start_stop_pins) },
+	{ "mii_grp", bcm6846_mii_pins, ARRAY_SIZE(bcm6846_mii_pins) },
+	{ "signal_detect_grp_a", bcm6846_signal_detect_pins_a, ARRAY_SIZE(bcm6846_signal_detect_pins_a) },
+	{ "signal_detect_grp_b", bcm6846_signal_detect_pins_b, ARRAY_SIZE(bcm6846_signal_detect_pins_b) },
+	{ "one_sec_pls_grp_a", bcm6846_one_sec_pls_pins_a, ARRAY_SIZE(bcm6846_one_sec_pls_pins_a) },
+	{ "one_sec_pls_grp_b", bcm6846_one_sec_pls_pins_b, ARRAY_SIZE(bcm6846_one_sec_pls_pins_b) },
+	{ "rogue_onu_grp_a", bcm6846_rogue_onu_pins_a, ARRAY_SIZE(bcm6846_rogue_onu_pins_a) },
+	{ "rogue_onu_grp_b", bcm6846_rogue_onu_pins_b, ARRAY_SIZE(bcm6846_rogue_onu_pins_b) },
+	{ "wan_mdio_grp", bcm6846_wan_mdio_pins, ARRAY_SIZE(bcm6846_wan_mdio_pins) },
+	{ "wan_nco_grp", bcm6846_wan_nco_pins, ARRAY_SIZE(bcm6846_wan_nco_pins) },
+	{ "wan_early_txen_grp_a", bcm6846_wan_early_txen_pins_a, ARRAY_SIZE(bcm6846_wan_early_txen_pins_a) },
+	{ "wan_early_txen_grp_b", bcm6846_wan_early_txen_pins_b, ARRAY_SIZE(bcm6846_wan_early_txen_pins_b) },
+	{ "wan_nco_1pps_sig_grp_a", bcm6846_wan_nco_1pps_sig_pins_a, ARRAY_SIZE(bcm6846_wan_nco_1pps_sig_pins_a) },
+	{ "wan_nco_1pps_sig_grp_b", bcm6846_wan_nco_1pps_sig_pins_b, ARRAY_SIZE(bcm6846_wan_nco_1pps_sig_pins_b) },
+	{ "uart0_grp", bcm6846_uart0_pins, ARRAY_SIZE(bcm6846_uart0_pins) },
+	{ "uart2_grp", bcm6846_uart2_pins, ARRAY_SIZE(bcm6846_uart2_pins) },
+};
+
+static const char * const bcm6846_led_0_groups[] = { "led_0_grp_a", "led_0_grp_b" };
+static const char * const bcm6846_led_1_groups[] = { "led_1_grp_a", "led_1_grp_b" };
+static const char * const bcm6846_led_2_groups[] = { "led_2_grp_a", "led_2_grp_b" };
+static const char * const bcm6846_led_3_groups[] = { "led_3_grp_a", "led_3_grp_b" };
+static const char * const bcm6846_led_4_groups[] = { "led_4_grp_a", "led_4_grp_b" };
+static const char * const bcm6846_led_5_groups[] = { "led_5_grp_a", "led_5_grp_b" };
+static const char * const bcm6846_led_6_groups[] = { "led_6_grp_a", "led_6_grp_b" };
+static const char * const bcm6846_led_7_groups[] = { "led_7_grp_a", "led_7_grp_b" };
+static const char * const bcm6846_led_8_groups[] = { "led_8_grp_a", "led_8_grp_b" };
+static const char * const bcm6846_led_9_groups[] = { "led_9_grp_a", "led_9_grp_b" };
+static const char * const bcm6846_led_10_groups[] = { "led_10_grp_a", "led_10_grp_b" };
+static const char * const bcm6846_led_11_groups[] = { "led_11_grp_a", "led_11_grp_b" };
+static const char * const bcm6846_led_12_groups[] = { "led_12_grp_a", "led_12_grp_b" };
+static const char * const bcm6846_led_13_groups[] = { "led_13_grp" };
+static const char * const bcm6846_led_14_groups[] = { "led_14_grp" };
+static const char * const bcm6846_led_15_groups[] = { "led_15_grp" };
+static const char * const bcm6846_led_16_groups[] = { "led_16_grp" };
+static const char * const bcm6846_led_17_groups[] = { "led_17_grp" };
+static const char * const bcm6846_ser_led_groups[] = { "ser_led_grp_a", "ser_led_grp_b" };
+/* We use these three groups with the NAND function to get as many pins as we want */
+static const char * const bcm6846_nand_groups[] = { "nand_ctrl_grp", "nand_data_grp", "nand_wp_grp" };
+static const char * const bcm6846_emmc_groups[] = { "emmc_ctrl_grp" };
+/* Activate SPIM with "spim_grp" and then as many selects as used with "spim_ssN_grp" groups */
+static const char * const bcm6846_spim_groups[] = {
+	"spim_grp_a", "spim_ss0_grp_a",	"spim_ss1_grp_a", "spim_ss2_grp_a", "spim_ss3_grp_a",
+	"spim_grp_b", "spim_ss0_grp_b",	"spim_ss1_grp_b", "spim_ss2_grp_b", "spim_ss3_grp_b",
+	"spim_grp_c", "spim_ss0_grp_c",	"spim_ss1_grp_c" };
+static const char * const bcm6846_spis_groups[] = {
+	"spis_grp_a", "spim_ss_grp_a",
+	"spis_grp_b", "spis_ss_grp_b" };
+static const char * const bcm6846_usb0_pwr_groups[] = { "usb0_pwr_grp" };
+static const char * const bcm6846_usb1_pwr_groups[] = { "usb1_pwr_grp" };
+static const char * const bcm6846_i2c_groups[] = { "i2c_grp" };
+static const char * const bcm6846_rgmii_groups[] = { "rgmii_grp", "rgmii_rx_ok_grp", "rgmii_start_stop_grp" };
+static const char * const bcm6846_mii_groups[] = { "mii_grp" };
+static const char * const bcm6846_signal_detect_groups[] = { "signal_detect_grp_a", "signal_detect_grp_b" };
+static const char * const bcm6846_one_sec_pls_groups[] = { "one_sec_pls_grp_a", "one_sec_pls_grp_b" };
+static const char * const bcm6846_rogue_onu_groups[] = { "rogue_onu_grp_a", "rogue_onu_grp_b" };
+static const char * const bcm6846_wan_groups[] = { "wan_mdio_grp", "wan_nco_grp",
+	"wan_early_txen_grp_a", "wan_early_txen_grp_b", "wan_nco_1pps_sig_grp_a", "wan_nco_1pps_sig_grp_b" };
+static const char * const bcm6846_uart0_groups[] = { "uart0_grp" };
+static const char * const bcm6846_uart2_groups[] = { "uart2_grp" };
+
+static const struct bcmbca_pinctrl_function bcm6846_pinctrl_functions[] = {
+	{ "led_0", bcm6846_led_0_groups, ARRAY_SIZE(bcm6846_led_0_groups) },
+	{ "led_1", bcm6846_led_1_groups, ARRAY_SIZE(bcm6846_led_1_groups) },
+	{ "led_2", bcm6846_led_2_groups, ARRAY_SIZE(bcm6846_led_2_groups) },
+	{ "led_3", bcm6846_led_3_groups, ARRAY_SIZE(bcm6846_led_3_groups) },
+	{ "led_4", bcm6846_led_4_groups, ARRAY_SIZE(bcm6846_led_4_groups) },
+	{ "led_5", bcm6846_led_5_groups, ARRAY_SIZE(bcm6846_led_5_groups) },
+	{ "led_6", bcm6846_led_6_groups, ARRAY_SIZE(bcm6846_led_6_groups) },
+	{ "led_7", bcm6846_led_7_groups, ARRAY_SIZE(bcm6846_led_7_groups) },
+	{ "led_8", bcm6846_led_8_groups, ARRAY_SIZE(bcm6846_led_8_groups) },
+	{ "led_9", bcm6846_led_9_groups, ARRAY_SIZE(bcm6846_led_9_groups) },
+	{ "led_10", bcm6846_led_10_groups, ARRAY_SIZE(bcm6846_led_10_groups) },
+	{ "led_11", bcm6846_led_11_groups, ARRAY_SIZE(bcm6846_led_11_groups) },
+	{ "led_12", bcm6846_led_12_groups, ARRAY_SIZE(bcm6846_led_12_groups) },
+	{ "led_13", bcm6846_led_13_groups, ARRAY_SIZE(bcm6846_led_13_groups) },
+	{ "led_14", bcm6846_led_14_groups, ARRAY_SIZE(bcm6846_led_14_groups) },
+	{ "led_15", bcm6846_led_15_groups, ARRAY_SIZE(bcm6846_led_15_groups) },
+	{ "led_16", bcm6846_led_16_groups, ARRAY_SIZE(bcm6846_led_16_groups) },
+	{ "led_17", bcm6846_led_17_groups, ARRAY_SIZE(bcm6846_led_17_groups) },
+	{ "ser_led", bcm6846_ser_led_groups, ARRAY_SIZE(bcm6846_ser_led_groups) },
+	{ "nand", bcm6846_nand_groups, ARRAY_SIZE(bcm6846_nand_groups) },
+	{ "emmc", bcm6846_emmc_groups, ARRAY_SIZE(bcm6846_emmc_groups) },
+	{ "spim", bcm6846_spim_groups, ARRAY_SIZE(bcm6846_spim_groups) },
+	{ "usb0_pwr", bcm6846_usb0_pwr_groups, ARRAY_SIZE(bcm6846_usb0_pwr_groups) },
+	{ "usb1_pwr", bcm6846_usb1_pwr_groups, ARRAY_SIZE(bcm6846_usb1_pwr_groups) },
+	{ "i2c", bcm6846_i2c_groups, ARRAY_SIZE(bcm6846_i2c_groups) },
+	{ "rgmii", bcm6846_rgmii_groups, ARRAY_SIZE(bcm6846_rgmii_groups) },
+	{ "mii", bcm6846_mii_groups, ARRAY_SIZE(bcm6846_mii_groups) },
+	{ "signal_detect", bcm6846_signal_detect_groups, ARRAY_SIZE(bcm6846_signal_detect_groups) },
+	{ "one_sec_pls", bcm6846_one_sec_pls_groups, ARRAY_SIZE(bcm6846_one_sec_pls_groups) },
+	{ "rogue_onu", bcm6846_rogue_onu_groups, ARRAY_SIZE(bcm6846_rogue_onu_groups) },
+	{ "wan", bcm6846_wan_groups, ARRAY_SIZE(bcm6846_wan_groups) },
+	{ "uart0", bcm6846_uart0_groups, ARRAY_SIZE(bcm6846_uart0_groups) },
+	{ "uart2", bcm6846_uart2_groups, ARRAY_SIZE(bcm6846_uart2_groups) },
+};
+
+static const struct bcmbca_soc_info bcm6846_pinctrl_soc_info = {
+	.num_pins = BCM6846_NUM_PINS,
+	.groups = bcm6846_pinctrl_grps,
+	.num_groups = ARRAY_SIZE(bcm6846_pinctrl_grps),
+	.functions = bcm6846_pinctrl_functions,
+	.num_functions = ARRAY_SIZE(bcm6846_pinctrl_functions),
+};
+
 /* BCM4908 groups and functions */
 
 #define BCM4908_NUM_PINS 86
@@ -474,6 +1001,10 @@ static const struct pinctrl_desc bcmbca_pinctrl_desc = {
 };
 
 static const struct of_device_id bcmbca_pinctrl_of_match_table[] = {
+	{
+		.compatible = "brcm,bcm6846-pinctrl",
+		.data = &bcm6846_pinctrl_soc_info,
+	},
 	{
 		.compatible = "brcm,bcm4908-pinctrl",
 		.data = &bcm4908_pinctrl_soc_info,

-- 
2.51.0


