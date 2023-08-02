Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9367976C2D9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 04:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbjHBCYi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 22:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjHBCYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 22:24:37 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1612689
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 19:24:35 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFwh36M6CzNmhp;
        Wed,  2 Aug 2023 10:21:07 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 10:24:33 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <thor.thayer@linux.intel.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <andy@kernel.org>, <linux-gpio@vger.kernel.org>,
        <andriy.shevchenko@linux.intel.com>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v2] gpio: altera-a10sr: remove redundant of_match_ptr
Date:   Wed, 2 Aug 2023 10:24:03 +0800
Message-ID: <20230802022403.146920-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it. Hence we remove of_match_ptr().

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Change of_match_ptr to of_match_ptr()
- Include mod_devicetable.h
---
 drivers/gpio/gpio-altera-a10sr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index be1ed7ee5225..11edf1fe6c90 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -9,6 +9,7 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/mfd/altera-a10sr.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/property.h>
 
@@ -104,7 +105,7 @@ static struct platform_driver altr_a10sr_gpio_driver = {
 	.probe = altr_a10sr_gpio_probe,
 	.driver = {
 		.name	= "altr_a10sr_gpio",
-		.of_match_table = of_match_ptr(altr_a10sr_gpio_of_match),
+		.of_match_table = altr_a10sr_gpio_of_match,
 	},
 };
 module_platform_driver(altr_a10sr_gpio_driver);
-- 
2.17.1

