Return-Path: <linux-gpio+bounces-16201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD72A3A214
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 17:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0883B1DF2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 16:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A60D26F44F;
	Tue, 18 Feb 2025 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jfKJ4vHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C5C26E645
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894662; cv=none; b=sCZgqqcZ6HiH467oXFMvYMdFJGJj4uNQputD8QkZBrzgMV/oNMlMRYoWBBRdBbZ74pbi1l57JxXivB5EhVuH6MGeecRhKEgSlBb2AgJIqMQYrzJSwLtzt01aex6eTMVIa7Z/6D258qZdX0UX2Bcu5tjPFJ7SpTO1m+/dTLrubAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894662; c=relaxed/simple;
	bh=hC2PNDnSvlx8tVpCvUE09c63PWr8yW9nO5xzmsySDoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuxAgWMCNxb2HDxSRXGKt3dREjgSgqEOFFtspwlWLKu9iPNI6czc6k3UCVFKMQaZE5bFt2cKj3ViQ7IKsnEaP/johWnwaRZyafsNRmxHAKdAEXBeq4OCfdnbHUpl4GsT751oCTUlKFsTINLRkv2LEYRxK1wUC6Gy56/1n8lUD4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jfKJ4vHr; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 002823FE71
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739894651;
	bh=AHMqJnxK4/Dnt8c9QVgTRTY4Zs2e90yXoYYPy4GoEkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=jfKJ4vHrNLwIu9IxT2I2f8KDtFye1Nztd+pxYWxPCEzuVB/GpIW9cqIq1eq9t7mY7
	 cpCyhn7dSlgY/8hVVUQ29CrigHN3deh1XJpJK7gF47aoLM7ppMf1Us+QikRx1WZ49V
	 zk5Hu+42raJ0fPEG7Rqh3tBhyo7OceBHVtOu+GpvpgY6wupkhup+WiVhBp0TylibM1
	 TftQkiaJyDdjTC9OQIBDFftYCh4IBYm3xKBiHTb5JEtf4HjeAi4X7YdA4Rg8LTF30o
	 7YZBjjrDVwE2QsQR9JEZIJIOrEDasCrhYg8iSjs+Z7iaqcgXf+vrVyag6LKUr/bn+n
	 6BUV/5Sk9O2WA==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22103ae73f9so69977855ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 08:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894648; x=1740499448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHMqJnxK4/Dnt8c9QVgTRTY4Zs2e90yXoYYPy4GoEkA=;
        b=HXP2WwudL/UEtTwxZ2q8ozikdnDSL+Sx0HTybnnoD+16To496ZrfaYwf4138EL6bGY
         F7v4W0ygVeVlhcToSJyY48QjUdaSUVnDWtvU5efvzMY/Dlf/LXlnq67Un+1BTo13loiW
         +GkAPGu4jL4AyL0T2nQpbcwQViCXl5mGydSY/+A/Pb3/Ym+NLZdIai/CAKj1KLAIv934
         dPkxpHuQd9xEeqRGUgGLvG8SGoxz8p5SAQDVX5A/Oqcc9tZq+51MdRfwW0NAmJsOg0xU
         WfDn2joxInL+ZOVj8RAWmNmQgTajy6pUeE+bHqymYJ200g2luTmwSMBQVhW7nN++whqH
         jP8g==
X-Gm-Message-State: AOJu0YwnqXQvSj7o2mY4toWS7QBlIcMcfnnD0Vgbc/CZkRO9Y425nKc3
	GUOhMENj0iOpoIkhto6jGnKq9uveAOBPaDht4QRdfcXpX+/0pn5rOK3jR97rp6L6aCrrUda/iW1
	7Bm5mxoW0ibRpWyBGToZkBa3QPThslP/CV1hBzqUw12pKBKpnywnWaqdPShveOLRybmRDtK7VpZ
	klEdE9NIo=
X-Gm-Gg: ASbGncsW5SPaIj4svLuBwKyc2cJ4NOHU+IIbQacXjvf0IhZXZjSL5GGCGGUWkb06y4O
	ofaXN+74ULDY5blzPzseZS49jMY7h3LTFfm2bLPdSm9mRcHwFq1jTc0IR4Oa0BTRUsmCfz/UsfM
	xfiBMSRZv5IbWeH0gD884+XfLbojmKlMy/4NVxaKnLWRoZ8b/XZrCp+u9JHAyUERYl3IDZBxgZn
	vX+MgA1UqizqVVQTEgwOqiXlbH8XvOQAG/NR0ODEdpN6Af5zlXPrf6IjZ6tvzp1tEbssG6nxa6d
	e+eRdqBxZH9WmTVAOHH8vKY=
X-Received: by 2002:a05:6a21:3995:b0:1ee:c390:58ad with SMTP id adf61e73a8af0-1eec3905cf2mr9166247637.34.1739894647613;
        Tue, 18 Feb 2025 08:04:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWmjYTvj6cKvC3gQEh96rnDqB1rMAwKafJdc7LFPp9QKU7MUBHctRmJpmMjmoPftsnIJh8sg==
X-Received: by 2002:a05:6a21:3995:b0:1ee:c390:58ad with SMTP id adf61e73a8af0-1eec3905cf2mr9166188637.34.1739894647261;
        Tue, 18 Feb 2025 08:04:07 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:ad3a:e902:d78b:b8fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae01c768020sm3662177a12.73.2025.02.18.08.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:04:06 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake device creation
