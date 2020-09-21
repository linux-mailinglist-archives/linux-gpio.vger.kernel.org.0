Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857E92724DF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 15:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgIUNKn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 09:10:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13764 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727396AbgIUNKm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:42 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id AB7FC6204E7E87FB805C;
        Mon, 21 Sep 2020 21:10:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:27 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH -next] omapfb: connector-hdmi: simplify the return expression of hdmic_connect
Date:   Mon, 21 Sep 2020 21:10:51 +0800
Message-ID: <20200921131051.92661-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpio/gpio-cs5535.c                                 | 6 +-----
 drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c | 7 +------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 53b24e3ae..57b9ddffd 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -345,12 +345,8 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 				mask_orig, mask);
 
 	/* finally, register with the generic GPIO API */
-	err = devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
+	return devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
 				     &cs5535_gpio_chip);
-	if (err)
-		return err;
-
-	return 0;
 }
 
 static struct platform_driver cs5535_gpio_driver = {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
index 49551afbd..670b9c6eb 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
@@ -50,18 +50,13 @@ static int hdmic_connect(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct omap_dss_device *in = ddata->in;
-	int r;
 
 	dev_dbg(ddata->dev, "connect\n");
 
 	if (omapdss_device_is_connected(dssdev))
 		return 0;
 
-	r = in->ops.hdmi->connect(in, dssdev);
-	if (r)
-		return r;
-
-	return 0;
+	return in->ops.hdmi->connect(in, dssdev);
 }
 
 static void hdmic_disconnect(struct omap_dss_device *dssdev)
-- 
2.23.0

