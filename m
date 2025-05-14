Return-Path: <linux-gpio+bounces-20155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A6AB6C5A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 15:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F129189097C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 13:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B4F27A469;
	Wed, 14 May 2025 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="b7T/ii+g";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="U16cqvSQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C531279910;
	Wed, 14 May 2025 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228440; cv=none; b=bZ6pwB2jZwTAvVK64FLk61G2co2U0vnj2ljm98aYNiDAQb3cVvDZMEDhZRedf173b5g0MRB7YU0b++/QINLg40+2IrC/c2+SKOHyl/SLQElu4wcMmP4SDgKopKKaOhqB1iHm4WzmeypMPDjW+neaXgI/xBZqsoGlwAFGcmF+mvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228440; c=relaxed/simple;
	bh=6CLqnuIgEctjQfdvqvKh/aA+fL52MSlYHzbUqzJ0pL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ep+p3UVMFD3q9D76SpHyb7ZiEx+i7HWjO7X5jCKS2jIRA6s0u4XEitpgpqu0BvQMwzPXGnr2mGFnO9bHY5ap3lkARv5+43r5YPi+ctL2FI4p4j8sLea1RNf/HrPumpqjnKvsXlGwaRuKmcL4L/VAiYXHWviYOIbGnO4dU2X/bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=b7T/ii+g; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=U16cqvSQ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747228437; x=1778764437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XHqOopCQYo4IeXXjHPGwYrzoVdIHtHO13BeehVCvljM=;
  b=b7T/ii+gbVqlw+jdGyuUQFiwqzU9E593gH+Ckbdg4K2XUFAH58t/wJ+y
   yfzl5ehZUEqTi+Bal46WqskBFYtvuYqIVwqmQ9+KFNtup78gGbOp9N8+V
   ftPrPTb36fjN1w23XsR+sauwpHCp7rPmdlM1mu8hhIOMwtqp5gGJPyvGt
   USGzNWcp1EcC+GGrYDo+btAGub6EMLtNO/m8hdh1cYk26h8s0gXqhZUJY
   ARhFFZEnxyOPD68x3Sl+nDFbNDrRtIiJoiGODh5bJW9KC5sqihN5uC/oU
   VDhrYaC8DjYhD5yn9t7ETvF+VGwKWH3It9JF8J1xufGdAteuJ3W8nUdhx
   Q==;
X-CSE-ConnectionGUID: 7L2i/4dZQZiVxY4UyBQCZQ==
X-CSE-MsgGUID: i/XFyG87Qa2j98UNMQ9pXw==
X-IronPort-AV: E=Sophos;i="6.15,288,1739833200"; 
   d="scan'208";a="44072736"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 15:13:54 +0200
X-CheckPoint: {68249712-23-DF3E87D0-C74668F0}
X-MAIL-CPID: 70AE4422C0700A94B436A45DF8200D70_0
X-Control-Analysis: str=0001.0A006397.68249717.001B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A5121640FF;
	Wed, 14 May 2025 15:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747228430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHqOopCQYo4IeXXjHPGwYrzoVdIHtHO13BeehVCvljM=;
	b=U16cqvSQncNVnuVWlnrPB6BlWsWbk1fzoZAKJPbc7psftBgtiINewaJls06/4sCzFL1RQu
	n61LVWFTDHyeDdmKI5K7FlVRhiR9meen07SmtScZr6zcDPCl66nCNLrb24ZtrbITfzSg13
	MuLDNLtMhBvvpNFAYA8cKf9MnETkA1b8wpJoofth3UXkm4y5NDXiENbZF9kf1ltiUoEi/c
	pS3R6q+aqb3SMxUKq6DAGZZi+AGyRodblBHXhUnfndE0hORxTlZC5iwIW1HNlh6/3x9KPR
	mnQMw3jHreldtEbwm/a+RncCTeKd/y/pb60D3oETtpfrdM0X/2ETePunAifhSw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] pinctrl: freescale: Enable driver if platform is enabled.
Date: Wed, 14 May 2025 15:13:40 +0200
Message-ID: <20250514131342.755840-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
References: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The pinctrl drivers are not enabled in defconfig. Instead of listing
each driver in the defconfig, enable then by default if the platform/soc
support is enabled as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

Changes in v2:
* default pinctrl driver depending on SoC support

The discussion at [1] resulted it is better to default SoC-specific pinctrl
drivers to thei SoC support instead of adding to defconfig or selecting
pinctrl.

[1] https://lore.kernel.org/all/20250507124414.3088510-1-alexander.stein@ew.tq-group.com/

 drivers/pinctrl/freescale/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index d1610e2f21427..8d24decd3f074 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -22,6 +22,7 @@ config PINCTRL_IMX_SCU
 	tristate
 	depends on OF
 	depends on IMX_SCU || COMPILE_TEST
+	default IMX_SCU
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
@@ -160,6 +161,7 @@ config PINCTRL_IMX8MM
 	tristate "IMX8MM pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mm pinctrl driver
@@ -168,6 +170,7 @@ config PINCTRL_IMX8MN
 	tristate "IMX8MN pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mn pinctrl driver
@@ -176,6 +179,7 @@ config PINCTRL_IMX8MP
 	tristate "IMX8MP pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mp pinctrl driver
@@ -184,6 +188,7 @@ config PINCTRL_IMX8MQ
 	tristate "IMX8MQ pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
@@ -192,6 +197,7 @@ config PINCTRL_IMX8QM
 	tristate "IMX8QM pinctrl driver"
 	depends on OF
 	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qm pinctrl driver
@@ -200,6 +206,7 @@ config PINCTRL_IMX8QXP
 	tristate "IMX8QXP pinctrl driver"
 	depends on OF
 	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
@@ -208,6 +215,7 @@ config PINCTRL_IMX8DXL
 	tristate "IMX8DXL pinctrl driver"
 	depends on OF
 	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8dxl pinctrl driver
@@ -216,6 +224,7 @@ config PINCTRL_IMX8ULP
 	tristate "IMX8ULP pinctrl driver"
 	depends on OF
 	depends on ARCH_MXC || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8ulp pinctrl driver
@@ -240,6 +249,7 @@ config PINCTRL_IMX93
 	tristate "IMX93 pinctrl driver"
 	depends on OF
 	depends on ARCH_MXC || COMPILE_TEST
+	default SOC_IMX9
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx93 pinctrl driver
-- 
2.43.0


