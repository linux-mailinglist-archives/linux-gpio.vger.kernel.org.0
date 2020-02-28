Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B550173BE1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 16:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbgB1PmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 10:42:19 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:3964 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726940AbgB1PmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Feb 2020 10:42:18 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01SFcchc002611;
        Fri, 28 Feb 2020 09:42:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=ufh6/9f7UQjn+9arPRj1c/9Z3GCp2z/Am5Y76SrZ/FY=;
 b=j9vAS3FE6Q5wGWY6Lixa19TgB/e3FKKlbumsGDPEfO4RSgtVdDOC75378CLN7bUFXQgG
 JJUe+JjZOWp+2wYv5TiWV7C/vwl3QC265Fueu8oOUb0E9iRi7LKwE0r6bE5LSXcxCRwW
 QDi2UMOKvXZzVC3j8fLTKyV5FkYxYYiJ+ceR1aLnc10n4kFMjhrdAJnrJmd1fRkOap16
 eE9bweH1zVQUoAUR7sS74qL1Sd7KWlOQpH16S56UhsTIvKGjTlxbNlg7MC9D76VFLVvI
 slf1o8V3smcnO3dbAZeQ0f0t90KJZAQzBK1cKyjxILiWLML22383o4PjK7sL6maY2B3H PA== 
Authentication-Results: ppops.net;
        spf=pass smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
        by mx0a-001ae601.pphosted.com with ESMTP id 2yepwmse6v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 28 Feb 2020 09:42:17 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 28 Feb
 2020 15:42:15 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 28 Feb 2020 15:42:15 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F02A645A;
        Fri, 28 Feb 2020 15:42:14 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] pinctrl: madera: Add missing call to pinctrl_unregister_mappings
Date:   Fri, 28 Feb 2020 15:42:14 +0000
Message-ID: <20200228154214.13916-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=745 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=1 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280124
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl_register_mappings is called in the pdata case, however a call to
pinctrl_unregister_mappings is missing causing the mappings to be leaked
on driver unbind. Add the missing call to correct this issue.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 7b6409ef553c9..dce2626384a90 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1073,13 +1073,26 @@ static int madera_pin_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	platform_set_drvdata(pdev, priv);
+
 	dev_dbg(priv->dev, "pinctrl probed ok\n");
 
 	return 0;
 }
 
+static int madera_pin_remove(struct platform_device *pdev)
+{
+	struct madera_pin_private *priv = platform_get_drvdata(pdev);
+
+	if (priv->madera->pdata.gpio_configs)
+		pinctrl_unregister_mappings(priv->madera->pdata.gpio_configs);
+
+	return 0;
+}
+
 static struct platform_driver madera_pin_driver = {
 	.probe = madera_pin_probe,
+	.remove = madera_pin_remove,
 	.driver = {
 		.name = "madera-pinctrl",
 	},
-- 
2.11.0

