Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA13C55393
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 17:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732430AbfFYPjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 11:39:19 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:23572 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728823AbfFYPjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 11:39:19 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5PFcsIG014256;
        Tue, 25 Jun 2019 10:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=m9i70Bb4JPAwTTc+PTQ/tffvrK3BtDNGAJcALPIRxX8=;
 b=Qdx6UAxIzXPG90TR6ag9a0U0Pn3wfIFMygECo6UNhZJiS/eEYbI1nRS08qOm8q4AWAt8
 D3VgQVy0P1J06MSjOgdvKORZrmDZwsX87MeF3Nseo1ruCcne0EaU0jGD1QtwE09W5gi0
 /PrF6kUiuf/b/oOMvVAjAwMDYy5gRX+gV4nWhw91HNDx6JUmHUnKAIpaff3nb7TqQEnn
 PwID4JRAEB9G61GyCULy63paIIiwLIHXAa/OQvBn4TiInv8RcuJC2kufOAfHtfPOJQc+
 4JXe9d/QDMPjqqitBTto9KKVywVFiB38WGtt1XUTFOgU6FMzDwCMlk1u0Hyo+2UDqWKb ZA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t9grnvwhn-1;
        Tue, 25 Jun 2019 10:39:16 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 2EC74611C8C1;
        Tue, 25 Jun 2019 10:39:16 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 25 Jun
 2019 16:39:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 25 Jun 2019 16:39:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2CE132A1;
        Tue, 25 Jun 2019 16:39:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <linus.walleij@linaro.org>
CC:     <bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 1/2] pinctrl: madera: Fixup SPDX headers
Date:   Tue, 25 Jun 2019 16:39:14 +0100
Message-ID: <20190625153915.28424-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=861 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250118
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPL-2.0-only is the preferred way of expressing v2 of the GPL, so switch
to that. Remove some redundant copyright notices and correct some
instances where the wrong comment type has been used in header files.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs47l35.c     | 6 +-----
 drivers/pinctrl/cirrus/pinctrl-cs47l85.c     | 6 +-----
 drivers/pinctrl/cirrus/pinctrl-cs47l90.c     | 6 +-----
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 6 +-----
 drivers/pinctrl/cirrus/pinctrl-madera.h      | 6 +-----
 5 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs47l35.c b/drivers/pinctrl/cirrus/pinctrl-cs47l35.c
index 06b59160783d7..53a8eab19aad3 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs47l35.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs47l35.c
@@ -1,12 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl for Cirrus Logic CS47L35
  *
  * Copyright (C) 2016-2017 Cirrus Logic
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #include <linux/err.h>
diff --git a/drivers/pinctrl/cirrus/pinctrl-cs47l85.c b/drivers/pinctrl/cirrus/pinctrl-cs47l85.c
index 0a322e2a0fde9..e08c7992d252d 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs47l85.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs47l85.c
@@ -1,12 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl for Cirrus Logic CS47L85
  *
  * Copyright (C) 2016-2017 Cirrus Logic
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #include <linux/err.h>
diff --git a/drivers/pinctrl/cirrus/pinctrl-cs47l90.c b/drivers/pinctrl/cirrus/pinctrl-cs47l90.c
index fc38f579f4924..3151f107adc4c 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs47l90.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs47l90.c
@@ -1,12 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl for Cirrus Logic CS47L90
  *
  * Copyright (C) 2016-2017 Cirrus Logic
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #include <linux/err.h>
diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 7c9694593f790..c6b9f65f23621 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1,12 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl for Cirrus Logic Madera codecs
  *
  * Copyright (C) 2016-2018 Cirrus Logic
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #include <linux/err.h>
diff --git a/drivers/pinctrl/cirrus/pinctrl-madera.h b/drivers/pinctrl/cirrus/pinctrl-madera.h
index 8000f4f832a12..4ae13918316fe 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera.h
+++ b/drivers/pinctrl/cirrus/pinctrl-madera.h
@@ -1,12 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Pinctrl for Cirrus Logic Madera codecs
  *
  * Copyright (C) 2016-2017 Cirrus Logic
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #ifndef PINCTRL_MADERA_H
-- 
2.11.0

