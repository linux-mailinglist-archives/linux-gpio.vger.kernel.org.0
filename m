Return-Path: <linux-gpio+bounces-18034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77761A7291F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 04:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB2B189E53D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 03:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D867B1C861A;
	Thu, 27 Mar 2025 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KszUwacK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9141AA1E0;
	Thu, 27 Mar 2025 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045846; cv=none; b=IoupBNcUVQcDm5JlxsjM3Y8sNRcTuTXVtnUln8bEDpzZWNy0ODjTy7Pt34RzqzcONQUtynOVUDhpy/atGDFELsVgNUGQ/vGqcffAiyynFd5hLx0x2lBWiOTR8umJacbjo0waZ6z4E9d7ttGkCcA7AhwEth486f9zMUdp3vFLOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045846; c=relaxed/simple;
	bh=m14h3yoUTbAqVpXODC0zMSbRl54bX2+I393JGsWn+ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZG9PISJnXPxqqiBmSzq3ZlHZvozUPzxm3NSPIH45lYBxC4+NO9hNMHWaq2/3WOzrsEBGd3k6Mfq28T7QBk734X4Pb7VqqpQsmY8SZTJHq6yN/+RGbZe6IXqMudvW6eAY1qo91hm74gLwiKsyz8DvLp0ePShtoVpQlX+bYoNfm6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KszUwacK; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743045833; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=IzFeiGzmrelIDrN3T+p0dy+aeXecEBBAeMklppQIpr0=;
	b=KszUwacK5zbgkjS1bePSQ0Ji3+/TMyiHCfy570l2kotxUlUEJc9meAAqpsfxhh6mx2Dc2SRicfUOwl3fuCd1v4oYPLoOZXoHkWf0ea0yN+4KksSVzExuZBaEczaWZbXkPA2v5YbcH6hNJMX/iVnSxoCOgDHd1bXmpTRnMaOCwGs=
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WT78S1A_1743045829 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Mar 2025 11:23:53 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: tegra186: fix resource handling in ACPI probe path
Date: Thu, 27 Mar 2025 11:23:49 +0800
Message-ID: <20250327032349.78809-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the Tegra186 GPIO controller is probed through ACPI matching,
the driver emits two error messages during probing:
  "tegra186-gpio NVDA0508:00: invalid resource (null)"
  "tegra186-gpio NVDA0508:00: invalid resource (null)"

Fix this by getting resource first and then do the ioremap.

Fixes: 2606e7c9f5fc ("gpio: tegra186: Add ACPI support")
Cc: stable@vger.kernel.org
Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
Changes from v2 to v3:
- Add "CC: stable" to commit body.

Changes from v1 to v2:
- Add "Fixes" to commit body.

 drivers/gpio/gpio-tegra186.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 6895b65c86af..d27bfac6c9f5 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -823,6 +823,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
 	struct device_node *np;
+	struct resource *res;
 	char **names;
 	int err;
 
@@ -842,19 +843,19 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->num_banks++;
 
 	/* get register apertures */
-	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
-	if (IS_ERR(gpio->secure)) {
-		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(gpio->secure))
-			return PTR_ERR(gpio->secure);
-	}
-
-	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
-	if (IS_ERR(gpio->base)) {
-		gpio->base = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(gpio->base))
-			return PTR_ERR(gpio->base);
-	}
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "security");
+	if (!res)
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gpio->secure = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(gpio->secure))
+		return PTR_ERR(gpio->secure);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
+	if (!res)
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
 
 	err = platform_irq_count(pdev);
 	if (err < 0)
-- 
2.43.0


