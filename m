Return-Path: <linux-gpio+bounces-6131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8C8BCBF3
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30E08B22765
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA125142E6A;
	Mon,  6 May 2024 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="tTifO5zD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FED43AA5;
	Mon,  6 May 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991068; cv=none; b=Lko0EHidvelICTKmLcLf5nNCiVM5OVq3oSE/p0B1pHX9JONSEzQZVLlcntb7yuKTx5kMtPDuNmHaUY4jN/rDYSGuFypxQw8U66RHeVFUSE/1iFhjwJmFveZpbGVHpOeBlAHinNdVRnfcMHaLjMpIskEPXrKoZqigdufNPg+kfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991068; c=relaxed/simple;
	bh=A95II0L+2CU8yfg7lhrZG/cyFVKl7bFuDgSv7zTeqt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xyl6Rna6FZXm1t4DqcPuiKSNFVLaOLTs1Ie5LaPVN9DBMRCtzPFOWrvEkKez8eDc61VrOtAFaw/3T56xeY5I386tJhBJ2a+1Y5rb5fk4iUXJey9YAG1MGC3gRH+SFE4I5NVOsc+fzbug+cDi6mkJnnNxaIpUAa3LAlzzopMXI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=tTifO5zD; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Sr5sE9hhxNCxdk/KUaVoDet/Mj59itaUMZRr+MecJjc=; b=tTifO5zDIqefvel+Axv9aUMb87
	kOztsW7nbsirxEVyKaWvRL3s2RXObi08MRCgSTPqxBP2jZZAHaPtY3Uet+iQq07F4GwYC/zwH4JCt
	EZ9RZHMKpX661e2bzhrwyqVyBf6M+Ymghxt6bfOpTKY7msLpv+N5xyz27dW25knqwMaS1gtVs+bUg
	833l1XiMUB4YU/KWg9/5m/QMj56tSWRqam67GaRbAgFlz5k3a2r4wYFeVX8Dg5V9Weik4mYtbEkve
	SWfk+Rmc59LS6xUY+mjPombDLirqYNJ83S2SCONFH1ieIf4L3kTz9a7dIoB2KKN7qtkmf+VHKEByo
	NhQrUMTg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1s3vVu-0007YE-5V; Mon, 06 May 2024 12:24:06 +0200
Received: from [87.49.147.101] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1s3vVs-000OnK-30;
	Mon, 06 May 2024 12:24:05 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 06 May 2024 12:23:54 +0200
Subject: [PATCH v2 2/3] pinctrl: freescale: Use CONFIG_SOC_IMXRT to guard
 i.MX RT1xxx drivers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-imx-pinctrl-optional-v2-2-bdff75085156@geanix.com>
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

This aligns with the use of SOC_IMX* as dependencies for all the other
mach-imx pinctrl drivers. Enabling i.MX RT pinctrl drivers for a kernel
with out i.MX RT SOC support is pointless.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/pinctrl/freescale/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index ef39bb6cf9cb..2b19c40978c2 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -193,7 +193,8 @@ config PINCTRL_IMX8ULP
 
 config PINCTRL_IMXRT1050
 	bool "IMXRT1050 pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMXRT
+	default SOC_IMXRT
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imxrt1050 pinctrl driver
@@ -228,7 +229,7 @@ config PINCTRL_IMX28
 
 config PINCTRL_IMXRT1170
 	bool "IMXRT1170 pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMXRT
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imxrt1170 pinctrl driver

-- 
2.45.0


