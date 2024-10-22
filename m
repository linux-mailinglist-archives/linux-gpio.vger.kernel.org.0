Return-Path: <linux-gpio+bounces-11770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885F9AB339
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8B51C2290E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819771C2DCC;
	Tue, 22 Oct 2024 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UQc1fZ03"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816391C3F24;
	Tue, 22 Oct 2024 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612812; cv=none; b=De/51KO544Cw1Uzdy44Cbs6+TduXTS5NQULmfuoR527c3JzKA2zRS+aadgcXiB8/fqaknmHYeIakElnHX7wYybrMK16e+HIxYJKFbYNt8dMvUl9+z0Cgkk7sokxmB/TMlm8lh55vmdPx+iTTkYNpyU6V3qlPkcBoCtw6azyLEIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612812; c=relaxed/simple;
	bh=LWT8XY+b7E9HF2rQ2eks6de6w/pL2pBfqEfwxEpe9bk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpGpJPWARQfeXTP9+xavVTrszrKiCSJIFgHKVD0hbRBazN8TnGhlSZMDdxKy+v7ERno08UjtUHct57tAK9Lv0aGucSgQMm3DNuegx2fQOgxMlJN8KwYOsrfLkBPrGbSn+2quo6p2c2hOQIhZPKiYGJqa6qYQ9W9S/YlGtb/mMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UQc1fZ03; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBUoKb018536;
	Tue, 22 Oct 2024 17:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8aQw95NKLV7pz5xLKjXabgQZGmy3/srHpwB1l+uvLQQ=; b=UQc1fZ03M8foUp9/
	7eVyT+x/3R0qA6qv3LUf/BeIH6MH+Zje3Oy/36aZOvj0X7WcmkG66F0BXa1H2cy/
	RZeWR9J2pZJuzU4c9ePSNpsBhDJe9oVNkYkDUGNgun7HDg43Ft01vI8DwK+Nwm9C
	i6eEnrJToJLwWreJk1MzHVQ5AldDqoAvzSBgMaLrTofFyioR0b/SmGGesCe9r537
	B8f/3l9gcPKFHEOZYdVa5BUVqkTYKVCa/iJCovShB/g50fk98ygsazNiaI9svUFz
	gpjqjz/wpoUDRaIes6U577Mpp6hanp9vl5FucvWipByImIE6RZg+TO5OI3AtfD3r
	+WUk0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2ED9640061;
	Tue, 22 Oct 2024 17:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2EC026E86D;
	Tue, 22 Oct 2024 17:57:35 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:35 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 14/14] pinctrl: stm32: Add new package to stm32mp257 pinctrl support
Date: Tue, 22 Oct 2024 17:56:58 +0200
Message-ID: <20241022155658.1647350-15-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add the package 'AJ' to the list of supported SoC packages for
stm32mp257 pinctrl.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 288 ++++++++++-----------
 2 files changed, 145 insertions(+), 144 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 1d576aad029d1..52ade2244ec3e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -26,6 +26,7 @@
 #define STM32MP_PKG_AC		BIT(2)
 #define STM32MP_PKG_AD		BIT(3)
 #define STM32MP_PKG_AI		BIT(8)
+#define STM32MP_PKG_AJ		BIT(9)
 #define STM32MP_PKG_AK		BIT(10)
 #define STM32MP_PKG_AL		BIT(11)
 #define STM32MP_PKG_AM		BIT(12)
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 6709bddd97186..8e332bb88737b 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -13,7 +13,7 @@
 static const struct stm32_desc_pin stm32mp257_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(0, "PA0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA0"),
 		STM32_FUNCTION(2, "LPTIM1_CH2"),
 		STM32_FUNCTION(3, "SPI5_RDY"),
