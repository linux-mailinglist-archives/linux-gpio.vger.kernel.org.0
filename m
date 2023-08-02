Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B25476C3C9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 05:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjHBDyX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 23:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjHBDyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 23:54:22 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D749B
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 20:54:21 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFykP0Mc1zrRgt;
        Wed,  2 Aug 2023 11:53:17 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 11:54:19 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andy@kernel.org>,
        <linux-gpio@vger.kernel.org>, <andriy.shevchenko@linux.intel.com>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v2] gpio: max732x: remove redundant CONFIG_OF and of_match_ptr()
Date:   Wed, 2 Aug 2023 11:53:49 +0800
Message-ID: <20230802035349.177583-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here. We remove both CONFIG_OF and of_match_ptr() here.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Change of_match_ptr to of_match_ptr() in the commit message.
- Drop of.h which is not needed anymore.
---
 drivers/gpio/gpio-max732x.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index fca9ca68e387..474f4410a419 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -18,7 +18,6 @@
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/max732x.h>
-#include <linux/of.h>
 
 
 /*
@@ -114,7 +113,6 @@ static const struct i2c_device_id max732x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max732x_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id max732x_of_table[] = {
 	{ .compatible = "maxim,max7319" },
 	{ .compatible = "maxim,max7320" },
@@ -128,7 +126,6 @@ static const struct of_device_id max732x_of_table[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max732x_of_table);
-#endif
 
 struct max732x_chip {
 	struct gpio_chip gpio_chip;
@@ -709,7 +706,7 @@ static int max732x_probe(struct i2c_client *client)
 static struct i2c_driver max732x_driver = {
 	.driver = {
 		.name		= "max732x",
-		.of_match_table	= of_match_ptr(max732x_of_table),
+		.of_match_table	= max732x_of_table,
 	},
 	.probe		= max732x_probe,
 	.id_table	= max732x_id,
-- 
2.17.1

