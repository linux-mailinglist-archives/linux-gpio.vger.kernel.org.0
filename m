Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BEC2B9467
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 15:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgKSOPy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 09:15:54 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:50244 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727942AbgKSOPx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 09:15:53 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AJEEYlK029032;
        Thu, 19 Nov 2020 09:15:50 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34t9ybt85d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Nov 2020 09:15:50 -0500
Received: from SCSQMBX10.ad.analog.com (SCSQMBX10.ad.analog.com [10.77.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AJEFm9N029123
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 19 Nov 2020 09:15:49 -0500
Received: from SCSQCASHYB6.ad.analog.com (10.77.17.132) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 19 Nov 2020 06:15:47 -0800
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by
 SCSQCASHYB6.ad.analog.com (10.77.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 19 Nov 2020 06:14:37 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 19 Nov 2020 06:15:47 -0800
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AJEFidk028071;
        Thu, 19 Nov 2020 09:15:44 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <nandor.han@ge.com>, <semi.malinen@ge.com>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] gpio: xra1403: remove unneeded spi_set_drvdata()
Date:   Thu, 19 Nov 2020 16:21:04 +0200
Message-ID: <20201119142104.85566-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-19_09:2020-11-19,2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190107
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no matching spi_get_drvdata() call in the driver, so there is no
need to do spi_set_drvdata(). This looks like it probably was copied from a
driver that used both spi_set_drvdata() & spi_get_drvdata().

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/gpio/gpio-xra1403.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index e2cac12092af..49c878cfd5c6 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -186,15 +186,7 @@ static int xra1403_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = devm_gpiochip_add_data(&spi->dev, &xra->chip, xra);
-	if (ret < 0) {
-		dev_err(&spi->dev, "Unable to register gpiochip\n");
-		return ret;
-	}
-
-	spi_set_drvdata(spi, xra);
-
-	return 0;
+	return devm_gpiochip_add_data(&spi->dev, &xra->chip, xra);
 }
 
 static const struct spi_device_id xra1403_ids[] = {
-- 
2.17.1

