Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FDD1AD928
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 10:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgDQIy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 04:54:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:49938 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729819AbgDQIy3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 04:54:29 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A45ED4FB16B8E53C3F52;
        Fri, 17 Apr 2020 16:54:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:54:16 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <renesas@glider.be>, <linus.walleij@linaro.org>,
        <nishkadg.linux@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] pinctrl: rza1: remove unused 'rza1l_swio_pins'
Date:   Fri, 17 Apr 2020 17:20:42 +0800
Message-ID: <20200417092042.11994-1-yanaijie@huawei.com>
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

Fix the following gcc warning:

drivers/pinctrl/pinctrl-rza1.c:401:35: warning: ‘rza1l_swio_pins’
defined but not used [-Wunused-const-variable=]
 static const struct rza1_swio_pin rza1l_swio_pins[] = {
                                   ^~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index da2d8365c690..e96bf89b3764 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -398,15 +398,6 @@ static const struct rza1_bidir_pin rza1l_bidir_pins_p9[] = {
 	{ .pin = 5, .func = 3 },
 };
 
-static const struct rza1_swio_pin rza1l_swio_pins[] = {
-	{ .port = 2, .pin = 8, .func = 2, .input = 0 },
-	{ .port = 5, .pin = 6, .func = 3, .input = 0 },
-	{ .port = 6, .pin = 6, .func = 3, .input = 0 },
-	{ .port = 6, .pin = 10, .func = 3, .input = 0 },
-	{ .port = 7, .pin = 10, .func = 2, .input = 0 },
-	{ .port = 8, .pin = 2, .func = 3, .input = 0 },
-};
-
 static const struct rza1_bidir_entry rza1l_bidir_entries[RZA1_NPORTS] = {
 	[1] = { ARRAY_SIZE(rza1l_bidir_pins_p1), rza1l_bidir_pins_p1 },
 	[3] = { ARRAY_SIZE(rza1l_bidir_pins_p3), rza1l_bidir_pins_p3 },
-- 
2.21.1

