Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36E206FBD0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 11:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbfGVJHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 05:07:54 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:3896 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728726AbfGVJHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 05:07:54 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6M94Zjj016878;
        Mon, 22 Jul 2019 04:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=Y3t7DZiR0O7wQKpUcSQAjXkQTD2FdcUwSbencU2WHbg=;
 b=UVl2zrZ/stQd553wUgIFUy6NAt9Fz5P0ljEsAkzgtePMGxGJrzhqgw0vMsHISm1rd+Vb
 MQ1fIdmMIn8hgLJMehTpCHC1Z02PcqWTVYVHpZPSZMhMX5KtLPFVDQBR7gxde/Em/5uG
 bcYzP7r5hs7qDZ4YYw2PO5LKkOGF/SkWnTDAhIzrn3qqncA0ML4ph8Afwy1EZNv2mn99
 8zVi0Zg41wjg+kco7tHmW4i00Hnzh4GRhZOuv1A6gcSkJmCun8wOKeDABnu6+ONlWb6L
 Un2HICZi20n4FRtk5o8/tZ7/Att7ptZICK502ezHANY6X33NcXIO1+dUiHAkKq7JJgF/ zA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tv08h23j5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Jul 2019 04:07:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 22 Jul
 2019 10:07:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 22 Jul 2019 10:07:48 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 408A645;
        Mon, 22 Jul 2019 10:07:48 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <bgolaszewski@baylibre.com>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 3/4] gpio: madera: Add support for Cirrus Logic CS47L15
Date:   Mon, 22 Jul 2019 10:07:47 +0100
Message-ID: <20190722090748.20807-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722090748.20807-1-ckeepax@opensource.cirrus.com>
References: <20190722090748.20807-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=1 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1904300001
 definitions=main-1907220109
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.cirrus.com>

As the gpio is common to all madera codecs all that is needed
is to setup the correct number of GPIO pins for the CS47L15.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/gpio/gpio-madera.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index fa3441df0a5db..c403899ff4500 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -136,6 +136,9 @@ static int madera_gpio_probe(struct platform_device *pdev)
 	madera_gpio->gpio_chip.parent = pdev->dev.parent;
 
 	switch (madera->type) {
+	case CS47L15:
+		madera_gpio->gpio_chip.ngpio = CS47L15_NUM_GPIOS;
+		break;
 	case CS47L35:
 		madera_gpio->gpio_chip.ngpio = CS47L35_NUM_GPIOS;
 		break;
-- 
2.11.0

