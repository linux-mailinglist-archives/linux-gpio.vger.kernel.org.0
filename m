Return-Path: <linux-gpio+bounces-6130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B328BCBF0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FFB01F213E8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A7C1428EA;
	Mon,  6 May 2024 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="AqmxWFQ4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB0A14265A;
	Mon,  6 May 2024 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991068; cv=none; b=EZD8eb625WesLyUrdcsQrE7Vod8DshhnzcTiGv3qri7tLdUZ4e0t/PLqSB+bTVhQ3jgQs2Kpm1swwNV2vtAgjvyj5FlwzOUWnFRpWnxc2qeFzmJk+IHzBd9R9u7i0P/P2rQj59pklVsxIYYDeUnJYPTNN66v92Cb4clUfTOasj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991068; c=relaxed/simple;
	bh=Q52rUnIGtjWz8uUhLDj0XEvKHoBXONohWF2/CBBsBl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEEZCkW64lltp76gimdLMLkBFU2TSZuA/HeG4xgM6nYJeNirmLl7L5qyQQKsDzDjJODCyNi6CRwWukKxC1pwMgyW2rsVJ05c3fjt8j0lkgZx4TN+Pbx5kzG6sZMKdFNNA4PBDggJgNfXC9OKTf8j5Z4UCJfjhle3eNastyitRng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=AqmxWFQ4; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3s0nDwS5JrJFEtce2r05iKq1Vh6FYQrvfcyLxROyL7I=; b=AqmxWFQ46Q0rWCYmJ1Dx3Qn9MW
	e1fmbq1Hb11Oa620VU8ucTG+L9H/hhI5iNRkwBH97EDRBy1OuiXHU2TNAKjhTW9C6phQIEBvf7y7C
	zdXBhJGLY2D1VLw0d98et4JVt1pg7CRjbv3WnBu6/dcA7PgZEP93AXLhfIB+SVf5IBjt2Ka1FSpDO
	VbaphlGdOUZycsHWGM3rLxW0K/UtIXq/1LOqGA4O8iFAAk7juYd+0OXv7hKqC9/uQrCBSRWAq0qhV
	QznEjd4Ypxs6Zn+KfBoKw8yyYdfknBVU6Fbgx8k4XYOqinvq1Gug2SNGN/ybN9n2U06RO4I8nDqmE
	zzNUfKqQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1s3vVt-0007Y4-Jo; Mon, 06 May 2024 12:24:05 +0200
Received: from [87.49.147.101] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1s3vVs-000Ojz-12;
	Mon, 06 May 2024 12:24:04 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 06 May 2024 12:23:53 +0200
Subject: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
In-Reply-To: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27267/Mon May  6 10:24:34 2024)

Making pinctrl drivers and subsequently the pinctrl framework
user-controllable, allows building a kernel without this.
While in many (most) cases, this could make the system unbootable, it
does allow building smaller kernels for those situations where picntrl
is not needed.

One such situation is when building a kernel for NXP LS1021A systems,
which does not have run-time controllable pinctrl, so pinctrl framework
and drivers are 100% dead-weight.


Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/arm/mach-imx/Kconfig         | 16 ----------------
 drivers/pinctrl/freescale/Kconfig | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index ab767f059929..e4fe059cd861 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -6,7 +6,6 @@ menuconfig ARCH_MXC
 	select CLKSRC_IMX_GPT
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB
-	select PINCTRL
 	select PM_OPP if PM
 	select SOC_BUS
 	select SRAM
@@ -49,7 +48,6 @@ config SOC_IMX31
 config SOC_IMX35
 	bool "i.MX35 support"
 	select MXC_AVIC
-	select PINCTRL_IMX35
 	help
 	  This enables support for Freescale i.MX35 processor
 
@@ -61,7 +59,6 @@ config SOC_IMX1
 	bool "i.MX1 support"
 	select CPU_ARM920T
 	select MXC_AVIC
