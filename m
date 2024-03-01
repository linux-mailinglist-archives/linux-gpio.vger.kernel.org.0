Return-Path: <linux-gpio+bounces-4052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF186EC19
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 23:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ECA4287D72
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 22:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19A45EE79;
	Fri,  1 Mar 2024 22:59:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D559B6F
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 22:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709333978; cv=none; b=GfjzJprocGomsXDq6nlDOrh5DlGrbWRi3Q48HA0wAD6SqT8PmEz7nOdyARywRn3JZUZXNRNblavFiKFtnHRXEBOJLYvPjsR/esd5vjy/18MRBsefaxkh/yu3r+ieoCP24vUim2YqGdsGVA5PbqdhP1OeWP0KfUKlNobs0pqWGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709333978; c=relaxed/simple;
	bh=9mixZGRjVd+uWR2Vm6koGSHFqRdJ7D/yHJ7KL1mIxf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIfvlS634Syu4Le5ty5RcDSEBzulI1MloRJIoGyRNK+ZgRArtX4a5SztXAnyXe9BDOynZ77VaifbMKnHL5m4tWgNvnio2mQSJoDV4vt8fsBjSbkR8weS10Gqqiv6oQZ75S+T6efs8o5sf5y04CialN9LsbrSoU4s7y84M6hARxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 3603e7df-d81f-11ee-b3cf-005056bd6ce9;
	Sat, 02 Mar 2024 00:58:26 +0200 (EET)
From: andy.shevchenko@gmail.com
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpio: nomadik: Finish conversion to use firmware node APIs
Date: Sat,  2 Mar 2024 00:58:19 +0200
Message-ID: <20240301225819.193814-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously driver got a few updates in order to replace OF APIs by
respective firmware node, however it was not finished to the logical
end, e.g., some APIs that has been used are still require OF node
to be passed. Finish that job by converting leftovers to use firmware
node APIs.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/Kconfig        |  1 -
 drivers/gpio/gpio-nomadik.c | 13 ++++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f633be517654..ef20ab921010 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -481,7 +481,6 @@ config GPIO_MXS
 config GPIO_NOMADIK
 	bool "Nomadik GPIO driver"
 	depends on ARCH_U8500 || ARCH_NOMADIK || MACH_EYEQ5 || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the Nomadik SoC GPIO block. This block is also
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index c9fd6631e0aa..483086deb397 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -23,10 +23,10 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/mod_devicetable.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -504,7 +504,7 @@ static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
  * it is the pin controller or GPIO driver. However we need to use the right
  * platform device when looking up resources so pay attention to pdev.
  */
-struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
+struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 					     struct platform_device *pdev)
 {
 	struct nmk_gpio_chip *nmk_chip;
@@ -517,9 +517,9 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
 	u32 id, ngpio;
 	int ret;
 
-	gpio_dev = bus_find_device_by_of_node(&platform_bus_type, np);
+	gpio_dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
 	if (!gpio_dev) {
-		pr_err("populate \"%pOFn\": device not found\n", np);
+		dev_err(&pdev->dev, "populate \"%pfwP\": device not found\n", fwnode);
 		return ERR_PTR(-ENODEV);
 	}
 	gpio_pdev = to_platform_device(gpio_dev);
@@ -624,7 +624,6 @@ static const struct irq_chip nmk_irq_chip = {
 static int nmk_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_irq_chip *girq;
 	bool supports_sleepmode;
@@ -632,7 +631,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nmk_chip = nmk_gpio_populate_chip(np, pdev);
+	nmk_chip = nmk_gpio_populate_chip(dev_fwnode(dev), pdev);
 	if (IS_ERR(nmk_chip)) {
 		dev_err(dev, "could not populate nmk chip struct\n");
 		return PTR_ERR(nmk_chip);
-- 
2.44.0


