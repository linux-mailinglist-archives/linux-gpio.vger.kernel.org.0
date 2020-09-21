Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E21271CDD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgIUICw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 04:02:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13789 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726925AbgIUICd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 04:02:33 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 963CE9013D99E4B42B04;
        Mon, 21 Sep 2020 16:02:31 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:24 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] pinctrl: spear: simplify the return expression of spear310_pinctrl_probe
Date:   Mon, 21 Sep 2020 16:24:48 +0800
Message-ID: <20200921082448.2591929-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/pinctrl/spear/pinctrl-spear310.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear310.c b/drivers/pinctrl/spear/pinctrl-spear310.c
index 393b2b97d527..9d9facc4a6e4 100644
--- a/drivers/pinctrl/spear/pinctrl-spear310.c
+++ b/drivers/pinctrl/spear/pinctrl-spear310.c
@@ -379,8 +379,6 @@ static const struct of_device_id spear310_pinctrl_of_match[] = {
 
 static int spear310_pinctrl_probe(struct platform_device *pdev)
 {
-	int ret;
-
 	spear3xx_machdata.groups = spear310_pingroups;
 	spear3xx_machdata.ngroups = ARRAY_SIZE(spear310_pingroups);
 	spear3xx_machdata.functions = spear310_functions;
@@ -392,11 +390,7 @@ static int spear310_pinctrl_probe(struct platform_device *pdev)
 
 	spear3xx_machdata.modes_supported = false;
 
-	ret = spear_pinctrl_probe(pdev, &spear3xx_machdata);
-	if (ret)
-		return ret;
-
-	return 0;
+	return spear_pinctrl_probe(pdev, &spear3xx_machdata);
 }
 
 static struct platform_driver spear310_pinctrl_driver = {
-- 
2.25.1

