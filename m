Return-Path: <linux-gpio+bounces-23859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E8CB1349E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 08:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37ACF172013
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 06:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617FC21FF38;
	Mon, 28 Jul 2025 06:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="UDjtvuWl";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oh9g3DYI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11319F40A;
	Mon, 28 Jul 2025 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682769; cv=none; b=NyM9tG7JifTwwlav6COG97oLUgKmlACrUQx/aX74MQUAZe2dCfP4Pyf/3S7cZnMzPZfAtkccZnDcmk6qKh+gDLpmw0vR31w9INcUPkJXPxMi/ZW0aOa3xoPuQepnGPypOoltpImuwP0YgtJH/Yzw9aK6GrLcDAJQLlErmZeKiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682769; c=relaxed/simple;
	bh=6vTjO/cynC+dj+pDFDq/WIqqZaida7ljLfk9SDTISGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmRA7VxXU0KdgRW9UaIv4szZ+tP3R/bYp3PqHGWq159MdeCxP9W1oUxQx4C94LSSTH1j5S/OvX/7pvDIdcVkyR2pkOMMs9OCmSwbA7q9eFtz4oHq/aurP9fubHwUY9LqBL4XuVYD6nqjapOYkdkseJEANxV2+7JOdrqGeG3Xg60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=UDjtvuWl; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oh9g3DYI reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753682764; x=1785218764;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=;
  b=UDjtvuWlFRK6C66qs1CbVKVnyxuy3GFEFQRRySKQKFAfQT5PlIFuSOlL
   Q3RVUdRJqX6Uz5fGp1OMruVlNezuIZLgHB6yAzHGjoGrRrPGM/9kxqF/B
   uqRRPCoP7eXGuLfggkgKhERinI9bIgrkgrLRlygYN1zQZXanNJZzYV4fd
   cnvv2jEpb/Cb6M2R96AzyvQULhH/wX0vHL0oWIQ1bRKVvZpfEAiPDnLQR
   NpJK4AqGnS9QLbPy56GST5l1/89ihkDLdhXZFObb8mfMTkPyrp3uXcY3a
   FiNoFmciF5A+LgzjmxLECrhDLsX8J7eXu2tBQTjWd0DhGUk3rfffDvUDJ
   w==;
X-CSE-ConnectionGUID: LuVdxQooQWywzzukvPuoDg==
X-CSE-MsgGUID: tSUhUxs7SjGmYTS1cQrlpA==
X-IronPort-AV: E=Sophos;i="6.16,339,1744063200"; 
   d="scan'208";a="45440332"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Jul 2025 08:05:51 +0200
X-CheckPoint: {68871340-A-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: 154A4088696352CA20E2E8C7001DE7E1_2
X-Control-Analysis: str=0001.0A002106.6887134A.008B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A938E16568B;
	Mon, 28 Jul 2025 08:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753682747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=;
	b=oh9g3DYI0g2Ihh111neIBiKYeOBcsinYlR9XMSILJwIObcOmA5eB3dYyvC8wwLQxrDbq5q
	TDue0UOUfjc6qvBGVcpfGQgRoOaUUuApM6qp8u3XV0kbAO2WWKa/Ojo1jsb5kvPSaGyTZ3
	FqEyJ8MZSkrwvEnl8RTD+2BwN/dKWwhzXWOKWJ5TNOi/onxB89OGjv/hZg0yeZtHolvYXD
	Rm3GkSeNmxHLodTJx4tZ9b9IJvZ2tLmKuSV7Y+bUeJMOUTYdByPimye8d5m/OL0u9VR9sc
	7jW5b8QXdC8A2WhFUr0LOs9IlmSmltBoUsvoUGHO6adfBJxN35gDfR9m6C3v0g==
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
Subject: [PATCH v2 1/1] gpio: stmpe: Allow to compile as a module
Date: Mon, 28 Jul 2025 08:05:43 +0200
Message-ID: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
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
Keep the subsys_initcall to not change registration order for built-in.
Also add OF match table for module autoloading.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Do not touch subsys_initcall
* Add module_exit instead
* Adjust commit message

 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-stmpe.c | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

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
index 0a270156e0bea..97d6c4f98eaf7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -534,10 +534,16 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
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
 	.probe		= stmpe_gpio_probe,
 };
@@ -547,3 +553,13 @@ static int __init stmpe_gpio_init(void)
 	return platform_driver_register(&stmpe_gpio_driver);
 }
 subsys_initcall(stmpe_gpio_init);
+
+static void __exit stmpe_gpio_exit(void)
+{
+	platform_driver_unregister(&stmpe_gpio_driver);
+}
+module_exit(stmpe_gpio_exit);
+
+MODULE_DESCRIPTION("STMPE expander GPIO");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


