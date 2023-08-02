Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66AE76C30B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 04:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjHBCpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 22:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjHBCpa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 22:45:30 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4101BFD
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 19:45:28 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFxBx2Rh7z1GDP8;
        Wed,  2 Aug 2023 10:44:25 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 10:45:26 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <linusw@kernel.org>, <kaloz@openwrt.org>, <khalasa@piap.pl>,
        <brgl@bgdev.pl>, <andy@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <andriy.shevchenko@linux.intel.com>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next v2] gpio: ixp4xx: remove redundant of_match_ptr()
Date:   Wed, 2 Aug 2023 10:44:55 +0800
Message-ID: <20230802024455.210898-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
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
- Change of_match_ptr to of_match_ptr() in the commit message.
---
 drivers/gpio/gpio-ixp4xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 1e29de1671d4..dde6cf3a5779 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -302,7 +302,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
 static struct platform_driver ixp4xx_gpio_driver = {
 	.driver = {
 		.name		= "ixp4xx-gpio",
-		.of_match_table = of_match_ptr(ixp4xx_gpio_of_match),
+		.of_match_table = ixp4xx_gpio_of_match,
 	},
 	.probe = ixp4xx_gpio_probe,
 };
-- 
2.17.1

