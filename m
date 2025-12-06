Return-Path: <linux-gpio+bounces-29313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0838CAA113
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 06:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A178319D448
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 05:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B35B27FD75;
	Sat,  6 Dec 2025 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Kb8TLkq1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3268.qiye.163.com (mail-m3268.qiye.163.com [220.197.32.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C6A22D4DC;
	Sat,  6 Dec 2025 05:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764997760; cv=none; b=bMx3IiNDNvSgZpDJxApTKghrjOP5egYCRirr5HwvFahci8vKs7Bz1UoVOKb9BzB8JatwZCqAt7Ll2RGwCW1ywduH1KzdYwBMJULsD5PEJDY3XaMvdEDE9ynLHRtgctNGTWjqld3iVGWf89ryCQWFKdUbIAPWiGmjHWS7SdHm6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764997760; c=relaxed/simple;
	bh=RSP3DNGJ65CGbPW/5yypw/A+V/F+cH1ZIH3QoPwJKro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qSH0i5wJTTi3ftA0jAcYdRrBcS5dWCpbucPwa3O5DYzUJ6Qe35YFuHqNRMB7KX/2TQ7vGHGi+0t74AxBkqDBmV77rEXWFvv2zUTvU5jgzAxrXDRAZuZcruEEwQAhGwEaIr8K+QBoP72ybnm2/kB8lYC3v1/A5MdMuayGsP+QHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Kb8TLkq1; arc=none smtp.client-ip=220.197.32.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a6f;
	Sat, 6 Dec 2025 13:08:53 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v2 6/8] dt-bindings: pinctrl: Add header for Rockchip RK3506 RMIO
Date: Sat,  6 Dec 2025 13:08:42 +0800
Message-Id: <20251206050844.402958-7-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206050844.402958-1-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2101e1a09d8kunmae94618c4ed3eaf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhhNTlZMGh1MSEJCTk9NTUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Kb8TLkq1VYYEi5HZUftNqJWCUIeHSXocCTRrgo8kcUJ0OpwF42usAMDns9nwJ/LsXGWVpHG2x3YiSO+pnYkQ6tKDBJ429orJhIlDs7P7ohrsj93ll0A7qWNm0eaUXUWTKb6ru02BJQCMh0Blxc0zvTgFAMdWsdbsTd2FvxbPJWY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gcDxCT/vnr2dTxZ7y5r6e88qG/0XM0v8Hk5zok5szB8=;
	h=date:mime-version:subject:message-id:from;

Add header file with constants for RMIO pin and function IDs for the
Rockchip RK3506 SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../pinctrl/rockchip,rk3506-rmio.h            | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
new file mode 100644
index 000000000000..5d39690a0b28
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+
+/* RMIO pins definetion */
+#define RMIO_PIN0				0
+#define RMIO_PIN1				1
+#define RMIO_PIN2				2
+#define RMIO_PIN3				3
+#define RMIO_PIN4				4
+#define RMIO_PIN5				5
+#define RMIO_PIN6				6
+#define RMIO_PIN7				7
+#define RMIO_PIN8				8
+#define RMIO_PIN9				9
+#define RMIO_PIN10				10
+#define RMIO_PIN11				11
+#define RMIO_PIN12				12
+#define RMIO_PIN13				13
+#define RMIO_PIN14				14
+#define RMIO_PIN15				15
+#define RMIO_PIN16				16
+#define RMIO_PIN17				17
+#define RMIO_PIN18				18
+#define RMIO_PIN19				19
+#define RMIO_PIN20				20
+#define RMIO_PIN21				21
+#define RMIO_PIN22				22
+#define RMIO_PIN23				23
+#define RMIO_PIN24				24
+#define RMIO_PIN25				25
+#define RMIO_PIN26				26
+#define RMIO_PIN27				27
+#define RMIO_PIN28				28
+#define RMIO_PIN29				29
+#define RMIO_PIN30				30
+#define RMIO_PIN31				31
+
+/* RMIO function definetion */
+#define RMIO_UART1_TX			1
+#define RMIO_UART1_RX			2
+#define RMIO_UART2_TX			3
+#define RMIO_UART2_RX			4
+#define RMIO_UART3_TX			5
+#define RMIO_UART3_RX			6
+#define RMIO_UART3_CTSN			7
+#define RMIO_UART3_RTSN			8
+#define RMIO_UART4_TX			9
+#define RMIO_UART4_RX			10
+#define RMIO_UART4_CTSN			11
+#define RMIO_UART4_RTSN			12
+#define RMIO_MIPITE			13
+#define RMIO_CLK_32K			14
+#define RMIO_I2C0_SCL			15
+#define RMIO_I2C0_SDA			16
+#define RMIO_I2C1_SCL			17
+#define RMIO_I2C1_SDA			18
+#define RMIO_I2C2_SCL			19
+#define RMIO_I2C2_SDA			20
+#define RMIO_PDM_CLK0			21
+#define RMIO_PDM_SDI0			22
+#define RMIO_PDM_SDI1			23
+#define RMIO_PDM_SDI2			24
+#define RMIO_PDM_SDI3			25
+#define RMIO_CAN1_TX			26
+#define RMIO_CAN1_RX			27
+#define RMIO_CAN0_TX			28
+#define RMIO_CAN0_RX			29
+#define RMIO_PWM0_CH0			30
+#define RMIO_PWM0_CH1			31
+#define RMIO_PWM0_CH2			32
+#define RMIO_PWM0_CH3			33
+#define RMIO_PWM1_CH0			34
+#define RMIO_PWM1_CH1			35
+#define RMIO_PWM1_CH2			36
+#define RMIO_PWM1_CH3			37
+#define RMIO_PWM1_CH4			38
+#define RMIO_PWM1_CH5			39
+#define RMIO_PWM1_CH6			40
+#define RMIO_PWM1_CH7			41
+#define RMIO_TOUCH_KEY_DRIVE		42
+#define RMIO_TOUCH_KEY_IN0		43
+#define RMIO_TOUCH_KEY_IN1		44
+#define RMIO_TOUCH_KEY_IN2		45
+#define RMIO_TOUCH_KEY_IN3		46
+#define RMIO_TOUCH_KEY_IN4		47
+#define RMIO_TOUCH_KEY_IN5		48
+#define RMIO_TOUCH_KEY_IN6		49
+#define RMIO_TOUCH_KEY_IN7		50
+#define RMIO_SAI0_MCLK			51
+#define RMIO_SAI0_SCLK			52
+#define RMIO_SAI0_LRCK			53
+#define RMIO_SAI0_SDI0			54
+#define RMIO_SAI0_SDI1			55
+#define RMIO_SAI0_SDI2			56
+#define RMIO_SAI0_SDI3			57
+#define RMIO_SAI0_SDO			58
+#define RMIO_SAI1_MCLK			59
+#define RMIO_SAI1_SCLK			60
+#define RMIO_SAI1_LRCK			61
+#define RMIO_SAI1_SDI			62
+#define RMIO_SAI1_SDO0			63
+#define RMIO_SAI1_SDO1			64
+#define RMIO_SAI1_SDO2			65
+#define RMIO_SAI1_SDO3			66
+#define RMIO_SPI0_CLK			67
+#define RMIO_SPI0_MOSI			68
+#define RMIO_SPI0_MISO			69
+#define RMIO_SPI0_CSN0			70
+#define RMIO_SPI0_CSN1			71
+#define RMIO_SPI1_CLK			72
+#define RMIO_SPI1_MOSI			73
+#define RMIO_SPI1_MISO			74
+#define RMIO_SPI1_CSN0			75
+#define RMIO_SPI1_CSN1			76
+#define RMIO_WDT_TSADC_SHUT		77
+#define RMIO_PMU_SLEEP			78
+#define RMIO_CORE_POWER_OFF		79
+#define RMIO_SPDIF_TX			80
+#define RMIO_SPDIF_RX			81
+#define RMIO_PWM1_BIP_CNTR_A0		82
+#define RMIO_PWM1_BIP_CNTR_A1		83
+#define RMIO_PWM1_BIP_CNTR_A2		84
+#define RMIO_PWM1_BIP_CNTR_A3		85
+#define RMIO_PWM1_BIP_CNTR_A4		86
+#define RMIO_PWM1_BIP_CNTR_A5		87
+#define RMIO_PWM1_BIP_CNTR_B0		88
+#define RMIO_PWM1_BIP_CNTR_B1		89
+#define RMIO_PWM1_BIP_CNTR_B2		90
+#define RMIO_PWM1_BIP_CNTR_B3		91
+#define RMIO_PWM1_BIP_CNTR_B4		92
+#define RMIO_PWM1_BIP_CNTR_B5		93
+#define RMIO_PDM_CLK1			94
+#define RMIO_ETH_RMII0_PPSCLK		95
+#define RMIO_ETH_RMII0_PPSTRIG		96
+#define RMIO_ETH_RMII1_PPSCLK		97
+#define RMIO_ETH_RMII1_PPSTRIG		98
+
+#endif /* __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H */
-- 
2.34.1


