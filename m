Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA8D96FBDD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 11:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbfGVJKT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 05:10:19 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:65318 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726339AbfGVJKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 05:10:19 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6M992wY008117;
        Mon, 22 Jul 2019 04:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=5MKtOi/bJ5grFiHQJq1u2ND1XbA2KZnd10IARcz5zP0=;
 b=qBI57+YWNQx8X71ovvhjqALFw1PaS1WMZHwjiij1G+OinQE7OLJryKI55Ig234vdU5Bk
 vw6FW5whiHNEBatQ8Y16AOW4A27IrCudYdP97rAgfoPasMWayOB72B997Z47flAqG9H3
 ZsK40wylBOMoVYwUdlaCJTYFKuVDMzOMhvJlhB3k4pqs6CWkrmxR9Ow8FqB0l7TSDgCE
 cHNDou4QkDMDiEegVCBPDM9cwrB56Z8x8IRYZpf4sN6K2+uTIMvieo1w5g53xyrQflmb
 xFehIEYJGZwU4r3N84ENg/7+4HLzLDCheCuAFXM7HMXdjgtcWsCHTcM+YmcEM2WmI7yc kA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2tv0c0a534-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Jul 2019 04:10:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 22 Jul
 2019 10:10:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 22 Jul 2019 10:10:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5FFFD45;
        Mon, 22 Jul 2019 10:10:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 1/3] pinctrl: madera: Use local copy of pdata
Date:   Mon, 22 Jul 2019 10:10:13 +0100
Message-ID: <20190722091015.20884-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=732
 impostorscore=0 suspectscore=1 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907220110
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A local copy of the pdata exists and it should be used rather than
pulling a fresh copy.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index c6b9f65f23621..0c7fa1febc802 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -986,7 +986,7 @@ static struct pinctrl_desc madera_pin_desc = {
 static int madera_pin_probe(struct platform_device *pdev)
 {
 	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
-	const struct madera_pdata *pdata = dev_get_platdata(madera->dev);
+	const struct madera_pdata *pdata = &madera->pdata;
 	struct madera_pin_private *priv;
 	int ret;
 
@@ -1037,7 +1037,7 @@ static int madera_pin_probe(struct platform_device *pdev)
 	}
 
 	/* if the configuration is provided through pdata, apply it */
-	if (pdata && pdata->gpio_configs) {
+	if (pdata->gpio_configs) {
 		ret = pinctrl_register_mappings(pdata->gpio_configs,
 						pdata->n_gpio_configs);
 		if (ret) {
-- 
2.11.0

