Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96622577DD4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 10:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbiGRIrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 04:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbiGRIre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 04:47:34 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DC660E9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 01:47:33 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 50B0E1A165C;
        Mon, 18 Jul 2022 10:47:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0956B1A165F;
        Mon, 18 Jul 2022 10:47:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A3305180222D;
        Mon, 18 Jul 2022 16:47:30 +0800 (+08)
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl, marek.vasut@gmail.com
Cc:     linux-gpio@vger.kernel.org, haibo.chen@nxp.com, linux-imx@nxp.com
Subject: [PATCH 1/3] gpio: pca953x: only use single read/write for No AI mode
Date:   Mon, 18 Jul 2022 16:31:41 +0800
Message-Id: <1658133103-23394-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

For the device use NO AI mode(not support auto address increment),
only use the single read/write when config the regmap.

We meet issue on PCA9557PW on i.MX8QXP/DXL evk board, this device
do not support AI mode, but when do the regmap sync, regmap will
sync 3 byte data to register 1, logically this means write first
data to register 1, write second data to register 2, write third data
to register 3. But this device do not support AI mode, finally, these
three data write only into register 1 one by one. the reault is the
value of register 1 alway equal to the latest data, here is the third
data, no operation happened on register 2 and register 3. This is
not what we expect.

Fixes: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 08bc52c3cdcb..7209f69a8e8d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -351,6 +351,9 @@ static const struct regmap_config pca953x_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
+	.use_single_read = true,
+	.use_single_write = true,
+
 	.readable_reg = pca953x_readable_register,
 	.writeable_reg = pca953x_writeable_register,
 	.volatile_reg = pca953x_volatile_register,
-- 
2.25.1

