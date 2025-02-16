Return-Path: <linux-gpio+bounces-16074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F387A3744B
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1F5B16E949
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 12:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECA9190051;
	Sun, 16 Feb 2025 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="FjmU+VmG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E5191F74
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710723; cv=none; b=AHHc/oOsjkcp3l7Fu6ZqO6Wgzangw+Fz7RCyoONtwBzUtuLRwOO4tGqfAkdKnebEmhkuiRd9iyW0EiEX1fYmcRmv5vW8fUe2W6Gvs7v6hAzQ7K42Hb7DqiXFfr+PgS7iooXJiD8RSP40+ZunXZG3oBnm3Gs5/o7WQr2ppDARey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710723; c=relaxed/simple;
	bh=rEnR6g5dONAt30j589RxgJPlKFdaeKR/MdU4AsEK4Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXQIdKnFTJiBvhn2eEikIqZt0gOPOV1MaYpH3nGXBE6l2hyEdgsDKM2jGFOf8J1qegXSnL557GpseS/LM6GpX7h1fb/0bHCFwxqG+GcJjicPFguQK8J44pjFXkcHoTJfoKJKstpDHx5Su53GOBkN6BxmxdKfkifq1OLmNn6zrI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=FjmU+VmG; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C1FD63F85E
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710716;
	bh=YWbOsm+CZ0rP8EEsqBCFAU6ijhi7ERtYl/4TbSEKuvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=FjmU+VmG3XpGk8sOLsid9aMPn+kAU/cjp4u2KxpyZZOxGm5h4UTxVixjrpZuuFbDD
	 Wuz5Eoi0761f2wDojMMtJkX6r4mdtA0yJ8UHniXnZS4JcNGF/f5fxHH9DDdBbGp54B
	 tLgDy/kDlYzycaY9UQcz2Oi9vzFViBNgpkLjFxYur7ZopswgRTpAsL7eJWb0MSzvMi
	 vtDw8hsqi2EzaEqcP2vuQ8VD0lbyR/iDujrkigPDEXKrAQCnGRd7oABZ8+YbxVU1Xv
	 uWpZFZvtiR3iWEKWke4qjrnujsvNy6O1ny0Lsa2o5n9FMCQF26NIgWjRUJ/Nm9VWP2
	 W2L8T+tLv0Etg==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc1e7efdffso9307599a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710715; x=1740315515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWbOsm+CZ0rP8EEsqBCFAU6ijhi7ERtYl/4TbSEKuvk=;
        b=YbQuMA+7jNhrk7swymccl7GWsqAt1Nw/JlnKsrit24MAWCXf1LUPUgAwcMCiLqZpkJ
         gj0KZJHOQj5inNH8CUkmflLVvn/VsdzetwccfKQMf2JsF5bMQM8a6dWH0NJRtNRB0JWV
         fIWAHUyq1k63qMfgO8N+WjLSLvGWbM1vfbMjSmZJ5V4bAuGoCIy5zw95/dhKT5mt9SFF
         pNAcGpsAPJCvO3h7jD/Pdv7t1UBnZbxhLJw88GDeGU0hU7j4V7q6IHW1cyhEvCbuJzbW
         MLrgm1Z4GCZn8jgybzm0NyfgjPpiohjvoQZ8rtk9Q4+ie7lInHS7FWryyLP52LE+XAf6
         i5zQ==
X-Gm-Message-State: AOJu0YzVpxIh9/gIHve2UBYGX7mFh6R0sF37uL9hsXR8jM3rYfxxZXvI
	ykxeYd5m75Q5qjcxLDbSOMUL6pQQFj+a7tIbIFuxv8w0Ompkwgl/63MgtTJpg7YJRAUs8b4PxjJ
	jvOtkDw4gS0RAUuYrXxOzbm9G3SiNuFfli/0476hJQsJHWA86IFHk//g1CqK7OsB4UWvZXOWd+3
	UAk89+Zyk=
X-Gm-Gg: ASbGncv2PH+vj8cqDoxyN9uEDn9KMGJCiEcerF6apKl52yUDOq6KOS73GYUss2wfPNf
	NrwR5yyO2ZNuB+srH9AIXGyMkYnwHf1G0ZhL85Zl0sJpTdeOIN3u/+dmOKWGLzSt6m+7qURXkWd
	qk0nM45VRXWiOrxcpTFLOkmF9YRKK1Gjhm1CBlCejzl7XWm5FVkTMbIzE31r5xjMsAQrFlRyzh/
	WyFutim5dpxRMQvcQoZPRjf8O4ht6axyapnLSSFmJxvx1UlmQAT6zp0jbURb3Rb9e9E2X/yw0wD
	67P3jQ==
X-Received: by 2002:a05:6a20:918e:b0:1e4:80a9:3fb8 with SMTP id adf61e73a8af0-1ee8cb5d194mr9500717637.16.1739710715283;
        Sun, 16 Feb 2025 04:58:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm+gOGp9YBo5KHi2FrSJg3FynLc/Gzo+d49GTcLDk3uRw/FcP0OrcjD42Gx4gpZ8lwU2fMEg==
