Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BDD3D1C80
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 05:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhGVDAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 23:00:05 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:12234 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhGVDAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 23:00:03 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GVdP555Kpz1CMXP;
        Thu, 22 Jul 2021 11:34:49 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 11:40:37 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 11:40:36 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 2/2] pinctrl: single: Move test PCS_HAS_PINCONF in pcs_parse_bits_in_pinctrl_entry() to the beginning
Date:   Thu, 22 Jul 2021 11:39:30 +0800
Message-ID: <20210722033930.4034-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210722033930.4034-1-thunder.leizhen@huawei.com>
References: <20210722033930.4034-1-thunder.leizhen@huawei.com>
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

The value of pcs->flags is not overwritten in function
pcs_parse_bits_in_pinctrl_entry() and its subfunctions, so moving this
check to the beginning of the function eliminates unnecessary rollback
operations.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/pinctrl/pinctrl-single.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4fcae8458359..d8b4dc40f3c6 100644
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
@@ -1212,30 +1217,19 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
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
-		res = -ENOTSUPP;
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

