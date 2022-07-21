Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA6057C5BE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 10:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbiGUIDy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 04:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiGUIDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 04:03:50 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA0340BF3;
        Thu, 21 Jul 2022 01:03:50 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L5N77o024879;
        Thu, 21 Jul 2022 04:03:46 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hbt860w6j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jul 2022 04:03:46 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26L83i1r039507
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Jul 2022 04:03:44 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:43 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:43 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 21 Jul 2022 04:03:43 -0400
Received: from nsa.ad.analog.com ([10.44.3.68])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26L83GIq028313;
        Thu, 21 Jul 2022 04:03:36 -0400
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
Subject: [PATCH v3 09/10] input: keyboard: adp5588-keys: add regulator support
Date:   Thu, 21 Jul 2022 10:04:22 +0200
Message-ID: <20220721080423.156151-10-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721080423.156151-1-nuno.sa@analog.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 12PY0Z7Q0HoI8KTq_tFApgSsWJuy4k-T
X-Proofpoint-GUID: 12PY0Z7Q0HoI8KTq_tFApgSsWJuy4k-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210031
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support feeding VCC through a regulator.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/keyboard/adp5588-keys.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 908b6865a2e6..3aa65d8d9f29 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -24,6 +24,7 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
@@ -706,12 +707,18 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	return 0;
 }
 
+static void adp5588_disable_regulator(void *reg)
+{
+	regulator_disable(reg);
+}
+
 static int adp5588_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct adp5588_kpad *kpad;
 	struct input_dev *input;
 	struct gpio_desc *gpio;
+	struct regulator *vcc;
 	unsigned int revid;
 	int ret;
 	int error;
@@ -737,6 +744,18 @@ static int adp5588_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	vcc = devm_regulator_get(&client->dev, "vcc");
+	if (IS_ERR(vcc))
+		return PTR_ERR(vcc);
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&client->dev, adp5588_disable_regulator, vcc);
+	if (ret)
+		return ret;
+
 	gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(gpio))
 		return PTR_ERR(gpio);
-- 
2.37.1

