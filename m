Return-Path: <linux-gpio+bounces-6132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A518BCBF5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A46283B58
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B8F142E92;
	Mon,  6 May 2024 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="XzGdWnUI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABE1422C5;
	Mon,  6 May 2024 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991069; cv=none; b=pWqKKHu7sc5OdJ8fkL84cZ4QSbQCdudP268Z+uKjiU8grPcKLVRPiT75dfGABn/oSyftJP24iBO44Os2Iklh3A2hPDjr6+1Oa15pGH2VPpEcZr+Gs6VPnXLGgh0yXNE+5p7I9F43wboC5T279CVRiFhhl1sKiDwJVZxAe95aNUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991069; c=relaxed/simple;
	bh=+iGbmdojo/ysSAYj9+vv3uoYFfIvQYKAAZNiAJ+Gy3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wz7EiVvTmk7wSb8F4pdl4ctlSykHHYaG8uq2StfEuZQnd5zeuM3exb/3x97vqhRmTBIWfo35eRR1VFUOXE5a0ZdtU/Inou6GcuMRoF3hd8XgHl3yGD9nP863ZbylvkLOMhG2Iu8qmbIp0sQFb4KS5ll5Cy9WHgTbqca1VWZMupk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=XzGdWnUI; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DQm/agkAtB5qHs0WKvLGfyrGJ7CCayWji+zZYNYTpIk=; b=XzGdWnUIIZZD5TnSkfo3PNVvtI
	e7FzcSNPzKOjyJA38ahUt3KPEAlgNhZKinpIshQ0oJYhtaGhf1aQyr37JoLyN8jTPX9a3JDhmWU5P
	M0VMAj8b/WalJGVJKUorOe+kxsn0hloPrTfnFGUlsWHPtAjAN+cR+TT36JRpL1TaDvaMH0fDRpC2t
	Oid9XJ/FOe1AhQgNZfzbbrcs8tomOxHGDtTnxGYdiHGug5jyyTnkzW17MOrtOoEufo4tps01cNby2
	IxLqx8M8+nY6CVktwekHUXxVfG5H9FrM9+Nv988jiiCgeFrxTOcrYuKXwMhnclzHTyW0FXl/vNzd9
	XRHuFztg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1s3vVu-0007YK-Og; Mon, 06 May 2024 12:24:06 +0200
Received: from [87.49.147.101] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1s3vVt-000OrS-1l;
	Mon, 06 May 2024 12:24:05 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 06 May 2024 12:23:55 +0200
Subject: [PATCH v2 3/3] pinctrl: freescale: enable use with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-imx-pinctrl-optional-v2-3-bdff75085156@geanix.com>
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

Allow compile-testing of i.MX pinctrl drivers using CONFIG_COMPILE_TEST.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/pinctrl/freescale/Kconfig | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 2b19c40978c2..34a4255dfd4c 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -19,7 +19,8 @@ config PINCTRL_IMX1_CORE
 
 config PINCTRL_IMX1
 	bool "IMX1 pinctrl driver"
-	depends on SOC_IMX1
+	depends on OF
+	depends on SOC_IMX1 || COMPILE_TEST
 	default SOC_IMX1
 	select PINCTRL_IMX1_CORE
 	help
@@ -27,7 +28,8 @@ config PINCTRL_IMX1
 
 config PINCTRL_IMX27
 	bool "IMX27 pinctrl driver"
-	depends on SOC_IMX27
+	depends on OF
+	depends on SOC_IMX27 || COMPILE_TEST
 	default SOC_IMX27
 	select PINCTRL_IMX1_CORE
 	help
@@ -37,7 +39,7 @@ config PINCTRL_IMX27
 config PINCTRL_IMX25
 	bool "IMX25 pinctrl driver"
 	depends on OF
-	depends on SOC_IMX25
+	depends on SOC_IMX25 || COMPILE_TEST
 	default SOC_IMX25
 	select PINCTRL_IMX
 	help
@@ -45,7 +47,8 @@ config PINCTRL_IMX25
 
 config PINCTRL_IMX35
 	bool "IMX35 pinctrl driver"
-	depends on SOC_IMX35
+	depends on OF
+	depends on SOC_IMX35 || COMPILE_TEST
 	default SOC_IMX35
 	select PINCTRL_IMX
 	help
@@ -53,7 +56,8 @@ config PINCTRL_IMX35
 
 config PINCTRL_IMX50
 	bool "IMX50 pinctrl driver"
-	depends on SOC_IMX50
+	depends on OF
+	depends on SOC_IMX50 || COMPILE_TEST
 	default SOC_IMX50
 	select PINCTRL_IMX
 	help
@@ -61,7 +65,8 @@ config PINCTRL_IMX50
 
 config PINCTRL_IMX51
 	bool "IMX51 pinctrl driver"
-	depends on SOC_IMX51
+	depends on OF
+	depends on SOC_IMX51 || COMPILE_TEST
 	default SOC_IMX51
 	select PINCTRL_IMX
 	help
@@ -69,7 +74,8 @@ config PINCTRL_IMX51
 
 config PINCTRL_IMX53
 	bool "IMX53 pinctrl driver"
-	depends on SOC_IMX53
+	depends on OF
+	depends on SOC_IMX53 || COMPILE_TEST
 	default SOC_IMX53
 	select PINCTRL_IMX
 	help
@@ -77,7 +83,8 @@ config PINCTRL_IMX53
 
 config PINCTRL_IMX6Q
 	bool "IMX6Q/DL pinctrl driver"
-	depends on SOC_IMX6Q
+	depends on OF
+	depends on SOC_IMX6Q || COMPILE_TEST
 	default SOC_IMX6Q
 	select PINCTRL_IMX
 	help
