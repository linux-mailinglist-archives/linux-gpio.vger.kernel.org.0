Return-Path: <linux-gpio+bounces-18036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189FA7294E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 04:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 303797A2596
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 03:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E99370838;
	Thu, 27 Mar 2025 03:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="B1tQw4n8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE4749C;
	Thu, 27 Mar 2025 03:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743046559; cv=none; b=STxMoIGwMcDUUzg4b8hTEKOWGhiOU+7jsdiAYZRxXRxGHU5JMfz26MmefNf4IvVRzjnVRsImFbKSj7Fi6abw8S6ZtIqZiZysnQ9EqWpU6tUYGbUhP4SiZN6QqgXn2rGKkd1QB63IsViy8HIVZsTttTxCJox/2NfghU1neJTj7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743046559; c=relaxed/simple;
	bh=B4DFsCLzfJydiMiaUXd15k2xHQUR8806BueCQKWjvh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TU8w1d//o3BaqxjWL1kNu4MvzfMhPJIvZJv4QkGijX9zjGavoE6YjeOf2DaPWCd2fYdhNEEU/5lZxkcps0S9zCmnp20XSLdkUHJp5iLjg50fN4kS+ypAqgyl0FStSRcI2fGG/c93oyrP4+sjTBfEH2edpKtzHYmlJzADZEbuH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=B1tQw4n8; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743046552; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7fENAmjA5HlDqIU2S3l84f8tZ1auIWrnxR7dGJSHztU=;
	b=B1tQw4n8uQzBAhx3+Hagr07uyaXrwzGLN9nxEu0b6EHprmb3odYdOkt6hklS+ePDEhIw5ky3+ozsfXHdkMC0+DWuSfhKD7w9YIOGqcJTDl9Ig+j0kJOe0FmIfH2HFhZyLyZsLG0+OzUGr2m8QtcV1jMpCMMg2CzJY4ZTEOP6hpY=
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WT7CZp1_1743045606 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Mar 2025 11:20:10 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gpio: tegra186: fix resource handling in ACPI probe path
Date: Thu, 27 Mar 2025 11:20:06 +0800
Message-ID: <20250327032006.73798-1-kanie@linux.alibaba.com>
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
Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
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


