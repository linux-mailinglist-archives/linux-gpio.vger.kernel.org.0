Return-Path: <linux-gpio+bounces-10261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF897C772
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 11:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431C21C20958
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 09:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948A91A01D3;
	Thu, 19 Sep 2024 09:44:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADF1A00FF;
	Thu, 19 Sep 2024 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726739050; cv=none; b=ZfLMCRbvDaqf3OriuRDVwsdEYfpT7dH+5GffnHIPAUlxyPcET+YjHV38dgJC6ZG4lJmN9sHOUnxykpjjvAvusfQbsX+KIRHc88v1BSerqhveCh1eW9DiBI+Jch0Yd+ooIHeIw7uXRNsxbmt74bo3q4oZACan/kMD0K5za7zQmnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726739050; c=relaxed/simple;
	bh=LZo7tXx/X3IYzIBTbPHYkwX4X/ERNVgO5jELty9Bat4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtkNt67P4sHUSgLT0eu0pPMZvlHj6JkfzDbDOZc3kSKIaGpyXHgIrM26rTN2HY2I+eEib0Tr1hZGFj+mmpYeueEDD2kh0Q5ZoyVCh9bOvHd/klPGUBXippYfv/EXMuO4ejja61XGs33pSN7iCp3gkvgc4DrMhA1f4IjgJhaNfnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 17:43:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 19 Sep 2024 17:43:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v4 5/6] gpio: aspeed: Change the macro to support deferred probe
Date: Thu, 19 Sep 2024 17:43:38 +0800
Message-ID: <20240919094339.2407641-6-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use module_platform_driver() to replace module_platform_driver_probe().
The former utilizes platform_driver_register(), which allows the driver to
defer probing when it doesn't acquire the necessary resources due to probe
order. In contrast, the latter uses __platform_driver_probe(), which
includes the comment "Note that this is incompatible with deferred
probing." Since our GPIO driver requires access to the clock resource, the
former is more suitable.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 060c0225cb99..c811e84db0b9 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1282,7 +1282,7 @@ static const struct of_device_id aspeed_gpio_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
-static int __init aspeed_gpio_probe(struct platform_device *pdev)
+static int aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
@@ -1382,13 +1382,14 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 }
 
 static struct platform_driver aspeed_gpio_driver = {
+	.probe = aspeed_gpio_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = aspeed_gpio_of_table,
 	},
 };
 
-module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
+module_platform_driver(aspeed_gpio_driver);
 
 MODULE_DESCRIPTION("Aspeed GPIO Driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1


