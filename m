Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7369E76A789
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 05:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjHADgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jul 2023 23:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjHADgx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2023 23:36:53 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408551BC7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2023 20:36:52 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFLNk188Xz1GDJ7;
        Tue,  1 Aug 2023 11:35:50 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 11:36:50 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <andriy.shevchenko@linux.intel.com>,
        <bartosz.golaszewski@linaro.org>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <andy@kernel.org>, <linux-gpio@vger.kernel.org>,
        <u.kleine-koenig@pengutronix.de>, <arnd@arndb.de>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] gpio: max732x: remove redundant CONFIG_OF and of_match_ptr
Date:   Tue, 1 Aug 2023 11:36:20 +0800
Message-ID: <20230801033620.221270-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr here. We remove both CONFIG_OF and of_match_ptr here.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpio/gpio-max732x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index fca9ca68e387..da7e9c7c431c 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -114,7 +114,6 @@ static const struct i2c_device_id max732x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max732x_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id max732x_of_table[] = {
 	{ .compatible = "maxim,max7319" },
 	{ .compatible = "maxim,max7320" },
@@ -128,7 +127,6 @@ static const struct of_device_id max732x_of_table[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max732x_of_table);
-#endif
 
 struct max732x_chip {
 	struct gpio_chip gpio_chip;
@@ -709,7 +707,7 @@ static int max732x_probe(struct i2c_client *client)
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