-	select PINCTRL_IMX1
 	help
 	  This enables support for Freescale i.MX1 processor
 
@@ -73,7 +70,6 @@ config SOC_IMX25
 	bool "i.MX25 support"
 	select CPU_ARM926T
 	select MXC_AVIC
-	select PINCTRL_IMX25
 	help
 	  This enables support for Freescale i.MX25 processor
 
@@ -81,7 +77,6 @@ config SOC_IMX27
 	bool "i.MX27 support"
 	select CPU_ARM926T
 	select MXC_AVIC
-	select PINCTRL_IMX27
 	help
 	  This enables support for Freescale i.MX27 processor
 
@@ -98,7 +93,6 @@ config SOC_IMX5
 
 config SOC_IMX50
 	bool "i.MX50 support"
-	select PINCTRL_IMX50
 	select SOC_IMX5
 
 	help
@@ -106,14 +100,12 @@ config SOC_IMX50
 
 config SOC_IMX51
 	bool "i.MX51 support"
-	select PINCTRL_IMX51
 	select SOC_IMX5
 	help
 	  This enables support for Freescale i.MX51 processor
 
 config SOC_IMX53
 	bool "i.MX53 support"
-	select PINCTRL_IMX53
 	select SOC_IMX5
 
 	help
@@ -137,7 +129,6 @@ config SOC_IMX6Q
 	select ARM_ERRATA_775420
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD
-	select PINCTRL_IMX6Q
 	select SOC_IMX6
 
 	help
@@ -147,7 +138,6 @@ config SOC_IMX6SL
 	bool "i.MX6 SoloLite support"
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
-	select PINCTRL_IMX6SL
 	select SOC_IMX6
 
 	help
@@ -157,7 +147,6 @@ config SOC_IMX6SLL
 	bool "i.MX6 SoloLiteLite support"
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
-	select PINCTRL_IMX6SLL
 	select SOC_IMX6
 
 	help
@@ -167,7 +156,6 @@ config SOC_IMX6SX
 	bool "i.MX6 SoloX support"
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
-	select PINCTRL_IMX6SX
 	select SOC_IMX6
 
 	help
@@ -175,7 +163,6 @@ config SOC_IMX6SX
 
 config SOC_IMX6UL
 	bool "i.MX6 UltraLite support"
-	select PINCTRL_IMX6UL
 	select SOC_IMX6
 	select ARM_ERRATA_814220
 
@@ -211,7 +198,6 @@ config SOC_IMX7D_CM4
 
 config SOC_IMX7D
 	bool "i.MX7 Dual support"
-	select PINCTRL_IMX7D
 	select SOC_IMX7D_CA7 if ARCH_MULTI_V7
 	select SOC_IMX7D_CM4 if ARM_SINGLE_ARMV7M
 	select ARM_ERRATA_814220 if ARCH_MULTI_V7
@@ -221,7 +207,6 @@ config SOC_IMX7D
 config SOC_IMX7ULP
 	bool "i.MX7ULP support"
 	select CLKSRC_IMX_TPM
-	select PINCTRL_IMX7ULP
 	select SOC_IMX7D_CA7 if ARCH_MULTI_V7
 	select SOC_IMX7D_CM4 if ARM_SINGLE_ARMV7M
 	help
@@ -237,7 +222,6 @@ config SOC_IMXRT
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
-	select PINCTRL_VF610
 
 	help
 	  This enables support for Freescale Vybrid VF610 processor.
diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 27bdc548f3a7..ef39bb6cf9cb 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -20,6 +20,7 @@ config PINCTRL_IMX1_CORE
 config PINCTRL_IMX1
 	bool "IMX1 pinctrl driver"
 	depends on SOC_IMX1
+	default SOC_IMX1
 	select PINCTRL_IMX1_CORE
 	help
 	  Say Y here to enable the imx1 pinctrl driver
