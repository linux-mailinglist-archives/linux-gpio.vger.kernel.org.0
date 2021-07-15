Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CDF3C98DD
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 08:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhGOGpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 02:45:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6933 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhGOGpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 02:45:46 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GQPq92KGLz7v0p;
        Thu, 15 Jul 2021 14:39:17 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Jul 2021 14:42:37 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Jul 2021 14:42:37 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manjunathappa Prakash <prakash.pm@ti.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH] pinctrl: single: Fix error return code in pcs_parse_bits_in_pinctrl_entry()
Date:   Thu, 15 Jul 2021 14:42:06 +0800
Message-ID: <20210715064206.3193-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix to return -ENOTSUPP instead of 0 when PCS_HAS_PINCONF is true, which
is the same as that returned in pcs_parse_pinconf().

In addition, I found the value of pcs->flags is not overwritten in
pcs_parse_bits_in_pinctrl_entry() and its subfunctions, so moving this
check to the beginning of the function eliminates unnecessary rollback
operations.

Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/pinctrl/pinctrl-single.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e3aa64798f7d..d8b4dc40f3c6 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1115,7 +1115,7 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 {
 	const char *name = "pinctrl-single,bits";
 	struct pcs_func_vals *vals;
-	int rows, *pins, found = 0, res = -ENOMEM, i, fsel, gsel;
+	int rows, *pins, found = 0, res = -ENOMEM, i, fsel;
 	int npins_in_row;
 	struct pcs_function *function = NULL;
 
@@ -1125,6 +1125,11 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 		return -EINVAL;
 	}
 
+	if (PCS_HAS_PINCONF) {
+		dev_err(pcs->dev, "pinconf not supported\n");
+		return -ENOTSUPP;
+	}
+
 	npins_in_row = pcs->width / pcs->bits_per_pin;
 
 	vals = devm_kzalloc(pcs->dev,
@@ -1212,29 +1217,19 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 		goto free_pins;
 	}
 
-	gsel = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
-	if (gsel < 0) {
-		res = gsel;
+	res = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
+	if (res < 0)
 		goto free_function;
-	}
 
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
 	(*map)->data.mux.group = np->name;
 	(*map)->data.mux.function = np->name;
 
-	if (PCS_HAS_PINCONF) {
-		dev_err(pcs->dev, "pinconf not supported\n");
-		goto free_pingroups;
-	}
-
 	*num_maps = 1;
 	mutex_unlock(&pcs->mutex);
 
 	return 0;
 
-free_pingroups:
-	pinctrl_generic_remove_group(pcs->pctl, gsel);
-	*num_maps = 1;
 free_function:
 	pinmux_generic_remove_function(pcs->pctl, fsel);
 free_pins:
-- 
2.25.1

