Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6E42EBE78
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 14:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbhAFNTO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 08:19:14 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10552 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbhAFNTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:19:14 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D9qfB0jzdzMDkH;
        Wed,  6 Jan 2021 21:17:22 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:18:25 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] gpio: vx855: use resource_size
Date:   Wed, 6 Jan 2021 21:19:08 +0800
Message-ID: <20210106131908.584-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-vx855.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 3bf397b8dfbc..69713fd5485b 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -216,7 +216,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->direction_output = vx855gpio_direction_output;
 	c->get = vx855gpio_get;
 	c->set = vx855gpio_set;
-	c->set_config = vx855gpio_set_config,
+	c->set_config = vx855gpio_set_config;
 	c->dbg_show = NULL;
 	c->base = 0;
 	c->ngpio = NR_VX855_GP;
-- 
2.22.0

