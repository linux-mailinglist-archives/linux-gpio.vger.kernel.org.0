Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9765232DB22
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 21:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhCDUXt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 15:23:49 -0500
Received: from polaris.svanheule.net ([84.16.241.116]:33676 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhCDUXk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 15:23:40 -0500
X-Greylist: delayed 567 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Mar 2021 15:23:40 EST
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9701:81b5:1a59:96d9:b1e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 61A7E1D7A84;
        Thu,  4 Mar 2021 21:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1614888812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zmq7LhwLXDkC8+O15emRxYgrzslnS0/S4UsDcEdoTvs=;
        b=UP5NdzAu6Kjeo6x9neIm7USP4HYjuMRdibUeQGC1dy5MFT527844vB6Nnw4d1lbHjJAMWb
        j8zl5XXpRa5QpL/Kvi/Uv0riDWfGF36witUj2fhv3rzssOnQSQ9fkkMjw3VKiepvQ+MQOu
        m/mPxL5z0jUQ4wH3kVn5tmWF5eZo9jhXYA3us2J/80fv/2QcBuv2krPEr3yl7H0V3ZRJtz
        nxBQsv77WoIqMkfdZW4Htc7cj/Q7HP8p5MUx3zjkt93I9o7hzayDJXTXFHS+U3WbNxJnnh
        pAUtwDSApdBGtr/wWmUSQn2W28if1zoEBlPy67apxc0mRH/EWAppCPydnjD0Lw==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sander Vanheule <sander@svanheule.net>,
        Gregory Bean <gbean@codeaurora.org>
Subject: [PATCH] pinctrl: sx150x: support building as module
Date:   Thu,  4 Mar 2021 21:11:20 +0100
Message-Id: <20210304201119.702637-1-sander@svanheule.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SX150x GPIO expander driver, and the subsystems it depends on, have
seen some development since its initial introduction. Let's add some
extra bits to enable building it as a module.

Build tested on 5.12-rc1. Run tested on a MIPS device with OpenWrt,
kernel version 5.4.101, to confirm unloading/reloading works.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
This is the first time I've attempted to create a driver that can be
built as a module, so there's a reasonable chance I missed some things.

As the commit message notes, I've tested loading/unloading on a 5.4
kernel in OpenWrt, and no obvious regressions were encountered.

MODULE_LICENSE/_AUTHOR were copied from the driver's comment header.

 drivers/pinctrl/Kconfig          |  2 +-
 drivers/pinctrl/pinctrl-sx150x.c | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b7675cce0027..50ce0caf18f0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -227,7 +227,7 @@ config PINCTRL_SINGLE
 	  This selects the device tree based generic pinctrl driver.
 
 config PINCTRL_SX150X
-	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
+	tristate "Semtech SX150x I2C GPIO expander pinctrl driver"
 	depends on I2C=y
 	select PINMUX
 	select PINCONF
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 484a3b9e875c..ac589c1e939a 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -13,9 +13,9 @@
 
 #include <linux/regmap.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -829,6 +829,7 @@ static const struct i2c_device_id sx150x_id[] = {
 	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
 	{}
 };
+MODULE_DEVICE_TABLE(i2c, sx150x_id);
 
 static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1501q", .data = &sx1501q_device_data },
@@ -842,6 +843,7 @@ static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
 static int sx150x_reset(struct sx150x_pinctrl *pctl)
 {
@@ -1258,9 +1260,8 @@ static struct i2c_driver sx150x_driver = {
 	.probe    = sx150x_probe,
 	.id_table = sx150x_id,
 };
+module_i2c_driver(sx150x_driver);
 
-static int __init sx150x_init(void)
-{
-	return i2c_add_driver(&sx150x_driver);
-}
-subsys_initcall(sx150x_init);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gregory Bean <gbean@codeaurora.org>");
+MODULE_DESCRIPTION("Semtech SX150x I2C GPIO expander");
-- 
2.29.2

