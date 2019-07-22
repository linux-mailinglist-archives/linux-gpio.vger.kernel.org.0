Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26FEC6FBC5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbfGVJHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 05:07:53 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:5932 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728722AbfGVJHw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 05:07:52 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6M94csf016881;
        Mon, 22 Jul 2019 04:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=W5RLnn66YeqCIXIP4O3XAsyoyb4bnUJFgLxWBlI9WZw=;
 b=UGtL12wsXGTRuihRp9D65RD/9940a/XBhTUl/zJIV3ZPOF6pAtIvuwWAOmopm6T81vvj
 /UT+dWumvI4z+Cac0BjQK3kpMiZ74Sf/pKu3lssRshln22RW40xpyExoWu1xDXFs30xa
 Q1fl8gjLUJlfQuyOQAB4+XmQKN9xBrDuDqg1bFQdA40nd5/KABX0vfvrEKn6smxKsqkV
 ktM5Aba4zUEVOvS75sjMgwukmFAP3vzae8HvQwROg/qfGkDqDNPTupFZQ+0QwkjReFax
 Cc8zwY4R1La3VOqiB2j3Q99qmhkpvXj3e1/1pyJBT/HC5pogAYohpS9EhIdUduA08yV0 Ug== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tv08h23j3-3
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
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4D410B13;
        Mon, 22 Jul 2019 10:07:48 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <bgolaszewski@baylibre.com>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 4/4] gpio: madera: Add support for Cirrus Logic CS47L92
Date:   Mon, 22 Jul 2019 10:07:48 +0100
Message-ID: <20190722090748.20807-4-ckeepax@opensource.cirrus.com>
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

As the gpio is common to all madera codecs all that is needed
is to setup the correct number of GPIO pins for the CS47L92.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/gpio/gpio-madera.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index c403899ff4500..7086f8b5388fd 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -150,6 +150,11 @@ static int madera_gpio_probe(struct platform_device *pdev)
 	case CS47L91:
 		madera_gpio->gpio_chip.ngpio = CS47L90_NUM_GPIOS;
 		break;
+	case CS42L92:
+	case CS47L92:
+	case CS47L93:
+		madera_gpio->gpio_chip.ngpio = CS47L92_NUM_GPIOS;
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown chip variant %d\n", madera->type);
 		return -EINVAL;
-- 
2.11.0

