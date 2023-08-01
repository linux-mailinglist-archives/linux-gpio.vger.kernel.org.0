Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B55276A784
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 05:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbjHADfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jul 2023 23:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjHADfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2023 23:35:46 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5771BC7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2023 20:35:45 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFLJl4hslztRlg;
        Tue,  1 Aug 2023 11:32:23 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 11:35:43 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <andriy.shevchenko@linux.intel.com>,
        <bartosz.golaszewski@linaro.org>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <andy@kernel.org>, <shc_work@mail.ru>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <u.kleine-koenig@pengutronix.de>, <arnd@arndb.de>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] gpio: clps711x: remove redundant of_match_ptr
Date:   Tue, 1 Aug 2023 11:35:13 +0800
Message-ID: <20230801033513.220783-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr here.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it. Hence we remove of_match_ptr.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpio/gpio-clps711x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index 75f6f8d4323e..ffee46839949 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -76,7 +76,7 @@ MODULE_DEVICE_TABLE(of, clps711x_gpio_ids);
 static struct platform_driver clps711x_gpio_driver = {
 	.driver	= {
 		.name		= "clps711x-gpio",
-		.of_match_table	= of_match_ptr(clps711x_gpio_ids),
+		.of_match_table	= clps711x_gpio_ids,
 	},
 	.probe	= clps711x_gpio_probe,
 };
-- 
2.17.1

