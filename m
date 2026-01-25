Return-Path: <linux-gpio+bounces-31042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDATAl9mdmkmQQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:52:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A281D57
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C38A53001448
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 18:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ADE2EF67A;
	Sun, 25 Jan 2026 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SMLgbxB1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855224A04A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367132; cv=none; b=aF4IOSkOtO2a+EZmjc+HA3ANZgsY272UAUXpTSAg3ZwvwsGDiBCd5r83oiPxxT0IRSeLIlsyk0YXb/6/tlViraSNpop4tLd3KsSqEF65HiXdwU6jODisfGb3C3+n/qrzLR5qYAxNWFW6qRtI0jFxDkiAq6DbRiGZh7hmekABQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367132; c=relaxed/simple;
	bh=VL247n96oRPcfuixpfOIb+O7qbGpBQQK2ECt48CpKvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9WiTUweSmbN4hDuvrNtZ0hPUicn+qGnWWL2fBuMqiupZdtwUSof0wwetvLS7y0zaGqhEsP/OgaPiz3brcOyagKtqA3ZjUPleumtQgus0r2f1ydIFUe2Yn2Zh+BSDCVJYBuom9nilauDiSsv3CPu/jiW9pbO45z5yMiOSzm939o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SMLgbxB1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=z4r+DipmsGc4TALWGuhn2ZwJzaRHArRzwqq3J+v552E=; b=SMLgbx
	B1PEXNHJ5oir0k+1bSIbdpgScGfVkkJqi4T1aeQJNKLvxOiELtzrDIYETfuMTHrz
	9nhfTkASTyg72yoIiSOEzmV88opLRXCuYnsNzg+ORzFMDBwOrHaDfsjHp1WBtz6T
	Pr+ksqXw4UcNCrgibeE6AWs8dlhHokeFlklrQnT5DVl59U1h46ti8F8TffE2V9/5
	w7voaGRF+dsySf1Lv4AzRv40XAR+6BM+9sxzXGKj34TCOext62ibuI2u349hMyU4
	45iM+UbF9nng0Js/2oiM5Q6GHup0dd5jN62IVMLGKrbh0hyHI1A817GCrbdIgJqx
	g6x26A0RPSKXRlcQ==
Received: (qmail 2369640 invoked from network); 25 Jan 2026 19:51:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2026 19:51:54 +0100
X-UD-Smtp-Session: l3s3148p1@rcBK4jpJXzptKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [RFC PATCH 3/4] treewide: convert hwspinlock users to the new consumer header file
Date: Sun, 25 Jan 2026 19:46:54 +0100
Message-ID: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31042-lists,linux-gpio=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,linuxfoundation.org,baylibre.com,analog.com,gmail.com,linux.alibaba.com,foss.st.com,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E49A281D57
X-Rspamd-Action: no action

Point the drivers to the new header file. No functional changes.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/base/regmap/regmap.c          | 2 +-
 drivers/iio/adc/sc27xx_adc.c          | 2 +-
 drivers/irqchip/irq-stm32mp-exti.c    | 2 +-
 drivers/mfd/syscon.c                  | 2 +-
 drivers/nvmem/sc27xx-efuse.c          | 2 +-
 drivers/nvmem/sprd-efuse.c            | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 drivers/soc/qcom/smem.c               | 2 +-
 drivers/spi/spi-sprd-adi.c            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index ae2215d4e61c..ec2348e199c1 100644
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
index e5d5def594f6..49473669e84e 100644
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
index 088b2bbee9e6..4cc65b6a7f24 100644
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
-- 
2.47.3


