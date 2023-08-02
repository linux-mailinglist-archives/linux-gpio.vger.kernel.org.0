Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2290276C3D4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 06:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjHBEDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 00:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjHBEDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 00:03:06 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9547610B
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 21:03:05 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFysn2GFMztRm0;
        Wed,  2 Aug 2023 11:59:41 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 12:03:02 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <nandor.han@ge.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <andy@kernel.org>, <linux-gpio@vger.kernel.org>,
        <andriy.shevchenko@linux.intel.com>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v2] gpio: xra1403: remove redundant of_match_ptr()
Date:   Wed, 2 Aug 2023 12:02:32 +0800
Message-ID: <20230802040232.182535-1-wangzhu9@huawei.com>
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
of_match_ptr() here, and __maybe_unused can also be removed.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Since spi.h included mod_devicetable.h, so we drop mod_devicetable.h.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Change of_match_ptr to of_match_ptr() in the commit message.
- Drop mod_devicetable.h.
---
 drivers/gpio/gpio-xra1403.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index eed8a1684830..c9ea6cd7f501 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -8,7 +8,6 @@
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/kernel.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/seq_file.h>
@@ -194,7 +193,7 @@ static const struct spi_device_id xra1403_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
-static const struct of_device_id xra1403_spi_of_match[] __maybe_unused = {
+static const struct of_device_id xra1403_spi_of_match[] = {
 	{ .compatible = "exar,xra1403" },
 	{},
 };
@@ -205,7 +204,7 @@ static struct spi_driver xra1403_driver = {
 	.id_table = xra1403_ids,
 	.driver   = {
 		.name           = "xra1403",
-		.of_match_table = of_match_ptr(xra1403_spi_of_match),
+		.of_match_table = xra1403_spi_of_match,
 	},
 };
 
-- 
2.17.1

