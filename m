Return-Path: <linux-gpio+bounces-20072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE46AB57D2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 17:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19208860F7B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B2319995D;
	Tue, 13 May 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DOrhuriI";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="REGEktdO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87E31D555;
	Tue, 13 May 2025 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148443; cv=none; b=rheEF3IJwAvQgVEDoCpILvhos/MdSPuVD8BS8A5apYh59nNmg4ENWI6gnRj0fq6zFoP559nayupeYJPZZPq382vPq59HazooMAX+xgk7Svr+/13lA1w4rEV2yQxlEFfVB/LgLxnZ4EXgiB5xOfCKO+58icv5RlyytJbCSKgE3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148443; c=relaxed/simple;
	bh=Lucx0KH9MaH/7UpmN5KbkNHQmkYf5YHbGDtSWRCjDiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sm5f0FYzVuqmVZVeG2pq6XJysNbGj7h+r51DbzLhwtddtT7Mlib6QAObwfWxLSzqTvuyaC+UnRrbFVoy+liSViukGP0rVMRZUXjGX7F7MAZLOEATNTfKvxCu/JO2EZg9kHZlP5rW18qB+EPZaHFBEWfASujyWPJbNkha/JXkYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DOrhuriI; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=REGEktdO reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747148439; x=1778684439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gh2NMO7qJrdv3iG60qbGVCR0O4srfdQABWtiiWuAUlw=;
  b=DOrhuriI8a4Nw3OlNGY+cL+LEFaxdENf6Y6X/C1aA2F+AgGjDUYqkrDR
   3O1OxznGt/Fb1DjI1J5mYbQ53xMY8PSi7lRnxSxW4NP565lgjqaDXvxPl
   XEPDnSHmeJfgMwkIBvzN07gIV+1HozxvR7HHh/4kIl60goxSPmdQabn+o
   NEf94gEpO7F9Selb0yB6vDbHtrKyPveDI5Fp4uPyDFo9CAqF7jfwXtb1X
   2wIKO26vQheVJpo1QOviSS0OR1uNlg77pg+Wowv+QrNEFnaZQhhjcV7lR
   QqL8D0JW2pQIFeSb4AVc97WHY+1pa6dMT0SjU4awDH8F5VDQoll2Kvehx
   A==;
X-CSE-ConnectionGUID: BWWvUYNuSImKxyj+5+dKgg==
X-CSE-MsgGUID: 2iIUzI4OSQKYJDou9ZNbKg==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; 
   d="scan'208";a="44051266"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 May 2025 17:00:31 +0200
X-CheckPoint: {68235E8E-25-3689CF63-CB8C500E}
X-MAIL-CPID: 8AF5C25384C644D3101B75723DB32111_3
X-Control-Analysis: str=0001.0A006375.68235E91.0079,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E6FB166837;
	Tue, 13 May 2025 17:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747148426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gh2NMO7qJrdv3iG60qbGVCR0O4srfdQABWtiiWuAUlw=;
	b=REGEktdOJSZB22vxLke68pavWt63t07eXLNHdPVOsHqS+kedsJ7991/Gup3ZFTdO6yuVrZ
	WxnhB7OgzS8x/KPu70JHOi7gfOuJxq+nBJhXWiIm7mCS71GPqU4rqiVSW4kXl4iKdM6TLY
	kbzHPyiMUYPa1wYzqbIEwbFkFTLE9ycxO1qZInz5U5WnDe0oPa5ZaWmT0cWikYL0fmn93k
	vqkxai4ooXNPGs2VrhnkNLwOTVWIMVJQQ8UbYheLbpwV4hzBPESIGq/YVCwjhL5D4zKoHu
	+iStl/v1wasjLk9KQs3/X9lshXEUQ6uTSS5bE9eQlTCewudBw8itNWY7Ah2Xyg==
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
Subject: [PATCH v2 1/1] pinctrl: freescale: Enable driver if platform is enabled.
Date: Tue, 13 May 2025 17:00:09 +0200
Message-ID: <20250513150010.600656-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
Changes in v2:
* default pinctrl driver depending on SoC support

The discussion at [1] resulted it is better to default SoC-specific pinctrl
drivers to thei SoC support instead of adding to defconfig or selecting
pinctrl.

[1] https://lore.kernel.org/all/20250507124414.3088510-1-alexander.stein@ew.tq-group.com/

 drivers/pinctrl/freescale/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4c420b21b804d..18962bc93b87d 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -21,6 +21,7 @@ config PINCTRL_IMX_SCMI
 config PINCTRL_IMX_SCU
 	tristate
 	depends on IMX_SCU || COMPILE_TEST
+	default IMX_SCU
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
@@ -159,6 +160,7 @@ config PINCTRL_IMX8MM
 	tristate "IMX8MM pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mm pinctrl driver
@@ -167,6 +169,7 @@ config PINCTRL_IMX8MN
 	tristate "IMX8MN pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mn pinctrl driver
@@ -175,6 +178,7 @@ config PINCTRL_IMX8MP
 	tristate "IMX8MP pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mp pinctrl driver
@@ -183,6 +187,7 @@ config PINCTRL_IMX8MQ
 	tristate "IMX8MQ pinctrl driver"
 	depends on OF
 	depends on SOC_IMX8M || COMPILE_TEST
+	default SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
@@ -191,6 +196,7 @@ config PINCTRL_IMX8QM
 	tristate "IMX8QM pinctrl driver"
 	depends on OF
 	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qm pinctrl driver
@@ -199,6 +205,7 @@ config PINCTRL_IMX8QXP
 	tristate "IMX8QXP pinctrl driver"
 	depends on OF
 	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
@@ -207,6 +214,7 @@ config PINCTRL_IMX8DXL
 	tristate "IMX8DXL pinctrl driver"
 	depends on OF
 	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8dxl pinctrl driver
@@ -215,6 +223,7 @@ config PINCTRL_IMX8ULP
 	tristate "IMX8ULP pinctrl driver"
 	depends on OF
 	depends on ARCH_MXC || COMPILE_TEST
+	default ARCH_MXC
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8ulp pinctrl driver
@@ -239,6 +248,7 @@ config PINCTRL_IMX93
 	tristate "IMX93 pinctrl driver"
 	depends on OF
 	depends on ARCH_MXC || COMPILE_TEST
+	default SOC_IMX9
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx93 pinctrl driver
-- 
2.43.0


