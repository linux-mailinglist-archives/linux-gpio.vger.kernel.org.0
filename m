Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7293076DDE1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 04:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjHCCNx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 22:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjHCCNu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 22:13:50 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF52212D
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 19:13:48 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGXRv0kSKzrRxG;
        Thu,  3 Aug 2023 10:12:43 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 10:13:46 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <nandor.han@ge.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <andy@kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v3] gpio: xra1403: remove redundant of_match_ptr()
Date:   Thu, 3 Aug 2023 10:13:17 +0800
Message-ID: <20230803021317.257727-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Change of_match_ptr to of_match_ptr() in the commit message.
- Drop mod_devicetable.h.

---
Changes in v3:
- Include mod_devicetable.h.
---
 drivers/gpio/gpio-xra1403.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index eed8a1684830..dc2710c21c50 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -194,7 +194,7 @@ static const struct spi_device_id xra1403_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
-static const struct of_device_id xra1403_spi_of_match[] __maybe_unused = {
+static const struct of_device_id xra1403_spi_of_match[] = {
 	{ .compatible = "exar,xra1403" },
 	{},
 };
@@ -205,7 +205,7 @@ static struct spi_driver xra1403_driver = {
 	.id_table = xra1403_ids,
 	.driver   = {
 		.name           = "xra1403",
-		.of_match_table = of_match_ptr(xra1403_spi_of_match),
+		.of_match_table = xra1403_spi_of_match,
 	},
 };
 
-- 
2.17.1

