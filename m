Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B508C2F811D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 17:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbhAOQrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 11:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbhAOQrp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 11:47:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C70C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 08:47:05 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0SFY-0001WT-Ic; Fri, 15 Jan 2021 17:47:00 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0SFY-0004h4-5g; Fri, 15 Jan 2021 17:47:00 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] gpio: pca953x: Add support for pca9506
Date:   Fri, 15 Jan 2021 17:46:56 +0100
Message-Id: <20210115164658.187681-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
References: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to the reference manual "The PCA9505 is identical to the
PCA9506 except that it includes 100 kΩ internal pull-up resistors on all
the I/Os." So the pca9506 device can be considered identical to the
pca9505 for the gpio driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 825b362eb4b7..5ea09fd01544 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -73,6 +73,7 @@
 static const struct i2c_device_id pca953x_id[] = {
 	{ "pca6416", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9505", 40 | PCA953X_TYPE | PCA_INT, },
+	{ "pca9506", 40 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9534", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "pca9535", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9536", 4  | PCA953X_TYPE, },
@@ -1236,6 +1237,7 @@ static int pca953x_resume(struct device *dev)
 static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca6416", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_INT), },
+	{ .compatible = "nxp,pca9506", .data = OF_953X(40, PCA_INT), },
 	{ .compatible = "nxp,pca9534", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "nxp,pca9535", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9536", .data = OF_953X( 4, 0), },
-- 
2.29.2

