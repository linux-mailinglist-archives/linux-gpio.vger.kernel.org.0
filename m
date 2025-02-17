Return-Path: <linux-gpio+bounces-16143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C28A3866A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A86E2164A03
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3E721D595;
	Mon, 17 Feb 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Xi2inA43"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17E21D58E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802524; cv=none; b=iMW+tHBoiPaq0PI21VYhgfSmwBLrKCeBTfQLuTDGXr8Ic44dun4oMca0k3hftc5eC/1C7p9SaxYlBdHLwTNMD8SKQ8rhAyTZPt1PjTN9mz07jrHNCo5oFFlxvUzd1rYbMDC813tpMxtt0R3gskugXlA8bGjVFFGeaxk2kZMpr/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802524; c=relaxed/simple;
	bh=rEnR6g5dONAt30j589RxgJPlKFdaeKR/MdU4AsEK4Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpGw+jN8PC0JMtF5oEFB3SUmnRxZC/tdNsvDyYi5vhShOPtbEl42fdaWiKQADaMc1q6z4pFuiSYpj9ZVPIBQmzfEnEPM1YuIwcnKZYcdVRJW3O+N8WOaEze/RkwLaCDba7tErj2epyco8EHCJWPVN5XacVrrPavdRo/W9GDSe30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Xi2inA43; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66D5A3F84C
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802513;
	bh=YWbOsm+CZ0rP8EEsqBCFAU6ijhi7ERtYl/4TbSEKuvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Xi2inA437d+n6yMq1bKW+E1Et8lECJdTkHTKAkdJBEGWMROdbjute6lHCX+PgZo1V
	 JyPsxH4oNUL6UDi+KBVWbgO0QZrsCUxaZz1/c8dM2NblcQ7X2qn5myDInKlO1FMogg
	 QeKMpA5AfyzCEvyWzs0qDKaIBjUlPmsl/gk/d86F9ef0lWnE2MJm1tKG4vZlUT9WD3
	 MVhgmy2FtScHg0vWCOVPTGQwhbBPgzCTML8OsZ2Ap+1yYFW/o3fz5czlZ8nhwNu7HR
	 VmPjlA6tWdJTWsWsHyJodg07ZCulKnEgdBY8IZnQagGWtRWUGtmbXEcMxieJenR1+Z
	 MZAOHrYnMpXzQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220ff7d7b67so52237655ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802512; x=1740407312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWbOsm+CZ0rP8EEsqBCFAU6ijhi7ERtYl/4TbSEKuvk=;
        b=UFrOYH1rpIaXEfSsqI+ds9ZCwQBXxWjJsuSeWJzAuMVKRe4KSqw0hpb3Qu0xxLaT6U
         bzmkh5rL+cCka4fOLRMnCbGhMFh4FuLVk11n0JSfKcEmJda+VAtvG1CSJnG4i9f4OMOh
         G/qKrwPhEiqswb30D1SAtAN8fsWDSYGjnNxzEXfkL2bcLamR58Kdu0SVYwimKP1U1EcH
         EWPd4uMzBS1g7FXPfrrOI3L5tVPmvbhsk9SqbH9IGc3bG+PGfP2UPlikX2AcgOUzbDtM
         nwqvRAdwd3pM+dc/PtKDF4+EkCD/fsRowNv1JppTfFKIGoMLnGxl0hP1WAwWEhZ2rQhH
         DfgA==
X-Gm-Message-State: AOJu0YwnEWHn11eOSw93O/pP1taT7VDQHlY5+BuT2nUhg1+zQWJZtyHy
	TfS7oEkP6h5RJE1JTIaBvmZfhCahXCGKEvll3V+nkDxFBYnvRPD8XBlvkL9rfFZ8Zd2R7Rvj4o1
	mgztJJOvnSq9Jcb8jMBZDBad6Ezo1+6DaEd5D3T1rZgobQJIBVnOZH7q08uaYF4CT64bYVgS65m
	0SGgCJFqI=
X-Gm-Gg: ASbGnculBjitiWU2WjwQ6TRqJA1jkAEKFnDYN9DvDZ5ya2S/0fxf/IUvb83ZtH0iRgu
	j8KkgfIwYygCkvjvvU3/VIDlgZ2rq068jmdZRb/mSAYgrhNU/r69x8UiteKJ25Baz/uRMIScl2L
	l8fzzWmXkLHgtnMIxQae4vnB3SZx7DSiX7DaHZf2ai2SN+vlQJeu4PzaCPUbGUupxN2jIzuHFLC
	bVN5Bll8n7RvQW7u2mMCwlAFB+g17nAG51SaA9H51lijxWAr6NNkk86mfP2upY42EY2KCraU81j
	qJBGvqPXLeENE2heU4SzoTA=
X-Received: by 2002:a17:902:e88a:b0:220:cd13:d0ec with SMTP id d9443c01a7336-221040cf8admr180261675ad.48.1739802511904;
        Mon, 17 Feb 2025 06:28:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfZIRJAzO+xxCEyVz/n4jHiqUmLNlcKx8CpuXtume9GjbD9zD5G5cZZIXe92Y7wYgNUOjqnA==
X-Received: by 2002:a17:902:e88a:b0:220:cd13:d0ec with SMTP id d9443c01a7336-221040cf8admr180261235ad.48.1739802511583;
        Mon, 17 Feb 2025 06:28:31 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm72237735ad.243.2025.02.17.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:28:31 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo gpio devices
Date: Mon, 17 Feb 2025 23:27:56 +0900
Message-ID: <20250217142758.540601-2-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217142758.540601-1-koichiro.den@canonical.com>
References: <20250217142758.540601-1-koichiro.den@canonical.com>
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


