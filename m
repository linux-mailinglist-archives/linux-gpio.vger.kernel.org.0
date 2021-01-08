Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BF42EEF7B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 10:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbhAHJXx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 04:23:53 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10412 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbhAHJXx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 04:23:53 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DByKz4PDvz7RxP;
        Fri,  8 Jan 2021 17:22:15 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:23:01 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] gpio: vx855: convert comma to semicolon
Date:   Fri, 8 Jan 2021 17:23:45 +0800
Message-ID: <20210108092345.19164-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace a comma between expression statements by a semicolon.

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