@@ -31,7 +31,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(1, "PA1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA1"),
 		STM32_FUNCTION(3, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_SD_A"),
@@ -48,7 +48,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(2, "PA2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA2"),
 		STM32_FUNCTION(2, "LPTIM2_IN1"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
@@ -64,7 +64,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(3, "PA3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA3"),
 		STM32_FUNCTION(2, "LPTIM2_ETR"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
@@ -81,7 +81,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(4, "PA4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA4"),
 		STM32_FUNCTION(7, "USART2_TX"),
 		STM32_FUNCTION(8, "FDCAN2_TX"),
@@ -94,7 +94,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(5, "PA5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA5"),
 		STM32_FUNCTION(4, "SPI4_MOSI"),
 		STM32_FUNCTION(5, "SAI2_MCLK_B"),
@@ -111,7 +111,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(6, "PA6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA6"),
 		STM32_FUNCTION(4, "SPI4_SCK"),
 		STM32_FUNCTION(5, "SAI2_FS_B"),
@@ -128,7 +128,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(7, "PA7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA7"),
 		STM32_FUNCTION(3, "AUDIOCLK"),
 		STM32_FUNCTION(4, "SPI6_RDY"),
@@ -148,7 +148,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(8, "PA8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA8"),
 		STM32_FUNCTION(2, "LPTIM2_CH2"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
@@ -163,7 +163,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(9, "PA9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA9"),
 		STM32_FUNCTION(4, "SPI4_NSS"),
 		STM32_FUNCTION(5, "SAI2_SCK_B"),
@@ -179,7 +179,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(10, "PA10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA10"),
 		STM32_FUNCTION(4, "SPI4_MISO"),
 		STM32_FUNCTION(5, "SAI2_SD_B"),
@@ -195,7 +195,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(11, "PA11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA11"),
 		STM32_FUNCTION(2, "SPI8_SCK"),
 		STM32_FUNCTION(3, "LPTIM2_CH1"),
@@ -207,7 +207,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(12, "PA12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA12"),
 		STM32_FUNCTION(3, "SPI6_MOSI"),
 		STM32_FUNCTION(5, "SAI3_FS_A"),
@@ -220,7 +220,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(13, "PA13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA13"),
 		STM32_FUNCTION(2, "SPI8_RDY"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -234,7 +234,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(14, "PA14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA14"),
 		STM32_FUNCTION(2, "SPI8_NSS"),
 		STM32_FUNCTION(3, "LPTIM2_CH2"),
@@ -246,7 +246,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(15, "PA15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOA15"),
 		STM32_FUNCTION(3, "SPI3_MISO I2S3_SDI"),
 		STM32_FUNCTION(7, "USART2_RX"),
@@ -257,7 +257,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(16, "PB0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB0"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
 		STM32_FUNCTION(7, "USART1_CK"),
@@ -269,7 +269,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(17, "PB1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB1"),
 		STM32_FUNCTION(2, "SPI3_NSS I2S3_WS"),
 		STM32_FUNCTION(8, "TIM16_CH1N"),
@@ -281,7 +281,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(18, "PB2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB2"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
 		STM32_FUNCTION(6, "MDF1_CKI3"),
@@ -294,7 +294,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(19, "PB3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB3"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI3"),
@@ -306,7 +306,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(20, "PB4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB4"),
 		STM32_FUNCTION(3, "SPI2_RDY"),
 		STM32_FUNCTION(4, "UART4_CTS"),
@@ -322,7 +322,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(21, "PB5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB5"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(4, "UART4_RTS"),
@@ -339,7 +339,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(22, "PB6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB6"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
 		STM32_FUNCTION(4, "UART4_RX"),
@@ -353,7 +353,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(23, "PB7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB7"),
 		STM32_FUNCTION(2, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(4, "UART4_TX"),
@@ -368,7 +368,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(24, "PB8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB8"),
 		STM32_FUNCTION(2, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(5, "PCIE_CLKREQN"),
@@ -382,7 +382,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(25, "PB9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB9"),
 		STM32_FUNCTION(2, "SPI3_RDY"),
 		STM32_FUNCTION(7, "USART1_RTS"),
@@ -397,7 +397,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(26, "PB10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB10"),
 		STM32_FUNCTION(2, "SPI3_MISO I2S3_SDI"),
 		STM32_FUNCTION(7, "USART1_RX"),
@@ -409,7 +409,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(27, "PB11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB11"),
 		STM32_FUNCTION(2, "I2S3_MCK"),
 		STM32_FUNCTION(7, "USART1_CTS"),
@@ -425,7 +425,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(28, "PB12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB12"),
 		STM32_FUNCTION(6, "UART8_CTS"),
 		STM32_FUNCTION(8, "TIM13_CH1"),
@@ -438,7 +438,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(29, "PB13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB13"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(5, "SAI1_SD_B"),
@@ -451,7 +451,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(30, "PB14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB14"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
 		STM32_FUNCTION(6, "MDF1_CKI7"),
@@ -465,7 +465,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(31, "PB15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOB15"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(3, "SPI5_SCK"),
@@ -483,7 +483,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(32, "PC0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC0"),
 		STM32_FUNCTION(2, "LPTIM1_CH1"),
 		STM32_FUNCTION(4, "SPI6_SCK"),
@@ -499,7 +499,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(33, "PC1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC1"),
 		STM32_FUNCTION(3, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(7, "USART2_TX"),
@@ -510,7 +510,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(34, "PC2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC2"),
 		STM32_FUNCTION(2, "SPI8_MOSI"),
 		STM32_FUNCTION(3, "LPTIM2_IN1"),
@@ -523,7 +523,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(35, "PC3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC3"),
 		STM32_FUNCTION(2, "LPTIM1_IN2"),
 		STM32_FUNCTION(3, "SPI3_NSS I2S3_WS"),
@@ -539,7 +539,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(36, "PC4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC4"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_FS_B"),
@@ -551,7 +551,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(37, "PC5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC5"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN1"),
 		STM32_FUNCTION(6, "MDF1_SDI1"),
@@ -567,7 +567,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(38, "PC6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC6"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN0"),
@@ -584,7 +584,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(39, "PC7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC7"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
 		STM32_FUNCTION(5, "SAI3_SD_B"),
@@ -598,7 +598,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(40, "PC8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC8"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(4, "SPI6_NSS"),
@@ -614,7 +614,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(41, "PC9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC9"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "SPI3_MISO I2S3_SDI"),
@@ -632,7 +632,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(42, "PC10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC10"),
 		STM32_FUNCTION(3, "SPI3_MOSI I2S3_SDO"),
 		STM32_FUNCTION(8, "LPTIM4_ETR"),
@@ -648,7 +648,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(43, "PC11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC11"),
 		STM32_FUNCTION(2, "LPTIM1_CH1"),
 		STM32_FUNCTION(3, "SPI5_NSS"),
@@ -666,7 +666,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(44, "PC12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC12"),
 		STM32_FUNCTION(2, "LPTIM1_CH2"),
 		STM32_FUNCTION(4, "I3C3_SCL"),
@@ -682,14 +682,14 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(45, "PC13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOC13"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(48, "PD0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD0"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -706,7 +706,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(49, "PD1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD1"),
 		STM32_FUNCTION(2, "HDP1"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
@@ -725,7 +725,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(50, "PD2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD2"),
 		STM32_FUNCTION(2, "HDP2"),
 		STM32_FUNCTION(3, "SPI1_NSS I2S1_WS"),
@@ -743,7 +743,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(51, "PD3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD3"),
 		STM32_FUNCTION(2, "SAI1_MCLK_A"),
 		STM32_FUNCTION(3, "SPI2_SCK I2S2_CK"),
@@ -760,7 +760,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(52, "PD4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD4"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "SPI4_MISO"),
@@ -776,7 +776,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(53, "PD5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD5"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "SPI4_NSS"),
@@ -792,7 +792,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(54, "PD6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD6"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "SPI4_MOSI"),
@@ -808,7 +808,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(55, "PD7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD7"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "SPI4_SCK"),
@@ -824,7 +824,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(56, "PD8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD8"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "SPI4_RDY"),
@@ -843,7 +843,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(57, "PD9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD9"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -861,7 +861,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(58, "PD10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD10"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -880,7 +880,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(59, "PD11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD11"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
@@ -899,7 +899,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(60, "PD12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD12"),
 		STM32_FUNCTION(2, "SPI7_MISO"),
 		STM32_FUNCTION(3, "SPI2_MISO I2S2_SDI"),
@@ -914,7 +914,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(61, "PD13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD13"),
 		STM32_FUNCTION(3, "SPI2_NSS I2S2_WS"),
 		STM32_FUNCTION(6, "MDF1_SDI7"),
@@ -928,7 +928,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(62, "PD14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD14"),
 		STM32_FUNCTION(3, "I2S1_MCK"),
 		STM32_FUNCTION(8, "FDCAN1_RX"),
@@ -942,7 +942,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(63, "PD15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOD15"),
 		STM32_FUNCTION(2, "SPI1_RDY"),
 		STM32_FUNCTION(6, "DSI_TE"),
@@ -959,7 +959,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(64, "PE0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE0"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "LPTIM2_CH1"),
@@ -972,7 +972,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(65, "PE1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE1"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "LPTIM2_CH2"),
@@ -985,7 +985,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(66, "PE2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE2"),
 		STM32_FUNCTION(2, "LPTIM2_ETR"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
@@ -998,7 +998,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(67, "PE3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE3"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SPI1_RDY"),
@@ -1012,7 +1012,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(68, "PE4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE4"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "LPTIM2_IN1"),
@@ -1027,7 +1027,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(69, "PE5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE5"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "LPTIM2_IN2"),
@@ -1042,7 +1042,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(70, "PE6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE6"),
 		STM32_FUNCTION(2, "SPI4_RDY"),
 		STM32_FUNCTION(5, "SPDIFRX1_IN2"),
@@ -1056,7 +1056,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(71, "PE7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE7"),
 		STM32_FUNCTION(4, "SAI4_D4"),
 		STM32_FUNCTION(5, "SPDIFRX1_IN3"),
@@ -1071,7 +1071,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(72, "PE8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE8"),
 		STM32_FUNCTION(2, "SPI4_MOSI"),
 		STM32_FUNCTION(4, "SAI4_CK1"),
@@ -1085,7 +1085,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(73, "PE9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE9"),
 		STM32_FUNCTION(2, "SPI4_MISO"),
 		STM32_FUNCTION(4, "SAI4_D2"),
@@ -1100,7 +1100,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(74, "PE10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE10"),
 		STM32_FUNCTION(2, "SPI4_SCK"),
 		STM32_FUNCTION(4, "SAI4_D1"),
@@ -1116,7 +1116,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(75, "PE11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE11"),
 		STM32_FUNCTION(3, "SPI7_SCK"),
 		STM32_FUNCTION(4, "SAI4_D3"),
@@ -1130,7 +1130,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(76, "PE12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE12"),
 		STM32_FUNCTION(2, "SPI4_NSS"),
 		STM32_FUNCTION(4, "SAI4_CK2"),
@@ -1146,7 +1146,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(77, "PE13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE13"),
 		STM32_FUNCTION(3, "SPI7_MISO"),
 		STM32_FUNCTION(5, "SAI1_SD_A"),
@@ -1159,7 +1159,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(78, "PE14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE14"),
 		STM32_FUNCTION(3, "SPI7_NSS"),
 		STM32_FUNCTION(5, "SAI1_MCLK_A"),
@@ -1173,7 +1173,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(79, "PE15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOE15"),
 		STM32_FUNCTION(3, "SPI7_MOSI"),
 		STM32_FUNCTION(5, "SAI1_SCK_A"),
@@ -1187,7 +1187,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(80, "PF0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF0"),
 		STM32_FUNCTION(3, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(8, "FDCAN2_RX"),
@@ -1201,7 +1201,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(81, "PF1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF1"),
 		STM32_FUNCTION(2, "SPI8_MISO"),
 		STM32_FUNCTION(3, "LPTIM2_IN2"),
@@ -1214,7 +1214,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(82, "PF2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF2"),
 		STM32_FUNCTION(3, "SPI3_RDY"),
 		STM32_FUNCTION(7, "I2C4_SMBA"),
@@ -1229,7 +1229,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(83, "PF3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF3"),
 		STM32_FUNCTION(4, "UART8_RX"),
 		STM32_FUNCTION(5, "SAI2_SCK_B"),
@@ -1246,7 +1246,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(84, "PF4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF4"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
 		STM32_FUNCTION(3, "SPI6_NSS"),
@@ -1263,7 +1263,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(85, "PF5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF5"),
 		STM32_FUNCTION(3, "SPI6_SCK"),
 		STM32_FUNCTION(5, "SAI3_MCLK_A"),
@@ -1279,7 +1279,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(86, "PF6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF6"),
 		STM32_FUNCTION(2, "RTC_OUT2"),
 		STM32_FUNCTION(4, "SAI3_MCLK_B"),
@@ -1293,7 +1293,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(87, "PF7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF7"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN1"),
 		STM32_FUNCTION(4, "SPI6_SCK"),
@@ -1307,7 +1307,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(88, "PF8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF8"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(4, "SAI3_SCK_B"),
@@ -1323,7 +1323,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(89, "PF9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF9"),
 		STM32_FUNCTION(4, "SAI3_SD_B"),
 		STM32_FUNCTION(5, "SAI2_SD_A"),
@@ -1337,7 +1337,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(90, "PF10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF10"),
 		STM32_FUNCTION(2, "MCO2"),
 		STM32_FUNCTION(3, "SPI3_RDY"),
@@ -1351,7 +1351,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(91, "PF11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF11"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "SPDIFRX1_IN0"),
@@ -1366,7 +1366,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(92, "PF12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF12"),
 		STM32_FUNCTION(1, "TRACECLK"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
@@ -1380,7 +1380,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(93, "PF13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF13"),
 		STM32_FUNCTION(1, "TRACED0"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -1397,7 +1397,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(94, "PF14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF14"),
 		STM32_FUNCTION(1, "TRACED1"),
 		STM32_FUNCTION(2, "HDP1"),
@@ -1412,7 +1412,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(95, "PF15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOF15"),
 		STM32_FUNCTION(1, "TRACED2"),
 		STM32_FUNCTION(2, "HDP2"),
@@ -1429,7 +1429,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(96, "PG0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG0"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(4, "I3C3_SDA"),
@@ -1445,7 +1445,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(97, "PG1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG1"),
 		STM32_FUNCTION(2, "LPTIM1_IN1"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -1465,7 +1465,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(98, "PG2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG2"),
 		STM32_FUNCTION(2, "RTC_REFIN"),
 		STM32_FUNCTION(3, "I2S3_MCK"),
@@ -1483,7 +1483,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(99, "PG3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG3"),
 		STM32_FUNCTION(2, "LPTIM1_ETR"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
@@ -1501,7 +1501,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(100, "PG4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG4"),
 		STM32_FUNCTION(3, "SPI5_MISO"),
 		STM32_FUNCTION(4, "SAI3_FS_B"),
@@ -1517,7 +1517,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(101, "PG5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG5"),
 		STM32_FUNCTION(1, "TRACED3"),
 		STM32_FUNCTION(2, "HDP3"),
@@ -1531,7 +1531,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(102, "PG6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG6"),
 		STM32_FUNCTION(1, "TRACED4"),
 		STM32_FUNCTION(2, "HDP4"),
@@ -1546,7 +1546,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(103, "PG7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG7"),
 		STM32_FUNCTION(1, "TRACED5"),
 		STM32_FUNCTION(2, "HDP5"),
@@ -1561,7 +1561,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(104, "PG8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG8"),
 		STM32_FUNCTION(1, "TRACED6"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -1578,7 +1578,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(105, "PG9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG9"),
 		STM32_FUNCTION(1, "TRACED7"),
 		STM32_FUNCTION(6, "UART5_TX"),
@@ -1590,7 +1590,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(106, "PG10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG10"),
 		STM32_FUNCTION(1, "TRACED8"),
 		STM32_FUNCTION(2, "HDP0"),
@@ -1603,7 +1603,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(107, "PG11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG11"),
 		STM32_FUNCTION(1, "TRACED9"),
 		STM32_FUNCTION(2, "HDP1"),
@@ -1617,7 +1617,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(108, "PG12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG12"),
 		STM32_FUNCTION(1, "TRACED10"),
 		STM32_FUNCTION(2, "HDP2"),
@@ -1631,7 +1631,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(109, "PG13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG13"),
 		STM32_FUNCTION(1, "TRACED11"),
 		STM32_FUNCTION(2, "HDP3"),
@@ -1647,7 +1647,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(110, "PG14"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG14"),
 		STM32_FUNCTION(1, "TRACED12"),
 		STM32_FUNCTION(2, "HDP4"),
@@ -1662,7 +1662,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(111, "PG15"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOG15"),
 		STM32_FUNCTION(1, "TRACED13"),
 		STM32_FUNCTION(2, "HDP5"),
@@ -1677,7 +1677,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(114, "PH2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH2"),
 		STM32_FUNCTION(2, "LPTIM2_CH1"),
 		STM32_FUNCTION(3, "SPI7_RDY"),
@@ -1693,7 +1693,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(115, "PH3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH3"),
 		STM32_FUNCTION(3, "SPI1_NSS I2S1_WS"),
 		STM32_FUNCTION(7, "UART7_RX"),
@@ -1706,7 +1706,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(116, "PH4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH4"),
 		STM32_FUNCTION(7, "UART7_TX"),
 		STM32_FUNCTION(8, "TIM17_BKIN"),
@@ -1721,7 +1721,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(117, "PH5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH5"),
 		STM32_FUNCTION(5, "SAI2_FS_A"),
 		STM32_FUNCTION(7, "UART8_CTS"),
@@ -1736,7 +1736,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(118, "PH6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH6"),
 		STM32_FUNCTION(2, "LPTIM2_IN2"),
 		STM32_FUNCTION(5, "SAI1_MCLK_B"),
@@ -1751,7 +1751,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(119, "PH7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH7"),
 		STM32_FUNCTION(3, "SPI1_MOSI I2S1_SDO"),
 		STM32_FUNCTION(5, "UART4_TX"),
@@ -1765,7 +1765,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(120, "PH8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH8"),
 		STM32_FUNCTION(3, "SPI1_MISO I2S1_SDI"),
 		STM32_FUNCTION(4, "SPDIFRX1_IN3"),
@@ -1780,7 +1780,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(121, "PH9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH9"),
 		STM32_FUNCTION(4, "SPI6_NSS"),
 		STM32_FUNCTION(5, "SAI3_MCLK_A"),
@@ -1793,7 +1793,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(122, "PH10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH10"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
@@ -1806,7 +1806,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(123, "PH11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH11"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
 		STM32_FUNCTION(5, "SAI3_FS_A"),
@@ -1818,7 +1818,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(124, "PH12"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH12"),
 		STM32_FUNCTION(3, "SPI3_NSS I2S3_WS"),
 		STM32_FUNCTION(4, "SPI6_MISO"),
@@ -1829,7 +1829,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(125, "PH13"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOH13"),
 		STM32_FUNCTION(3, "SPI3_SCK I2S3_CK"),
 		STM32_FUNCTION(4, "SPI6_MOSI"),
@@ -1841,7 +1841,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(128, "PI0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI0"),
 		STM32_FUNCTION(1, "TRACED14"),
 		STM32_FUNCTION(2, "HDP6"),
@@ -1856,7 +1856,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(129, "PI1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI1"),
 		STM32_FUNCTION(1, "TRACED15"),
 		STM32_FUNCTION(2, "HDP7"),
@@ -1872,7 +1872,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(130, "PI2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI2"),
 		STM32_FUNCTION(4, "LPTIM1_ETR"),
 		STM32_FUNCTION(5, "SAI4_SCK_B"),
@@ -1885,7 +1885,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(131, "PI3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI3"),
 		STM32_FUNCTION(4, "LPTIM1_IN2"),
 		STM32_FUNCTION(5, "SAI4_SD_B"),
@@ -1898,7 +1898,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(132, "PI4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI4"),
 		STM32_FUNCTION(4, "LPTIM1_CH1"),
 		STM32_FUNCTION(5, "SAI4_FS_B"),
@@ -1910,7 +1910,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(133, "PI5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI5"),
 		STM32_FUNCTION(3, "SPI5_MOSI"),
 		STM32_FUNCTION(4, "SPI1_MOSI I2S1_SDO"),
@@ -1924,7 +1924,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(134, "PI6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI6"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(7, "USART3_TX"),
@@ -1936,7 +1936,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(135, "PI7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI7"),
 		STM32_FUNCTION(7, "USART3_RX"),
 		STM32_FUNCTION(8, "TIM2_CH1"),
@@ -1947,14 +1947,14 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(136, "PI8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI8"),
 		STM32_FUNCTION(16, "EVENTOUT"),
 		STM32_FUNCTION(17, "ANALOG")
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(137, "PI9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI9"),
 		STM32_FUNCTION(2, "SPI7_MOSI"),
 		STM32_FUNCTION(3, "SPI2_MOSI I2S2_SDO"),
@@ -1970,7 +1970,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(138, "PI10"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI10"),
 		STM32_FUNCTION(2, "SAI1_SCK_A"),
 		STM32_FUNCTION(3, "SPI1_SCK I2S1_CK"),
@@ -1986,7 +1986,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(139, "PI11"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOI11"),
 		STM32_FUNCTION(3, "I2S2_MCK"),
 		STM32_FUNCTION(6, "UART8_TX"),
@@ -2389,7 +2389,7 @@ static const struct stm32_desc_pin stm32mp257_pins[] = {
 static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	STM32_PIN_PKG(
 		PINCTRL_PIN(400, "PZ0"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ0"),
 		STM32_FUNCTION(3, "LPTIM3_IN1"),
 		STM32_FUNCTION(4, "SPI8_MOSI"),
@@ -2404,7 +2404,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(401, "PZ1"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ1"),
 		STM32_FUNCTION(3, "LPTIM3_CH1"),
 		STM32_FUNCTION(4, "SPI8_MISO"),
@@ -2419,7 +2419,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(402, "PZ2"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ2"),
 		STM32_FUNCTION(3, "LPTIM3_CH1"),
 		STM32_FUNCTION(4, "SPI8_SCK"),
@@ -2433,7 +2433,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(403, "PZ3"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ3"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2451,7 +2451,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(404, "PZ4"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ4"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2468,7 +2468,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(405, "PZ5"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ5"),
 		STM32_FUNCTION(2, "MCO1"),
 		STM32_FUNCTION(3, "LPTIM3_ETR"),
@@ -2482,7 +2482,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(406, "PZ6"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ6"),
 		STM32_FUNCTION(1, "DBTRGI"),
 		STM32_FUNCTION(2, "DBTRGO"),
@@ -2497,7 +2497,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(407, "PZ7"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ7"),
 		STM32_FUNCTION(4, "SPI8_MOSI"),
 		STM32_FUNCTION(5, "MDF1_CCK1"),
@@ -2510,7 +2510,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(408, "PZ8"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ8"),
 		STM32_FUNCTION(3, "LPTIM3_IN1"),
 		STM32_FUNCTION(4, "SPI8_MISO"),
@@ -2525,7 +2525,7 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 	),
 	STM32_PIN_PKG(
 		PINCTRL_PIN(409, "PZ9"),
-		STM32MP_PKG_AI | STM32MP_PKG_AK | STM32MP_PKG_AL,
+		STM32MP_PKG_AI | STM32MP_PKG_AJ | STM32MP_PKG_AK | STM32MP_PKG_AL,
 		STM32_FUNCTION(0, "GPIOZ9"),
 		STM32_FUNCTION(2, "MCO2"),
 		STM32_FUNCTION(4, "SPI8_RDY"),
-- 
2.34.1


