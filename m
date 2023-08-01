Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84A76A78A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 05:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjHADhF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jul 2023 23:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjHADhF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2023 23:37:05 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDF31BC7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2023 20:37:04 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFLNy3hBsz1GD1x;
        Tue,  1 Aug 2023 11:36:02 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 11:37:02 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <andriy.shevchenko@linux.intel.com>,
        <bartosz.golaszewski@linaro.org>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <andy@kernel.org>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <u.kleine-koenig@pengutronix.de>, <arnd@arndb.de>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] gpio: raspberrypi-exp: remove redundant of_match_ptr
Date:   Tue, 1 Aug 2023 11:36:32 +0800
Message-ID: <20230801033632.221318-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
of_match_ptr here, and __maybe_unused can also be removed.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpio/gpio-raspberrypi-exp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index ecb0d3800dfe..9d1b95e429f1 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -234,7 +234,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
 }
 
-static const struct of_device_id rpi_exp_gpio_ids[] __maybe_unused = {
+static const struct of_device_id rpi_exp_gpio_ids[] = {
 	{ .compatible = "raspberrypi,firmware-gpio" },
 	{ }
 };
@@ -243,7 +243,7 @@ MODULE_DEVICE_TABLE(of, rpi_exp_gpio_ids);
 static struct platform_driver rpi_exp_gpio_driver = {
 	.driver	= {
 		.name		= MODULE_NAME,
-		.of_match_table	= of_match_ptr(rpi_exp_gpio_ids),
+		.of_match_table	= rpi_exp_gpio_ids,
 	},
 	.probe	= rpi_exp_gpio_probe,
 };
-- 
2.17.1