X-Received: by 2002:a05:6a20:918e:b0:1e4:80a9:3fb8 with SMTP id adf61e73a8af0-1ee8cb5d194mr9500690637.16.1739710715005;
        Sun, 16 Feb 2025 04:58:35 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:34 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/13] gpio: pseudo: common helper functions for pseudo gpio devices
Date: Sun, 16 Feb 2025 21:58:06 +0900
Message-ID: <20250216125816.14430-4-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250216125816.14430-1-koichiro.den@canonical.com>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
platform device and wait synchronously for probe completion.
With gpio-aggregator adopting the same approach in a later commit for
its configfs interface, it's time to factor out the common code.

Add gpio-pseudo.[ch] to house helper functions used by all the pseudo
GPIO device implementations.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig       |  4 ++
 drivers/gpio/Makefile      |  1 +
 drivers/gpio/gpio-pseudo.c | 86 ++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-pseudo.h | 24 +++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 drivers/gpio/gpio-pseudo.c
 create mode 100644 drivers/gpio/gpio-pseudo.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56c1f30ac195..1e2c95e03a95 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1863,6 +1863,10 @@ config GPIO_MPSSE
 
 endmenu
 
+# This symbol is selected by some pseudo gpio device implementations
+config GPIO_PSEUDO
+	bool
+
 menu "Virtual GPIO drivers"
 
 config GPIO_AGGREGATOR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b58..5eb54147a1ab 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
+obj-$(CONFIG_GPIO_PSEUDO)		+= gpio-pseudo.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-pseudo.c b/drivers/gpio/gpio-pseudo.c
new file mode 100644
index 000000000000..6e3da05440d8
--- /dev/null
+++ b/drivers/gpio/gpio-pseudo.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Helper functions for Pseudo GPIOs
+ *
+ * Copyright 2025 Canonical Ltd.
+ */
+
+#include "gpio-pseudo.h"
+
+static int pseudo_gpio_notifier_call(struct notifier_block *nb,
+				     unsigned long action,
+				     void *data)
+{
+	struct pseudo_gpio_common *common;
+	struct device *dev = data;
+
+	common = container_of(nb, struct pseudo_gpio_common, bus_notifier);
+	if (!device_match_name(dev, common->name))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_BOUND_DRIVER:
+		common->driver_bound = true;
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		common->driver_bound = false;
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	complete(&common->probe_completion);
+	return NOTIFY_OK;
+}
+
+void pseudo_gpio_init(struct pseudo_gpio_common *common)
+{
+	memset(common, 0, sizeof(*common));
+	init_completion(&common->probe_completion);
+	common->bus_notifier.notifier_call = pseudo_gpio_notifier_call;
+}
+EXPORT_SYMBOL_GPL(pseudo_gpio_init);
+
+int pseudo_gpio_register(struct pseudo_gpio_common *common,
+			 struct platform_device_info *pdevinfo)
+{
+	struct platform_device *pdev;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
+	if (!name)
+		return -ENOMEM;
+
+	common->driver_bound = false;
+	common->name = name;
+	reinit_completion(&common->probe_completion);
+	bus_register_notifier(&platform_bus_type, &common->bus_notifier);
+
+	pdev = platform_device_register_full(pdevinfo);
+	if (IS_ERR(pdev)) {
+		bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
+		kfree(common->name);
+		return PTR_ERR(pdev);
+	}
+
+	wait_for_completion(&common->probe_completion);
+	bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
+
+	if (!common->driver_bound) {
+		platform_device_unregister(pdev);
+		kfree(common->name);
+		return -ENXIO;
+	}
+
+	common->pdev = pdev;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pseudo_gpio_register);
+
+void pseudo_gpio_unregister(struct pseudo_gpio_common *common)
+{
+	platform_device_unregister(common->pdev);
+	kfree(common->name);
+	common->pdev = NULL;
+}
+EXPORT_SYMBOL_GPL(pseudo_gpio_unregister);
diff --git a/drivers/gpio/gpio-pseudo.h b/drivers/gpio/gpio-pseudo.h
new file mode 100644
index 000000000000..093112b6cce5
--- /dev/null
+++ b/drivers/gpio/gpio-pseudo.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef GPIO_PSEUDO_H
+#define GPIO_PSEUDO_H
+
+#include <linux/completion.h>
+#include <linux/platform_device.h>
+
+struct pseudo_gpio_common {
+	struct platform_device *pdev;
+	const char *name;
+
+	/* Synchronize with probe */
+	struct notifier_block bus_notifier;
+	struct completion probe_completion;
+	bool driver_bound;
+};
+
+void pseudo_gpio_init(struct pseudo_gpio_common *common);
+int pseudo_gpio_register(struct pseudo_gpio_common *common,
+			 struct platform_device_info *pdevinfo);
+void pseudo_gpio_unregister(struct pseudo_gpio_common *common);
+
+#endif /* GPIO_PSEUDO_H */
-- 
2.45.2


