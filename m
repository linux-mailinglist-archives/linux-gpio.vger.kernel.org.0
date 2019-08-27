Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61459E6D2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 13:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfH0LcQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 07:32:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5668 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725860AbfH0LcP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Aug 2019 07:32:15 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id C53B4A4C43443BA1BF25;
        Tue, 27 Aug 2019 19:32:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Tue, 27 Aug 2019 19:31:55 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] pinctrl: sh-pfc: Fix missing unlock on error in sh_pfc_func_set_mux()
Date:   Tue, 27 Aug 2019 11:35:27 +0000
Message-ID: <20190827113527.99831-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the missing unlock before return from function sh_pfc_func_set_mux()
in the error handling case.

Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 99f4ebd69861..212a4a9c3a8f 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -361,8 +361,10 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 		 * This driver cannot manage both gpio and mux when the gpio
 		 * pin is already enabled. So, this function fails.
 		 */
-		if (cfg->gpio_enabled)
-			return -EBUSY;
+		if (cfg->gpio_enabled) {
+			ret = -EBUSY;
+			goto done;
+		}
 
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)



