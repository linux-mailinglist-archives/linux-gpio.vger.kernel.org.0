Return-Path: <linux-gpio+bounces-23804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C3B11819
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 07:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39EF5562496
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 05:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8746C244666;
	Fri, 25 Jul 2025 05:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qoR307dS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oyzKEkx2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193853A1DB;
	Fri, 25 Jul 2025 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753422759; cv=none; b=RdOlnbVt/bp//K4l0RDK0iUdZu+pFpngbSA9G1Mfs/erdndC0pKKcfFZwXpQhqPR+6KF3Ow4sUKb1pKYhSGnJqi/5FWNsG6gWRIwl4iiFnFo3N/dAFfJFbS5X2SdfHLTv9/9MHBHRTdX4Wmw8ZBFalFhM4KpLeOycbaGaFsAUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753422759; c=relaxed/simple;
	bh=RyWfplusbYQzaahrxToauxEMOY4ZYZyPcruISZoqJag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EouQF+2PCLCs8R9pKFR7Eg8YvsLN2B7aGQ9rGOnbSDUvH32b7XfJ+sa1e6bVjhqqu1y3daP3dW54saHSC/1Ljvaml1V4GybaY0fYWdNt20RMC00Om65Z5t8/ayZJ4wyIBZxEpy11NGuVAHm7i9lmsbfxBp1x6iaT16TYyj5uarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=qoR307dS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oyzKEkx2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753422755; x=1784958755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=;
  b=qoR307dSXrvQvbPCqenszW/6AlWjB0D4DSofkZ3H9si5dQGsVxDQ428y
   3kQGEghiRtPW0lrQB/BvyDfY6AbOtVsG6ktE/7bD6JMWrO6V2SY1NHd2F
   AJvDLgFHjIWtZnSeEDdwYJUr29sERfQO4IphneoAcMmT3waUs5+OxOoyG
   7rtDnkDaAZdZQzUau/mtjN1DyTC2A0Ud6ynEaZTmmUBhihnAupUnvlH6V
   6+NyVec4Q8zo1I9Hg2kd29rgr/TTfO8QlMlajmAO6WtO+ONq9n+BlzRkR
   ag48A+rpSpYkg9MkvBDGr9yGC6tO+uBB3/91z+pmLzpDU2Ox7p1UlJHME
   Q==;
X-CSE-ConnectionGUID: CnGdkg3lRoyewLU0Ay8xYw==
X-CSE-MsgGUID: 1gFfGMw+QYmLb3/VB/qSIw==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45412473"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 07:52:29 +0200
X-CheckPoint: {68831B9C-2D-4FC15ADB-CD71293B}
X-MAIL-CPID: 1D1F9231A91F7DBFBC957FFF256F8A75_0
X-Control-Analysis: str=0001.0A002103.68831BC0.0008,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5047C1682BB;
	Fri, 25 Jul 2025 07:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753422744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=;
	b=oyzKEkx25B9P597urr/TQ4CGH0UThu7GbikqokVj9ixGHld5Sl+b1OgdtBB3sibD42o1EQ
	jTcdrSyJJEtMNTgoL3/DXrMVMjZ8eU2v3rq8RomCd/bCTeXs4wrJFD01qcQ5sDdKNF3Uql
	870iPX/fQoStQFzarajnlqh3tt4kxhhAsuwfekVfT00Tfq9gGrY6jMp/ACw/QB6rbmP9Gj
	9wawEB+ZJQiFh8z1inVKvzSaj+c59NVH2CENc6SsNriYhoVEo3Li2j3agO1ovmRGpUInI7
	oXr6/5ynsVBeoLQ9tdrF/11SFSYRa2AAlDRqzQb9sMl2PSIYkMCGY/VQ7m/+Tg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] gpio: stmpe: Allow to compile as a module
Date: Fri, 25 Jul 2025 07:52:20 +0200
Message-ID: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the necessary boilerplate to also make this driver modular.
This follows commit a2b8191ab695a ("pwm: stmpe: Allow to compile as a
module") which does the same for pwm. Also add OF match table for module
autoloading.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-stmpe.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 500d839f65ee8..0621832d045fa 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1559,7 +1559,7 @@ config GPIO_SL28CPLD
 	  called gpio-sl28cpld.
 
 config GPIO_STMPE
-	bool "STMPE GPIOs"
+	tristate "STMPE GPIOs"
 	depends on MFD_STMPE
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 0a270156e0bea..db9f4cd1e8615 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -534,16 +534,19 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &stmpe_gpio->chip, stmpe_gpio);
 }
 
+static const struct of_device_id stmpe_gpio_of_matches[] = {
+	{ .compatible = "st,stmpe-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, stmpe_gpio_of_matches);
+
 static struct platform_driver stmpe_gpio_driver = {
 	.driver = {
-		.suppress_bind_attrs	= true,
-		.name			= "stmpe-gpio",
+		.name = "stmpe-gpio",
+		.of_match_table = stmpe_gpio_of_matches,
 	},
-	.probe		= stmpe_gpio_probe,
 };
+module_platform_driver_probe(stmpe_gpio_driver, stmpe_gpio_probe);
 
-static int __init stmpe_gpio_init(void)
-{
-	return platform_driver_register(&stmpe_gpio_driver);
-}
-subsys_initcall(stmpe_gpio_init);
+MODULE_DESCRIPTION("STMPE expander GPIO");
+MODULE_LICENSE("GPL");
-- 
2.43.0


