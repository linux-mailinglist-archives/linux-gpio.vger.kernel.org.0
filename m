Return-Path: <linux-gpio+bounces-17997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB194A710A9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 07:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FCA016F356
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 06:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B65018E750;
	Wed, 26 Mar 2025 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Zichuw4e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA214B965;
	Wed, 26 Mar 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742971072; cv=none; b=BEO6VL3ssuG/Kl62rHGC1ycfnIliFObULaRANo2lPvpmq3roWiYnF7t3kLSWou4z3KEXZG27/zdt4VuWxyg0RD3Zgu+mgGD6IJ+JstZsNUJ4rvG6NtClUb4h/aQv9thkju4eN3rKegNfIoB/iGnHJ6TWtcn3dI5hHlDvw28eC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742971072; c=relaxed/simple;
	bh=3jU62HIYkftAceNnzfyFV31uA1IhuSLr7xdyTOejwKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksfbjqApRro8lmBf37kV/kZpq2cRS5WXEWKXXF0UN6uS7AssUwqu5eTqmKkrWaMtt4ar/A1pYFbBQQBQgEA40G3lFi2FiY29deG8Zt1GEHGTd1HWzxE1Vl8whmU7TcaWkkzLtPFUThe5sVV5gLsp1uMJGEqM/R70CSANYzekpbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Zichuw4e; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1742971058; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=p9QUwAny8zB9N5asNQ4sP4FcMDc0cb/+ZejFeFKyauc=;
	b=Zichuw4eetBM8Dk53uEKTCUGY3vr8VWfZUdzjKKN2lubfHbGYfZEPehnGEvzlBMmPZgqKSdv/sWw23q01qjxI0M/PjbvabKayHgjIzZvzcVz0U99s3n11z+lpPgBcyCfueFGeVi1N9mFxCQPdXRTwrXiAjelCtBAQwNtHSE9Sd4=
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WT2eroX_1742970735 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 26 Mar 2025 14:32:19 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] gpio: tegra186: fix resource handling in ACPI probe path
Date: Wed, 26 Mar 2025 14:32:14 +0800
Message-ID: <20250326063214.50577-1-kanie@linux.alibaba.com>
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

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
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


