Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 761B276A788
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 05:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbjHADgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jul 2023 23:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbjHADgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2023 23:36:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D3D1BE9
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2023 20:36:42 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFLMj6Bn3zVjxm;
        Tue,  1 Aug 2023 11:34:57 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 11:36:40 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <andriy.shevchenko@linux.intel.com>,
        <bartosz.golaszewski@linaro.org>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <andy@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <u.kleine-koenig@pengutronix.de>, <arnd@arndb.de>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] gpio: max3191x: remove redundant of_match_ptr
Date:   Tue, 1 Aug 2023 11:36:10 +0800
Message-ID: <20230801033610.221172-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
and of_match_ptr here, we remove them all.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpio/gpio-max3191x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 161c4751c5f7..bbacc714632b 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -457,7 +457,6 @@ static int __init max3191x_register_driver(struct spi_driver *sdrv)
 	return spi_register_driver(sdrv);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id max3191x_of_id[] = {
 	{ .compatible = "maxim,max31910" },
 	{ .compatible = "maxim,max31911" },
@@ -468,7 +467,6 @@ static const struct of_device_id max3191x_of_id[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max3191x_of_id);
-#endif
 
 static const struct spi_device_id max3191x_spi_id[] = {
 	{ "max31910" },
@@ -484,7 +482,7 @@ MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
 static struct spi_driver max3191x_driver = {
 	.driver = {
 		.name		= "max3191x",
-		.of_match_table	= of_match_ptr(max3191x_of_id),
+		.of_match_table	= max3191x_of_id,
 	},
 	.probe	  = max3191x_probe,
 	.remove	  = max3191x_remove,
-- 
2.17.1

