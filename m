Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C137057C5C5
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 10:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbiGUIDz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 04:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiGUIDx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 04:03:53 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A690740BF3;
        Thu, 21 Jul 2022 01:03:52 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L4k5Qs024891;
        Thu, 21 Jul 2022 04:03:48 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hbt860w6x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jul 2022 04:03:48 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26L83lsO026253
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Jul 2022 04:03:47 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:46 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 21 Jul 2022 04:03:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 21 Jul 2022 04:03:46 -0400
Received: from nsa.ad.analog.com ([10.44.3.68])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26L83GIr028313;
        Thu, 21 Jul 2022 04:03:38 -0400
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
Subject: [PATCH v3 10/10] input: keyboard: adp5588-keys: Use new PM macros
Date:   Thu, 21 Jul 2022 10:04:23 +0200
Message-ID: <20220721080423.156151-11-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721080423.156151-1-nuno.sa@analog.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 13AE025VjwPVXYLhXfPwzJlrcczazCON
X-Proofpoint-GUID: 13AE025VjwPVXYLhXfPwzJlrcczazCON
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

With the new PM macros (DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()), the
compiler has visibility to see that the functions are not used when
!CONFIG_PM and hence, remove the dead code. As such, there's no need
for '__maybe_unused'.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/keyboard/adp5588-keys.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 3aa65d8d9f29..111e593e2f63 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -821,7 +821,7 @@ static int adp5588_remove(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused adp5588_suspend(struct device *dev)
+static int adp5588_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -830,7 +830,7 @@ static int __maybe_unused adp5588_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused adp5588_resume(struct device *dev)
+static int adp5588_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -839,7 +839,7 @@ static int __maybe_unused adp5588_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(adp5588_dev_pm_ops, adp5588_suspend, adp5588_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(adp5588_dev_pm_ops, adp5588_suspend, adp5588_resume);
 
 static const struct i2c_device_id adp5588_id[] = {
 	{ "adp5588-keys", 0 },
@@ -859,7 +859,7 @@ static struct i2c_driver adp5588_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = adp5588_of_match,
-		.pm   = &adp5588_dev_pm_ops,
+		.pm   = pm_sleep_ptr(&adp5588_dev_pm_ops),
 	},
 	.probe    = adp5588_probe,
 	.remove   = adp5588_remove,
-- 
2.37.1