Date: Wed, 19 Feb 2025 01:03:31 +0900
Message-ID: <20250218160333.605829-2-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218160333.605829-1-koichiro.den@canonical.com>
References: <20250218160333.605829-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
platform device, wait for probe completion, and retrieve the probe
success or error status synchronously. With gpio-aggregator planned to
adopt this approach for its configfs interface, it's time to factor
out the common code.

Add dev-sync-probe.[ch] to house helper functions used by all such
implementations.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/Kconfig          |  7 +++
 drivers/gpio/Makefile         |  3 ++
 drivers/gpio/dev-sync-probe.c | 96 +++++++++++++++++++++++++++++++++++
 drivers/gpio/dev-sync-probe.h | 25 +++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 drivers/gpio/dev-sync-probe.c
 create mode 100644 drivers/gpio/dev-sync-probe.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56c1f30ac195..2e4c5f0a94f7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1863,6 +1863,13 @@ config GPIO_MPSSE
 
 endmenu
 
+# This symbol is selected by drivers that need synchronous fake device creation
+config DEV_SYNC_PROBE
+	tristate "Utilities for synchronous fake device creation"
+	help
+	  Common helper functions for drivers that need synchronous fake
+	  device creation.
+
 menu "Virtual GPIO drivers"
 
 config GPIO_AGGREGATOR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b58..af130882ffee 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -19,6 +19,9 @@ obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 # directly supported by gpio-generic
 gpio-generic-$(CONFIG_GPIO_GENERIC)	+= gpio-mmio.o
 
+# Utilities for drivers that need synchronous fake device creation
+obj-$(CONFIG_DEV_SYNC_PROBE)		+= dev-sync-probe.o
+
 obj-$(CONFIG_GPIO_104_DIO_48E)		+= gpio-104-dio-48e.o
 obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
diff --git a/drivers/gpio/dev-sync-probe.c b/drivers/gpio/dev-sync-probe.c
new file mode 100644
index 000000000000..82c8d7ae9fa7
--- /dev/null
+++ b/drivers/gpio/dev-sync-probe.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Common code for drivers creating fake platform devices.
+ *
+ * Provides synchronous device creation: waits for probe completion and
+ * returns the probe success or error status to the device creator.
+ *
+ * Copyright (C) 2025 Bartosz Golaszewski <brgl@bgdev.pl>
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+
+#include "dev-sync-probe.h"
+
+static int dev_sync_probe_notifier_call(struct notifier_block *nb,
+					unsigned long action,
+					void *data)
+{
+	struct dev_sync_probe_data *pdata;
+	struct device *dev = data;
+
+	pdata = container_of(nb, struct dev_sync_probe_data, bus_notifier);
+	if (!device_match_name(dev, pdata->name))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_BOUND_DRIVER:
+		pdata->driver_bound = true;
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		pdata->driver_bound = false;
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	complete(&pdata->probe_completion);
+	return NOTIFY_OK;
+}
+
+void dev_sync_probe_init(struct dev_sync_probe_data *data)
+{
+	memset(data, 0, sizeof(*data));
+	init_completion(&data->probe_completion);
+	data->bus_notifier.notifier_call = dev_sync_probe_notifier_call;
+}
+EXPORT_SYMBOL_GPL(dev_sync_probe_init);
+
+int dev_sync_probe_register(struct dev_sync_probe_data *data,
+			    struct platform_device_info *pdevinfo)
+{
+	struct platform_device *pdev;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
+	if (!name)
+		return -ENOMEM;
+
+	data->driver_bound = false;
+	data->name = name;
+	reinit_completion(&data->probe_completion);
+	bus_register_notifier(&platform_bus_type, &data->bus_notifier);
+
+	pdev = platform_device_register_full(pdevinfo);
+	if (IS_ERR(pdev)) {
+		bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
+		kfree(data->name);
+		return PTR_ERR(pdev);
+	}
+
+	wait_for_completion(&data->probe_completion);
+	bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
+
+	if (!data->driver_bound) {
+		platform_device_unregister(pdev);
+		kfree(data->name);
+		return -ENXIO;
+	}
+
+	data->pdev = pdev;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_sync_probe_register);
+
+void dev_sync_probe_unregister(struct dev_sync_probe_data *data)
+{
+	platform_device_unregister(data->pdev);
+	kfree(data->name);
+	data->pdev = NULL;
+}
+EXPORT_SYMBOL_GPL(dev_sync_probe_unregister);
+
+MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
+MODULE_DESCRIPTION("Utilities for synchronous fake device creation");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpio/dev-sync-probe.h b/drivers/gpio/dev-sync-probe.h
new file mode 100644
index 000000000000..4b3d52b70519
--- /dev/null
+++ b/drivers/gpio/dev-sync-probe.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef DEV_SYNC_PROBE_H
+#define DEV_SYNC_PROBE_H
+
+#include <linux/completion.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+
+struct dev_sync_probe_data {
+	struct platform_device *pdev;
+	const char *name;
+
+	/* Synchronize with probe */
+	struct notifier_block bus_notifier;
+	struct completion probe_completion;
+	bool driver_bound;
+};
+
+void dev_sync_probe_init(struct dev_sync_probe_data *data);
+int dev_sync_probe_register(struct dev_sync_probe_data *data,
+			    struct platform_device_info *pdevinfo);
+void dev_sync_probe_unregister(struct dev_sync_probe_data *data);
+
+#endif /* DEV_SYNC_PROBE_H */
-- 
2.45.2


