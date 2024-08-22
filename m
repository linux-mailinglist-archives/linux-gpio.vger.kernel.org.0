Return-Path: <linux-gpio+bounces-9013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7F95C12B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 00:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3B41C21BD3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7309F1D1F4B;
	Thu, 22 Aug 2024 22:56:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44FA1D0DF0
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724367395; cv=none; b=bZucxsa6hl9z9uAwq+i91EWwmRU1yGskzupqWW/6Qcm2ON75hlG6WnwA8YCmc1sfes04EmTkf+9QXs/I5Ai5la4WJ4aHsaUPcYV5a78PIWasNZtXyzuS+ot2mI5RRgK8LMQSkmw+v5kXVx9hvLFgefOa3HHoKtAjTiiddmFNWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724367395; c=relaxed/simple;
	bh=kydB5gAR1qt/Mq0WG6CTYE3LCD6Nj2jl2gXbb9SCuQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FINupb7VqAOF9cQY428u2nZvqBWHLatVVbJvgz/XL35yF0RKRO5Wf2tVlj/QqNTDsnGvTGGzVyTtcpuoMTgCRauBlyIsreHKZKB2da9Q4JjxGWjWPoIyeOXnT3cvx5IOx2C5ZlWovE3Xj9HkhGfRQB4ey9oj17c1v78zTqAlE5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c5724119-60d9-11ef-822f-005056bdfda7;
	Fri, 23 Aug 2024 01:56:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpio: uniphier: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:56:29 +0300
Message-ID: <20240822225629.707365-1-andy.shevchenko@gmail.com>
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
 drivers/gpio/gpio-uniphier.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 1f440707f8f4..da99ba13e82d 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/gpio/uniphier-gpio.h>
 
@@ -164,7 +165,7 @@ static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 	if (offset < UNIPHIER_GPIO_IRQ_OFFSET)
 		return -ENXIO;
 
-	fwspec.fwnode = of_node_to_fwnode(chip->parent->of_node);
+	fwspec.fwnode = dev_fwnode(chip->parent);
 	fwspec.param_count = 2;
 	fwspec.param[0] = offset - UNIPHIER_GPIO_IRQ_OFFSET;
 	/*
@@ -404,7 +405,7 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	priv->domain = irq_domain_create_hierarchy(
 					parent_domain, 0,
 					UNIPHIER_GPIO_IRQ_MAX_NUM,
-					of_node_to_fwnode(dev->of_node),
+					dev_fwnode(dev),
 					&uniphier_gpio_irq_domain_ops, priv);
 	if (!priv->domain)
 		return -ENOMEM;
-- 
2.46.0


