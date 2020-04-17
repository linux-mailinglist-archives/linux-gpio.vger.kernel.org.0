Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515AD1ADB92
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbgDQKtz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:49:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2399 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729301AbgDQKtz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:49:55 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 85CFC75ABBDD60E2745D;
        Fri, 17 Apr 2020 18:49:49 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 18:49:39 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <geert+renesas@glider.be>, <linus.walleij@linaro.org>,
        <nishkadg.linux@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] pinctrl: rza1: fix wrong array assignment of rza1l_swio_entries
Date:   Fri, 17 Apr 2020 19:16:04 +0800
Message-ID: <20200417111604.19143-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The rza1l_swio_entries refered to the wrong array rza1h_swio_pins, which
was intended to be rza1l_swio_pins. So let's fix it.

This is detected by the following gcc warning:

drivers/pinctrl/pinctrl-rza1.c:401:35: warning: ‘rza1l_swio_pins’
defined but not used [-Wunused-const-variable=]
 static const struct rza1_swio_pin rza1l_swio_pins[] = {
                                   ^~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index da2d8365c690..ff4a7fb518bb 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -418,7 +418,7 @@ static const struct rza1_bidir_entry rza1l_bidir_entries[RZA1_NPORTS] = {
 };
 
 static const struct rza1_swio_entry rza1l_swio_entries[] = {
-	[0] = { ARRAY_SIZE(rza1h_swio_pins), rza1h_swio_pins },
+	[0] = { ARRAY_SIZE(rza1l_swio_pins), rza1l_swio_pins },
 };
 
 /* RZ/A1L (r7s72102x) pinmux flags table */
-- 
2.21.1