@@ -85,7 +92,8 @@ config PINCTRL_IMX6Q
 
 config PINCTRL_IMX6SL
 	bool "IMX6SL pinctrl driver"
-	depends on SOC_IMX6SL
+	depends on OF
+	depends on SOC_IMX6SL || COMPILE_TEST
 	default SOC_IMX6SL
 	select PINCTRL_IMX
 	help
@@ -93,7 +101,8 @@ config PINCTRL_IMX6SL
 
 config PINCTRL_IMX6SLL
 	bool "IMX6SLL pinctrl driver"
-	depends on SOC_IMX6SLL
+	depends on OF
+	depends on SOC_IMX6SLL || COMPILE_TEST
 	default SOC_IMX6SLL
 	select PINCTRL_IMX
 	help
@@ -101,7 +110,8 @@ config PINCTRL_IMX6SLL
 
 config PINCTRL_IMX6SX
 	bool "IMX6SX pinctrl driver"
-	depends on SOC_IMX6SX
+	depends on OF
+	depends on SOC_IMX6SX || COMPILE_TEST
 	default SOC_IMX6SX
 	select PINCTRL_IMX
 	help
@@ -109,7 +119,8 @@ config PINCTRL_IMX6SX
 
 config PINCTRL_IMX6UL
 	bool "IMX6UL pinctrl driver"
-	depends on SOC_IMX6UL
+	depends on OF
+	depends on SOC_IMX6UL || COMPILE_TEST
 	default SOC_IMX6UL
 	select PINCTRL_IMX
 	help
@@ -117,7 +128,8 @@ config PINCTRL_IMX6UL
 
 config PINCTRL_IMX7D
 	bool "IMX7D pinctrl driver"
-	depends on SOC_IMX7D
+	depends on OF
+	depends on SOC_IMX7D || COMPILE_TEST
 	default SOC_IMX7D
 	select PINCTRL_IMX
 	help
@@ -125,7 +137,8 @@ config PINCTRL_IMX7D
 
 config PINCTRL_IMX7ULP
 	bool "IMX7ULP pinctrl driver"
-	depends on SOC_IMX7ULP
+	depends on OF
+	depends on SOC_IMX7ULP || COMPILE_TEST
 	default SOC_IMX7ULP
 	select PINCTRL_IMX
 	help
@@ -134,7 +147,7 @@ config PINCTRL_IMX7ULP
 config PINCTRL_IMX8MM
 	tristate "IMX8MM pinctrl driver"
 	depends on OF
-	depends on SOC_IMX8M
+	depends on SOC_IMX8M || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mm pinctrl driver
@@ -142,7 +155,7 @@ config PINCTRL_IMX8MM
 config PINCTRL_IMX8MN
 	tristate "IMX8MN pinctrl driver"
 	depends on OF
-	depends on SOC_IMX8M
+	depends on SOC_IMX8M || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mn pinctrl driver
@@ -150,7 +163,7 @@ config PINCTRL_IMX8MN
 config PINCTRL_IMX8MP
 	tristate "IMX8MP pinctrl driver"
 	depends on OF
-	depends on SOC_IMX8M
+	depends on SOC_IMX8M || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mp pinctrl driver
@@ -158,42 +171,47 @@ config PINCTRL_IMX8MP
 config PINCTRL_IMX8MQ
 	tristate "IMX8MQ pinctrl driver"
 	depends on OF
-	depends on SOC_IMX8M
+	depends on SOC_IMX8M || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
 
 config PINCTRL_IMX8QM
 	tristate "IMX8QM pinctrl driver"
-	depends on IMX_SCU && ARCH_MXC && ARM64
+	depends on OF
+	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qm pinctrl driver
 
 config PINCTRL_IMX8QXP
 	tristate "IMX8QXP pinctrl driver"
-	depends on IMX_SCU && ARCH_MXC && ARM64
+	depends on OF
+	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
 
 config PINCTRL_IMX8DXL
 	tristate "IMX8DXL pinctrl driver"
-	depends on IMX_SCU && ARCH_MXC && ARM64
+	depends on OF
+	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8dxl pinctrl driver
 
 config PINCTRL_IMX8ULP
 	tristate "IMX8ULP pinctrl driver"
-	depends on ARCH_MXC
+	depends on OF
+	depends on ARCH_MXC || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8ulp pinctrl driver
 
 config PINCTRL_IMXRT1050
 	bool "IMXRT1050 pinctrl driver"
-	depends on SOC_IMXRT
+	depends on OF
+	depends on SOC_IMXRT || COMPILE_TEST
 	default SOC_IMXRT
 	select PINCTRL_IMX
 	help
@@ -201,14 +219,16 @@ config PINCTRL_IMXRT1050
 
 config PINCTRL_IMX93
 	tristate "IMX93 pinctrl driver"
-	depends on ARCH_MXC
+	depends on OF
+	depends on ARCH_MXC || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx93 pinctrl driver
 
 config PINCTRL_VF610
 	bool "Freescale Vybrid VF610 pinctrl driver"
-	depends on SOC_VF610
+	depends on OF
+	depends on SOC_VF610 || COMPILE_TEST
 	default SOC_VF610
 	select PINCTRL_IMX
 	help
@@ -229,7 +249,8 @@ config PINCTRL_IMX28
 
 config PINCTRL_IMXRT1170
 	bool "IMXRT1170 pinctrl driver"
-	depends on SOC_IMXRT
+	depends on OF
+	depends on SOC_IMXRT || COMPILE_TEST
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imxrt1170 pinctrl driver

-- 
2.45.0


