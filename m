Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A52357C5B6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 10:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbiGUIDw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 04:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiGUIDs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 04:03:48 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBF6422E4;
        Thu, 21 Jul 2022 01:03:48 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L6nnYl007904;
        Thu, 21 Jul 2022 04:03:38 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hbq679e4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jul 2022 04:03:38 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26L83aZE039495
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Jul 2022 04:03:36 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:36 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:35 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 21 Jul 2022 04:03:35 -0400
Received: from nsa.ad.analog.com ([10.44.3.68])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26L83GIk028313;
        Thu, 21 Jul 2022 04:03:27 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 03/10] input: keyboard: adp5588-keys: bail out on returned error
Date:   Thu, 21 Jul 2022 10:04:16 +0200
Message-ID: <20220721080423.156151-4-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721080423.156151-1-nuno.sa@analog.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: F61sLNx8yH0Th-PL1lpeIbh4WQYUmvM6
X-Proofpoint-ORIG-GUID: F61sLNx8yH0Th-PL1lpeIbh4WQYUmvM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210031
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Don't continue in code paths after some error is found. It makes no
sense to do any other device configuration if a previous one failed.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/keyboard/adp5588-keys.c | 56 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index c63f95f86ba2..389eb112989b 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -145,9 +145,13 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 
 	ret = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
 				 kpad->dat_out[bank]);
-	ret |= adp5588_write(kpad->client, GPIO_DIR1 + bank,
+	if (ret)
+		goto out_unlock;
+
+	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank,
 				 kpad->dir[bank]);
 
+out_unlock:
 	mutex_unlock(&kpad->gpio_lock);
 
 	return ret;
@@ -446,42 +450,58 @@ static int adp5588_setup(struct i2c_client *client)
 	int i, ret;
 
 	ret = adp5588_write(client, KP_GPIO1, KP_SEL(pdata->rows));
-	ret |= adp5588_write(client, KP_GPIO2, KP_SEL(pdata->cols) & 0xFF);
-	ret |= adp5588_write(client, KP_GPIO3, KP_SEL(pdata->cols) >> 8);
+	if (ret)
+		return ret;
+
+	ret = adp5588_write(client, KP_GPIO2, KP_SEL(pdata->cols) & 0xFF);
+	if (ret)
+		return ret;
+
+	ret = adp5588_write(client, KP_GPIO3, KP_SEL(pdata->cols) >> 8);
+	if (ret)
+		return ret;
 
 	if (pdata->en_keylock) {
-		ret |= adp5588_write(client, UNLOCK1, pdata->unlock_key1);
-		ret |= adp5588_write(client, UNLOCK2, pdata->unlock_key2);
-		ret |= adp5588_write(client, KEY_LCK_EC_STAT, ADP5588_K_LCK_EN);
+		ret = adp5588_write(client, UNLOCK1, pdata->unlock_key1);
+		if (ret)
+			return ret;
+
+		ret = adp5588_write(client, UNLOCK2, pdata->unlock_key2);
+		if (ret)
+			return ret;
+
+		ret = adp5588_write(client, KEY_LCK_EC_STAT, ADP5588_K_LCK_EN);
+		if (ret)
+			return ret;
 	}
 
-	for (i = 0; i < KEYP_MAX_EVENT; i++)
-		ret |= adp5588_read(client, Key_EVENTA);
+	for (i = 0; i < KEYP_MAX_EVENT; i++) {
+		ret = adp5588_read(client, Key_EVENTA);
+		if (ret)
+			return ret;
+	}
 
 	if (gpio_data) {
 		for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
 			int pull_mask = gpio_data->pullup_dis_mask;
 
-			ret |= adp5588_write(client, GPIO_PULL1 + i,
+			ret = adp5588_write(client, GPIO_PULL1 + i,
 				(pull_mask >> (8 * i)) & 0xFF);
+			if (ret)
+				return ret;
 		}
 	}
 
-	ret |= adp5588_write(client, INT_STAT,
+	ret = adp5588_write(client, INT_STAT,
 				ADP5588_CMP2_INT | ADP5588_CMP1_INT |
 				ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
 				ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
+	if (ret)
+		return ret;
 
-	ret |= adp5588_write(client, CFG, ADP5588_INT_CFG |
+	return adp5588_write(client, CFG, ADP5588_INT_CFG |
 					  ADP5588_OVR_FLOW_IEN |
 					  ADP5588_KE_IEN);
-
-	if (ret < 0) {
-		dev_err(&client->dev, "Write Error\n");
-		return ret;
-	}
-
-	return 0;
 }
 
 static int adp5588_probe(struct i2c_client *client,
-- 
2.37.1

