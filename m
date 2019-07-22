Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744C16FBDF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 11:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbfGVJKT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 05:10:19 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:8884 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726364AbfGVJKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 05:10:19 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6M992wX008117;
        Mon, 22 Jul 2019 04:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=Z87rZcZyI8u5juU0mQYVyPg4vYaAs6hPehNttOXmRYM=;
 b=hDx2aBIiPK3p/NZ7LF8BrvqphLOMf0Qd06ZViRxZV17ssdJbpFnmIj7zDPgk0N3QNgOI
 cRzokYooFAhT+Db1fVrmKDYeIJ0e7RaGyQdv3kr1hNIWNz0XZ/bP6Ale3b135Rxi74nY
 IWC1rTx8QC0Aqc4mek224deNNr4eE6dkQhJRLEKo8SitYsbonPva0zhESswrZWkCuyWS
 8dVYG4dJyLjCQse+CyPxmMtZEkmSsZk/N0/t19KojKBXbBgUz6E6EqwVX0I+Ay5OjHAv
 wJSZYq+iwvcxDYpPXkeXQu/W0rplZxIXuzK8YH3ncl5ljbrkEPDzSX0p4Ya59JocWEWC 7Q== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2tv0c0a534-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Jul 2019 04:10:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 22 Jul
 2019 10:10:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 22 Jul 2019 10:10:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E51C2C5;
        Mon, 22 Jul 2019 10:10:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 2/3] pinctrl: madera: Add configuration for Cirrus Logic CS47L15
Date:   Mon, 22 Jul 2019 10:10:14 +0100
Message-ID: <20190722091015.20884-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722091015.20884-1-ckeepax@opensource.cirrus.com>
References: <20190722091015.20884-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=1 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907220110
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.cirrus.com>

This adds the pinctrl configuration for the CS47L15 codec to
the madera pinctrl driver.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/Kconfig               |  3 +++
 drivers/pinctrl/cirrus/Makefile              |  3 +++
 drivers/pinctrl/cirrus/pinctrl-cs47l15.c     | 40 ++++++++++++++++++++++++++++
 drivers/pinctrl/cirrus/pinctrl-madera-core.c |  4 +++
 drivers/pinctrl/cirrus/pinctrl-madera.h      |  1 +
 5 files changed, 51 insertions(+)
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs47l15.c

diff --git a/drivers/pinctrl/cirrus/Kconfig b/drivers/pinctrl/cirrus/Kconfig
index e546a6b75b4d7..ef01a0b062730 100644
--- a/drivers/pinctrl/cirrus/Kconfig
+++ b/drivers/pinctrl/cirrus/Kconfig
@@ -15,6 +15,9 @@ config PINCTRL_MADERA
 	select PINMUX
 	select GENERIC_PINCONF
 
+config PINCTRL_CS47L15
+	bool
+
 config PINCTRL_CS47L35
 	bool
 
diff --git a/drivers/pinctrl/cirrus/Makefile b/drivers/pinctrl/cirrus/Makefile
index 0c5deb62153ef..491bcb658d8e1 100644
--- a/drivers/pinctrl/cirrus/Makefile
+++ b/drivers/pinctrl/cirrus/Makefile
@@ -3,6 +3,9 @@
 obj-$(CONFIG_PINCTRL_LOCHNAGAR)	+= pinctrl-lochnagar.o
 
 pinctrl-madera-objs		:= pinctrl-madera-core.o
+ifeq ($(CONFIG_PINCTRL_CS47L15),y)
+pinctrl-madera-objs		+= pinctrl-cs47l15.o
+endif
 ifeq ($(CONFIG_PINCTRL_CS47L35),y)
 pinctrl-madera-objs		+= pinctrl-cs47l35.o
 endif
diff --git a/drivers/pinctrl/cirrus/pinctrl-cs47l15.c b/drivers/pinctrl/cirrus/pinctrl-cs47l15.c
new file mode 100644
index 0000000000000..a4bfec5281d07
--- /dev/null
+++ b/drivers/pinctrl/cirrus/pinctrl-cs47l15.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Pinctrl for Cirrus Logic CS47L15
+ *
+ * Copyright (C) 2018-2019 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ */
+
+#include <linux/err.h>
+#include <linux/mfd/madera/core.h>
+
+#include "pinctrl-madera.h"
+
+/*
+ * The alt func groups are the most commonly used functions we place these at
+ * the lower function indexes for convenience, and the less commonly used gpio
+ * functions at higher indexes.
+ *
+ * To stay consistent with the datasheet the function names are the same as
+ * the group names for that function's pins
+ *
+ * Note - all 1 less than in datasheet because these are zero-indexed
+ */
+static const unsigned int cs47l15_aif1_pins[] = { 0, 1, 2, 3 };
+static const unsigned int cs47l15_aif2_pins[] = { 4, 5, 6, 7 };
+static const unsigned int cs47l15_aif3_pins[] = { 8, 9, 10, 11 };
+static const unsigned int cs47l15_spk1_pins[] = { 12, 13, 14 };
+
+static const struct madera_pin_groups cs47l15_pin_groups[] = {
+	{ "aif1", cs47l15_aif1_pins, ARRAY_SIZE(cs47l15_aif1_pins) },
+	{ "aif2", cs47l15_aif2_pins, ARRAY_SIZE(cs47l15_aif2_pins) },
+	{ "aif3", cs47l15_aif3_pins, ARRAY_SIZE(cs47l15_aif3_pins) },
+	{ "pdmspk1", cs47l15_spk1_pins, ARRAY_SIZE(cs47l15_spk1_pins) },
+};
+
+const struct madera_pin_chip cs47l15_pin_chip = {
+	.n_pins = CS47L15_NUM_GPIOS,
+	.pin_groups = cs47l15_pin_groups,
+	.n_pin_groups = ARRAY_SIZE(cs47l15_pin_groups),
+};
diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 0c7fa1febc802..64281ad5c1b9e 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1004,6 +1004,10 @@ static int madera_pin_probe(struct platform_device *pdev)
 	pdev->dev.of_node = madera->dev->of_node;
 
 	switch (madera->type) {
+	case CS47L15:
+		if (IS_ENABLED(CONFIG_PINCTRL_CS47L15))
+			priv->chip = &cs47l15_pin_chip;
+		break;
 	case CS47L35:
 		if (IS_ENABLED(CONFIG_PINCTRL_CS47L35))
 			priv->chip = &cs47l35_pin_chip;
diff --git a/drivers/pinctrl/cirrus/pinctrl-madera.h b/drivers/pinctrl/cirrus/pinctrl-madera.h
index 4ae13918316fe..a10f0238dd928 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera.h
+++ b/drivers/pinctrl/cirrus/pinctrl-madera.h
@@ -30,6 +30,7 @@ struct madera_pin_private {
 	struct pinctrl_dev *pctl;
 };
 
+extern const struct madera_pin_chip cs47l15_pin_chip;
 extern const struct madera_pin_chip cs47l35_pin_chip;
 extern const struct madera_pin_chip cs47l85_pin_chip;
 extern const struct madera_pin_chip cs47l90_pin_chip;
-- 
2.11.0

