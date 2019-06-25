Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3176755394
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 17:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728823AbfFYPjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 11:39:19 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:5528 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730803AbfFYPjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 11:39:19 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5PFcqtZ003292;
        Tue, 25 Jun 2019 10:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=ZV2R8PUZI/CteOlyNwQxI6iEVuU5Z+bXtIB/FEY2zU8=;
 b=H4BEnw4eLy4zr6QcbsZUQpS2z7K6lBI4bx/E3aWYFh0NkiSbexnyBLsw0jDYPlONwrVE
 A5jK9aYPc5P2nI7EuDuvVzOhUvgfhFMvLKCOtBkDLIkPTqe6E3mObkQ45BJpGrLKLwPs
 mHDGeRTpYGkM3lEjck7BtoDlowh0soO14f7x1tcup2pBv0/YMXbjSByY3jCSfutyKWEg
 BGRoHDIYQaoDPuccTbOzsf6L37wjEs4Lx/sZCrykyyZjZVQQVk/rcE0qrgmeJjPMPNfq
 EM/7laatFzN4nIfsOo0kL2cUqtxKxYdX25CnTF7XdvK9TJNWhG+2hZvANlOoVd/oJKJU rA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2dd3h-1;
        Tue, 25 Jun 2019 10:39:16 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id CB4A3611C8B2;
        Tue, 25 Jun 2019 10:39:15 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 25 Jun
 2019 16:39:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 25 Jun 2019 16:39:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3AFF144;
        Tue, 25 Jun 2019 16:39:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <linus.walleij@linaro.org>
CC:     <bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 2/2] gpio: madera: Fixup SPDX headers
Date:   Tue, 25 Jun 2019 16:39:15 +0100
Message-ID: <20190625153915.28424-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625153915.28424-1-ckeepax@opensource.cirrus.com>
References: <20190625153915.28424-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=792 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250118
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPL-2.0-only is the preferred way of expressing v2 of the GPL, so switch
to that and remove some redundant copyright notices.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/gpio/gpio-madera.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index c9dad0543672a..4dbc837d12155 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -1,12 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * GPIO support for Cirrus Logic Madera codecs
  *
  * Copyright (C) 2015-2018 Cirrus Logic
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #include <linux/gpio/driver.h>
-- 
2.11.0