@@ -27,6 +28,7 @@ config PINCTRL_IMX1
 config PINCTRL_IMX27
 	bool "IMX27 pinctrl driver"
 	depends on SOC_IMX27
+	default SOC_IMX27
 	select PINCTRL_IMX1_CORE
 	help
 	  Say Y here to enable the imx27 pinctrl driver
@@ -36,6 +38,7 @@ config PINCTRL_IMX25
 	bool "IMX25 pinctrl driver"
 	depends on OF
 	depends on SOC_IMX25
+	default SOC_IMX25
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx25 pinctrl driver
@@ -43,6 +46,7 @@ config PINCTRL_IMX25
 config PINCTRL_IMX35
 	bool "IMX35 pinctrl driver"
 	depends on SOC_IMX35
+	default SOC_IMX35
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx35 pinctrl driver
@@ -50,6 +54,7 @@ config PINCTRL_IMX35
 config PINCTRL_IMX50
 	bool "IMX50 pinctrl driver"
 	depends on SOC_IMX50
+	default SOC_IMX50
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx50 pinctrl driver
@@ -57,6 +62,7 @@ config PINCTRL_IMX50
 config PINCTRL_IMX51
 	bool "IMX51 pinctrl driver"
 	depends on SOC_IMX51
+	default SOC_IMX51
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx51 pinctrl driver
@@ -64,6 +70,7 @@ config PINCTRL_IMX51
 config PINCTRL_IMX53
 	bool "IMX53 pinctrl driver"
 	depends on SOC_IMX53
+	default SOC_IMX53
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx53 pinctrl driver
@@ -71,6 +78,7 @@ config PINCTRL_IMX53
 config PINCTRL_IMX6Q
 	bool "IMX6Q/DL pinctrl driver"
 	depends on SOC_IMX6Q
+	default SOC_IMX6Q
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx6q/dl pinctrl driver
@@ -78,6 +86,7 @@ config PINCTRL_IMX6Q
 config PINCTRL_IMX6SL
 	bool "IMX6SL pinctrl driver"
 	depends on SOC_IMX6SL
+	default SOC_IMX6SL
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx6sl pinctrl driver
@@ -85,6 +94,7 @@ config PINCTRL_IMX6SL
 config PINCTRL_IMX6SLL
 	bool "IMX6SLL pinctrl driver"
 	depends on SOC_IMX6SLL
+	default SOC_IMX6SLL
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx6sll pinctrl driver
@@ -92,6 +102,7 @@ config PINCTRL_IMX6SLL
 config PINCTRL_IMX6SX
 	bool "IMX6SX pinctrl driver"
 	depends on SOC_IMX6SX
+	default SOC_IMX6SX
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx6sx pinctrl driver
@@ -99,6 +110,7 @@ config PINCTRL_IMX6SX
 config PINCTRL_IMX6UL
 	bool "IMX6UL pinctrl driver"
 	depends on SOC_IMX6UL
+	default SOC_IMX6UL
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx6ul pinctrl driver
@@ -106,6 +118,7 @@ config PINCTRL_IMX6UL
 config PINCTRL_IMX7D
 	bool "IMX7D pinctrl driver"
 	depends on SOC_IMX7D
+	default SOC_IMX7D
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx7d pinctrl driver
@@ -113,6 +126,7 @@ config PINCTRL_IMX7D
 config PINCTRL_IMX7ULP
 	bool "IMX7ULP pinctrl driver"
 	depends on SOC_IMX7ULP
+	default SOC_IMX7ULP
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx7ulp pinctrl driver
@@ -194,6 +208,7 @@ config PINCTRL_IMX93
 config PINCTRL_VF610
 	bool "Freescale Vybrid VF610 pinctrl driver"
 	depends on SOC_VF610
+	default SOC_VF610
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the Freescale Vybrid VF610 pinctrl driver

-- 
2.45.0


