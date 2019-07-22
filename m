Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5B76FBC3
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfGVJHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 05:07:53 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:5122 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728721AbfGVJHw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 05:07:52 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6M94cse016881;
        Mon, 22 Jul 2019 04:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=AE2gZjnyfqCj2POCJw9ZDzWfb316e4GUR3zNkArJ3EM=;
 b=AUCIFX64VApnWasGSYiQFfgcs/h51VRpG5tSdDHYvyNZXWGYREDdPs8QisRDUvsoF9IE
 QGRTyKn77FQeDITGlAOLsirmeh02JDJHqoSioK0W9vFlqN8No4+BYin6rNwFqkjTs/z0
 AvqrU1GT90NUwJrN9I+Mhn9/U4k2BpU1ziavA4JRZsYWs7keSLoxQKc4h9T6oJpaOCSR
 QA+qG36XfIcd8E9BCUj4zcQ2OfJ9GNKpladaRUVlxPoOK09Nu0LzEfjViaDjTVTAKCwi
 xTMOJj+IhULBj6z0ayal3SI9btWUR3I7cKZ+BGOdntEC0YnZyzDMPjPS18eVRbSL0ie1 Aw== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tv08h23j3-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Jul 2019 04:07:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 22 Jul
 2019 10:07:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 22 Jul 2019 10:07:48 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 33D0D448;
        Mon, 22 Jul 2019 10:07:48 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <bgolaszewski@baylibre.com>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 2/4] gpio: madera: Use local copy of pdata
Date:   Mon, 22 Jul 2019 10:07:46 +0100
Message-ID: <20190722090748.20807-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722090748.20807-1-ckeepax@opensource.cirrus.com>
References: <20190722090748.20807-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=625 clxscore=1015
 suspectscore=1 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1904300001
 definitions=main-1907220109
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A local copy of the pdata exists and it should be used rather than
pulling a fresh copy.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/gpio/gpio-madera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 4dbc837d12155..fa3441df0a5db 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -120,7 +120,7 @@ static const struct gpio_chip madera_gpio_chip = {
 static int madera_gpio_probe(struct platform_device *pdev)
 {
 	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
-	struct madera_pdata *pdata = dev_get_platdata(madera->dev);
+	struct madera_pdata *pdata = &madera->pdata;
 	struct madera_gpio *madera_gpio;
 	int ret;
 
@@ -153,7 +153,7 @@ static int madera_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* We want to be usable on systems that don't use devicetree or acpi */
-	if (pdata && pdata->gpio_base)
+	if (pdata->gpio_base)
 		madera_gpio->gpio_chip.base = pdata->gpio_base;
 	else
 		madera_gpio->gpio_chip.base = -1;
-- 
2.11.0

