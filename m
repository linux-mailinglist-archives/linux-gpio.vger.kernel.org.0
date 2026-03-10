Return-Path: <linux-gpio+bounces-32880-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDyZApzPr2l0cgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32880-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:00:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6E0246D3C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF141308C5A4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 07:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4D8364E82;
	Tue, 10 Mar 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dZrru0GX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DDF3D3CE0
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129404; cv=none; b=Q5gwuohwh6BOfPZVFX7k+cJo9x+dARfs3XYqJkRIKZsDKSZjnrw7fVHOIJLI4aNKy6DicBptXxs3fGjaSWqumT8DOPJSkty2Jw5r2KixKM2MYZ92z2SqdLZg/sBFvgdOpgaVJIzcm6ac+ahw48x22+bqKlThWO40YB9dGuN/GoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129404; c=relaxed/simple;
	bh=YQYoMl9cJ2YRn65PkaBbiPVREIoceypt3NqeBMjR1eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oL095nirgqZhCS6TnwdrQpFQuHS9jhylMZ634JwRExm9WfHrBix+/A8dbjhSOCANHV2JJPypPAVw/WN34mJ345CAfW2rhQ92MuN2LwUwat6meErTPo6zS7nNirB7TmGZmV4HzKDSfnqt/2FNz70SSNHk29peGpYVUJCJTPeuhpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dZrru0GX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VR3bz5kc4VcI1PQY8TwV4x5GtzDKGF8AtE87sZOuzTU=; b=dZrru0
	GXM++14D1PbCtyngDrMW8bonktJHKvt9XeOUkdDaxOXlM9NRre3Vd3APZ5cxZFIC
	f14v8TBO29iO5BU0eZet6ismxA9rjm2dFjLdqiKB74WpuV1gyDyThm3AeO6Cago5
	YTH3bqYH6cMhgSq4vjiDCFP0HWuZ0q4dxt4OQyjRwx9QzOX6J4qQokLjTqD8Qpin
	0t2/ojU2/9cJulIAxn/KrNdCKDJ6bLGq8S2cju1wMCIoe6eEYnYbz1q/sETFrOzE
	seq3fEvjDeCrOyipkspFtTZgGc5YzEAUOkx2f0THGSsEwFjbW8iABQGkIOIP5U1z
	8Jc6iJm42q5pRLbQ==
Received: (qmail 3112920 invoked from network); 10 Mar 2026 08:56:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:56:03 +0100
X-UD-Smtp-Session: l3s3148p1@CnfT2aZM/tIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Lee Jones <lee@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH v4 15/15] hwspinlock/treewide: refactor consumer.h from public header
Date: Tue, 10 Mar 2026 08:55:30 +0100
Message-ID: <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7C6E0246D3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32880-lists,linux-gpio=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,huawei.com,linux.alibaba.com,infradead.org,redhat.com,lwn.net,linuxfoundation.org,baylibre.com,analog.com,gmail.com,foss.st.com,arndb.de,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wizery.com:email,ti.com:url,intel.com:email,huawei.com:email,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Factor out the entries only needed for consumers from the generic public
header. This allows for a clean separation between providers and
consumers. Also remove contact field in favor of MAINTAINERS entries.
Fix the users, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO
Acked-by: Lee Jones <lee@kernel.org> # for MFD
---
 Documentation/locking/hwspinlock.rst              |  2 +-
 MAINTAINERS                                       |  1 -
 drivers/base/regmap/regmap.c                      |  2 +-
 drivers/hwspinlock/hwspinlock_core.c              |  2 +-
 drivers/iio/adc/sc27xx_adc.c                      |  2 +-
 drivers/irqchip/irq-stm32mp-exti.c                |  2 +-
 drivers/mfd/syscon.c                              |  2 +-
 drivers/nvmem/sc27xx-efuse.c                      |  2 +-
 drivers/nvmem/sprd-efuse.c                        |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c             |  2 +-
 drivers/soc/qcom/smem.c                           |  2 +-
 drivers/spi/spi-sprd-adi.c                        |  2 +-
 .../linux/{hwspinlock.h => hwspinlock/consumer.h} | 15 ++++++---------
 13 files changed, 17 insertions(+), 21 deletions(-)
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (98%)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1..001bcab86690 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -306,7 +306,7 @@ Typical usage
 
 ::
 
-	#include <linux/hwspinlock.h>
+	#include <linux/hwspinlock/consumer.h>
 	#include <linux/err.h>
 
 	int hwspinlock_example(void)
diff --git a/MAINTAINERS b/MAINTAINERS
index d5d78f08bfca..11421b205874 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11213,7 +11213,6 @@ F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
 F:	include/linux/hwspinlock/
-F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
 M:	Alexander Shishkin <alexander.shishkin@linux.intel.com>
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 607c1246d994..d25494495469 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -16,7 +16,7 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/log2.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/unaligned.h>
 
 #define CREATE_TRACE_POINTS
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 6c8a03deb00c..e78ec4b5cfa3 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/hwspinlock/provider.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
diff --git a/drivers/iio/adc/sc27xx_adc.c b/drivers/iio/adc/sc27xx_adc.c
index 6209499c5c37..8a881d63b7dd 100644
--- a/drivers/iio/adc/sc27xx_adc.c
+++ b/drivers/iio/adc/sc27xx_adc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Spreadtrum Communications Inc.
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index a24f4f1a4f8f..25d5aa67728a 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 21a7fcdd2737..8ec74f8513d7 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -11,7 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
diff --git a/drivers/nvmem/sc27xx-efuse.c b/drivers/nvmem/sc27xx-efuse.c
index 4e2ffefac96c..309090cd4ff0 100644
--- a/drivers/nvmem/sc27xx-efuse.c
+++ b/drivers/nvmem/sc27xx-efuse.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Spreadtrum Communications Inc.
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 1a7e4e5d8b86..92e3092719ba 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -3,7 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23..17b2072d609e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -10,7 +10,7 @@
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..6d574d65b4a3 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index e7d83c16b46c..04313e4a63dd 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock/consumer.h
similarity index 98%
rename from include/linux/hwspinlock.h
rename to include/linux/hwspinlock/consumer.h
index 4fe1c8831cd1..f476222ec924 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock/consumer.h
@@ -1,17 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Hardware spinlock public header
+ * Hardware spinlock public header for consumers
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
  */
 
-#ifndef __LINUX_HWSPINLOCK_H
-#define __LINUX_HWSPINLOCK_H
+#ifndef __LINUX_HWSPINLOCK_CONSUMER_H
+#define __LINUX_HWSPINLOCK_CONSUMER_H
 
 #include <linux/err.h>
-#include <linux/sched.h>
 
 /* hwspinlock mode argument */
 #define HWLOCK_IRQSTATE		0x01 /* Disable interrupts, save state */
@@ -22,8 +21,6 @@
 struct device;
 struct device_node;
 struct hwspinlock;
-struct hwspinlock_device;
-struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
@@ -403,4 +400,4 @@ static inline void hwspin_unlock(struct hwspinlock *hwlock)
 	__hwspin_unlock(hwlock, 0, NULL);
 }
 
-#endif /* __LINUX_HWSPINLOCK_H */
+#endif /* __LINUX_HWSPINLOCK_CONSUMER_H */
-- 
2.47.3


