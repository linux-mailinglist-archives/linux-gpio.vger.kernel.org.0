Return-Path: <linux-gpio+bounces-9014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2495C12D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 00:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E461F250C6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070AA1D174A;
	Thu, 22 Aug 2024 22:58:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84312B72
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724367503; cv=none; b=Sq8hDM29c/2hDqoFkWMDEoprMRPmFFDDU8MMDquHXp3/6IdznmXWTmh71vgB5IMQ0kuNz+eqTIsjHahYPrRtn+sNX0ZUl9qX8vi4RPlFXhQcTzKOMfXN6D+71cImXFAalK38jCNrsm/DE9CiUePCpKk3fDxynFqyoF8RwnkXo48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724367503; c=relaxed/simple;
	bh=XP59DpnvPpz3OTugVZRRK2XvnbQkKUHgfixv7fVy6R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1XZaoSOrq+EGr3tWeJ7z0Gsu90A0bkuZuqgE3o3p11fK/Y7sZhdRl49m8B+TI2r0kg6TzRCq4qHbnpYKflRrOMBknt8F3OUjjtKfedGzszPfKAUHk+iA7bC9uzyfxLTcMMRTfcbXVU6+9cySM+asY/ztybQEwX6hMdZ9R9EEqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 0605c0c0-60da-11ef-822f-005056bdfda7;
	Fri, 23 Aug 2024 01:58:19 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v1 1/1] gpio: visconti: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:58:18 +0300
Message-ID: <20240822225818.707550-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is a IRQ domain specific implementation of
of_fwnode_handle(). Replace the former with more suitable API.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-visconti.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index 6734e7e1e2a4..ebc71ecdb6cf 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -8,6 +8,7 @@
  * Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  */
 
+#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -15,8 +16,8 @@
 #include <linux/io.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
-#include <linux/bitops.h>
 
 /* register offset */
 #define GPIO_DIR	0x00
@@ -202,7 +203,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 
 	girq = &priv->gpio_chip.irq;
 	gpio_irq_chip_set_chip(girq, &visconti_gpio_irq_chip);
-	girq->fwnode = of_node_to_fwnode(dev->of_node);
+	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = visconti_gpio_child_to_parent_hwirq;
 	girq->populate_parent_alloc_arg = visconti_gpio_populate_parent_fwspec;
-- 
2.46.0


